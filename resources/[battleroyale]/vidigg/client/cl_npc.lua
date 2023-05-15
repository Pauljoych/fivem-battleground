
local function DrawText3D(x, y, z, text)
	SetTextScale(0.27, 0.26)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
wait = 3000
CreateThread(function()
    while true do
        Wait(wait)
        for k,v in pairs(Vidi.WarlokTokoBaju) do
            local coords = GetEntityCoords(cache.ped, true)
            local dist = #(v.lokasi - coords)
            if dist < 100.0 then
                wait = 5
                DrawText3D(v.lokasi.x,v.lokasi.y,v.lokasi.z + 1.0,v.label)
            end
        end
    end
end)
