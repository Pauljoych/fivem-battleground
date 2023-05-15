local delay = Vidi.delay * 60000

RegisterCommand('cds', function()
    print('pistol50         : ',GetWeaponDamage(0x99AEEB3B,0xD9D3AC92))
    print('pythonmg         : ',GetWeaponDamage(0xCB96392F,0xBA23D8BE))
    print('doubleaction     : ',GetWeaponDamage(0x97EA20B8,0xBA23D8BE))
end)

local playerid = GetPlayerServerId(PlayerId())
local component = nil
local Default = " Default Clip"
local Extended = " Extended Clip"
local Drum = " Drum Clip"

CreateThread(function()
    Wait(delay)
    while true do
        Wait(100)
                if (Vidi.doubleaction < GetWeaponDamage(0x97EA20B8,0xBA23D8BE)) then
                    component = GetWeaponDamage(0x97EA20B8,0xBA23D8BE)
                    if Vidi.kick then
                        TriggerServerEvent('logdamage',playerid," Double Action",Default, component,Vidi.doubleaction)
                        TriggerServerEvent('kickdamage')
                    elseif not Vidi.kick then
                        TriggerServerEvent('logdamage',playerid," Double Action",Default, component,Vidi.doubleaction)
                    end
                end
                if (Vidi.pistol50 < GetWeaponDamage(0x99AEEB3B,0xD9D3AC92)) then
                    component = GetWeaponDamage(0x99AEEB3B,0xD9D3AC92)
                    if Vidi.kick then
                        TriggerServerEvent('logdamage',playerid," Pistol50",Default, component,Vidi.pistol50)
                        TriggerServerEvent('kickdamage')
                    elseif not Vidi.kick then
                        TriggerServerEvent('logdamage',playerid," Pistol50",Default, component,Vidi.pistol50)
                    end
                end
                if (Vidi.pythonmagnum < GetWeaponDamage(0xCB96392F,0xBA23D8BE)) then
                    component = GetWeaponDamage(0xCB96392F,0xBA23D8BE)
                    if Vidi.kick then
                        TriggerServerEvent('logdamage',playerid," Python Magnum",Default,component,Vidi.pythonmagnum)
                        TriggerServerEvent('kickdamage')
                    elseif not Vidi.kick then
                        TriggerServerEvent('logdamage',playerid," Python Magnum",Default,component,Vidi.pythonmagnum)
                    end
                end

                if not Vidi.kick then
                    break;
                end

        end
end)

CreateThread(function()


    while Vidi.Ammo do
        Citizen.Wait(100)
        if(9 < GetWeaponComponentClipSize(0x2297BE19)) then
            ammoc = GetWeaponComponentClipSize(0x2297BE19)
            if Vidi.kick then
                TriggerServerEvent('logammo',playerid," PISTOL50",Default,"9",ammoc)
                TriggerServerEvent('kickdamage')
            elseif not Vidi.kick then
                TriggerServerEvent('logammo',playerid," PISTOL50",Default,"9",ammoc)
            end
        end
        if(12 < GetWeaponComponentClipSize(0xD9D3AC92)) then
            ammoc = GetWeaponComponentClipSize(0xD9D3AC92)
            if Vidi.kick then
                TriggerServerEvent('logammo',playerid," PISTOL50",Extended,"12",ammoc)
                TriggerServerEvent('kickdamage')
            elseif not Vidi.kick then
                TriggerServerEvent('logammo',playerid," PISTOL50",Extended,"12",ammoc)
            end
        end
        if(12 < GetWeaponComponentClipSize(0xFED0FD71)) then
            ammoc = GetWeaponComponentClipSize(0xFED0FD71)
            if Vidi.kick then
                TriggerServerEvent('logammo',playerid," PISTOL",Default,"12",ammoc)
                TriggerServerEvent('kickdamage')
            elseif not Vidi.kick then
                TriggerServerEvent('logammo',playerid," PISTOL",Default,"12",ammoc)
            end
        end
        if(16 < GetWeaponComponentClipSize(0xED265A1C)) then
            ammoc = GetWeaponComponentClipSize(0xED265A1C)
            if Vidi.kick then
                TriggerServerEvent('logammo',playerid," PISTOL",Extended,"16",ammoc)
                TriggerServerEvent('kickdamage')
            elseif not Vidi.kick then
                TriggerServerEvent('logammo',playerid," PISTOL",Extended,"16",ammoc)
            end
        end
        if(12 < GetWeaponComponentClipSize(0x94F42D62)) then
            ammoc = GetWeaponComponentClipSize(0x94F42D62)
            if Vidi.kick then
                TriggerServerEvent('logammo',playerid," PISTOL MK2",Default,"12",ammoc)
                TriggerServerEvent('kickdamage')
            elseif not Vidi.kick then
                TriggerServerEvent('logammo',playerid," PISTOL MK2",Default,"12",ammoc)
            end
        end
        -- print(GetWeaponComponentReticuleHash(0x7C8BD10E))
        if(6 < GetWeaponComponentClipSize(0xE9867CE3)) then

            ammoc = GetWeaponComponentClipSize(0xE9867CE3)
            if Vidi.kick then
                TriggerServerEvent('logammo',playerid," Heavy Revolver",Default,"6",ammoc)
                TriggerServerEvent('kickdamage')
            elseif not Vidi.kick then
                TriggerServerEvent('logammo',playerid," Heavy Revolver",Default,"6",ammoc)
            end
        end

        break
    end
end)