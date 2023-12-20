fx_version 'cerulean'
game 'gta5'

name "FiveStar-SpawnSelector"
description "Spawn Selector System by FiveStar"
author "FiveStar Development Team"
website "5star.Codes"
discord "discord.5star.codes"
tebex "5star.tebex.io"
version "1.0"
lua54 'yes'

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

shared_scripts {
	'shared/*.lua'
}

ui_page "ui/index.html"

files {
	"ui/index.html",
	"ui/images/*.*",
	"ui/sounds/*.*",
	"ui/css/*.*",
	"ui/js/*.*"
}