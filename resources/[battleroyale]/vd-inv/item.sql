CREATE DATABASE IF NOT EXISTS `dream`;
USE `dream`;

CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `limit` int(11) NOT NULL DEFAULT 10,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('2jzengine', '2JZ Engine', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('aclskey', 'Key Boy', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('alive_chicken', 'Living chicken', 1, 20, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ammo', 'Ammo', 1, 2, 0, 1, 1000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ammo_hunt', 'Ammo Hunting', 1, 2, 0, 1, 1000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ammo_pistol', 'Pistol Ammo', 5, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ammo_pistol_polisi', 'Pistol Ammo Police', 5, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ammo_rifle', 'Rifle Ammo', 5, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ammo_rifle_polisi', 'Rifle Ammo Police', 5, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ammo_shotgun', 'Shotgun Shells', 5, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ammo_shotgun_d', 'Shotgun Shells Police', 5, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ammo_smg', 'SMG Ammo', 5, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ammo_smg_polisi', 'SMG Ammo Police', 5, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ammo_snp', 'Sniper Ammo', 5, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ammo_snp_polisi', 'Sniper Ammo Police', 5, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('anchovy', 'Anchovy', 0, 10, 1, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('animal_bait', 'Animal bait', 1, 10, 0, 1, 200);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ankletracker', 'Ankle Bracelet Tracker', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('anti', 'Antibiotic', 1, 10, 0, 1, 50);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('armor', 'Armor', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('badge', 'Police Badge', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('bandage', 'Bandage', 2, 5, 0, 1, 100);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('basementkey', 'Basement Key', 1, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('beer', 'Beer', 1, 6, 0, 1, 250);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('beras', 'Rice', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('bgaram', 'Pack of Salt', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('biji_kopi', 'Coffee Powder', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('black_money', 'Dirty Money', 0, -1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('blowpipe', 'Blowtorch', 2, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('boarmeat', 'Boar Meat', 1, 5, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('boartusk', 'Boar Tusk', 1, 5, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('boltcutter', 'Bolt Cutter', 2, 10, 1, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('bottle', 'Bottle', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('bread', 'Bread', 1, 5, 0, 1, 150);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('brokencard', 'Broken Card', 1, 5, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('brokenlaptop', 'Broken Laptop', 1, 5, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('brokenphone', 'Broken Phone', 1, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('brokenproc', 'Broken Processor', 1, 5, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('bubuk_coklat', 'Chocolate Powder', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('burger', 'Hamburger', 1, 5, 0, 1, 500);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('cabe', 'Chilli', 1, 40, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('calculator', 'Calculator', 1, 1, 0, 1, 100);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('can', 'Can', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('carokit', 'Body Kit', 3, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('carotool', 'Tools', 2, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('cash', 'Cash', 1, -1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('champagne', 'Champagne', 1, 2, 0, 1, 1000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('chipcard', 'Chipcard', 1, 5, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('chocolate', 'Chocolate', 1, 5, 0, 1, 150);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('clothe', 'Cloth', 1, 36, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('clutch', 'Clutch', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('coca', 'Coca', 1, 5, 0, 1, 150);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('coffee', 'Hot Coffee', 1, 5, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('coke', 'Coke (1G)', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('coke_pooch', 'Bag of coke (28G)', 2, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('coklat', 'Chocolate', 1, 40, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('contract', 'Contract', 1, 1, 0, 1, 2000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('cookedMeat', 'Cooked Meat', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('copper', 'Copper', 1, 56, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('coyotefur', 'Coyote Fur', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('coyotemeat', 'Coyote Meat', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('croquettes', 'Pet Food', 1, 20, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('cutted_wood', 'Cut wood', 1, 20, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('deermeat', 'Deer Meat', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('deerskin', 'Deer Skin', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('deer_horn', 'Deer Horn', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('diamond', 'Diamond', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('dojkey', 'Key [Dream]', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('dolphin', 'Dolphin', 1, 3, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('dreamdiamond', 'Diamond [Dream]', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('dreamengagementring', 'Engagement Ring [Dream]', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('dreamengagementring2', 'Engagement Ring [Jazzelia]', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('dreamrose', 'Rose [Dream]', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('dreamruby', 'Ruby [Dream]', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('dreamweddingring', 'Wedding Ring [Dream]', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('dreamweddingring2', 'Wedding Ring [Jazzelia]', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('drill', 'Drill', 1, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('essence', 'Gas', 1, 24, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('fabric', 'Fabric', 1, 72, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('fibkey', 'key Fib', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('fish', 'Fish', 1, 100, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('fishbait', 'Fishing Bait', 1, 10, 0, 1, 100);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('fishingrod', 'Fishing Rod', 1, 10, 0, 1, 500);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('fixkit', 'Repair Kit', 3, 3, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('fixtool', 'Repair Tools', 2, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('frappucino', 'Frappucino', 1, 2, 0, 1, 750);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('friedchicken', 'Fried Chicken', 1, 2, 0, 1, 1000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('friedchickenv2', 'Fried Chicken V2', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('garam', 'Salt', 1, 40, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('gasket', 'Engine Gasket', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('gazbottle', 'Gas Bottle', 2, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('gold', 'Gold', 1, 21, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('gula', 'Sugar', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('gunbarrel', 'Gun Barrel', 1, 12, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('gunframe', 'Gun Frame', 1, 18, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('gunstock', 'Gun Stock', 1, 20, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('guntrigger', 'Gun Trigger', 1, 32, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('hackingdevice', 'Hacking Device', 1, 3, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('hackinglaptop', 'Hacking Laptop', 1, 3, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('hotelburger', 'Hotel Burger', 1, 5, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('huntingbait', 'Hunting Bait', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('huntingknife', 'Hunting Knife', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('icetea', 'Ice Tea', 1, 5, 0, 1, 500);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('id_card', 'ID Card', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('id_card_f', 'Malicious Access Card', 1, 1, 3, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('iron', 'Iron', 1, 42, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('jackdaniel', 'Jack D', 1, 2, 0, 1, 1750);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('jewels', 'Jewels', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('joint', 'Joint', 1, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('killerwhale', 'Killer Whale', 1, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('kopi', 'Coffee Bean', 1, 40, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('latte', 'Latte', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_boar_bad', 'Bad boar leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_boar_good', 'Good boar leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_boar_perfect', 'Perfect boar leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_chickenhawk_bad', 'Bad chickenhawl leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_chickenhawk_good', 'Good chickenhawk leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_chickenhawk_perfect', 'Perfect chickenhawk leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_cormorant_bad', 'Bad cormorant leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_cormorant_good', 'Good cormorant leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_cormorant_perfect', 'Perfect cormorant leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_coyote_bad', 'Bad coyote leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_coyote_good', 'Good coyote leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_coyote_perfect', 'Perfect coyote leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_deer_bad', 'Bad deer leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_deer_good', 'Good deer leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_deer_perfect', 'Perfect deer leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_mlion_bad', 'Bad mountain lion leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_mlion_good', 'Good mountain lion leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_mlion_perfect', 'Perfect mountain lion leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_rabbit_bad', 'Bad rabbit leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_rabbit_good', 'Good rabbit leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('leather_rabbit_perfect', 'Perfect rabbit leather', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('licenseplate', 'License plate', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ligther', 'Lighter', 1, 5, 0, 1, 250);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('lockpick', 'Lockpick', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('lsmdkey', 'Key Lsmd', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('lspdkey', 'Key Lspd', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('meat', 'Fresh meat', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('mechanic_tools', 'Mechanic Tools', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('medikit', 'Medikit', 2, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('mesiu', 'Gun Powder', 1, 5, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('meth', 'Meth (1G)', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('meth_pooch', 'Bag of meth (28G)', 2, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('michelin_tires', 'Michelin Tires', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('milk', 'Milk', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('money', 'Cash', 0, -1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('mullet', 'Mullet', 0, 10, 1, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ngk_sparkplugs', 'NGK Spark Plugs', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('nos', 'Nitrous NOS', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('notepad', 'Notepad', 1, 3, 0, 1, 100);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('oilfilter', 'Oil Filter', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('opium', 'Opium (1G)', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('opium_pooch', 'Bag of opium (28G)', 2, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('packaged_chicken', 'Chicken fillet', 1, 100, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('packaged_plank', 'Packaged wood', 1, 100, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('padi', 'Paddy', 1, 40, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('paper', 'Paper Pack', 1, 3, 0, 1, 250);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('petrol', 'Oil', 1, 24, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('petrol_raffin', 'Processed oil', 1, 12, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('phone', 'Handphone', 1, 5, 0, 1, 500);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('piston', 'Piston', 1, 8, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('pompano', 'Pompano Fish', 0, 10, 1, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('race_brakes', 'Race Breaks', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('race_suspension', 'Race Suspension', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('race_transmission_4wd', 'Race Transmission 4WD', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('race_transmission_fwd', 'Race Transmission FWD', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('race_transmition', 'Race Transmition', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('radio', 'Radio', 1, 5, 0, 1, 500);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('rubber', 'Tires Rubber', 1, 5, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('sake', 'Sake', 1, 2, 0, 1, 800);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('salmon', 'Salmon', 0, 10, 1, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('sambal', 'Chili Sauce', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('sardany', 'Sardany', 0, 10, 1, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('scope', 'Sniper Scope', 1, 5, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('secure_card', 'Secure ID Card', 1, 1, 3, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('shark', 'Shark', 1, -1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('sharkhammer', 'Hammerhead Shark', 1, 3, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('sharktiger', 'Tiger Shark', 1, 3, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('shell_oil', 'Shell Oil', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('shortcable', 'Short Cable', 1, 5, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('slaughtered_chicken', 'Slaughtered chicken', 1, 20, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('sparkplug', 'Spark Plug', 1, 4, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('sparkplugcable', 'Spark Plug Cables', 1, 4, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('startKey', 'Gate Key', 1, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('stingray', 'Stingray', 1, 5, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('stock_brakes', 'Stock Brakes', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('stone', 'Stone', 1, 7, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('suspensioncoil', 'Suspension Coil', 1, 4, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('syrup', 'Medicine Syrup', 1, 1, 0, 1, 5000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('tebu', 'Sugar Cane', 1, 40, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('teh', 'Tea Leaf', 1, 40, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('teh_kantong', 'Tea Pocket', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('tequila', 'Tequila', 1, 2, 0, 1, 1800);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('thermite', 'Thermite', 1, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('ticket', 'Ticket', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('toolbox', 'Tool Box', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('tuna', 'Tuna', 0, 10, 1, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('tuning_laptop', 'Tuner Laptop', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('turbo_lvl_1', 'GARET Turbo', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('turtle', 'Sea Turtle', 1, 3, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('turtlebait', 'Turtle Bait', 1, 10, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('tyrekit', 'Tyre Kit', 1, 2, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('uskey', 'Key Us', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('usmskey', 'key Usms', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('v8engine', 'V8 Engine', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('vodka', 'Vodka', 1, 2, 0, 1, 1200);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('washed_stone', 'Washed stone', 1, 7, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('water', 'Water', 1, 5, 0, 1, 150);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_ADVANCEDRIFLE', 'Advanced Rifle', 1, 1, 0, 1, 20000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_APPISTOL', 'AP Pistol', 1, 1, 0, 1, 10000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_ASSAULTRIFLE', 'Assault Rifle', 1, 1, 0, 1, 20000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_ASSAULTSHOTGUN', 'Assault Shotgun', 1, 1, 0, 1, 15000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_ASSAULTSMG', 'P-90', 1, 1, 0, 1, 22000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_AUTOSHOTGUN', 'Auto Shotgun', 1, 1, 0, 1, 17500);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_BAT', 'Baseball Bat', 1, 1, 0, 1, 10);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_CARBINERIFLE', 'Carbine Rifle', 1, 1, 0, 1, 16500);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_COMBATPISTOL', 'Combat Pistol', 1, 1, 0, 1, 1000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_FLASHLIGHT', 'Flashlight', 1, 1, 0, 1, 10);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_HEAVYSNIPER', 'Heavy Sniper', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_KATANA', 'Katana', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_KNIFE', 'Knife', 100, 1, 1, 1, 20);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_M4', 'M4A1', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_MICROSMG', 'Micro Uzi', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_PETROLCAN', 'Petrol Can', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_PISTOL', 'Pistol', 1, 1, 0, 1, 7500);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_PISTOL50', 'Desert Eagle', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_PUMPSHOTGUN', 'Pump Shotgun', 1, 1, 0, 1, 12500);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_SMG', 'SMG', 1, 1, 0, 1, 15000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_SNIPERRIFLE', 'Hunting Sniper Rifle', 1, 1, 0, 1, 10000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('WEAPON_STUNGUN', 'Taser', 100, 1, 1, 1, 80);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('weed', 'Weed (1G)', 2, 90, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('weed_pooch', 'Bag of weed (28G)', 2, 30, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('whisky', 'Whiskey', 1, 2, 0, 1, 1500);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('wine', 'Wine', 1, 2, 0, 1, 2000);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('wings', 'Chicken Wings', 1, 1, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('wood', 'Wood', 1, 20, 0, 1, 200);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('wool', 'Wool', 1, 36, 0, 1, 0);
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('zarowki', 'Headlights', 1, 1, 0, 1, 500);