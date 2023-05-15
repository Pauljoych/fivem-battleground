rightPosition = {
    x = 1400,
    y = 200
}
leftPosition = {
    x = 0,
    y = 100
}
menuPosition = {
    x = 0,
    y = 200
}

if Config.MenuPosition then
    if Config.MenuPosition == "left" then
        menuPosition = leftPosition
    elseif Config.MenuPosition == "right" then
        menuPosition = rightPosition
    end
end

if Config.CustomMenuEnabled then
    local RuntimeTXD = CreateRuntimeTxd('Custom_Menu_Head')
    local Object = CreateDui(Config.MenuImage, 512, 128)
    _G.Object = Object
    local TextureThing = GetDuiHandle(Object)
    local Texture = CreateRuntimeTextureFromDuiHandle(RuntimeTXD, 'Custom_Menu_Head', TextureThing)
    Menuthing = "Custom_Menu_Head"
else
    Menuthing = "shopui_title_sm_hangar"
end

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Royal", "BATTLEGROUND", menuPosition["x"], menuPosition["y"], Menuthing, Menuthing)
_menuPool:Add(mainMenu)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

local EmoteTable = {}
local FavEmoteTable = {}
local KeyEmoteTable = {}
local DanceTable = {}
local AnimalTable = {}
local PropETable = {}
local WalkTable = {}
local FaceTable = {}
local ShareTable = {}
local FavoriteEmote = ""

-- Citizen.CreateThread(function()
--   while true do
--     if Config.FavKeybindEnabled then
--       if IsControlPressed(0, Config.FavKeybind) then
--         if not IsPedSittingInAnyVehicle(PlayerPedId()) then
--           if FavoriteEmote ~= "" then
--             EmoteCommandStart(nil,{FavoriteEmote, 0})
--             Wait(3000)
--           end
--         end
--       end
--     end
--     Wait(5)
--   end
-- end)

lang = Config.MenuLanguage

function AddEmoteMenu(submenu)
    -- local submenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['emotes'], "", "", Menuthing, Menuthing)
    -- local dancemenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['danceemotes'], "", "", Menuthing, Menuthing)
    -- local animalmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['animalemotes'], "", "", Menuthing, Menuthing)
    -- local propmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['propemotes'], "", "", Menuthing, Menuthing)
    -- table.insert(EmoteTable, Config.Languages[lang]['danceemotes'])
    -- table.insert(EmoteTable, Config.Languages[lang]['danceemotes'])
    -- table.insert(EmoteTable, Config.Languages[lang]['animalemotes'])
end

function AddWalkMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['walkingstyles'], "", "", Menuthing, Menuthing)

    walkreset = NativeUI.CreateItem(Config.Languages[lang]['normalreset'], Config.Languages[lang]['resetdef'])
    submenu:AddItem(walkreset)
    table.insert(WalkTable, Config.Languages[lang]['resetdef'])

    WalkInjured = NativeUI.CreateItem("Injured", "")
    submenu:AddItem(WalkInjured)
    table.insert(WalkTable, "move_m@injured")

    for a, b in pairsByKeys(DP.Walks) do
        x = table.unpack(b)
        walkitem = NativeUI.CreateItem(a, "")
        submenu:AddItem(walkitem)
        table.insert(WalkTable, x)
    end

    submenu.OnItemSelect = function(sender, item, index)
        if item ~= walkreset then
            WalkMenuStart(WalkTable[index])
        else
            ResetPedMovementClipset(PlayerPedId())
        end
    end
end

function OpenEmoteMenu()
    if not LocalPlayer.state.lagiSibuk then
        mainMenu:Visible(not mainMenu:Visible())
    end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

AddEmoteMenu(mainMenu)
-- AddCancelEmote(mainMenu)
if Config.WalkingStylesEnabled then
    AddWalkMenu(mainMenu)
end
if Config.ExpressionsEnabled then
    -- AddFaceMenu(mainMenu)
end

_menuPool:RefreshIndex()

CreateThread(function()
    while true do
        Wait(1)
        _menuPool:ProcessMenus()
    end
end)

RegisterNetEvent("dp:RecieveMenu") -- For opening the emote menu from another resource.
AddEventHandler("dp:RecieveMenu", function()
    OpenEmoteMenu()
end)
