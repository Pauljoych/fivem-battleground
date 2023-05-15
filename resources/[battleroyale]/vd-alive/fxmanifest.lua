fx_version 'adamant'

game 'gta5'
lua54 'yes'
description 'lol dek'

version '1.1.0'

shared_scripts {
	'@ox_lib/init.lua',
}
server_script 'server/main.lua'

client_script 'client/main.lua'

ui_page 'html/scoreboard.html'

files {
	'html/scoreboard.html',
	'html/script.js',
	'html/lol.js',
	'html/style.css'
}
