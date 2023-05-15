Config = {}

Config.Debug = false

Config.ClothingCost = 0
Config.BarberCost = 0
Config.TattooCost = 0
Config.SurgeonCost = 0

Config.ChargePerTattoo = true -- Charge players per tattoo. Config.TattooCost will become the cost of 1 tattoo. The cost can be overridden by adding `cost` key in shared/tattoos.lua for specific tattoos

-- Only set this to true if you're using rcore_tattoos
Config.RCoreTattoosCompatibility = false

Config.AsynchronousLoading = false -- Change this to false if you want the NUI data to load before displaying the appearance UI

Config.UseTarget = false

Config.TextUIOptions = {
    position = "left-center"
}

Config.NotifyOptions = {
    position = "top-right"
}

Config.OutfitCodeLength = 10

Config.UseRadialMenu = false

Config.EnablePedsForShops = true
Config.EnablePedsForClothingRooms = true
Config.EnablePedsForPlayerOutfitRooms = true

Config.EnablePedMenu = true
Config.PedMenuGroup = "group.admin"

Config.ShowNearestShopOnly = false
Config.HideRadar = false -- Hides the minimap while the appearance menu is open
Config.NearestShopBlipUpdateDelay = 10000

Config.InvincibleDuringCustomization = false

Config.PreventTrackerRemoval = true -- Disables "Scarf and Chains" section if the player has tracker

Config.NewCharacterSections = {
    Ped = true,
    HeadBlend = true,
    FaceFeatures = true,
    HeadOverlays = true,
    Components = true,
    Props = true,
    Tattoos = true
}

Config.GenderBasedOnPed = true

Config.AlwaysKeepProps = false

Config.PersistUniforms = false -- Keeps Job / Gang Outfits on player reconnects / logout
Config.OnDutyOnlyClothingRooms = false -- Set to `true` to make the clothing rooms accessible only to players who are On Duty

Config.BossManagedOutfits = false -- Allows Job / Gang bosses to manage their own job / gang outfits

Config.ReloadSkinCooldown = 5000

Config.AutomaticFade = false -- Enables automatic fading and hides the Fade section from Hair

-- ACE Permissions Config
Config.EnableACEPermissions = true
Config.ACEResetCooldown = 5000
Config.ACEListCooldown = 60 * 60 * 1000 -- 1 Hour

Config.DisableComponents = {
    Masks = false,
    UpperBody = false,
    LowerBody = false,
    Bags = false,
    Shoes = false,
    ScarfAndChains = false,
    BodyArmor = false,
    Shirts = false,
    Decals = false,
    Jackets = false
}

Config.DisableProps = {
    Hats = false,
    Glasses = false,
    Ear = false,
    Watches = false,
    Bracelets = false
}

Config.Blips = {
    ["clothing"] = {
        Show = true,
        Sprite = 366,
        Color = 47,
        Scale = 0.7,
        Name = "Clothing Store",
    },
    ["barber"] = {
        Show = true,
        Sprite = 71,
        Color = 0,
        Scale = 0.7,
        Name = "Barber",
    },
    ["tattoo"] = {
        Show = true,
        Sprite = 75,
        Color = 4,
        Scale = 0.7,
        Name = "Tattoo Shop",
    },
    ["surgeon"] = {
        Show = true,
        Sprite = 102,
        Color = 4,
        Scale = 0.7,
        Name = "Plastic Surgeon",
    }
}

Config.TargetConfig = {
    ["clothing"] = {
        model = "s_f_m_shop_high",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-tshirt",
        label = "Open Clothing Store",
        distance = 3
    },
    ["barber"] = {
        model = "s_m_m_hairdress_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-scissors",
        label = "Open Barber Shop",
        distance = 3
    },
    ["tattoo"] = {
        model = "u_m_y_tattoo_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-pen",
        label = "Open Tattoo Shop",
        distance = 3
    },
    ["surgeon"] = {
        model = "s_m_m_doctor_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-scalpel",
        label = "Open Surgeon",
        distance = 3
    },
    ["clothingroom"] = {
        model = "mp_g_m_pros_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-sign-in-alt",
        label = "Open Job / Gang Clothes Menu",
        distance = 3
    },
    ["playeroutfitroom"] = {
        model = "mp_g_m_pros_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-sign-in-alt",
        label = "Open Outfits Menu",
        distance = 3
    },
}

Config.Stores = {
    {
        type = "clothing",
        coords = vector4(-1263.24, -3367.32, 13.96, 0.52),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
        showBlip = true, -- overrides the blip visibilty configured above for the group
        -- targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
        -- targetScenario = "s_m_m_doctor_01", -- overrides the target scenario configure for the group
        points = {
            vector3(-1266.52, -3373.2, 13.96),
            vector3(-1273.52, -3370.0, 13.96),
            vector3(-1268.08, -3360.12, 13.96),
            vector3(-1259.4, -3365.16, 13.96)
        },
    }
}


Config.ClothingRooms = {
    -- {
    --     job = "police",
    --     coords = vector4(454.91, -990.89, 30.69, 193.4),
    --     size = vector3(4, 4, 4),
    --     rotation = 45,
    --     usePoly = false,
    --     points = {
    --         vector3(460.41918945312, -993.11444091797, 30.69),
    --         vector3(449.39508056641, -993.60614013672, 30.69),
    --         vector3(449.88696289062, -990.23779296875, 30.69),
    --         vector3(450.97882080078, -989.71411132812, 30.69),
    --         vector3(451.0325012207, -987.89904785156, 30.69),
    --         vector3(453.47863769531, -987.76928710938, 30.69),
    --         vector3(454.35513305664, -988.46459960938, 30.69),
    --         vector3(460.4231262207, -987.94573974609, 30.69)
    --     }
    -- }
}


Config.PlayerOutfitRooms = {
    -- Sample outfit room config
--[[    {
        job = "police",
        coords = vector4(287.28, -573.41, 43.16, 79.61),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(284.83, -574.01, 43.16),
            vector3(286.33, -570.03, 43.16),
            vector3(290.33, -571.74, 43.16),
            vector3(289.0, -574.75, 43.16)
        },
        citizenIDs = {
            "BHH65156"
        }
    }]]--
}

Config.Outfits = {
    -- ["police"] = {
    --     ["Male"] = {
    --         {
    --             name = "Short Sleeve",
    --             outfitData = {
    --                 ["pants"] = {item = 24, texture = 0}, -- Pants
    --                 ["arms"] = {item = 19, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
    --                 ["vest"] = {item = 0, texture = 0}, -- Body Vest
    --                 ["torso2"] = {item = 55, texture = 0}, -- Jacket
    --                 ["shoes"] = {item = 51, texture = 0}, -- Shoes
    --                 ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["hat"] = {item = -1, texture = -1}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["mask"] = {item = 0, texture = 0} -- Mask
    --             },
    --             grades = {0, 1, 2, 3, 4},
    --         },
    --         {
    --             name = "Trooper Tan",
    --             outfitData = {
    --                 ["pants"] = {item = 24, texture = 0}, -- Pants
    --                 ["arms"] = {item = 20, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
    --                 ["vest"] = {item = 0, texture = 0}, -- Body Vest
    --                 ["torso2"] = {item = 317, texture = 3}, -- Jacket
    --                 ["shoes"] = {item = 51, texture = 0}, -- Shoes
    --                 ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["hat"] = {item = 58, texture = 0}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["mask"] = {item = 0, texture = 0} -- Mask
    --             },
    --             grades = {0, 1, 2, 3, 4},
    --         },
    --         {
    --             name = "Long Sleeve",
    --             outfitData = {
    --                 ["pants"] = {item = 24, texture = 0}, -- Pants
    --                 ["arms"] = {item = 20, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
    --                 ["vest"] = {item = 0, texture = 0}, -- Body Vest
    --                 ["torso2"] = {item = 317, texture = 0}, -- Jacket
    --                 ["shoes"] = {item = 51, texture = 0}, -- Shoes
    --                 ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["hat"] = {item = -1, texture = -1}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["mask"] = {item = 0, texture = 0} -- Mask
    --             },
    --             grades = {1, 2, 3, 4},
    --         },
    --         {
    --             name = "Trooper Black",
    --             outfitData = {
    --                 ["pants"] = {item = 24, texture = 0}, -- Pants
    --                 ["arms"] = {item = 20, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
    --                 ["vest"] = {item = 0, texture = 0}, -- Body Vest
    --                 ["torso2"] = {item = 317, texture = 8}, -- Jacket
    --                 ["shoes"] = {item = 51, texture = 0}, -- Shoes
    --                 ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["hat"] = {item = 58, texture = 3}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["mask"] = {item = 0, texture = 0} -- Mask
    --             },
    --             grades = {2, 3, 4},
    --         },
    --         {
    --             name = "SWAT",
    --             outfitData = {
    --                 ["pants"] = {item = 130, texture = 1}, -- Pants
    --                 ["arms"] = {item = 172, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 15, texture = 0}, -- T Shirt
    --                 ["vest"] = {item = 15, texture = 2}, -- Body Vest
    --                 ["torso2"] = {item = 336, texture = 3}, -- Jacket
    --                 ["shoes"] = {item = 24, texture = 0}, -- Shoes
    --                 ["accessory"] = {item = 133, texture = 0}, -- Neck Accessory
    --                 ["hat"] = {item = 150, texture = 0}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["mask"] = {item = 52, texture = 0} -- Mask
    --             },
    --             grades = {3, 4},
    --         }
    --     },
    --     ["Female"] = {
    --         {
    --             name = "Short Sleeve",
    --             outfitData = {
    --                 ["pants"] = {item = 133, texture = 0}, -- Pants
    --                 ["arms"] = {item = 31, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
    --                 ["vest"] = {item = 34, texture = 0}, -- Body Vest
    --                 ["torso2"] = {item = 48, texture = 0}, -- Jacket
    --                 ["shoes"] = {item = 52, texture = 0}, -- Shoes
    --                 ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["hat"] = {item = 0, texture = 0}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["mask"] = {item = 0, texture = 0} -- Mask
    --             },
    --             grades = {0, 1, 2, 3, 4},
    --         },
    --         {
    --             name = "Trooper Tan",
    --             outfitData = {
    --                 ["pants"] = {item = 133, texture = 0}, -- Pants
    --                 ["arms"] = {item = 31, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
    --                 ["vest"] = {item = 34, texture = 0}, -- Body Vest
    --                 ["torso2"] = {item = 327, texture = 3}, -- Jacket
    --                 ["shoes"] = {item = 52, texture = 0}, -- Shoes
    --                 ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["hat"] = {item = 0, texture = 0}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["mask"] = {item = 0, texture = 0} -- Mask
    --             },
    --             grades = {0, 1, 2, 3, 4},
    --         },
    --         {
    --             name = "Long Sleeve",
    --             outfitData = {
    --                 ["pants"] = {item = 133, texture = 0}, -- Pants
    --                 ["arms"] = {item = 31, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
    --                 ["vest"] = {item = 34, texture = 0}, -- Body Vest
    --                 ["torso2"] = {item = 327, texture = 0}, -- Jacket
    --                 ["shoes"] = {item = 52, texture = 0}, -- Shoes
    --                 ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["hat"] = {item = 0, texture = 0}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["mask"] = {item = 0, texture = 0} -- Mask
    --             },
    --             grades = {1, 2, 3, 4},
    --         },
    --         {
    --             name = "Trooper Black",
    --             outfitData = {
    --                 ["pants"] = {item = 133, texture = 0}, -- Pants
    --                 ["arms"] = {item = 31, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
    --                 ["vest"] = {item = 34, texture = 0}, -- Body Vest
    --                 ["torso2"] = {item = 327, texture = 8}, -- Jacket
    --                 ["shoes"] = {item = 52, texture = 0}, -- Shoes
    --                 ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["hat"] = {item = 0, texture = 0}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["mask"] = {item = 0, texture = 0} -- Mask
    --             },
    --             grades = {2, 3, 4},
    --         },
    --         {
    --             name = "SWAT",
    --             outfitData = {
    --                 ["pants"] = {item = 135, texture = 1}, -- Pants
    --                 ["arms"] = {item = 213, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 0, texture = 0}, -- T Shirt
    --                 ["vest"] = {item = 17, texture = 2}, -- Body Vest
    --                 ["torso2"] = {item = 327, texture = 8}, -- Jacket
    --                 ["shoes"] = {item = 52, texture = 0}, -- Shoes
    --                 ["accessory"] = {item = 102, texture = 0}, -- Neck Accessory
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["hat"] = {item = 149, texture = 0}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["mask"] = {item = 35, texture = 0} -- Mask
    --             },
    --             grades = {3, 4},
    --         }
    --     }
    -- },
    -- ["realestate"] = {
    --     ["Male"] = {
    --         {
    --             -- Outfits
    --             name = "Worker",
    --             outfitData = {
    --                 ["pants"]       = { item = 28, texture = 0},  -- Pants
    --                 ["arms"]        = { item = 1, texture = 0},  -- Arms
    --                 ["t-shirt"]     = { item = 31, texture = 0},  -- T Shirt
    --                 ["vest"]        = { item = 0, texture = 0},  -- Body Vest
    --                 ["torso2"]      = { item = 294, texture = 0},  -- Jacket
    --                 ["shoes"]       = { item = 10, texture = 0},  -- Shoes
    --                 ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
    --                 ["bag"]         = { item = 0, texture = 0},  -- Bag
    --                 ["hat"]         = { item = 12, texture = -1},  -- Hat
    --                 ["glass"]       = { item = 0, texture = 0},  -- Glasses
    --                 ["mask"]        = { item = 0, texture = 0},  -- Mask
    --             },
    --             grades = {0, 1, 2, 3, 4},
    --         }
    --     },
    --     ["Female"] = {
    --         {
    --             name = "Worker",
    --             outfitData = {
    --                 ["pants"]       = { item = 57, texture = 2},  -- Pants
    --                 ["arms"]        = { item = 0, texture = 0},  -- Arms
    --                 ["t-shirt"]     = { item = 34, texture = 0},  -- T Shirt
    --                 ["vest"]        = { item = 0, texture = 0},  -- Body Vest
    --                 ["torso2"]      = { item = 105, texture = 7},  -- Jacket
    --                 ["shoes"]       = { item = 8, texture = 5},  -- Shoes
    --                 ["accessory"]   = { item = 11, texture = 3},  -- Neck Accessory
    --                 ["bag"]         = { item = 0, texture = 0},  -- Bag
    --                 ["hat"]         = { item = -1, texture = -1},  -- Hat
    --                 ["glass"]       = { item = 0, texture = 0},  -- Glasses
    --                 ["mask"]        = { item = 0, texture = 0},  -- Mask
    --             },
    --             grades = {0, 1, 2, 3, 4},
    --         }
    --     }
    -- },
    -- ["ambulance"] = {
    --     ["Male"] = {
    --         {
    --             name = "T-Shirt",
    --             outfitData = {
    --                 ["arms"] = {item = 85, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 129, texture = 0}, -- T-Shirt
    --                 ["torso2"] = {item = 250, texture = 0}, -- Jackets
    --                 ["vest"] = {item = 0, texture = 0}, -- Vest
    --                 ["decals"] = {item = 58, texture = 0}, -- Decals
    --                 ["accessory"] = {item = 127, texture = 0}, -- Neck
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["pants"] = {item = 96, texture = 0}, -- Pants
    --                 ["shoes"] = {item = 54, texture = 0}, -- Shoes
    --                 ["mask"] = {item = 121, texture = 0}, -- Mask
    --                 ["hat"] = {item = 122, texture = 0}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["ear"] = {item = 0, texture = 0} -- Ear accessories
    --             },
    --             grades = {0, 1, 2, 3, 4},
    --         },
    --         {
    --             name = "Polo",
    --             outfitData = {
    --                 ["arms"] = {item = 90, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 15, texture = 0}, -- T-Shirt
    --                 ["torso2"] = {item = 249, texture = 0}, -- Jackets
    --                 ["vest"] = {item = 0, texture = 0}, -- Vest
    --                 ["decals"] = {item = 57, texture = 0}, -- Decals
    --                 ["accessory"] = {item = 126, texture = 0}, -- Neck
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["pants"] = {item = 96, texture = 0}, -- Pants
    --                 ["shoes"] = {item = 54, texture = 0}, -- Shoes
    --                 ["mask"] = {item = 121, texture = 0}, -- Mask
    --                 ["hat"] = {item = 122, texture = 0}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["ear"] = {item = 0, texture = 0} -- Ear accessories
    --             },
    --             grades = {2, 3, 4},
    --         },
    --         {
    --             name = "Doctor",
    --             outfitData = {
    --                 ["arms"] = {item = 93, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 32, texture = 3}, -- T-Shirt
    --                 ["torso2"] = {item = 31, texture = 7}, -- Jackets
    --                 ["vest"] = {item = 0, texture = 0}, -- Vest
    --                 ["decals"] = {item = 0, texture = 0}, -- Decals
    --                 ["accessory"] = {item = 126, texture = 0}, -- Neck
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["pants"] = {item = 28, texture = 0}, -- Pants
    --                 ["shoes"] = {item = 10, texture = 0}, -- Shoes
    --                 ["mask"] = {item = 0, texture = 0}, -- Mask
    --                 ["hat"] = {item = -1, texture = 0}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["ear"] = {item = 0, texture = 0} -- Ear accessories
    --             },
    --             grades = {3, 4},
    --         }
    --     },
    --     ["Female"] = {
    --         {
    --             name = "T-Shirt",
    --             outfitData = {
    --                 ["arms"] = {item = 109, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 159, texture = 0}, -- T-Shirt
    --                 ["torso2"] = {item = 258, texture = 0}, -- Jackets
    --                 ["vest"] = {item = 0, texture = 0}, -- Vest
    --                 ["decals"] = {item = 66, texture = 0}, -- Decals
    --                 ["accessory"] = {item = 97, texture = 0}, -- Neck
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["pants"] = {item = 99, texture = 0}, -- Pants
    --                 ["shoes"] = {item = 55, texture = 0}, -- Shoes
    --                 ["mask"] = {item = 121, texture = 0}, -- Mask
    --                 ["hat"] = {item = 121, texture = 0}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["ear"] = {item = 0, texture = 0} -- Ear accessories
    --             },
    --             grades = {0, 1, 2, 3, 4},
    --         },
    --         {
    --             name = "Polo",
    --             outfitData = {
    --                 ["arms"] = {item = 105, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 13, texture = 0}, -- T-Shirt
    --                 ["torso2"] = {item = 257, texture = 0}, -- Jackets
    --                 ["vest"] = {item = 0, texture = 0}, -- Vest
    --                 ["decals"] = {item = 65, texture = 0}, -- Decals
    --                 ["accessory"] = {item = 96, texture = 0}, -- Neck
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["pants"] = {item = 99, texture = 0}, -- Pants
    --                 ["shoes"] = {item = 55, texture = 0}, -- Shoes
    --                 ["mask"] = {item = 121, texture = 0}, -- Mask
    --                 ["hat"] = {item = 121, texture = 0}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["ear"] = {item = 0, texture = 0} -- Ear accessories
    --             },
    --             grades = {2, 3, 4},
    --         },
    --         {
    --             name = "Doctor",
    --             outfitData = {
    --                 ["arms"] = {item = 105, texture = 0}, -- Arms
    --                 ["t-shirt"] = {item = 39, texture = 3}, -- T-Shirt
    --                 ["torso2"] = {item = 7, texture = 1}, -- Jackets
    --                 ["vest"] = {item = 0, texture = 0}, -- Vest
    --                 ["decals"] = {item = 0, texture = 0}, -- Decals
    --                 ["accessory"] = {item = 96, texture = 0}, -- Neck
    --                 ["bag"] = {item = 0, texture = 0}, -- Bag
    --                 ["pants"] = {item = 34, texture = 0}, -- Pants
    --                 ["shoes"] = {item = 29, texture = 0}, -- Shoes
    --                 ["mask"] = {item = 0, texture = 0}, -- Mask
    --                 ["hat"] = {item = -1, texture = 0}, -- Hat
    --                 ["glass"] = {item = 0, texture = 0}, -- Glasses
    --                 ["ear"] = {item = 0, texture = 0} -- Ear accessories
    --             },
    --             grades = {3, 4},
    --         }
    --     }
    -- }
}

Config.InitialPlayerClothes = {
    Male = {
        Components = {
            {
                component_id = 0, -- Face
                drawable = 0,
                texture = 0
            },
            {
                component_id = 1, -- Mask
                drawable = 0,
                texture = 0
            },
            {
                component_id = 2, -- Hair
                drawable = 0,
                texture = 0
            },
            {
                component_id = 3, -- Upper Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 4, -- Lower Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 5, -- Bag
                drawable = 0,
                texture = 0
            },
            {
                component_id = 6, -- Shoes
                drawable = 0,
                texture = 0
            },
            {
                component_id = 7, -- Scarf & Chains
                drawable = 0,
                texture = 0
            },
            {
                component_id = 8, -- Shirt
                drawable = 0,
                texture = 0
            },
            {
                component_id = 9, -- Body Armor
                drawable = 0,
                texture = 0
            },
            {
                component_id = 10, -- Decals
                drawable = 0,
                texture = 0
            },
            {
                component_id = 11, -- Jacket
                drawable = 0,
                texture = 0
            }
        },
        Props = {
            {
                prop_id = 0, -- Hat
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 1, -- Glasses
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 2, -- Ear
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 6, -- Watch
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 7, -- Bracelet
                drawable = -1,
                texture = -1
            }
        },
        Hair = {
            color = 0,
            highlight = 0,
            style = 0,
            texture = 0
        }
    },
    Female = {
        Components = {
            {
                component_id = 0, -- Face
                drawable = 0,
                texture = 0
            },
            {
                component_id = 1, -- Mask
                drawable = 0,
                texture = 0
            },
            {
                component_id = 2, -- Hair
                drawable = 0,
                texture = 0
            },
            {
                component_id = 3, -- Upper Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 4, -- Lower Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 5, -- Bag
                drawable = 0,
                texture = 0
            },
            {
                component_id = 6, -- Shoes
                drawable = 0,
                texture = 0
            },
            {
                component_id = 7, -- Scarf & Chains
                drawable = 0,
                texture = 0
            },
            {
                component_id = 8, -- Shirt
                drawable = 0,
                texture = 0
            },
            {
                component_id = 9, -- Body Armor
                drawable = 0,
                texture = 0
            },
            {
                component_id = 10, -- Decals
                drawable = 0,
                texture = 0
            },
            {
                component_id = 11, -- Jacket
                drawable = 0,
                texture = 0
            }
        },
        Props = {
            {
                prop_id = 0, -- Hat
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 1, -- Glasses
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 2, -- Ear
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 6, -- Watch
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 7, -- Bracelet
                drawable = -1,
                texture = -1
            }
        },
        Hair = {
            color = 0,
            highlight = 0,
            style = 0,
            texture = 0
        }
    }
}
