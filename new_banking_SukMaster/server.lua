--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent("pNotify:SendNotification", -1, {text = "Invalid amount.", type = "error", queue = "lmao", timeout = 1000, layout = "centerLeft"})
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
		TriggerClientEvent("pNotify:SendNotification", -1, {text = 'You have deposited $' .. amount .. '', type = "success", queue = "lmao", timeout = 1000, layout = "centerLeft"})
	end
end)


RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
        TriggerClientEvent("pNotify:SendNotification", -1, {text = "Invalid amount.", type = "error", queue = "lmao", timeout = 1000, layout = "centerLeft"})
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
        TriggerClientEvent("pNotify:SendNotification", -1, {text = 'You have withdrawn $' .. amount .. '', type = "success", queue = "lmao", timeout = 1000, layout = "centerLeft"})
	end
end)

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('currentbalance1', _source, balance)
	
end)


RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(to)
	local balance = 0
	balance = xPlayer.getAccount('bank').money
	zbalance = zPlayer.getAccount('bank').money
	
	if tonumber(_source) == tonumber(to) then
		TriggerClientEvent("pNotify:SendNotification", -1, {text = "You cannot transfer funds to yourself.", type = "error", queue = "lmao", timeout = 1000, layout = "centerLeft"})
	else
		if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
			TriggerClientEvent("pNotify:SendNotification", -1, {text = "Invalid amount.", type = "error", queue = "lmao", timeout = 1000, layout = "centerLeft"})
		else
			xPlayer.removeAccountMoney('bank', amountt)
			zPlayer.addAccountMoney('bank', amountt)
            TriggerClientEvent("pNotify:SendNotification", -1, {text = 'You have transfered ~r~$' .. amountt .. '~s~ to ~r~' .. to .. ' .', type = "success", queue = "lmao", timeout = 1000, layout = "centerLeft"})
			TriggerClientEvent("pNotify:SendNotification", -1, {text = 'You have received: ~r~$' .. amountt .. '~s~ From ~r~' .. _source .. ' .', type = "success", queue = "lmao", timeout = 1000, layout = "centerLeft"})
		end
		
	end
end)





