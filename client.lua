ESX = nil
local inVehicle = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end	
	-- Updates the UI on start
	NetworkSetTalkerProximity(10.0)
end)

Citizen.CreateThread(function()
	while true do
		Wait(1)	
		kmhMode = true
		playerPed = GetPlayerPed(-1)
		if playerPed then
			playerCar = GetVehiclePedIsIn(playerPed, false)
			if playerCar and GetPedInVehicleSeat(playerCar, -1) == playerPed then
				carSpeed = GetEntitySpeed(playerCar)
					speed = math.ceil(carSpeed * 3.6)
					prefix = "KM/H"
				SendNUIMessage({
					showhud = true,
					speed = speed,
					prefix = prefix
				})
				SendNUIMessage({action = "toggleCar", show = true})
			else
				SendNUIMessage({hidehud = true})
				SendNUIMessage({action = "toggleCar", show = false})
			end
		end
	end
end)

RegisterNetEvent('ui:toggle')
AddEventHandler('ui:toggle', function(show)
SendNUIMessage({action = "toggle", show = show})
end)
RegisterNetEvent('esx_carui:lock')
AddEventHandler('esx_customui:lock', function(lock)
	SendNUIMessage({action = "updateLock", lock = lock})
end)
RegisterNetEvent('esx_carui:vd')
AddEventHandler('esx_carui:vd', function(damage)
	SendNUIMessage({action = "updateVD", damage = damage})
end)
RegisterNetEvent('esx_carui:belts')
AddEventHandler('esx_carui:belst', function(belt)
	SendNUIMessage({action = "updateBelst", belt = belt})
end)