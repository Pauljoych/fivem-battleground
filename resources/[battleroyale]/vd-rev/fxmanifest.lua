fx_version 'cerulean'
games { 'gta5' }
description 'ESX Ambulance Job'
lua54 'yes'
version '1.2.0'

shared_script {
	'@vd_core/imports.lua',
	'@ox_lib/init.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@vd_core/locale.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/cs.lua',
	'locales/he.lua',
	'config.lua',
	'server/main.lua',
	'server/server.lua'
}

client_scripts {
	'@vd_core/locale.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'locales/cs.lua',
	'locales/he.lua',
	'config.lua',
	'client/main.lua',
	'client/job.lua',
	'client/wheeslchair.lua',
	'client/client.lua',
	'client/death.lua'
}















 