Config = {}
Config.Locale = "en"
Config.IncludeCash = true -- DONT TOUCH!
Config.IncludeWeapons = true -- TRUE or FALSE
Config.IncludeAccounts = true -- TRUE or FALSE
Config.ExcludeAccountsList = {"bank", "money"} --  DONT TOUCH!
Config.OpenControl = 289 -- Key for opening inventory. Edit html/js/config.js to change key for closing it.
Config.MaxWeight = 5000 --SAME AS THE DEFAULT ON ES EXTENDED CONFIG
Config.LimitWeight = 5000
Config.MaximumWeight = 100
Config.localWeight = {
    cash = 1
}
Config.PakaiESX = 'baru' -- [baru/lama] kalo ESX 1.1 berarti lama, kalo ESX 1.2 dan ESX 1 final atau EXM berarti baru

Config.Attachments = {"flashlight", "grip", "scope", "skin", "suppressor"}

-- List of item names that will close ui when used
Config.CloseUiItems = {
  'bread',
}

function n(msg) -- Isi dengan Trigger / Export Notifikasi kamu yang menunjukkan bahwa Sukses (Client)
	--exports['okokNotify']:Alert("Inventory", msg, 5000, 'success')
    ESX.ShowNotification("INFO", msg, 2500, 'success')
    --TriggerEvent('notification', msg, 1)
end

function ne(msg) -- Isi dengan Trigger / Export Notifikasi kamu yang menunjukkan bahwa Error (Client) 
	--exports['okokNotify']:Alert("Inventory", msg, 5000, 'error')
    ESX.ShowNotification("INFO", msg, 2500, 'success')
    --TriggerEvent('notification', msg, 2)
end

-- PED --
Config.Invincible = true -- Is the ped going to be invincible?
Config.Frozen = true -- Is the ped frozen in place?
Config.Stoic = true -- Will the ped react to events around them?
Config.FadeIn = true -- Will the ped fade in and out based on the distance. (Looks a lot better.)
Config.DistanceSpawn = 10.0 -- Distance before spawning/despawning the ped. (GTA Units.)

Config.MinusOne = true -- Leave this enabled if your coordinates grabber does not -1 from the player coords.

Config.GenderNumbers = { -- No reason to touch these.
	['male'] = 4,
	['female'] = 5
}

Config.ShopBlipID = 52
Config.LiquorBlipID = 93
Config.YouToolBlipID = 479
Config.PrisonShopBlipID = 52
Config.WeedStoreBlipID = 140
Config.WeaponShopBlipID = 110
Config.PoliceShopShopBlipID = 110

Config.ShopLength = 14
Config.LiquorLength = 10
Config.YouToolLength = 2
Config.PrisonShopLength = 2
Config.PoliceShopLength = 2

Config.Color = 2
Config.WeaponColor = 1

--------------------------------------------------------------------BLIP--------------------------------------------------------------------
Config.Map = {
    -- {name="Fishing Shop",color=26, id=308, x=-1598.35, y=5201.18, z=4.39},

}
--------------------------------------------------------------------BLIP--------------------------------------------------------------------
Config.WeaponLiscence = {x = 12.47, y = -1105.5, z = -29.8}
Config.LicensePrice = 22500

Config.Shops = {
    RegularShop = {
        Locations = {
            -- {x = 373.875,   y = 325.896,  z = 103.566},
            -- {x = 2557.458,  y = 382.282,  z = 108.622},
            -- {x = -3038.939, y = 585.954,  z = 7.908},
            -- {x = 547.431,   y = 2671.710, z = 42.156},
            -- {x = 1961.464,  y = 3740.672, z = 32.343},
            -- {x = 2678.916,  y = 3280.671, z = 55.241},
            -- {x = 1729.216,  y = 6414.131, z = 35.037},
            -- {x = -48.519,   y = -1757.514, z = 29.421},
            -- {x = 1163.373,  y = -323.801,  z = 69.205},
            -- {x = -707.501,  y = -914.260,  z = 19.215},
            -- {x = -1820.523, y = 792.518,   z = 138.118},
            -- {x = 1698.388,  y = 4924.404,  z = 42.063},
            -- {x = 25.723,   y = -1346.966, z = 29.497}, 
            -- {x = -160.36,   y = 6322.74, z = 31.6}, 
            -- {x = 1135.81 ,   y = -982.14, z = 46.42},
            -- {x = -1222.77 ,   y = -907.11, z = 12.33},
            -- {x = -2967.89 ,   y = 390.6, z = 15.04},
            -- {x = 161.36 ,   y = 6640.69, z = 31.61},
        },
        Items = {
            -- {name = 'nasipadang', price = 20, pricesell = 10},
            -- {name = 'icetea', price = 20, pricesell = 10},
            -- {name = 'phone', price = 20, pricesell = 10},
            -- {name = 'cigarett', price = 20, pricesell = 10},
            -- {name = 'lighter', price = 20, pricesell = 10},
            -- {name = 'bread', price = 20, pricesell = 10},
            -- {name = 'water', price = 20, pricesell = 10}
        }
    },

    RobsLiquor = {
		Locations = {
            -- {x = 1985.27, y = 3050.6, z = 47.22},
            -- {x = -450.42, y = 281.22,   z = 77.52},
            -- {x = -429.59, y = 268.26,   z = 82.02},
            -- {x = 1420.48, y = 3558.65,   z = 35.71},
        },
        Items = {
            -- {name = 'beer', price = 1},
            -- {name = 'wine', price = 1},
            -- {name = 'cigaret', price = 1},
            -- {name = 'lighter', price = 1},
            -- {name = 'vodka', price = 1},
            -- {name = 'tequila', price = 1},
            -- {name = 'whisky', price = 1}
        }
    },

    IlegalShop = { -- BM pakai uang kotor
        Locations = {
            --{ x = 2567.69, y = 294.38, z = 108.73 },
        },
        Items = {
            -- {name = 'WEAPON_PISTOL', price = 55000},
            -- {name = 'WEAPON_BAT', price = 10000},
            -- {name = 'WEAPON_STUNGUN', price = 50000},
            -- {name = 'WEAPON_KNIFE', price = 25000},
            -- {name = 'WEAPON_MICROSMG', price = 200000}
        }
    },

    YouTool = {
        Locations = {
           -- { x = 468.58, y = -3205.64, z = 9.79 },
        },
        Items = {
            -- {name = 'bread', price = 20, pricesell = 10},
            -- {name = 'water', price = 20, pricesell = 10}
        }
    },

    Mekanik = {
        Locations = {
            --{x = -350.48, y = -170.68, z = 39.0}
        },
        Items = {
            -- {name = 'fixkit', price = 1000},
            -- {name = 'blowpipe', price = 35000},
            -- {name = 'carokit', price = 2000}
        }
    },

    RumahSakit = {
        Locations = {
            -- {x = 309.67, y = -585.6,  z = 43.28},
            -- {x = 1115.71, y = 220.06,  z = -49.44}
        },
        Items = {
            -- {name = 'bandage', price = 100},
            -- {name = 'medikit', price = 200}
        }
    },

    blackmarketItem = {
        Locations = {
            -- {x = 361.54, y = 328.14,  z = 103.86},
        },
        Items = {
            -- {name = 'bread', price = 20, pricesell = 10},
            -- {name = 'water', price = 20, pricesell = 10}
        }
    },

    PrisonShop = {
        Locations = {
            -- { x = -1103.05, y = -823.72, z = 14.48 },
        },
        Items = {
            -- { name = 'WEAPON_PISTOL' , price = 0},
            -- { name = 'WEAPON_PISTOL50',price = 0 }
        }
    },

    WeaponShop = { -- Toko Senjata pake uang bersih
        Locations = {
            -- { x = -662.180, y = -934.961, z = 21.829 },
            -- { x = 810.25, y = -2157.60, z = 29.62 },
            -- { x = 1693.44, y = 3760.16, z = 34.71 },
            -- { x = -330.24, y = 6083.88, z = 31.45 },
            -- { x = 252.63, y = -50.00, z = 69.94 },
            -- { x = 22.09, y = -1107.28, z = 29.80 },
            -- --{ x = 2567.69, y = 294.38, z = 108.73 },
            -- { x = -1117.58, y = 2698.61, z = 18.55 },
            -- { x = 842.44, y = -1033.42, z = 28.19 }
          
        },

        Items = {
            -- {name = 'WEAPON_PISTOL', price = 75000},
            -- {name = 'WEAPON_BAT', price = 10000},
            -- {name = 'WEAPON_STUNGUN', price = 50000},
            -- {name = 'WEAPON_KNIFE', price = 25000},
            -- {name = 'WEAPON_MICROSMG', price = 200000}
        }
    },


    PoliceShop = {
       Locations = {
            -- { x = 461.5, y = -981.09, z = 30.69 },

        },
        Items = {
            -- { name = 'WEAPON_PISTOL' , price = 0},
            -- { name = 'WEAPON_COMBATPISTOL',price = 0 },
            -- { name = 'WEAPON_SMG' , price = 0},
            -- { name = 'WEAPON_STUNGUN' , price = 0},
            -- { name = 'WEAPON_NIGHTSTICK',price = 0 },
            -- { name = 'WEAPON_FLASHLIGHT',price = 0 },
            -- { name = 'WEAPON_SPECIALCARBINE',price = 0 }
        }
}
}

Config.Throwables = {
    WEAPON_MOLOTOV = 615608432,
    WEAPON_GRENADE = -1813897027,
    WEAPON_STICKYBOMB = 741814745,
    WEAPON_PROXMINE = -1420407917,
    WEAPON_SMOKEGRENADE = -37975472,
    WEAPON_PIPEBOMB = -1169823560,
    WEAPON_FLARE = 1233104067,
    WEAPON_SNOWBALL = 126349499
}

Config.FuelCan = 883325847

Config.PropList = {
    cash = {["model"] = 'prop_cash_pile_02', ["bone"] = 28422, ["x"] = 0.02, ["y"] = 0.02, ["z"] = -0.08, ["xR"] = 270.0, ["yR"] = 180.0, ["zR"] = 0.0}
}

Config.InventoryPath = 'html/img/items/'

Config.DisplayTimeout = 3

Config.CashLabel = '$%s'
Config.BlackMoneyLabel = '$%s'

Config.NotifyUseWeapon = true
Config.Weapon = {
    WEAPON_KNIFE = 'WEAPON_KNIFE',
    WEAPON_KNUCKLE = 'WEAPON_KNUCKLE',
    WEAPON_NIGHTSTICK = 'WEAPON_NIGHTSTICK',
    WEAPON_HAMMER = 'WEAPON_HAMMER',
    WEAPON_BAT = 'WEAPON_BAT',
    WEAPON_GOLFCLUB = 'WEAPON_GOLFCLUB',
    WEAPON_CROWBAR = 'WEAPON_CROWBAR',
    WEAPON_BOTTLE = 'WEAPON_BOTTLE',
    WEAPON_DAGGER = 'WEAPON_DAGGER',
    WEAPON_HATCHET = 'WEAPON_HATCHET',
    WEAPON_MACHETE = 'WEAPON_MACHETE',
    WEAPON_FLASHLIGHT = 'WEAPON_FLASHLIGHT',
    WEAPON_SWITCHBLADE = 'WEAPON_SWITCHBLADE',
    WEAPON_PROXMINE = 'WEAPON_PROXMINE',
    WEAPON_BZGAS = 'WEAPON_BZGAS',
    WEAPON_SMOKEGRENADE = 'WEAPON_SMOKEGRENADE',
    WEAPON_MOLOTOV = 'WEAPON_MOLOTOV',
    WEAPON_FIREEXTINGUISHER = 'WEAPON_FIREEXTINGUISHER',
    WEAPON_PETROLCAN = 'WEAPON_PETROLCAN',
    WEAPON_HAZARDCAN = 'WEAPON_HAZARDCAN',
    WEAPON_SNOWBALL = 'WEAPON_SNOWBALL',
    WEAPON_FLARE = 'WEAPON_FLARE',
    WEAPON_BALL = 'WEAPON_BALL',
    WEAPON_REVOLVER = 'WEAPON_REVOLVER',
    WEAPON_POOLCUE = 'WEAPON_POOLCUE',
    WEAPON_PIPEWRENCH = 'WEAPON_PIPEWRENCH',
    WEAPON_PISTOL = 'WEAPON_PISTOL',
    WEAPON_PISTOL_MK2 = 'WEAPON_PISTOL_MK2',
    WEAPON_COMBATPISTOL = 'WEAPON_COMBATPISTOL',
    WEAPON_APPISTOL = 'WEAPON_APPISTOL',
    WEAPON_PISTOL50 = 'WEAPON_PISTOL50',
    WEAPON_SNSPISTOL = 'WEAPON_SNSPISTOL',
    WEAPON_HEAVYPISTOL = 'WEAPON_HEAVYPISTOL',
    WEAPON_VINTAGEPISTOL = 'WEAPON_VINTAGEPISTOL',
    WEAPON_STUNGUN = 'WEAPON_STUNGUN',
    WEAPON_FLAREGUN = 'WEAPON_FLAREGUN',
    WEAPON_MARKSMANPISTOL = 'WEAPON_MARKSMANPISTOL',
    WEAPON_MICROSMG = 'WEAPON_MICROSMG',
    WEAPON_MINISMG = 'WEAPON_MINISMG',
    WEAPON_SMG = 'WEAPON_SMG',
    WEAPON_SMG_MK2 = 'WEAPON_SMG_MK2',
    WEAPON_ASSAULTSMG = 'WEAPON_ASSAULTSMG',
    WEAPON_MG = 'WEAPON_MG',
    WEAPON_COMBATMG = 'WEAPON_COMBATMG',
    WEAPON_COMBATMG_MK2 = 'WEAPON_COMBATMG_MK2',
    WEAPON_COMBATPDW = 'WEAPON_COMBATPDW',
    WEAPON_GUSENBERG = 'WEAPON_GUSENBERG',
    WEAPON_MACHINEPISTOL = 'WEAPON_MACHINEPISTOL',
    WEAPON_ASSAULTRIFLE = 'WEAPON_ASSAULTRIFLE',
    WEAPON_ASSAULTRIFLE_MK2 = 'WEAPON_ASSAULTRIFLE_MK2',
    WEAPON_CARBINERIFLE = 'WEAPON_CARBINERIFLE',
    WEAPON_CARBINERIFLE_MK2 = 'WEAPON_CARBINERIFLE_MK2',
    WEAPON_ADVANCEDRIFLE = 'WEAPON_ADVANCEDRIFLE',
    WEAPON_SPECIALCARBINE = 'SCAR-H',
    WEAPON_BULLPUPRIFLE = 'WEAPON_BULLPUPRIFLE',
    WEAPON_COMPACTRIFLE = 'WEAPON_COMPACTRIFLE',
    WEAPON_PUMPSHOTGUN = 'WEAPON_PUMPSHOTGUN',
    WEAPON_SWEEPERSHOTGUN = 'WEAPON_SWEEPERSHOTGUN',
    WEAPON_SAWNOFFSHOTGUN = 'WEAPON_SAWNOFFSHOTGUN',
    WEAPON_BULLPUPSHOTGUN = 'WEAPON_BULLPUPSHOTGUN',
    WEAPON_ASSAULTSHOTGUN = 'WEAPON_ASSAULTSHOTGUN',
    WEAPON_MUSKET = 'WEAPON_MUSKET',
    WEAPON_HEAVYSHOTGUN = 'WEAPON_HEAVYSHOTGUN',
    WEAPON_DBSHOTGUN = 'WEAPON_DBSHOTGUN',
    WEAPON_SNIPERRIFLE = 'WEAPON_SNIPERRIFLE',
    WEAPON_HEAVYSNIPER = 'WEAPON_HEAVYSNIPER',
    WEAPON_HEAVYSNIPER_MK2 = 'WEAPON_HEAVYSNIPER_MK2',
    WEAPON_MARKSMANRIFLE = 'WEAPON_MARKSMANRIFLE',
    WEAPON_GRENADELAUNCHER = 'WEAPON_GRENADELAUNCHER',
    WEAPON_GRENADELAUNCHER_SMOKE = 'WEAPON_GRENADELAUNCHER_SMOKE',
    WEAPON_RPG = 'WEAPON_RPG',
    WEAPON_MINIGUN = 'WEAPON_MINIGUN',
    WEAPON_FIREWORK = 'WEAPON_FIREWORK',
    WEAPON_RAILGUN = 'WEAPON_RAILGUN',
    WEAPON_HOMINGLAUNCHER = 'WEAPON_HOMINGLAUNCHER',
    WEAPON_GRENADE = 'WEAPON_GRENADE',
    WEAPON_STICKYBOMB = 'WEAPON_STICKYBOMB',
    WEAPON_COMPACTLAUNCHER = 'WEAPON_COMPACTLAUNCHER',
    WEAPON_SNSPISTOL_MK2 = 'WEAPON_SNSPISTOL_MK2',
    WEAPON_REVOLVER_MK2 = 'WEAPON_REVOLVER_MK2',
    WEAPON_DOUBLEACTION = 'WEAPON_DOUBLEACTION',
    WEAPON_SPECIALCARBINE_MK2 = 'WEAPON_SPECIALCARBINE_MK2',
    WEAPON_BULLPUPRIFLE_MK2 = 'WEAPON_BULLPUPRIFLE_MK2',
    WEAPON_PUMPSHOTGUN_MK2 = 'WEAPON_PUMPSHOTGUN_MK2',
    WEAPON_MARKSMANRIFLE_MK2 = 'WEAPON_MARKSMANRIFLE_MK2',
    WEAPON_RAYPISTOL = 'WEAPON_RAYPISTOL',
    WEAPON_RAYCARBINE = 'WEAPON_RAYCARBINE',
    WEAPON_RAYMINIGUN = 'WEAPON_RAYMINIGUN',
    WEAPON_DIGISCANNER = 'WEAPON_DIGISCANNER',
    WEAPON_NAVYREVOLVER = 'WEAPON_NAVYREVOLVER',
    WEAPON_CERAMICPISTOL = 'WEAPON_CERAMICPISTOL',
    WEAPON_STONE_HATCHET = 'WEAPON_STONE_HATCHET',
    WEAPON_PIPEBOMB = 'WEAPON_PIPEBOMB',
    GADGET_PARACHUTE = 'GADGET_PARACHUTE',
}


Config.PedList = {

	--PHARMACY
	{
		model = `s_m_m_doctor_01`,
		coords = vector4(-491.15, -341.42, 42.32, 352.64),
		gender = 'male'
	},

	--LIQUOR SHOP
	{
		model = `s_f_y_bartender_01`,
		coords = vector4(-561.75, 286.96, 82.18, 265.43),
		gender = 'female'
	},
    {
		model = `s_f_y_bartender_01`,
		coords = vector4(-1377.49, -627.33, 30.82, 38.73),
		gender = 'female'
	},
    {
		model = `s_f_y_bartender_01`,
		coords = vector4(129.45, -1284.12, 29.27, 124.43),
		gender = 'female'
	},
    {
		model = `mp_f_chbar_01`,
		coords = vector4(1984.93, 3050.76, 47.22, 329.87),
		gender = 'female'
	},
    {
		model = `mp_f_chbar_01`,
		coords = vector4(1983.77, 3050.95, 50.44, 233.42),
		gender = 'female'
	},

    --MECHANIC
    {
		model = `s_m_y_xmech_02`,
		coords = vector4(1178.06, 2635.9, 37.75, 2.62),
		gender = 'female'
	},

    --WEAPON SHOP
    {
		model = `s_m_y_ammucity_01`,
		coords = vector4(-663.03, -933.43, 21.83, 180.9),
		gender = 'male'
	},
    {
		model = `s_m_y_ammucity_01`,
		coords = vector4(842.29, -1035.35, 28.19, 0.74),
		gender = 'male'
	},
    {
		model = `s_m_y_ammucity_01`,
		coords = vector4(2567.75, 292.55, 108.73, 357.82),
		gender = 'male'
	},
    {
		model = `s_m_y_ammucity_01`,
		coords = vector4(22.84, -1105.64, 29.8, 163.36),
		gender = 'male'
	},
    {
		model = `s_m_y_ammucity_01`,
		coords = vector4(810.93, -2159.15, 29.62, 4.43),
		gender = 'male'
	},
    {
		model = `s_m_y_ammucity_01`,
		coords = vector4(253.79, -50.51, 69.94, 71.38),
		gender = 'male'
	},
    {
		model = `s_m_m_ammucountry`,
		coords = vector4(1692.42, 3761.07, 34.71, 229.03),
		gender = 'male'
	},
    {
		model = `s_m_m_ammucountry`,
		coords = vector4(-331.52, 6085.25, 31.45, 222.58),
		gender = 'male'
	},
    {
		model = `s_m_m_ammucountry`,
		coords = vector4(-1118.82, 2699.84, 18.55, 222.93),
		gender = 'male'
	},
    --MARKET
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1487.2, -377.06, 40.16, 135.24),
		gender = 'male'
	},
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1221.41, -907.9, 12.33, 34.04),
		gender = 'male'
	},
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(24.47, -1346.46, 29.5, 277.56),
		gender = 'male'
	},
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(-47.13, -1758.58, 29.42, 54.35),
		gender = 'male'
	},
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(1134.31, -983.14, 46.42, 279.08),
		gender = 'male'
	},
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(1164.82, -323.63, 69.21, 104.47),
		gender = 'male'
	},
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(372.96, 327.91, 103.57, 255.59),
		gender = 'male'
	}, 
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(2555.63, 380.91, 108.62, 358.7),
		gender = 'male'
	},   
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(2676.63, 3280.21, 55.24, 333.53),
		gender = 'male'
	}, 
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(1959.29, 3741.44, 32.34, 303.97),
		gender = 'male'
	},  
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(1697.35, 4923.44, 42.06, 324.15),
		gender = 'male'
	}, 
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(1728.58, 6416.63, 35.04, 246.89),
		gender = 'male'
	},
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(549.35, 2669.69, 42.16, 101.79),
		gender = 'male'
	}, 
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(-3243.93, 1000.12, 12.83, 358.48),
		gender = 'male'
	},
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(-3040.6, 584.04, 7.91, 16.53),
		gender = 'male'
	},
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(-2966.38, 391.58, 15.04, 85.7),
		gender = 'male'
	}, 
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1819.56, 793.53, 138.09, 137.32),
		gender = 'male'
	},
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(1165.31, 2710.78, 38.16, 178.64),
		gender = 'male'
	},
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(-706.17, -914.54, 19.22, 89.65),
		gender = 'male'
	},
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(1393.48, 3606.62, 34.98, 203.58),
		gender = 'male'
	},
    {
		model = `mp_m_shopkeep_01`,
		coords = vector4(161.79, 6642.83, 31.7, 230.23),
		gender = 'male'
	},
}


Config.PakaiLisensi = false

Config.Toko = {
    -- {lokasi = vec3(25.745370864868, -1346.9307861328, 28.497020721436), jenis = 'warung'},
    -- {lokasi = vec3(373.86560058594, 325.89385986328, 102.56156921387), jenis = 'warung'},
    -- {lokasi = vec3(2557.4514160156, 382.28012084961, 107.61877441406), jenis = 'warung'},
    -- {lokasi = vec3(-3038.9409179688, 585.95324707031, 6.9122357368469), jenis = 'warung'},
    -- {lokasi = vec3(-3241.9304199219, 1001.4612426758, 11.835907936096), jenis = 'warung'},
    -- {lokasi = vec3(547.42047119141, 2671.7099609375, 41.1510887146), jenis = 'warung'},
    -- {lokasi = vec3(1961.4536132813, 3740.6721191406, 31.33931350708), jenis = 'warung'},
    -- {lokasi = vec3(2678.9108886719, 3280.6708984375, 54.236328125), jenis = 'warung'},
    -- {lokasi = vec3(1729.2136230469, 6414.130859375, 34.031475067139), jenis = 'warung'},
    -- {lokasi = vec3(161.77984619141, 6636.8891601563, 30.555105209351), jenis = 'warung'},
    -- {lokasi = vec3(1135.7972412109, -982.28228759766, 45.410415649414), jenis = 'warung'},
    -- {lokasi = vec3(-1222.9050292969, -906.9775390625, 11.321559906006), jenis = 'warung'},
    -- {lokasi = vec3(-1487.5433349609, -379.10125732422, 39.158466339111), jenis = 'warung'},
    -- {lokasi = vec3(-2968.2416992188, 390.91555786133, 14.037848472595), jenis = 'warung'},
    -- {lokasi = vec3(1166.0339355469, 2708.9299316406, 37.152805328369), jenis = 'warung'},
    -- {lokasi = vec3(1392.5620117188, 3604.6479492188, 33.993934631348), jenis = 'warung'},
    -- {lokasi = vec3(-48.510555267334, -1757.5098876953, 28.416299819946), jenis = 'warung'},
    -- {lokasi = vec3(1163.3818359375, -323.79632568359, 68.183235168457), jenis = 'warung'},
    -- {lokasi = vec3(-707.49212646484, -914.25463867188, 18.210081100464), jenis = 'warung'},
    -- {lokasi = vec3(-1820.5205078125, 792.51959228516, 137.10192871094), jenis = 'warung'},
    -- {lokasi = vec3(1698.3979492188, 4924.4038085938, 41.059043884277), jenis = 'warung'},

    -- {lokasi = vec3(810.25408935547, -2157.6018066406, 28.613540649414), jenis = 'tokosenjata'},
    -- {lokasi = vec3(-662.17755126953, -934.96606445313, 20.834409713745), jenis = 'tokosenjata'},
    -- {lokasi = vec3(1693.4412841797, 3760.1567382813, 33.70987701416), jenis = 'tokosenjata'},
    -- {lokasi = vec3(-330.23590087891, 6083.8798828125, 30.450080871582), jenis = 'tokosenjata'},
    -- {lokasi = vec3(252.63136291504, -50.003170013428, 68.946296691895), jenis = 'tokosenjata'},
    -- {lokasi = vec3(22.092412948608, -1107.2857666016, 28.801843643188), jenis = 'tokosenjata'},
    -- {lokasi = vec3(2567.6899414063, 294.37405395508, 107.73987579346), jenis = 'bm'},
    -- {lokasi = vec3(-1117.5787353516, 2698.6071777344, 17.549283981323), jenis = 'tokosenjata'},
    -- {lokasi = vec3(842.44287109375, -1033.4261474609, 27.190347671509), jenis = 'tokosenjata'},

    -- {lokasi = vec3(459.71, -990.72, 30.69), jenis = 'polisi', pangkat = 2},
    -- {lokasi = vec3(0,0,0), jenis = 'mekanik', pangkat = 2},
    -- {lokasi = vec3(0,0,0), jenis = 'ems', pangkat = 2},

    -- -- {lokasi = vec3(0,0,0), jenis = 'bm'},
    -- {lokasi = vec3(46.84521484375, -1749.4244384766, 28.633298873901), jenis = 'youtool'},

    -- {lokasi = vec3(1985.27, 3050.6, 47.22), jenis = 'diskotik'},
    -- {lokasi = vec3(-450.42, 281.22, 77.52), jenis = 'diskotik'},
    -- {lokasi = vec3(-429.59, 268.26, 82.02), jenis = 'diskotik'},
    -- {lokasi = vec3(1420.48, 3558.65, 35.71), jenis = 'diskotik'},

    -- {lokasi = vec3(372.01, 341.55, 103.2), jenis = 'bmitem'},

}

Config.Brankas = {
    -- {lokasi = vec3(422.95193481445, -1016.0178222656, 28.057888031006), namajob = 'police', pangkat = 2, tulisan = 'Tekan [E] untuk akses Brankas Polisi', namabrankas = 'Brankas Polisi', maxBerat = 10000},
    -- {lokasi = vec3(424.46,-990.9,30.71), namajob = 'ambulance', pangkat = 1, tulisan = 'Tekan [E] untuk akses Brankas EMS', namabrankas = 'Brankas EMS', maxBerat = 100},
}

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 1000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 5

Config.localWeight = {
    meth = 12,
    meth_pooch  = 12,
    bread = 12,
}

-- Config.BisaJualKeWarung = false
