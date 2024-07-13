AddEventHandler('gameEventTriggered', function(name, data)
    if name == "CEventNetworkEntityDamage" then
        victim = tonumber(data[1])
        attacker = tonumber(data[2])
        victimDied = tonumber(data[6]) == 1 and true or false 
        weaponHash = tonumber(data[7])
        isMeleeDamage = tonumber(data[10]) ~= 0 and true or false 
        vehicleDamageTypeFlag = tonumber(data[11]) 

        local PPed = PlayerPedId()
        local isplayer = IsPedAPlayer(attacker)
        local attackerid = isplayer and GetPlayerServerId(NetworkGetPlayerIndexFromPed(attacker)) or tostring(attacker==-1 and " " or attacker)

        if victim == attacker or victim ~= PPed or not IsPedAPlayer(victim) or not IsPedAPlayer(attacker) then return end

        if victim == PPed then 
            if victimDied then
                if IsEntityAPed(attacker) then
                    TriggerServerEvent('rewards:GivePlayerMoney', attackerid)
                end
            end
        end
    end
end)