fx_version 'adamant'

game 'gta5'

description ""
lua54 'yes'
version "1.0"

ui_page "html/ui.html"

shared_script {
  '@vd_core/imports.lua',
  '@ox_lib/init.lua'
}

client_scripts {
  "@vd_core/locale.lua",
  "client/*.lua",
  "common/weapons.lua",
  "locales/en.lua",
  "config.lua",
  "notif_client.lua"
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  "@vd_core/locale.lua",
  "server/main.lua",
  "server/storage.lua",
  "server/logs.lua",
  "common/weapons.lua",
  "locales/en.lua",
  "config.lua",
  "notif_server.lua"
}

files {
    'html/ui.html',
    'html/css/ui.css',
    'html/css/jquery-ui.css',
    'html/css/bootstrap.min.css',
    'html/js/inventory.js',
    'html/js/config.js',
    'html/js/inventory.js',
    'html/js/jquery-3.3.1.min.js',
    'html/js/jquery-ui.min.js',
    -- JS LOCALES
    'html/locales/en.js',
    -- IMAGES
    'html/img/*.png',
    'html/img/*.svg',
    'html/img/items/*.png'
}