local IsBusy = false

RegisterNetEvent('vidi:revive')
AddEventHandler('vidi:revive', function()
    if not IsEntityDead(PlayerPedId()) then
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 2.5 then
        IsBusy = true
                local closestPlayerPed = GetPlayerPed(closestPlayer)

                if IsPedDeadOrDying(closestPlayerPed, 1) then   
                local berhasil = lib.progressCircle({
                        position = 'bottom',
                        duration = 8000,
                        label = 'Revive Player',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                        car = true,
                        combat = true,
                        mouse = false,
                        move = true,
                        },
                        anim = {
                            dict = 'mini@cpr@char_a@cpr_str',
                            clip = 'cpr_pumpchest' , 
                            flag = 3,
                        },
                    })

                    if berhasil then
                        FreezeEntityPosition(cache.ped, false)
                        ClearPedTasks(cache.ped)
                        TriggerServerEvent('esx_ambulancejob:removeItem', '')
                        TriggerServerEvent('esx_ambulancejob:menghidupkan', GetPlayerServerId(closestPlayer))
                        ESX.ShowNotification('INFO', "Revive berhasil dilakukan",  2500, 'info')
                    else
                        ESX.ShowNotification('INFO', "Revive dibatalkan",  2500, 'info')
                end
                                        
                    if Config.ReviveReward > 0 then
                    else 
                            -- ESX.ShowNotification('INFO', "Revive berhasil dilakukan",  2500, 'info')
                        end
                    else
                            ESX.ShowNotification('INFO', "Tidak ada orang pingsan disekitar kamu",  2500, 'error')
                        end

        IsBusy = false
        else
        ESX.ShowNotification('INFO', "Tidak ada orang disekitar kamu",  2500, 'error')
    end
else
    ESX.ShowNotification('INFO', "Mau ngapain bro ? wkwkwk",  2500, 'error')
end
end)
