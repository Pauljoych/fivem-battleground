Config = {}

Config.MenuItems = {
    -- [1] = {
    --     id = 'lepashitmarker',
    --     title = 'Toogle Hit Marker',
    --     icon = 'crosshairs',
    --     type = 'client',
    --     event = 'togle:hitmarker',
    --     shouldClose = true
    -- },
    -- [1] = {
    --     id = 'revive',
    --     title = 'Revive Player',
    --     icon = 'heart',
    --     type = 'client',
    --     event = 'vidi:revive',
    --     shouldClose = true
    -- },
    -- [2] = {
    --     id = 'openinventory',
    --     title = 'Buka Inventory',
    --     icon = 'briefcase',
    --     type = 'client',
    --     event = 'vxd-inventory:openinv1',
    --     shouldClose = true
    -- },
    -- [3] = {
    --     id = 'lootingplayer',
    --     title = 'Looting Player',
    --     type = 'client',
    --     event = 'geledah:orang',
    --     icon = 'search',
    --     shouldClose = true
    -- },
    [1] = {
        id = 'crosshairmenu',
        title = 'Crosshair Menu',
        type = 'client',
        event = 'vxd:crosshair',
        icon = 'crosshairs',
        shouldClose = true
    },
    [2] = {
        id = 'opencrew',
        title = 'Crew System',
        type = 'cmd',
        event = 'crew',
        icon = 'person-rifle',
        shouldClose = true
    },
    [3] = {
        id = 'lootingitem',
        title = 'Looting Sampah',
        type = 'client',
        event = 'oke:rilek',
        icon = 'dumpster',
        shouldClose = true
    },
    [4] = {
        id = 'fpsboost',
        title = 'Fps Boost',
        type = 'cmd',
        event = 'fps',
        icon = 'crosshairs',
        shouldClose = true
    }
    -- [8] = {
    --     id = 'rockstareditor',
    --     title = 'Rockstar Editor',
    --     type = 'cmd',
    --     event = 'rockstar',
    --     icon = 'camera',
    --     shouldClose = true
    -- }
}
