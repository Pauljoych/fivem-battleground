exports.ox_target:addPolyZone({
	name = "WW",
	points = {
		vec3(-108.0299987793, -237.10000610352, 45.0),
	},
	thickness = 4.0,
})
exports.ox_target:addPolyZone({
	name = "12",
	points = {
		vec3(-129.0, -415.0, 34.0),
	},
	thickness = 4.0,
})
exports.ox_target:addBoxZone({
	name = "BOX",
	coords = vec3(-103.78, -241.15, 45.0),
	size = vec3(4.0, 4.0, 4.0),
	rotation = 0.0,
})
local sphere = lib.zones.sphere({
	name = "zone1",
	coords = vec3(-104.0, -424.0, 36.0),
	radius = 56,
})
local sphere = lib.zones.sphere({
	name = "",
	coords = vec3(-107.74, -423.69, 36.0),
	radius = 59.0,
})
exports.ox_target:addSphereZone({
	name = "zzzz",
	coords = vec3(-96.67, -236.99, 45.0),
	radius = 59.0,
})
