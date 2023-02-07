useKeys = function(plate)
  local playerCoords = GetEntityCoords(cache.ped)

  local closestVehicle = cache.vehicle or GetClosestVehicle(playerCoords.x, playerCoords.y, playerCoords.z, 7.5, 0, 71)

  if DoesEntityExist(closestVehicle) and not Entity(closestVehicle).state.zamek then 
      local vehiclePlate = GetVehicleNumberPlateText(closestVehicle)

      if vehiclePlate == plate then 
          Entity(closestVehicle).state.zamek = true -- do cooldownu

          local lockState = GetVehicleDoorsLockedForPlayer(closestVehicle, cache.playerId)

          local dict, anim = 'anim@mp_player_intmenu@key_fob@', 'fob_click'

          if lockState then 
              text = 'Otwarto pojazd'
          else 
              text = 'Zamknięto pojazd'
          end 

          if closestVehicle ~= cache.vehicle then 
              lib.requestAnimDict(dict)

              TaskPlayAnim(cache.ped, dict, anim, 8.0, 8.0, -1, 48, 1)
          end 

          local vehicleCoords = GetEntityCoords(closestVehicle)
          
          flashVehLights(closestVehicle, not lockState)
          
          SetVehicleAlarmTimeLeft(closestVehicle, 0)
          SetVehicleAlarm(closestVehicle, false)

          local doorLockStatus = 0

          if not lockState then 
              doorLockStatus = 2
          else 
              doorLockStatus = 0
          end 

          SetVehicleDoorsLocked(closestVehicle, doorLockStatus)

          SetVehicleDoorsLockedForAllPlayers(closestVehicle, not lockState)
          
          lib.notify({
              description = text
          })

          Entity(closestVehicle).state.zamek = false
      end 
  end 
end

flashVehLights = function(vehicle, state)
  if vehicle ~= cache.vehicle then -- tylko poza autem
      Citizen.Wait(200)
      SetVehicleLights(vehicle, 2)

      if state then 
          PlaySoundFromEntity(-1, 'Remote_Control_Close', vehicle, 'PI_Menu_Sounds', 1, 0)
      else
          PlaySoundFromEntity(-1, 'Remote_Control_Open', vehicle, 'PI_Menu_Sounds', 1, 0)
      end 

      Citizen.Wait(100)
      SetVehicleLights(vehicle, 0)

      Citizen.Wait(200)
      SetVehicleLights(vehicle, 2)

      if state then 
          PlayVehicleDoorCloseSound(vehicle, 0)
      else
          PlayVehicleDoorOpenSound(vehicle, 0)
      end 

      Citizen.Wait(100)
      SetVehicleLights(vehicle, 0)
  end 
end 
