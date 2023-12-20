-- ! ███████╗██╗██╗   ██╗███████╗███████╗████████╗ █████╗ ██████╗ 
-- ! ██╔════╝██║██║   ██║██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗
-- ! █████╗  ██║██║   ██║█████╗  ███████╗   ██║   ███████║██████╔╝
-- ! ██╔══╝  ██║╚██╗ ██╔╝██╔══╝  ╚════██║   ██║   ██╔══██║██╔══██╗
-- ! ██║     ██║ ╚████╔╝ ███████╗███████║   ██║   ██║  ██║██║  ██║
-- ! ╚═╝     ╚═╝  ╚═══╝  ╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝
-- ! 		   Copyright ® 2023 Lorem All rights FiveStar
-- ! 		      5star.tebex.io | Discord/HdEzqEJBdh
Config = {}

-- * If an update is released for the script, it will not allow the script to start and will cause the server to shut down
Config.CheckVersion = true

Config.Location = {
    [1] = {
        Coords = vector4(324.9939, -229.552, 54.221, 167.54),
        Name = "Motel",
        Description = "Click on select to go to Pink cage Motel",
        Image = "motel.png"
    },
    [2] = {
        Coords = vector4(420.4171, -965.907, 29.398, 8.92),
        Name = "Police Department",
        Description = "Click on select to go to LSPD",
        Image = "lspd.png"
    },
    [3] = {
        Coords = vector4(-277.146, -881.197, 31.546, 351.19),
        Name = "Central parking",
        Description = "Click on select to go to central parking",
        Image = "parking.png"
    },
    [4] = {
        Coords = vector4(2049.449, 3731.146, 32.862, 306.22),
        Name = "Sandy Shores",
        Description = "Click on select to go to Sandy Shores",
        Image = "sandy.png"
    },
    [5] = {
        Coords = vector4(-187.425, -1312.40, 31.295, 269.87),
        Name = "Mechanic",
        Description = "Click on select to go to mechanic location",
        Image = "mechanic.png"
    }
}

Config.LastLocation = {
    Name = "Last Location",
    Description = "The last location you were in",
    MiniTxt = "main"
}