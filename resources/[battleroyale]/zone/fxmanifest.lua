fx_version 'cerulean'
games { 'gta5' }
author 'Mectov'
lua54 'yes'
shared_script '@vd_core/imports.lua'


client_scripts {
  'client.lua',
  'lib.lua',
  'config.lua'
}

server_scripts {
  'server.lua'
}

escrow_ignore {
  'config.lua'
}

