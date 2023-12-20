RegisterNUICallback("RequestLoadUIData", function(_, cb)
    local SpawnPlayer = GlobalState.SpawnPlayer[GetPlayerServerId(PlayerId())]
    if not SpawnPlayer then
        SetTimecycleModifier('fp_vig_black')
        SetNuiFocus(true, true)
        TriggerServerEvent("FiveStar-SpawnSelector:server:SaveSpawnPlayer")
        cb({data = Config.Location, last = Config.LastLocation})
    end
end)

local function StartDarkScreen()
    DoScreenFadeOut(500)
    while IsScreenFadingOut() do
        Citizen.Wait(1)
    end
end

local function EndDarkScreen()
    ShutdownLoadingScreen()
    DoScreenFadeIn(500)
    while IsScreenFadingIn() do
        Citizen.Wait(1)
    end
end

RegisterNUICallback("teleport", function(data)
    if data then
        local Location = Config.Location[tonumber(data.index)].Coords
        StartDarkScreen()
        local PlayerPed = PlayerPedId()
        SetEntityCoords(PlayerPed, Location.x, Location.y, Location.z)
        FreezeEntityPosition(PlayerPed, true)
        local start_time = GetGameTimer()
        while (not HasCollisionLoadedAroundEntity(PlayerPed) and GetGameTimer() - start_time < 5000) do
            Citizen.Wait(5)
        end
        SetEntityHeading(PlayerPed, Location.w)
        FreezeEntityPosition(PlayerPed, false)
        Citizen.Wait(300)
        EndDarkScreen()     
      
    end

    SetTimecycleModifier('default')
    SetNuiFocus(false, false)
end)