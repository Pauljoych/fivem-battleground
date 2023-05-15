fx_version 'adamant'
lua54 'yes'
game 'gta5'

-- Comment this out if you don't want to use the SQL keybinds
-- dependency 'ghmattimysql'


shared_scripts {
	'@vd_core/imports.lua'
}
client_scripts {
	'NativeUI.lua',
	'Config.lua',
	'Client/*.lua'
}

server_scripts {
	'Config.lua',
	'Server/*.lua'
}

escrow_ignore {
	'config.lua',
}
