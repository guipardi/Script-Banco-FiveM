fx_version 'cerulean'
game 'gta5'

shared_scripts {
    '@vrp/lib/utils.lua'
}

ui_page 'NUI/index.html'

server_script 'server.lua'
client_script 'client.lua' 

files {
    'NUI/*.*',
    'NUI/**/*.*',
    'NUI/**/**/*.*'
}