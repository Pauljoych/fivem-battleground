var type = "normal";
var disabled = false;
var disabledFunction = null;
var ownerHouse = null;
let locker = null;
let stash = null;

window.addEventListener("message", function (event) {
    if (event.data.action == "display") {
        type = event.data.type
        disabled = false;

        $("#search").bind('input', function () {
            searchFor = $("#search").val().toLowerCase();
            $(".slot").each(function (index, value) {
                label = $(this).text().toLowerCase();
                if (label.indexOf(searchFor) < 0) {
                    $(this).hide();
                } else {
                    $(this).show();
                }
            });
        });

        $("#UseBar").fadeOut(100);
        $(document).on('keydown', function (event) {
            // $("#search").focus();
        });

        if (type === "normal") {
            // $("#other-inv-label").html('');
            // $("#other-inv-weight").html('');
            // $(".pro1").css("width","0%");
            // $("#other-inv-label").hide();
            // $("#other-inv-weight").hide();
                namaic(event.data.nama)
            
            $(".other-inv-info").hide();
        } else if (type === "trunk") {
            namaic(event.data.nama)
            $(".other-inv-info").show();
            $(".pro1").show();
        } else if (type === "property") {
            namaic(event.data.nama)
			$("#otherInventory").show();
            $(".other-inv-info").show();
            $(".pro1").show();
			ownerHouse = event.data.owner;
        } else if (type === "shop") {
            $(".other-inv-info").show();
            $("#player-inv-label").html(event.data.nama);
            $("#otherInventory").show();
        } else if (type === "rusun") {
            namaic(event.data.nama)
            $("#otherInventory").show();
            $(".other-inv-info").show();
            $(".pro1").show();
        } else if (type === "losmen") {
            namaic(event.data.nama)
            $("#otherInventory").show();
            $(".other-inv-info").show();
            $(".pro1").show();
        } else if (type === "koswc") {
            namaic(event.data.nama)
            $("#otherInventory").show();
            $(".other-inv-info").show();
            $(".pro1").show();
        } else if (type === "koswanita") {
            $("#otherInventory").show();
            $(".other-inv-info").show();
            $(".pro1").show();
        } else if (type === "warehouse") {
            $("#otherInventory").show();
            $(".other-inv-info").show();
            $(".pro1").show();
        } else if (type === "warehouse2") {
            $("#otherInventory").show();
            $(".other-inv-info").show();
        } else if (type === "warehouse3") {
            $("#otherInventory").show();
            $(".other-inv-info").show();
        } else if (type === "police") {
            $("#otherInventory").show();
            $(".other-inv-info").show();
        } else if (type === "storage") {
            $(".other-inv-info").show();
            $("#player-inv-label").html(event.data.nama);
            $("#other-inv-label").html(event.data.namabrank);
            $("#otherInventory").show();
        } else if (type === "gudang") {
            $(".info-div").show();
            $("#otherInventory").show();
            $(".other-inv-info").show();
        } else if (type === 'locker') {
			$('.info-div').show();
			locker = event.data.locker;
        } else if (type === 'stash') {
			$('.info-div').show();
			stash = event.data.stash;
        } else if (type === "motels") {
            $(".info-div").hide();
        } else if (type === "motelsbed") {
            $(".info-div").hide();
        } else if (type === "player") {
			$("#otherInventory").show();
            $(".other-inv-info").show();
        }

        $(".ui").fadeIn();
    } else if (event.data.action == "hide") {
        $("#dialog").dialog("close");
        $(".ui").fadeOut();
        $(".item").remove();
        $("#otherInventory").html("");
         updatenootherweights();
    } else if (event.data.action == "setItems") {
        inventorySetup(event.data.itemList, event.data.fastItems);        

        $('.item').draggable({
            helper: 'clone',
            appendTo: 'body',
            zIndex: 99999,
            revert: 'invalid',
            start: function (event, ui) {
                if (disabled) {
                    return false;
                }

                $(this).css('background-image', 'none');
                itemData = $(this).data("item");
                itemInventory = $(this).data("inventory");

                if (itemInventory == "second" || !itemData.canRemove) {
                    //$("#drop").addClass("disabled");
                    $("#give").addClass("disabled");
                }

                if (itemInventory == "second" || !itemData.usable) {
                    $("#use").addClass("disabled");
                }
            },

            stop: function () {
                itemData = $(this).data("item");
                if (itemData !== undefined && itemData.name !== undefined) {
                    $(this).css('background-image', 'url(\'img/items/' + itemData.name + '.png\'');
                    //$("#drop").removeClass("disabled");
                    $("#use").removeClass("disabled");
                    $("#give").removeClass("disabled");
                }

            }

        });
    } else if (event.data.action == "setSecondInventoryItems") {
        secondInventorySetup(event.data.itemList);
        hanyaUpdateBarSaja(event.data.hitung, event.data.max);
        // //console.log('brankas masuk')
        //console.log(event.data.max);
    } else if (event.data.action == "setShopInventoryItems") {
        shopInventorySetup(event.data.itemList, event.data.zone)
    } else if (event.data.action == "setInfoPlayer") {
        updateweights(event.data.playerWeight, event.data.maxweight)
    } else if (event.data.action == "setInfoText") {
        updateotherweights(event.data.text, (event.data.weight / 10), (event.data.max / 10));
        // hanyaUpdateBarSaja(event.data.weight, event.data.max);
        //console.log(event.data.weight, event.data.max)
    } else if (event.data.action == "itemUsed") {
        UseBar(event.data.alerts);
    } else if (event.data.action == "notification") {
        sendNotification(event.data.itemaction, event.data.itemname, event.data.itemlabel , event.data.itemcount , event.data.itemremove)
    } else if (event.data.action == "showhotbar"){
        showHotbar(event.data.itemList, event.data.fastItems, event.data)
    } else if (event.data.action == "nearPlayers") {
        $("#nearPlayers").html("");
        $.each(event.data.players, function (index, player) {
            $("#nearPlayers").append('<button class="nearbyPlayerButton" data-player="' + player.player + '">' + player.player + '</button>');
        });
        $("#dialog").dialog("open");
        $(".nearbyPlayerButton").click(function () {
            $("#dialog").dialog("close");
            player = $(this).data("player");
            $.post("http://vd-inv/GiveItem", JSON.stringify({
                player: player,
                item: event.data.item,
                number: parseInt($("#count").val())
            }));
        });
    }
});

function updateweights(totalWeight, playerMaxWeight) {
    var per = (totalWeight/1000)/(playerMaxWeight/100000)
    if (per >= 100) {
        per = 100
    }
    $(".pro").css("width",per+"%");
    $("#player-inv-weight").html("Weight:" + (totalWeight).toFixed(2) + " / " + (playerMaxWeight).toFixed(2));

    return true;
}

function namaic(nama) {
    $("#player-inv-label").html(nama);
}

function updatenootherweights() {
    $("#other-inv-label").html('');
    $("#other-inv-weight").html('');
    $(".pro1").css("width","0%");
    // $("#other-inv-label").hide();
    // $("#other-inv-weight").hide();
    // $(".pro1").hide();

    return true;
}

function updateotherweights(otherLabel, totalWeightOther, otherMaxWeight) {
    $("#other-inv-label").html(otherLabel);
    if (totalWeightOther === undefined && otherMaxWeight === undefined) {
        // $("#other-inv-label").html('');
        $("#other-inv-weight").html("");
        // $(".pro1").css("width","100%");
        //console.log('satu')
        var per1 = (totalWeightOther/1000)/(otherMaxWeight/100000)
        $(".pro1").css("width",per1+"%");
    } else if (totalWeightOther === undefined) {
        $("#other-inv-weight").html("Weight:UNLIMITED / " + (otherMaxWeight/100).toFixed(2));
        // $(".pro1").css("width","100%");
        var per1 = (totalWeightOther/1000)/(otherMaxWeight/100000)
        $(".pro1").css("width",per1+"%");
        //console.log('dua')
    } else if (otherMaxWeight === undefined || otherMaxWeight == '') {
        $("#other-inv-weight").html("Weight:" + (totalWeightOther/100).toFixed(2) + " / UNLIMITED");
        // $(".pro1").css("width","100%");
        var per1 = (totalWeightOther/1000)/(otherMaxWeight/100000)
        $(".pro1").css("width",per1+"%");
        //console.log('tiga')
    } else if (totalWeightOther != '' || otherMaxWeight != '') {
        $("#other-inv-weight").html("Weight:" + (totalWeightOther/100).toFixed(2) + " / " + (otherMaxWeight/100).toFixed(2));
        var per1 = (totalWeightOther/1000)/(otherMaxWeight/100000)
        $(".pro1").css("width",per1+"%");
        //console.log('empat')
    } else {
        $("#other-inv-weight").html("Weight:UNLIMITED / UNLIMITED");
        // $(".pro1").css("width","100%");
        var per1 = (totalWeightOther/1000)/(otherMaxWeight/100000)
        $(".pro1").css("width",per1+"%");
        //console.log('lima')
    }
    
    return true;
}

function hanyaUpdateBarSaja(totalWeightOther, otherMaxWeight) {
    if (totalWeightOther === undefined && otherMaxWeight === undefined) {
        // $("#other-inv-label").html('');
        $("#other-inv-weight").html("");
        //console.log('satu2')
        // $(".pro1").css("width","100%");
        var per1 = (totalWeightOther/1000)/(otherMaxWeight/100000)
        $(".pro1").css("width",per1+"%");
    } else if (totalWeightOther === undefined) {
        $("#other-inv-weight").html("Weight:UNLIMITED / " + (otherMaxWeight/100).toFixed(2));
        // $(".pro1").css("width","100%");
        var per1 = (totalWeightOther/1000)/(otherMaxWeight/100000)
        $(".pro1").css("width",per1+"%");
        //console.log('dua2')
    } else if (otherMaxWeight === undefined || otherMaxWeight == '') {
        $("#other-inv-weight").html("Weight:" + (totalWeightOther/100).toFixed(2) + " / UNLIMITED");
        // $(".pro1").css("width","100%");
        var per1 = (totalWeightOther/1000)/(otherMaxWeight/100000)
        $(".pro1").css("width",per1+"%");
        //console.log('tiga2')
    } else if (totalWeightOther != '' || otherMaxWeight != '') {
        $("#other-inv-weight").html("Weight:" + (totalWeightOther/100).toFixed(2) + " / " + (otherMaxWeight/100).toFixed(2));
        var per1 = (totalWeightOther/1000)/(otherMaxWeight/100000)
        $(".pro1").css("width",per1+"%");
        //console.log('empat2')
        
    } else {
        $("#other-inv-weight").html("Weight:UNLIMITED / UNLIMITED");
        // $(".pro1").css("width","100%");
        var per1 = (totalWeightOther/1000)/(otherMaxWeight/100000)
        $(".pro1").css("width",per1+"%");
        //console.log('lima2')
    }
    
    return true;
}

function showHotbar(items, fastItems, data) {
    $("#playerInventoryHotbar").html("");
    $.each(items, function (index, item) {
        count = setCount(item);
        $("#playerInventory").append('<div class="slot"><div id="item-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
            '<div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div> </div ><div class="item-name-bg"></div></div>');
        $('#item-' + index).data('item', item);
        $('#item-' + index).data('inventory', "main");
    });

    $("#playerInventoryHotbar").fadeIn();
    setTimeout(function(){
        $("#playerInventoryHotbar").fadeOut();
    }, 1000);
    setTimeout(function(){
        $("#playerInventoryHotbar").html("");
    }, 1500);

    var i;
    for (i = 1; i < 6; i++) {
        $("#playerInventoryHotbar").append('<div class="slotFast"><div id="itemFast-' + i + '" class="item" >' +
            '<div class="keybind">' + i + '</div><div class="item-count"></div> <div class="item-name"></div> </div ><div class="item-name-bg"></div></div>');
    }

    $.each(fastItems, function (index, item) {
        count = setCount(item);
        $('#itemFast-' + item.slot).css("background-image", 'url(\'img/items/' + item.name + '.png\')');
        $('#itemFast-' + item.slot).html('<div class="keybind">' + item.slot + '</div><div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div> <div class="item-name-bg"></div>');
        $('#itemFast-' + item.slot).data('item', item);
        $('#itemFast-' + item.slot).data('inventory', "fast");
    });
}

function sendNotification(action, item, itemlabel, count, remove) {
    var html = '';
    var prefix = '+';
    
    if (remove){
        prefix = '-';
    } else {
        prefix = '+';
    }
    
    html = '<div class="slotNotif" id="noti"><div id="item-action">' + action + '</div><div class="item2" style = "background-image: url(\'img/items/' + item + '.png\')">' +
    '<div class="item-count3">' + prefix + count + '</div> <div class="item-name2">' + itemlabel + '</div> </div ><div class="item-name-bg2"></div></div>';

    $(html).fadeIn(500).appendTo("#notificacao").delay(3000).fadeOut(500);
}

var alertTimer = null;
function ItemUsed(alerts) {
    $("#use-alert").html("");
    clearTimeout(alertTimer);
    $('#use-alert').hide('slide', {direction: 'left'}, 500, function () {
        $('#use-alert .slot').remove();
        $.each(alerts, function (index, data) {
            $("#use-alert").append('<div class="slot"><div id="item-' + index + '" class="item" style = "background-image: url(\'img/items/' + data.item.itemId + '.png\')">' +
            '<div class="item-count"> ' + data.qty + ' </div> <div class="item-name">' + data.item.label + '</div> </div ><div class="item-name-bg"></div></div>');
            $('#item-' + index).data('item', data);
        });
    });

    $('#use-alert').show('slide', {direction: 'left'}, 500, function () {
        alertTimer = setTimeout(function () {
            $('#use-alert .slot').addClass('expired');
            $('#use-alert').hide('slide', {direction: 'left'}, 500, function () {
                $('#use-alert .slot.expired').remove();
            });
        }, 1000);
    });
}

let usedBar     = 0
let image       = ""
let name        = ""
let htmlstring  = ""
let asw         = "asw"

function UseBar(alerts) {
    document.getElementById('UseBar').innerHTML = "";
    $.each(alerts, function(index, data) {
        image = data.item.itemId;
        name = data.item.label;
        htmlstring = "<div id='bind1'> " + data.message + " </div> <div class='item1' > <div class='itemname'> " + name + " </div> <img src='img/items/" + image + ".png' class='itemimage'>  </div>";
        document.getElementById('UseBar').innerHTML = htmlstring;
        $("#UseBar").fadeIn(500);
        clearTimeout(usedBar)
        usedBar = setTimeout(() => {
            $("#UseBar").fadeOut(1500);
        }, 1500)
    });
}

function closeInventory() {
    $.post("http://vd-inv/NUIFocusOff", JSON.stringify({}));
}

function inventorySetup(items, fastItems) {
    $("#playerInventory").html("");
    
    var space = 0
    var i;
    for (i = 1; i < 6 ; i++) { 
      $("#playerInventory").append('<div class="slotFast"><div id="itemFast-' + i + '" class="item" >' +
            '<div class="keybind">' + i + '</div> <div class="item-name"></div> </div ><div class="item-name-bg"></div></div>');
    }

    $.each(fastItems, function (index, item) {
        count = setCount(item);
        count2 = count.toString()
        if (count2.includes("/")) {
            split = count.split(" / ");
            if (split[1] != null) {
                jumlah = split[1] / split[0];
                jumlah = (100 / jumlah) + 5;
            } else {
                jumlah = item.count;
            }
        } else {
            jumlah = count;
        }

        if (jumlah > 100) {
            jumlah = 99;
        }

        $('#itemFast-' + item.slot).css("background-image",'url(\'img/items/' + item.name + '.png\')');
        $('#itemFast-' + item.slot).html('<div class="keybind">' + item.slot + '</div><div class="item-count2">' + count + '</div> <div class="item-name">' + item.label + '</div></div> <div class="item-name-bg"></div><div class="item-health" style="width: '+jumlah+'%;"></div></div>');
        $('#itemFast-' + item.slot).data('item', item);
        $('#itemFast-' + item.slot).data('inventory', "fast");
    });
    
    $.each(items, function (index, item) {
        count = setCount(item);
        count2 = count.toString()
        if (count2.includes("/")) {
            split = count.split(" / ");
            if (split[1] != null) {
                jumlah = split[1] / split[0];
                jumlah = (100 / jumlah) + 5;
            } else {
                jumlah = item.count;
            }
        } else {
            jumlah = count;
        }

        if (jumlah > 100) {
            jumlah = 99;
        }

        if (item.type === "item_account" || item.type === "item_money") {
            $("#playerInventory").append('<div class="slot"><div id="item-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
                '<div class="item-count"> ' + count + ' </div> <div class="item-name">' + item.label + '</div></div> <div class="item-name-bg"></div></div>');
        } else {
            $("#playerInventory").append('<div class="slot"><div id="item-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
                '<div class="item-count"> ' + count + ' </div> <div class="item-name">' + item.label + '</div></div> <div class="item-name-bg"></div><div class="item-health" style="width: '+jumlah+'%;"></div></div>');
        }
        $('#item-' + index).data('item', item);
        $('#item-' + index).data('inventory', "main");
        space = space + 1
    });

    for (var i = 0; i < (35 - space); i++) {
        $("#playerInventory").append('<div class="slot">' + '<div class="item-name"> </div> </div>');
    }

    makeDraggables()
}

function makeDraggables(){
    $('#itemFast-1').droppable({
        drop: function (event, ui) {
            itemData = ui.draggable.data("item");
            itemInventory = ui.draggable.data("inventory");

            if ((itemInventory === "main" || itemInventory === "fast") && (itemData.type === "item_standard" || itemData.type === "item_weapon") ) {
                disableInventory(500);
                $.post("http://vd-inv/PutIntoFast", JSON.stringify({
                    item: itemData,
                    slot : 1,
                }));
            }
        }
    });

    $('#itemFast-2').droppable({
        drop: function (event, ui) {
            itemData = ui.draggable.data("item");
            itemInventory = ui.draggable.data("inventory");

            if ((itemInventory === "main" || itemInventory === "fast") && (itemData.type === "item_standard" || itemData.type === "item_weapon") ) {
                disableInventory(500);
                $.post("http://vd-inv/PutIntoFast", JSON.stringify({
                    item: itemData,
                    slot : 2
                }));
            }
        }
    });

    $('#itemFast-3').droppable({
        drop: function (event, ui) {
            itemData = ui.draggable.data("item");
            itemInventory = ui.draggable.data("inventory");

            if ((itemInventory === "main" || itemInventory === "fast") && (itemData.type === "item_standard" || itemData.type === "item_weapon") ) {
                disableInventory(500);
                $.post("http://vd-inv/PutIntoFast", JSON.stringify({
                    item: itemData,
                    slot : 3
                }));
            }
        }
    });

    $('#itemFast-4').droppable({
        drop: function (event, ui) {
            itemData = ui.draggable.data("item");
            itemInventory = ui.draggable.data("inventory");

            if ((itemInventory === "main" || itemInventory === "fast") && (itemData.type === "item_standard" || itemData.type === "item_weapon") ) {
                disableInventory(500);
                $.post("http://vd-inv/PutIntoFast", JSON.stringify({
                    item: itemData,
                    slot : 4
                }));
            }
        }
    });

    $('#itemFast-5').droppable({
        drop: function (event, ui) {
            itemData = ui.draggable.data("item");
            itemInventory = ui.draggable.data("inventory");

            if ((itemInventory === "main" || itemInventory === "fast") && (itemData.type === "item_standard" || itemData.type === "item_weapon") ) {
                disableInventory(500);
                $.post("http://vd-inv/PutIntoFast", JSON.stringify({
                    item: itemData,
                    slot : 5
                }));
            }
        }
    });
}

function secondInventorySetup(items) {
    $("#otherInventory").html("");
    var space = 0
    $.each(items, function (index, item) {
        count = setCount(item);
        $("#otherInventory").append('<div class="slot"><div id="itemOther-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
            '<div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div></div> <div class="item-name-bg"></div><div class="item-health" style="width: 99%;"></div></div>');
        $('#itemOther-' + index).data('item', item);
        $('#itemOther-' + index).data('inventory', "second");
        space = space + 1
    });

    for (var i = 0; i < (35 - space); i++) {
        $("#otherInventory").append('<div class="slot">' + '<div class="item-name"> </div> </div>');
    }

}

function shopInventorySetup(items, zone) {
    $("#otherInventory").html("");
    var space = 0
    $.each(items, function (index, item) {
        //count = setCount(item)
        cost = setCost(item);
        $("#otherInventory").append('<div class="slot"><div id="itemOther-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
            '<div class="item-count">' + cost + '</div> <div class="item-name">' + item.label + '</div></div> <div class="item-name-bg"></div><div class="item-health" style="width: 99%;"></div></div>');
        $('#itemOther-' + index).data('item', item);
        $('#itemOther-' + index).data('inventory', "second");
        $('#itemOther-' + index).data('zone', zone);
        space = space + 1
    });

    for (var i = 0; i < (35 - space); i++) {
        $("#otherInventory").append('<div class="slot">' + '<div class="item-name"> </div> </div>');
    }
}

function Interval(time) {

    var timer = false;

    this.start = function () {

        if (this.isRunning()) {

            clearInterval(timer);

            timer = false;

        }



        timer = setInterval(function () {

            disabled = false;

        }, time);

    };

    this.stop = function () {

        clearInterval(timer);

        timer = false;

    };

    this.isRunning = function () {

        return timer !== false;

    };

}



function disableInventory(ms) {

    disabled = true;



    if (disabledFunction === null) {

        disabledFunction = new Interval(ms);

        disabledFunction.start();

    } else {

        if (disabledFunction.isRunning()) {

            disabledFunction.stop();

        }



        disabledFunction.start();

    }

}

function setCount(item) {
    count = item.count

    if (item.limit > 0) {
        count = item.count + " / " + item.limit
    }

    if (item.type === "item_weapon") {
        if (count == 0) {
            count = "0";
        } else {
            count = '<img src="img/bullet.png" class="ammoIcon"> ' + item.count;
        }
    }

    if (item.type === "item_account" || item.type === "item_money") {
        count = formatMoney(item.count);
    }

    return count;
}

function setCost(item) {

    cost = item.price
    if (Config.JualKeWarung == true){
    if (item.price == 0){
        cost = "GRATIS"
    }
    if (item.price > 0) {
        cost = "BELI $" + item.price + "| JUAL $" + item.pricesell
    }
    } else if (Config.JualKeWarung == false){
        if (item.price == 0){
            cost = "GRATIS"
        }
        if (item.price > 0) {
            cost = "BELI $" + item.price
        }
    }
    return cost;

}



function formatMoney(n, c, d, t) {

    var c = isNaN(c = Math.abs(c)) ? 2 : c,

        d = d == undefined ? "." : d,

        t = t == undefined ? "," : t,

        s = n < 0 ? "-" : "",

        i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),

        j = (j = i.length) > 3 ? j % 3 : 0;



    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t);

};



$(document).ready(function () {
    $("#count").focus(function () {
        $(this).val("")
    }).blur(function () {
        if ($(this).val() == "") {
            $(this).val("1")
        }
    });

    $("body").on("keyup", function (key) {
        if (Config.closeKeys.includes(key.which)) {
            closeInventory();
        }
    });

    $('#use').droppable({
        hoverClass: 'hoverControl',
        drop: function (event, ui) {
            itemData = ui.draggable.data("item");
            if (itemData == undefined || itemData.usable == undefined) {
                return;
            }

            itemInventory = ui.draggable.data("inventory");
            if (itemInventory == undefined || itemInventory == "second") {
                return;
            }

            if (itemData.usable) {
                disableInventory(300);
                $.post("http://vd-inv/UseItem", JSON.stringify({
                    item: itemData
                }));
            }
        }
    });

    $('#give').droppable({
        hoverClass: 'hoverControl',
        drop: function (event, ui) {
            itemData = ui.draggable.data("item");
            if (itemData == undefined || itemData.canRemove == undefined) {
                return;
            }

            itemInventory = ui.draggable.data("inventory");
            if (itemInventory == undefined || itemInventory == "second") {

                return;

            }

            if (itemData.canRemove) {
                disableInventory(300);
                $.post("http://vd-inv/GetNearPlayers", JSON.stringify({
                    item: itemData
                }));
            }
        }
    });

    $('#drop').droppable({
        hoverClass: 'hoverControl',
        drop: function (event, ui) {
            itemData = ui.draggable.data("item");
            if (itemData == undefined || itemData.canRemove == undefined) {
                return;
            }
            itemInventory = ui.draggable.data("inventory");

            if (itemInventory == undefined || itemInventory == "second") {
                return;
            }

            if (itemData.canRemove) {
                disableInventory(300);
                $.post("http://vd-inv/DropItem", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            }
        }
    });

    $('#playerInventory').droppable({
        drop: function (event, ui) {
            itemData = ui.draggable.data("item");
            itemInventory = ui.draggable.data("inventory");

            if (type === "trunk" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromTrunk", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "property" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromProperty", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val()),
                    owner : ownerHouse
                }));
            } else if (type === "gudang" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromGudang", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                })); 
            } else if (type === "storage" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromStorage", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                })); 
            } else if (type === 'locker' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://vd-inv/TakeFromLocker',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
						locker: locker,
					})
				);
            } else if (type === 'stash' && itemInventory === 'stash') {
				disableInventory(500);
				$.post(
					'http://vd-inv/TakeFromStash',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
						stash: stash,
					})
				);
            } else if (type === "rusun" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromRusun", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "losmen" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromLosmen", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "koswc" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromKosWC", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "koswanita" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromKosWanita", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "warehouse" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromWarehouse", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "warehouse2" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromWarehouse2", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "warehouse3" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromWarehouse3", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "vault" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromVault", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "glovebox" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromGlovebox", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "motels" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromMotel", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "motelsbed" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromMotelBed", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "player" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromPlayer", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (itemInventory === "fast") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromFast", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "shop" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://vd-inv/TakeFromShop", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            }
        }
    });

    $('#otherInventory').droppable({
        drop: function (event, ui) {
            itemData = ui.draggable.data("item");
            itemInventory = ui.draggable.data("inventory");

            if (type === "trunk" && itemInventory === "main") {
                disableInventory(500);
                $.post("http://vd-inv/PutIntoTrunk", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "property" && itemInventory === "main") {
                disableInventory(500);
                $.post("http://vd-inv/PutIntoProperty", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val()),
                    owner : ownerHouse
                }));
            } else if (type === "gudang" && itemInventory === "main") {
                disableInventory(500);
                $.post("http://vd-inv/PutIntoGudang", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "storage" && itemInventory === "main") {
                disableInventory(500);
                $.post("http://vd-inv/PutIntoStorage", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                })); 
            } else if (type === 'locker' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://vd-inv/PutIntoLocker',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
						locker: locker,
					})
				);
            } else if (type === 'stash' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://vd-inv/PutIntoStash',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
						stash: stash,
					})
				);
            } else if (type === "motels" && itemInventory === "main") {
                disableInventory(500);
                $.post("http://vd-inv/PutIntoMotel", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "motelsbed" && itemInventory === "main") {
                disableInventory(500);
                $.post("http://vd-inv/PutIntoMotelBed", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "vault" && itemInventory === "main") {
                disableInventory(500);
                $.post("http://vd-inv/PutIntoVault", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "glovebox" && itemInventory === "main") {
                disableInventory(500);
                $.post("http://vd-inv/PutIntoGlovebox", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "shop" && itemInventory === "main") {
                disableInventory(500);
                $.post("http://vd-inv/SellToShop", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "player" && itemInventory === "main") {
                disableInventory(500);
                $.post("http://vd-inv/PutIntoPlayer", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            }
        }
    });

    $("#count").on("keypress keyup blur", function (event) {
        $(this).val($(this).val().replace(/[^\d].+/, ""));
        if ((event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    });
});

$.widget('ui.dialog', $.ui.dialog, {
    options: {
        // Determine if clicking outside the dialog shall close it
        clickOutside: false,
        // Element (id or class) that triggers the dialog opening
        clickOutsideTrigger: ''
    },

    open: function () {
        var clickOutsideTriggerEl = $(this.options.clickOutsideTrigger),
            that = this;
        if (this.options.clickOutside) {
            // Add document wide click handler for the current dialog namespace
            $(document).on('click.ui.dialogClickOutside' + that.eventNamespace, function (event) {
                var $target = $(event.target);
                if ($target.closest($(clickOutsideTriggerEl)).length === 0 &&
                    $target.closest($(that.uiDialog)).length === 0) {
                    that.close();
                }
            });
        }
        // Invoke parent open method
        this._super();
    },

    close: function () {
        // Remove document wide click handler for the current dialog
        $(document).off('click.ui.dialogClickOutside' + this.eventNamespace);
        // Invoke parent close method
        this._super();
    },
});