RegisterNetEvent("core-guard:internalDetected")
AddEventHandler("core-guard:internalDetected", function()
    local src = source
    print("Eulan detected")
    DropPlayer(src, "Eulan detected")
end)