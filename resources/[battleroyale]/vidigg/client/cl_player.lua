-- exports.qtarget:Player({
-- 	options = {
-- 		{
-- 			event = "vidi:revive",
-- 			icon = "",
-- 			label = "💖 Revive Player",
-- 			num = 1
-- 		},
--         {
-- 			event = "geledah:orang",
-- 			icon = "fas fa-box-circle-check",
-- 			label = "🔍 Search Player",
-- 			num = 2
-- 		},
-- 	},
-- 	distance = 2
-- })

exports.ox_target:addGlobalPlayer({
    {
		event = 'vidi:revive',
        icon = '',
        label = '💖 Revive Player',
        distance = 2,
    },
	{
		event = 'geledah:orang',
        icon = 'fas fa-box-circle-check',
        label = '🔍 Search Player',
        distance = 2,
    },
})