local searched = {}
local timer = {}
local canSearch = true

-- // dumpster \\ --
exports.ox_target:addModel(Vidi.LokasiLooting, {
    {
        event = 'oke:rilek',
        icon = 'fas fa-dumpster',
        label = '🔍 Looting',
        distance = 1,
    },
})


RegisterNetEvent('oke:rilek')
AddEventHandler('oke:rilek', function()
    if not dizonaaman then
    local pos = GetEntityCoords(PlayerPedId())

    -- If it cannot search in the dumpster simply return 0, so that the code more ahead does not come executed
    if not canSearch then
        return
    end

    for i = 1, #Vidi.LokasiLooting do
        local dumpster = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, Vidi.LokasiLooting[i], false, false, false)

        if dumpster ~= 0 then
            if searched[dumpster] then
                ESX.ShowNotification("INFO", "Tempat ini sudah di looting!", 2500, 'info')
            else -- If is new            
                StartSearching(dumpster)
                searched[dumpster] = true
            end
            break -- We have already found the dumpster, so we stop the loop to not waste resources
        end
        end
    end
end)

function StartSearching(dumpster)
    LocalPlayer.state.lagiSibuk = true
    canSearch = false
    -- FreezeEntityPosition(cache.ped, true)
    local berhasil = lib.progressCircle({
        duration = 6000,
        label = 'Mencari Barang',
        useWhileDead = false,
        position = 'bottom',
        canCancel = true,
        disable = {
        car = true,
        combat = true,
        mouse = false,
        move = true,
        },
        anim = {
            dict = 'amb@prop_human_bum_bin@base',
            clip = 'base' 
        },
    })
    if berhasil then 
        LocalPlayer.state.lagiSibuk = false
        lagilooting = false
        canSearch = true
        timer[dumpster] = 5
        -- TriggerServerEvent('vidigg:kasihlooting') -- server
        TriggerEvent('client:kasihloot')
        FreezeEntityPosition(cache.ped, false)
        ClearPedTasks(ped)
    else
        LocalPlayer.state.lagiSibuk = false
       lagilooting = false
       canSearch = true
       ESX.ShowNotification('INFO', "Cancel Looting", 2500, 'error')
    --    FreezeEntityPosition(cache.ped, false)
    end
end

-- Timer
CreateThread(function()
    while true do
        for entity,time in pairs(timer) do
            if time == 0 then
                searched[entity] = false
                timer[entity] = nil
            else
                time = time - 1
            end
        end
        Wait(60000)
    end
end)