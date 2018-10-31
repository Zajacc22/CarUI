# FiveM_CarUI
FiveM CarUI is a public released UI to improve the UI for the ESX Framework. You may edit & change the UI to your liking.

CarUI was based on esx_customui and speedometer code. 

# Screenshot preview
![screenshot](https://cdn.discordapp.com/attachments/506939695465365517/506942879944671272/unknown.png)

# Requirements
* [es_extended](https://github.com/ESX-Org/es_extended)
* [locksystem](https://github.com/acecconato/FiveM_LockSystem)
* [wk_vehdamage](https://forum.fivem.net/t/release-rp-vehicle-damage-system-1-0-1/39563)
* any seatbelts script

# Download & Installation
1) Download the .zip.
2) Extract the .zip or Open the .zip.
3) Place `carui` in your ESX Directory
4) Add `start carui` to your server.cfg

How to make icons work

[LOCK]

locksystem\client\VehicleManager_CL.lua

```
rTable.lock = function()
	lockStatus = self.lockStatus
	if(lockStatus <= 2)then
		self.lockStatus = 4
		SetVehicleDoorsLocked(self.id, self.lockStatus)
		SetVehicleDoorsLockedForAllPlayers(self.id, 1)
		TriggerEvent("esx_customui:lock", self.lockStatus)
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "lock", 1.0)
	elseif(lockStatus > 2)then
		self.lockStatus = 1
		SetVehicleDoorsLocked(self.id, self.lockStatus)
		SetVehicleDoorsLockedForAllPlayers(self.id, false)
		TriggerEvent("esx_customui:lock", self.lockStatus)
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "unlock", 1.0)
	end
end
```

[BELTS]

in belts script\client.lua

```
if beltOn then 
    Wait(0)
	local belt = 1
	TriggerEvent('esx_carui:belts', belt)
else
    Wait(0)
	local belt = 0
	TriggerEvent('esx_carui:belts', belt)
	end 
end
```

[ENGINE]

resources\wk_vehdamage\cl_vehicle.lua
```		
if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
    local damage = GetVehicleEngineHealth( vehicle )
	TriggerEvent('esx_carui:vd', damage)
	if ( damage < levelOfDamageToKillThisBitch and IsValidVehicle( vehicle ) ) then 
        SetVehicleEngineHealth( vehicle, 300 )
        SetVehicleEngineOn( vehicle, false, true )
```
	
My Discord: Zajacc22#7732

