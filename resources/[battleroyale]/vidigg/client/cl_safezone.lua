dizonaaman = false

LocalPlayer.state.dizonaman = false

-- // safezone \\ --
RegisterCommand('die', function()
    SetEntityHealth(cache.ped, 0)
end)

local function inZonaAmanUtama()
    LocalPlayer.state.dizonaman = true
    dizonaaman = true
    lib.showTextUI('SAFE ZONE BATTLE ROYALE', {
        position = "left-center",
        icon = 'home',
        style = {
            borderRadius = 0,
            backgroundColor = '#ac0e0e',
            color = 'white'
        }
    })
    TriggerEvent('ngzona', true)
    SetCanAttackFriendly(cache.ped, false, false)
    NetworkSetFriendlyFireOption(false)
end

local function DiLuarZonaAmanUtama()
    LocalPlayer.state.dizonaman = false
    dizonaaman = false
    TriggerEvent('ngzona', false)
    SetCanAttackFriendly(cache.ped, true, false)
    NetworkSetFriendlyFireOption(true)
    lib.hideTextUI()
end

local function DiZonaAmanUtama()
    LocalPlayer.state.dizonaman = true
    dizonaaman = true
    TriggerEvent('ngzona', true)
    DisablePlayerFiring(cache.ped, true)
    DisableControlAction(0, 24, true) -- klik kiri
    DisableControlAction(0, 140, true) -- disable r
    DisableControlAction(0, 106, true) -- Disable in-game mouse controls
    SetCanAttackFriendly(cache.ped, false, false)
    NetworkSetFriendlyFireOption(false)
end

RegisterCommand('fixlib', function()
    if not dizonaaman then
        lib.hideTextUI()
        -- ESX.ShowNotification("Royal", "Berhasil", 2500, 'success')
    else
        ESX.ShowNotification("Royal", "Dapat digunakan ketika diluar zona aman", 2500, 'info')
    end
end)

local sphere = lib.zones.sphere({
    coords = vector3(-1280.16, -3386.36, 13.96), -- bandara
    radius = 55,
    debug = false,
    inside = DiZonaAmanUtama,
    onEnter = inZonaAmanUtama,
    onExit = DiLuarZonaAmanUtama
})
