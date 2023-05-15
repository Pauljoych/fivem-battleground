fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Mectov'
version '1.0.0'

ui_page 'html/index.html'

client_scripts {
    'Client/*.lua',
    '@vd_icon/lib/IconMenu.lua'
}

server_scripts {
	-- "@mysql-async/lib/MySQL.lua",
    "@oxmysql/lib/MySQL.lua",
    'Server/*.lua'
}

shared_scripts {
    "Config.lua"
}

files {
    'html/index.html',
    'html/css/*.css',
    'html/*.css',
    'html/js/*.js',
    'html/js/*.js.map',
    'html/img/*.png',
    'html/img/*.jpg',
    'html/img/*.gif',
    -- 'html/_sounds/*.mp3',
}

escrow_ignore {
    'Config.lua'
}