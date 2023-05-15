fx_version 'cerulean'
games {'gta5'}
author 'Royal'
lua54 'yes'

ui_page 'html/index.html'

files {'html/index.html', 'html/styles.css', 'html/fonts/*.otf', 'html/scripts.js'}

shared_script {'@vd_core/imports.lua', '@ox_lib/init.lua', 'config.lua'}
client_scripts {'client/*.lua'}

server_scripts {'@mysql-async/lib/MySQL.lua', 'server/*.lua'}

escrow_ignore {'config.lua'}
