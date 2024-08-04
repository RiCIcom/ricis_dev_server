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
    'uiindex.html',
    'uistyles.css',
    'uiscript.js'
}

ui_page 'uiindex.html'

shared_scripts {
    'shared/config.lua'
}
