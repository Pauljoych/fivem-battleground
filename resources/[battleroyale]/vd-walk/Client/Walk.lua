local curentWalkCok
local crouched           = false

function WalkMenuStart(name)
  RequestWalking(name)
  SetPedMovementClipset(PlayerPedId(), name, 0.2)
  curentWalkCok = name
  RemoveAnimSet(name)
end

function RequestWalking(set)
  RequestAnimSet(set)
  while not HasAnimSetLoaded(set) do
    Citizen.Wait(1)
  end 
end

function WalksOnCommand(source, args, raw)
  local WalksCommand = ""
  for a in pairsByKeys(DP.Walks) do
    WalksCommand = WalksCommand .. ""..string.lower(a)..", "
  end
  EmoteChatMessage(WalksCommand)
  EmoteChatMessage("To reset do /walk reset")
end

function WalkCommandStart(source, args, raw)
  local name = firstToUpper(args[1])

  if name == "Reset" then
      ResetPedMovementClipset(PlayerPedId()) return
  end

  local name2 = table.unpack(DP.Walks[name])
  if name2 ~= nil then
    WalkMenuStart(name2)
  else
    EmoteChatMessage("'"..name.."' is not a valid walk")
  end
end

CreateThread(function()
    while true do 
        Wait(5)
        local ped = PlayerPedId()
        if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
            DisableControlAction( 0, 36, true ) -- INPUT_DUCK 
            if ( not IsPauseMenuActive() ) then 
                if (IsDisabledControlJustPressed(0, 36)) then 
                    RequestAnimSet("move_ped_crouched")
                    while (not HasAnimSetLoaded("move_ped_crouched")) do 
                        Wait(100)
                    end
                    if (crouched == true) then 
                        if curentWalkCok then 
                            ResetPedMovementClipset(ped, 0.25)
                            RequestAnimSet(curentWalkCok)
                            while not HasAnimSetLoaded(curentWalkCok) do
                                Wait(100)
                            end
                            SetPedMovementClipset(ped, curentWalkCok, 0.2)
                        else
                            ResetPedMovementClipset(ped, 0.25)
                        end
                        crouched = false 
                    elseif (crouched == false) then
                        SetPedMovementClipset(ped, "move_ped_crouched", 0.35)
                        crouched = true 
                    end 
                end
            end 
        end
    end
end)