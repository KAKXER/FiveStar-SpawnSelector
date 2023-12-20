Citizen.CreateThread(function()
    local resourcename = "FiveStar-SpawnSelector"
    if resourcename == GetCurrentResourceName() then
        local GetVersion = tonumber(GetResourceMetadata(resourcename, "version"))
        if GetVersion ~= nil and type(GetVersion) == "number" then
            local VersionMetaData = tonumber(string.format("%.2f", GetVersion))
            local function PrintData(IsStarted)
                if IsStarted then
                    local color = {
                        [1] = math.random(1, 9),
                        [2] = math.random(1, 9),
                        [3] = math.random(1, 9),
                        [4] = math.random(1, 9)
                    }
                    if GetConvar("FiveStar", "enable") == "enable" then
                        SetConvar("FiveStar", "disable")
                        print("")
                        print("^" .. color[3] .. "            Hello, Welcome To ^" .. color[2] .. "FiveStar Development ^" .. color[3])
                        print(" ███████╗██╗██╗   ██╗███████╗███████╗████████╗ █████╗ ██████╗  ")
                        print(" ██╔════╝██║██║   ██║██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗ ")
                        print(" ██╔════╝██║██║   ██║██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗ ")
                        print(" █████╗  ██║██║   ██║█████╗  ███████╗   ██║   ███████║██████╔╝ ")
                        print(" ██╔══╝  ██║╚██╗ ██╔╝██╔══╝  ╚════██║   ██║   ██╔══██║██╔══██╗ ")
                        print(" ██║     ██║ ╚████╔╝ ███████╗███████║   ██║   ██║  ██║██║  ██║ ")
                        print(" ╚═╝     ╚═╝  ╚═══╝  ╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ")
                        print("                    ^" .. color[2] .. "FiveStar Development                      ")
                        print("                https://discord.5star.codes                ")
                        print("             Resource Name: ^" .. color[1] .. "" .. resourcename .. "                ^" .. color[3])
                        print("                    Resource Version: ^" .. color[1] .. "" .. VersionMetaData .. "                ^" .. color[3] .. "^0")
                    else
                        print("                    ^" .. color[2] .. "FiveStar Development                      ")
                        print("             Resource Name: ^" .. color[1] .. "" .. resourcename .. "                ^" .. color[3])
                        print("                    Resource Version: ^" .. color[1] .. "" .. VersionMetaData .. "                ^" .. color[3] .. "^0")
                    end
                else
                    Wait(500)
                    os.exit()
                end
            end

            if Config.CheckVersion then
                local function CheckVersion()
                    local Version = promise.new()

                    PerformHttpRequest("https://raw.githubusercontent.com/kakxer/fivestar-version/master/Version.json", function(errorCode, resultData, resultHeaders)
                        Version:resolve(resultData)
                    end, "GET")

                    local data = json.decode(Citizen.Await(Version))
                    if data == nil then
                        print("A connection to check your Update Version could not be established")
                        return false
                    end

                    local VersionMain = data[resourcename]
                    if (type(Version) ~= "table" and data == nil) or (type(VersionMain) ~= "number" and VersionMain == nil) then
                        print("^8The data Request is invalid | Please contact support [https://discord.5star.codes]^0")
                        return false
                    elseif VersionMetaData == VersionMain then
                      return true
                    else
                        print("^2UPDATE: The new Update of " .. resourcename .. " Version [" .. VersionMain .. "] has been Released, please go to your ControlPanel and update the " .. resourcename .. " Script.")
                        return false
                    end
                end
                PrintData(CheckVersion())
            else
                PrintData(true)
            end       
        else
            print("^8ERROR: Please Change the Script Version in fxmanifest.lua and Change to Default Mode")
            Wait(500)
            os.exit()
        end
    else
        print("^8WARNING: Source Name " .. resourcename .. " Do Change This Source Name!")
        Wait(500)
        os.exit()
    end
end)

GlobalState.SpawnPlayer = {}

RegisterNetEvent("FiveStar-SpawnSelector:server:SaveSpawnPlayer", function()
    GlobalState.SpawnPlayer[source] = true
end)