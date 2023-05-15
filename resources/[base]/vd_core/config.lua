Config = {}
Config.Locale = GetConvar('esx:locale', 'en')

Config.Accounts = {
	bank = {
		label = TranslateCap('account_bank'),
		round = true
	},
	black_money = {
		label = TranslateCap('account_black_money'),
		round = true
	},
	money = {
		label = TranslateCap('account_money'),
		round = true
	}
}

Config.StartingAccountMoney 	= {bank = 50000000}

Config.Spawn 			= {x = -1274.84, y = -3385.88, z = 13.96, heading = 329.56}
Config.DefaultPlayerModel = `mp_m_freemode_01`

Config.EnablePaycheck			= false -- enable paycheck
Config.EnableSocietyPayouts 	= false -- pay from the society account that the player is employed at? Requirement: esx_society
Config.MaxWeight            	= 5000   -- the max inventory weight without backpack
Config.PaycheckInterval         = 7 * 60000 -- how often to recieve pay checks in milliseconds
Config.EnableDebug              = false -- Use Debug options?
Config.EnableDefaultInventory   = false -- Display the default Inventory ( F2 )
Config.EnableWantedLevel    	= false -- Use Normal GTA wanted Level?
Config.EnablePVP                = true -- Allow Player to player combat

Config.Multichar                = false -- Enable support for esx_multicharacter
Config.Identity                 = false -- Select a characters identity data before they have loaded in (this happens by default with multichar)
Config.DistanceGive 			= 5.0 -- Max distance when giving items, weapons etc.

Config.DisableHealthRegeneration  = true -- Player will no longer regenerate health
Config.DisableVehicleRewards      = true -- Disables Player Recieving weapons from vehicles
Config.DisableNPCDrops            = false -- stops NPCs from dropping weapons on death
Config.DisableWeaponWheel         = true -- Disables default weapon wheel
Config.DisableAimAssist           = true -- disables AIM assist (mainly on controllers)
Config.RemoveHudCommonents = {
	[1] = true, --WANTED_STARS,
	[2] = false, --WEAPON_ICON
	[3] = true, --CASH
	[4] = true,  --MP_CASH
	[5] = false, --MP_MESSAGE
	[6] = false, --VEHICLE_NAME
	[7] = false,-- AREA_NAME
	[8] = false,-- VEHICLE_CLASS
	[9] = false, --STREET_NAME
	[10] = false, --HELP_TEXT
	[11] = false, --FLOATING_HELP_TEXT_1
	[12] = false, --FLOATING_HELP_TEXT_2
	[13] = true, --CASH_CHANGE
	[14] = false, --RETICLE
	[15] = false, --SUBTITLE_TEXT
	[16] = true, --RADIO_STATIONS
	[17] = false, --SAVING_GAME,
	[18] = true, --GAME_STREAM
	[19] = true, --WEAPON_WHEEL
	[20] = true, --WEAPON_WHEEL_STATS
	[21] = false, --HUD_COMPONENTS
	[22] = false, --HUD_WEAPONS
}


Config.SpawnVehMaxUpgrades = true -- admin vehicles spawn with max vehcle settings
Config.CustomAIPlates = "ROY^ALF^AM" -- Custom plates for AI vehicles 
-- Pattern string format
--1 will lead to a random number from 0-9.
--A will lead to a random letter from A-Z.
-- . will lead to a random letter or number, with 50% probability of being either.
--^1 will lead to a literal 1 being emitted.
--^A will lead to a literal A being emitted.
--Any other character will lead to said character being emitted.
-- A string shorter than 8 characters will be padded on the right.
