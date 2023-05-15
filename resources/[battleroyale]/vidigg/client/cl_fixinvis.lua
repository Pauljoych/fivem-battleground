RegisterCommand('fixinvis', function()
    SetEntityVisible(PlayerPedId(), true, 0)
    ResetEntityAlpha(cache.ped)
end)