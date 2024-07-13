RegisterServerEvent('rewards:GivePlayerMoney')
AddEventHandler('rewards:GivePlayerMoney', function(attackerid)
    local xPlayer = ESX.GetPlayerFromId(attackerid)

	xPlayer.addMoney(1000)
end)