Vidi = {}

-- // damage senjata \\ -- 
Vidi.DamageSenjata = {
    [GetHashKey("WEAPON_UNARMED")] = {
        Senjata = GetHashKey("WEAPON_UNARMED"),
        Damage = 0.5
    },
    [GetHashKey("WEAPON_PISTOL50")] = {
        Senjata = GetHashKey("WEAPON_PISTOL50"),
        Damage = 0.58
    },
    [GetHashKey("WEAPON_REVOLVER_MK2")] = {
        Senjata = GetHashKey("WEAPON_REVOLVER_MK2"),
        Damage = 0.22
    },
    [GetHashKey("WEAPON_DOUBLEACTION")] = {
        Senjata = GetHashKey("WEAPON_DOUBLEACTION"),
        Damage = 0.67
    },
    [GetHashKey("WEAPON_PISTOL_MK2")] = {
        Senjata = GetHashKey("WEAPON_PISTOL_MK2"),
        Damage = 0.67
    }
}

-- // WARLOK DOCTOR TOKO BAJU \\ --
Vidi.WarlokTokoBaju = {{
    lokasi = vector3(-1263.4, -3367.44, 13.96),
    heading = 151.28,
    ped_handler = nil,
    label = 'E - Toko Baju'
}}

-- // blip safezone \\ --
Vidi.BlipSafeZone = {
    bandara = {
        coords = vector3(-1280.16, -3386.36, 13.96),
        name = 'SAFE ZONE BATTLE ROYALE',
        color = 5,
        sprite = 487,
        radius = 55.0
    }
    -- tokobaju = {coords = vector3(-1263.36, -3369.04, 13.96), name = 'Toko Baju', color = 47, sprite = 73, radius = 0.0},

}

-- // br \\ --
Vidi.LokasiLeaveBattleRoyale = {
    x = -1266.52,
    y = -3372.56,
    z = 13.96,
    heading = 327.32
}
Vidi.Game = {
    PlaneModel = titan, -- or cargoplane
    Planes = {{
        spawnawal = vector4(728.72, 1451.32, 1532.56, 156),
        tujuanAkhir = vector3(-792.44, -2400.0, 1532.56)
    }}
}

-- // recoil \\ -- 
Vidi.RecoilP50 = 0.12
Vidi.RecoilPython = 0.50
Vidi.RecoilDA = 0.180

-- // holster \\ --
Vidi.SenjataHolster = {"WEAPON_PISTOL50", "WEAPON_REVOLVER_MK2", "WEAPON_REVOLVER", "WEAPON_PISTOL_MK2", "WEAPON_MINISMG", "WEAPON_MACHINEPISTOL", "WEAPON_DOUBLEACTION"}

-- // dumspter \\ --
Vidi.LokasiLooting = {-58485588, -1587184881, -1096777189, 666561306, 4236481708, 218085040, 682791951, 68279195, 684586828, 577432224, 300547451, 2707782415, 1899123601, 1248317080, 1524671283, 897366637, 344662182, 1367246939, 666581306, 1329570871, -206690185, -1620823304, -1096777189, -2007495856, 1923262137, 1605769687, -1098506160, -686494084}

Vidi.ItemLooting = {
    [1] = {
        bejan = 1,
        id = 'armor',
        name = 'Armor Level 1',
        quantity = math.random(1, 3),
        limit = 100
    },
    [2] = {
        bejan = 1,
        id = 'armor2',
        name = 'Armor Level 2',
        quantity = math.random(1, 2),
        limit = 100
    },
    -- [3] = {bejan = 1, id = 'armor3', name = 'Armor Level 3', quantity = math.random(1,3), limit = 100},
    [3] = {
        bejan = 9,
        id = 'airdrop',
        name = 'Airdrop',
        quantity = 1,
        limit = 100
    },
    [4] = {
        bejan = 1,
        id = 'clip',
        name = 'Clip',
        quantity = math.random(1,3),
        limit = 100
    },
    [5] = {
        bejan = 1,
        id = 'helm2',
        name = 'Helm Level 1',
        quantity = 1,
        limit = 100
    },
    [6] = {
        bejan = 1,
        id = 'helm3',
        name = 'Helm Level 2',
        quantity = 1,
        limit = 100
    },
    [7] = {
        bejan = 1,
        id = 'bandage',
        name = 'Bandage',
        quantity = math.random(1, 3),
        limit = 100
    },
    [8] = {
        bejan = 1,
        id = 'medikit',
        name = 'Medikit',
        quantity = 1,
        limit = 100
    },
    [9] = {
        bejan = 1,
        id = 'painkiller',
        name = 'Painkiller',
        quantity = math.random(1,2),
        limit = 100
    }
}

Vidi.ItemLootingRedzone = {
    [1] = {
        bejan = 3,
        id = 'airdrop',
        name = 'Airdrop',
        quantity = 1,
        limit = 100
    },
    [2] = {
        bejan = 1,
        id = 'clip',
        name = 'Clip',
        quantity = 3,
        limit = 100
    },
    [3] = {
        bejan = 1,
        id = 'helm1',
        name = 'Helm Level 3',
        quantity = 1,
        limit = 100
    },
    [4] = {
        bejan = 1,
        id = 'medikit',
        name = 'Medikit',
        quantity = math.random(1, 3),
        limit = 100
    },
    [5] = {
        bejan = 1,
        id = 'painkiller',
        name = 'Painkiller',
        quantity = math.random(1, 4),
        limit = 100
    },
    [6] = {
        bejan = 1,
        id = 'repairkit',
        name = 'Repair Kit',
        quantity = 1,
        limit = 100
    },
    [8] = {
        bejan = 1,
        id = 'armor2',
        name = 'Armor Level 2',
        quantity = math.random(1, 3),
        limit = 100
    },
    [9] = {
        bejan = 1,
        id = 'armor',
        name = 'Armor Level 1',
        quantity = math.random(1, 3),
        limit = 100
    },
    [10] = {
        bejan = 1,
        id = 'bandage',
        name = 'Bandage',
        quantity = math.random(2, 5),
        limit = 100
    }
}

-- // clear inv \\ --
Vidi.RemoveWeaponsAfterRPDeath = true
Vidi.RemoveItemsAfterRPDeath = true

-- // TOGLE SHOW ID \\ --
Vidi.ToogleID = 19 -- ALT
Vidi.which = "nama"
Vidi.drawDistance = 8

-- // anti modifier \\ --
Vidi.discord_damage = "https://discord.com/api/webhooks/1018130057933377536/1pzaDNuc8U4q8UkFsT_tMvYKAIg6dXA54s9NIgJRONa9AifOn1yTXhcAaaB2n6FGvQZW"
Vidi.discord_ammo = "https://discord.com/api/webhooks/1018130154129735721/oY1IrpYnlZgg8nryoBIAK1QR9ZWJuoV7t5qMIp_RbNCVV71cnuay87VOwAh57djl1dok"

Vidi.embed = "Anti AI By Royal BATTLEGROUND"
Vidi.color = 16753920
Vidi.Header = "Player di bawah ini Terdeteksi Menggunakan AI"
Vidi.player = "Player"
Vidi.id = "Kantong"
Vidi.Weapon = "Senjata"
Vidi.Component = "Component"
Vidi.DmgS = "Damage Server"
Vidi.Modifdmg = "Modifer Damage"
Vidi.kickai = 'Terdeteksi menggunakan File Terlarang'
Vidi.kickthermal = 'Kamu terdeteksi menggunakan Thermal Scope'
Vidi.kicknvision = 'Kamu terdeteksi menggunakan Night Vision Scope'
Vidi.kick = false
Vidi.thermal = false
Vidi.nvision = true
Vidi.Ammo = true
Vidi.delay = 0.2
Vidi.pistol50 = 55.0
Vidi.pythonmagnum = 210.0
Vidi.doubleaction = 90.0

-- // redzones \\ -- 
Vidi.LokasiRedzone = vector3(438.92, -1519.88, 29.28)

-- // airdrop \\ -- 
Config = {}
math.randomseed(GetGameTimer())

Config.DropDownTime = 60 * 1000 -- 2 hours if you want change minute use this "minute * 60 * 1000"
Config.DropWaitTime = 120 -- If drop come to ground how many seconds wait for open

Config.PlayersCheck = false -- If you want check players count
Config.HowPlayers = 1 -- How many players need for drop

Config.CaseProp = "prop_mil_crate_02" -- Case prop
Config.ParachuteProp = "p_cargo_chute_s" -- Parachute prop
Config.Coords = {
    [1] = {
        x = 196.32,
        y = -935.48,
        z = 30.68
    },
    [2] = {
        x = 18.32,
        y = -1063.16,
        z = 38.16
    },
    [3] = {
        x = 120.52,
        y = -1263.8,
        z = 33.48
    },
    [4] = {
        x = -137.24,
        y = -1275.28,
        z = 47.88
    },
    [5] = {
        x = -329.56,
        y = -975.28,
        z = 31.08
    },
    [6] = {
        x = -511.04,
        y = -834.24,
        z = 30.52
    },
    [7] = {
        x = -119.6,
        y = -268.04,
        z = 42.96
    },
    [8] = {
        x = 327.84,
        y = -211.64,
        z = 54.08
    },
    [9] = {
        x = 578.08,
        y = -140.6,
        z = 71.28
    },
    [10] = {
        x = 260.48,
        y = -586.44,
        z = 43.28
    },
    [11] = {
        x = 310.76,
        y = -1682.24,
        z = 29.28
    },
    [12] = {
        x = 50.88,
        y = -1672.76,
        z = 29.28
    },
    [13] = {
        x = 144.84,
        y = -1324.12,
        z = 29.2
    }
}

Config.JarakAirdrop = 20.0

Config.AirdropCommandConsole = 'airdropc'
Config.AirdropCommandIngame = 'airdrop'

Config.Item = {'medikit', 'clip', 'painkiller', 'bandage', 'armor3'}

-- // lootbox \\ --
Config.LootProp = "prop_big_bag_01"

Config.WeaponItems = true

-- // notif nembak \\ -- 
-- Set the time (in minutes) during the player is outlaw
Config.Timer = 0

-- Set if show alert when player use gun
Config.GunshotAlert = true

-- Set if show when player fight in melee
Config.MeleeAlert = true

-- In seconds
Config.BlipGunTime = 5

-- Blip radius, in float value!
Config.BlipGunRadius = 100.0

-- In seconds
Config.BlipMeleeTime = 5

-- Blip radius, in float value!
Config.BlipMeleeRadius = 50.0

-- Show notification when cops steal too?
Config.ShowCopsMisbehave = true

-- Jobs in this table are considered as cops
Config.WhitelistedCops = {'admin'}

-- // loop \\ -- 
Vidi.KepalaHit = true
Vidi.PauseMenu = true
Vidi.TimeJam12 = true
Vidi.UsingDefaultAction = true
Vidi.Cuaca = true
Vidi.KendaraanLokal = true
Vidi.TextPauseMenu = "Royal Battleground "
