-- // BLIP SAFEZONE \\ --
local function SafeZoneBlip(coords, text, radius, color, sprite)
	local blip = AddBlipForRadius(coords, radius)

	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 2)
	SetBlipAlpha (blip, 128)

	blip = AddBlipForCoord(coords)

	SetBlipHighDetail(blip, true)
	SetBlipSprite (blip, sprite)
	SetBlipScale  (blip, 1.0)
	SetBlipColour (blip, color)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
end


CreateThread(function()
	for k,safezone in pairs(Vidi.BlipSafeZone) do

		SafeZoneBlip(safezone.coords, safezone.name, safezone.radius, safezone.color, safezone.sprite)	
	end
end)