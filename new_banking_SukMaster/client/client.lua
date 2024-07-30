ESX                         = nil
inMenu                      = true
local showblips = true
local atbank = false
local bankMenu = true
local banks = {
	{name="Bank", id=108, x=150.266, y=-1040.203, z=29.374},
	{name="Bank", id=108, x=-1212.980, y=-330.841, z=37.787},
	{name="Bank", id=108, x=-2962.582, y=482.627, z=15.703},
	{name="Bank", id=108, x=-112.202, y=6469.295, z=31.626},
	{name="Bank", id=108, x=314.187, y=-278.621, z=54.170},
	{name="Bank", id=108, x=-351.534, y=-49.529, z=49.042},
	{name="Bank", id=108, x=237.39, y=217.81, z=106.29},
	{name="Bank", id=106, x=241.610, y=225.120, z=106.286},
	{name="Bank", id=108, x=1175.064, y=2706.643, z=38.094},
	{name="Bank", id=108, x=1175.0643310547, y=2706.6435546875, z=38.094036102295}
}
local atms = {
  -1364697528, --red
  -1126237515, --blue
  -870868698, --blue
  506770882, --green
  150237004, --green
  -239124254, --green
}

--================================================================================================
--==                                THREADING - DO NOT EDIT                                     ==
--================================================================================================

--===============================================
--==           Base ESX Threading              ==
--===============================================
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
--===============================================
--==             Core Threading                ==
--===============================================
RegisterNetEvent('new_banking:openmenuatm')
AddEventHandler('new_banking:openmenuatm',function()
  inMenu = true
  SetNuiFocus(true, true)
  SendNUIMessage({type = 'openGeneral'})
  TriggerServerEvent('bank:balance')
  local player = GetPlayerPed(-1)
  loadAnimDict( "amb@prop_human_atm@male@idle_a" )
  TaskPlayAnim( player, "amb@prop_human_atm@male@idle_a", "idle_b", 1.0, 1.0, -1, 49, 0, 0, 0, 0 )
  Citizen.Wait(5000)
  ClearPedTasks(GetPlayerPed(-1))
end)

exports['qtarget']:AddTargetModel(atms, {
    options = {
        {
            event = "new_banking:openmenuatm",
            icon = "fas fa-money-check",
            label = "Buka ATM",
        },
    },
    distance = 2.5
})


RegisterNetEvent('new_banking:openmenubank')
AddEventHandler('new_banking:openmenubank',function()
  inMenu = true
  SetNuiFocus(true, true)
  SendNUIMessage({type = 'openGeneral'})
  TriggerServerEvent('bank:balance')
  local player = GetPlayerPed(-1)
end)

exports['qtarget']:AddBoxZone("Bank1", vector3(149.07, -1041.16, 28.54), 1.5, 4.5, {
	name = "Bank1",
	heading = 160,
	debugPoly = false,
	minZ = 28,
	maxZ = 30.5,
	}, {
		options = {
			{
        event = "new_banking:openmenubank",
				icon = "fas fa-piggy-bank",
				label = "Bankmenu",
			},
		},
		distance = 2.5
})

exports['qtarget']:AddBoxZone("Bank2", vector3(-1212.98, -331.53, 37.24), 1.5, 4.5, {
	name = "Bank2",
	heading = 206,
	debugPoly = false,
	minZ = 37,
	maxZ = 39,
	}, {
		options = {
			{
        event = "new_banking:openmenubank",
				icon = "fas fa-piggy-bank",
				label = "Bankmenu",
			},
		},
		distance = 2.5
})

exports['qtarget']:AddBoxZone("Bank3", vector3(-2962.16, 482.17, 14.7), 1.5, 4.5, {
	name = "Bank3",
	heading = 269,
	debugPoly = false,
	minZ = 15,
	maxZ = 18,
	}, {
		options = {
			{
        event = "new_banking:openmenubank",
				icon = "fas fa-piggy-bank",
				label = "Bankmenu",
			},
		},
		distance = 2.5
})

exports['qtarget']:AddBoxZone("Bank4", vector3(-112.29, 6469.38, 30.63), 1.5, 4.5, {
	name = "Bank4",
	heading = 316,
	debugPoly = false,
	minZ = 31,
	maxZ = 33,
	}, {
		options = {
			{
        event = "new_banking:openmenubank",
				icon = "fas fa-piggy-bank",
				label = "Bankmenu",
			},
		},
		distance = 2.5
})

exports['qtarget']:AddBoxZone("Bank5", vector3(313.56, -279.7, 53.8), 1.5, 4.5, {
	name = "Bank5",
	heading = 160,
	debugPoly = false,
	minZ = 53,
	maxZ = 55,
	}, {
		options = {
			{
        event = "new_banking:openmenubank",
				icon = "fas fa-piggy-bank",
				label = "Bankmenu",
			},
		},
		distance = 2.5
})

exports['qtarget']:AddBoxZone("Bank6", vector3(-351.51, -49.8, 48.04), 1.5, 4.5, {
	name = "Bank6",
	heading = 160,
	debugPoly = false,
	minZ = 49,
	maxZ = 50,
	}, {
		options = {
			{
        event = "new_banking:openmenubank",
				icon = "fas fa-piggy-bank",
				label = "Bankmenu",
			},
		},
		distance = 2.5
})

exports['qtarget']:AddBoxZone("Bank7", vector3(1175.92, 2707.86, 37.09), 1.5, 4.5, {
	name = "Bank7",
	heading = 359.73,
	debugPoly = false,
	minZ = 37,
	maxZ = 39,
	}, {
		options = {
			{
        event = "new_banking:openmenubank",
				icon = "fas fa-piggy-bank",
				label = "Bankmenu",
			},
		},
		distance = 2.5
})

exports['qtarget']:AddBoxZone("BigBank", vector3(242.41, 225.03, 105.29), 1.5, 4.5, {
	name = "BigBank",
	heading = 342.44,
	debugPoly = false,
	minZ = 105,
	maxZ = 108,
	}, {
		options = {
			{
        event = "new_banking:openmenubank",
				icon = "fas fa-piggy-bank",
				label = "Bankmenu",
			},
		},
		distance = 2.5
})
--===============================================
--==             Map Blips	                   ==
--===============================================
Citizen.CreateThread(function()
	if showblips then
	  for k,v in ipairs(banks)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, v.id)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 2)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(tostring(v.name))
		EndTextCommandSetBlipName(blip)
	  end
	end
end)


--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNetEvent('currentbalance1')
AddEventHandler('currentbalance1', function(balance)
	local id = PlayerId()
	local playerName = GetPlayerName(id)

	SendNUIMessage({
		type = "balanceHUD",
		balance = balance,
		player = playerName
		})
end)
--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNUICallback('deposit', function(data)
  CloseGaes()
  TriggerEvent("mythic_progbar:client:progress", {
    name = "wdbank",
    duration = 1000,
    label = 'Menyimpan Uang',
    useWhileDead = false,
    canCancel = false,
    controlDisables = {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    },
    animation = {
      animDict = "mp_common",
      anim = "givetake1_a",
      flags = 49,
    }
  }, function(status)
    if not status then
    end
  end)
	TriggerServerEvent('bank:deposit', tonumber(data.amount))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==          Withdraw Event                   ==
--===============================================
RegisterNUICallback('withdrawl', function(data)
  CloseGaes()
  TriggerEvent("mythic_progbar:client:progress", {
    name = "wdbank",
    duration = 1000,
    label = 'Mengambil Uang',
    useWhileDead = false,
    canCancel = false,
    controlDisables = {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    },
    animation = {
      animDict = "mp_common",
      anim = "givetake1_a",
      flags = 49,
    }
  }, function(status)
    if not status then
    end
  end)
  TriggerServerEvent('bank:withdraw', tonumber(data.amountw))
  TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Balance Event                     ==
--===============================================
RegisterNUICallback('balance', function()
	TriggerServerEvent('bank:balance')
end)

RegisterNetEvent('balance:back')
AddEventHandler('balance:back', function(balance)
	SendNUIMessage({type = 'balanceReturn', bal = balance})
end)


--===============================================
--==         Transfer Event                    ==
--===============================================
RegisterNUICallback('transfer', function(data)
	TriggerServerEvent('bank:transfer', data.to, data.amountt)
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Result   Event                    ==
--===============================================
RegisterNetEvent('bank:result')
AddEventHandler('bank:result', function(type, message)
	SendNUIMessage({type = 'result', m = message, t = type})
end)

--===============================================
--==               NUIFocusoff                 ==
--===============================================
RegisterNUICallback('NUIFocusOff', function()
  inMenu = false
  SetNuiFocus(false, false)
  SendNUIMessage({type = 'closeAll'})
end)

function CloseGaes()
  inMenu = false
  SetNuiFocus(false, false)
  SendNUIMessage({type = 'closeAll'})
end


--===============================================
--==            Capture Bank Distance          ==
--===============================================
function nearBank()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(banks) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

		if distance <= 3 then
			return true
		end
	end
end

function nearATM()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(atms) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

		if distance <= 0.75 then
			return true
		end
	end
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

