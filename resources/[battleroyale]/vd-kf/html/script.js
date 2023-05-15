window.addEventListener('message', function (event) {
    let e = event.data
    switch (e.type) {
        case "add":
            addColumn(e.aName, e.dName, e.weapon, e.bone, e.aId, e.dId, e.combo);
            break;
        case "kill":
            colorColumn("kill", e.aId);
            break;
        case "death":
            colorColumn("death", e.dId);
            break;
        default: break;
    }
});

let columnId = 0;

function addColumn(aName, dName, weapon, bone, aId, dId, combo) {
    setTimeout(() => {
        columnId += 1
        let column = ``;
        column = `
        <div class="wrapper" data-columnid="${columnId}" data-killer="${aId}" data-deader="${dId}">

            <div class="wkill" style="display:none" data-killer="${aId}">
                <i class="fa-solid fa-ghost"></i>
            </div>

            <div class="wdeath" style="display:none" data-deader="${dId}">
                <i class="fa-solid fa-skull"></i>
            </div>

            ${combo <= 1 ? "" : `<div class="wcombo"><span>${combo}<span id="x">x</span></span></div>`}

            <div class="wleft">
                <span>${aName}</span>
            </div>

            <div class="wii">
                <img src="/html/weapons/${weapon}.png">
                ${bone == 31086 ? `<i class="fa-solid fa-crosshairs"></i>` : ""}
            </div>

            <div class="wright">
                <span>${dName}</span>
            </div>

        </div>
        `;
        $('body').append(column);
        anim(columnId);
    }, 250);
}

function anim(id) {
    $(`.wrapper[data-columnid="${id}"]`).animate({ "margin-right": "0vh" }, { duration: 500 }, setTimeout(() => {
        $(`.wrapper[data-columnid="${id}"]`).animate({ "margin-right": "-50vh" }, { duration: 500 }, setTimeout(() => {
            $(`.wrapper[data-columnid="${id}"]`).remove();
        }, 500));
    }, 5000));
}

function colorColumn(type, id) {
    console.log(type, id)
    setTimeout(() => {
        if (type == "kill") {
            //$(`.wrapper[data-killer="${id}"]`).addClass("me");
            $(`.wrapper[data-killer="${id}"]`).children('.wkill').show();
        } else if (type == "death") {
            //$(`.wrapper[data-deader="${id}"]`).addClass("death");
            $(`.wrapper[data-deader="${id}"]`).children('.wdeath').show();
        }
    }, 300);
}