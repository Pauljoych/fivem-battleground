CreateThread(function()
    while true do
        Wait(100)
        local ped = PlayerPedId() -- That return current ped
        local health = (GetEntityHealth(ped) - 100)
        local armor = GetPedArmour(ped)
        local stamina = (GetPlayerSprintTimeRemaining(PlayerId()) * 10)

        --print('Vie: ' .. health)
        --print('Armure: ' .. armor)
        if IsPauseMenuActive(true) then 
            SendNUIMessage({
                showHud = false
            })
        elseif not IsPauseMenuActive(true) then
            SendNUIMessage({
                showHud = true,
                health = health,
                stamina = stamina,
                armor = armor
            })
        end
    end
end)