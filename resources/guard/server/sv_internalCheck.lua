RegisterNetEvent("core-guard:internalDetected")
AddEventHandler("core-guard:internalDetected", function()
    local src = source
    print("Eulen detected")
    DropPlayer(src, "Eulen detected")
end)
