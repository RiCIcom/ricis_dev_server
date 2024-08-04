fx_version 'cerulean'
game 'gta5'

name 'Ricis Dev Server'
author 'Rici_Zockt'
description 'A custom framework for FiveM'

server_scripts {
    'servermain.lua',
    'serverplayer.lua',
    'serverjobs.lua',
    'serverbanking.lua',
    'servercharacter.lua'
}

client_scripts {
    'clientmain.lua',
    'clientplayer.lua',
    'clientjobs.lua',
    'clientbanking.lua',
    'clientcharacter.lua'
}

files {
    'ui/index.html',
    'ui/styles.css',
    'ui/script.js'
}

ui_page 'ui/index.html'

shared_scripts {
    'shared/config.lua'
}
