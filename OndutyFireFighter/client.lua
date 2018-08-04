RegisterCommand("onduty", function(source, args, rawCommand)
    Stuff() 
end, false)


function Stuff()
    local model = GetHashKey("S_M_Y_Fireman_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    local ped = PlayerPedId()
    local name = GetPlayerName(_source)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HATCHET"), 1000, false)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FIREEXTINGUISHER"), 1000, false)
    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
    TriggerEvent('chatMessage', "^*FireFighter", { 255, 26, 71 }, name .. " IS NOW ONDUTY!")
end

RegisterCommand("offduty", function(source, args, rawCommand)
    Other()
end, false)

function Other()
    local model = GetHashKey("a_m_m_business_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    local Ped = PlayerPedId()
    local name = GetPlayerName(_source)
    RemoveAllPedWeapons(GetPlayerPed(-1))
    TriggerEvent('chatMessage', "^*FireFighter", { 255, 26, 71 }, name .. " IS NOW OFFDUTY!")
end