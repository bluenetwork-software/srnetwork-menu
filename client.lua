ESX = nil
Citizen.CreateThread(function()
    while true do
        Wait(5)
        if ESX ~= nil then
       
        else
            ESX = nil
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        end
    end
end)

exports('AddButton', function(title , description , trigger , par , id)
    if(id == nil) then id = false end
    SetNuiFocus(true , true)
    SendNUIMessage({addbutton = true , title = title , description = description , trigger = trigger , par = par , id = id })
end)

exports('SubMenu', function(title , description , menuid)
    SetNuiFocus(true , true)
    SendNUIMessage({addmenu = true , title = title , description = description , menuid = menuid })
end)

exports('SetTitle', function(title)
    SendNUIMessage({SetTitle = true , title = title})
end)

local sound = Config.Sound
local soundName = Config.SoundName 
local enablesound = Config.EnableSound 

RegisterNUICallback("clicked" , function(data , cb)
    local trigger = data.trigger
    local d = data.server
    local d = data.server 
    TriggerServerEvent(trigger ,data.param)
    TriggerEvent(trigger , data.param)
    if(enablesound == true) then
        PlaySoundFrontend(-1, soundName,sound, 1)
    end
end)
RegisterNUICallback("close" , function(data , cb)
    SetNuiFocus(false , false)
    if(enablesound == true) then
        PlaySoundFrontend(-1, 'Highlight_Cancel','DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
    end
    
end)


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Kimlik KISMI Başlangıç --

RegisterNetEvent('idcard:gor')
AddEventHandler('idcard:gor', function()
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
end)

RegisterNetEvent('idcard:goster')
AddEventHandler('idcard:goster', function()
    local player, distance = ESX.Game.GetClosestPlayer()

    if distance ~= -1 and distance <= 3.0 then
      TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
    else
    exports['mythic_notify']:SendAlert('inform', 'Yakında birisi yok', 2500)
    end
end)

RegisterNetEvent('idcard:ehliyetgor')
AddEventHandler('idcard:ehliyetgor', function()
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
end)

RegisterNetEvent('idcard:ehliyetgoster')
AddEventHandler('idcard:ehliyetgoster', function()
    local player, distance = ESX.Game.GetClosestPlayer()

    if distance ~= -1 and distance <= 3.0 then
      TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
    else
        exports['mythic_notify']:SendAlert('inform', 'Yakında birisi yok', 2500)
    end
end)

RegisterNetEvent('idcard:ruhsatgor')
AddEventHandler('idcard:ruhsatgor', function()
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'license')
end)

RegisterNetEvent('idcard:ruhsatgoster')
AddEventHandler('idcard:ruhsatgoster', function()
    local player, distance = ESX.Game.GetClosestPlayer()

    if distance ~= -1 and distance <= 3.0 then
      TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'license')
    else
        exports['mythic_notify']:SendAlert('inform', 'Yakında birisi yok', 2500)
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Kimlik KISMI BİTİŞ --


-- Animasyon iptali
RegisterNetEvent('animasyon:iptal')
AddEventHandler('animasyon:iptal', function()
    ClearPedTasks(PlayerPedId())
    TriggerEvent('fishing:break')
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- BLİP KISMI Başlangıç --

RegisterNetEvent("lexia:togglegas")
AddEventHandler("lexia:togglegas", function()
   -- DeleteWaypoint()

    local currentGasBlip = 0

	local coords = GetEntityCoords(PlayerPedId())
	local closest = 1000
	local closestCoords

	for k,v in pairs(GasStations) do
		local dstcheck = GetDistanceBetweenCoords(coords, v)

		if dstcheck < closest then
			closest = dstcheck
            closestCoords = v
        end
    end

    SetNewWaypoint(closestCoords)
    exports["mythic_notify"]:SendAlert("inform", "En yakın benzinci GPS'de işaretlendi.", 3500)

end)

RegisterNetEvent("lexia:togglebarber")
AddEventHandler("lexia:togglebarber", function()
   -- DeleteWaypoint()
	local currentGasBlip = 0
	local coords = GetEntityCoords(PlayerPedId())
	local closest = 1000
	local closestCoords1

	for k,v in pairs(BarberShops) do
		local dstcheck = GetDistanceBetweenCoords(coords, v)

		if dstcheck < closest then
			closest = dstcheck
			closestCoords1 = v
		end
    end
    
    SetNewWaypoint(closestCoords1)
    exports["mythic_notify"]:SendAlert("inform", "En yakın berber GPS'de işaretlendi.", 3500)
end)

RegisterNetEvent("lexia:toggletattos")
AddEventHandler("lexia:toggletattos", function()
   -- DeleteWaypoint()
	local currentGasBlip = 0
	local coords = GetEntityCoords(PlayerPedId())
	local closest = 1000
	local closestCoords2

	for k,v in pairs(TattoShops) do
		local dstcheck = GetDistanceBetweenCoords(coords, v)

		if dstcheck < closest then
			closest = dstcheck
			closestCoords2 = v
		end
    end
    
    SetNewWaypoint(closestCoords2)
    exports["mythic_notify"]:SendAlert("inform", "En yakın dövmeci  GPS'de işaretlendi.", 3500)
end)

RegisterNetEvent("lexia:toggleclothes")
AddEventHandler("lexia:toggleclothes", function()
   -- DeleteWaypoint()
	local currentGasBlip = 0
	local coords = GetEntityCoords(PlayerPedId())
	local closest = 1000
	local closestCoords2

	for k,v in pairs(ClotheShop) do
		local dstcheck = GetDistanceBetweenCoords(coords, v)

		if dstcheck < closest then
			closest = dstcheck
			closestCoords2 = v
		end
    end
    
    SetNewWaypoint(closestCoords2)
    exports["mythic_notify"]:SendAlert("inform", "En yakın kıyafet dükkanı  GPS'de işaretlendi.", 3500)
end)

RegisterNetEvent("lexia:togglebank")
AddEventHandler("lexia:togglebank", function()
   -- DeleteWaypoint()
	local currentGasBlip = 0
	local coords = GetEntityCoords(PlayerPedId())
	local closest = 1000
	local closestCoords2

	for k,v in pairs(Bank) do
		local dstcheck = GetDistanceBetweenCoords(coords, v)

		if dstcheck < closest then
			closest = dstcheck
			closestCoords2 = v
		end
    end
    
    SetNewWaypoint(closestCoords2)
    exports["mythic_notify"]:SendAlert("inform", "En yakın banka GPS'de işaretlendi.", 3500)
end)

RegisterNetEvent("lexia:togglegarage")
AddEventHandler("lexia:togglegarage", function()
   -- DeleteWaypoint()
	local currentGasBlip = 0
	local coords = GetEntityCoords(PlayerPedId())
	local closest = 1000
	local closestCoords2

	for k,v in pairs(Garage) do
		local dstcheck = GetDistanceBetweenCoords(coords, v)

		if dstcheck < closest then
			closest = dstcheck
			closestCoords2 = v
		end
    end
    
    SetNewWaypoint(closestCoords2)
    exports["mythic_notify"]:SendAlert("inform", "En yakın market  GPS'de işaretlendi.", 3500)
end)

RegisterNetEvent("lexia:togglemarket")
AddEventHandler("lexia:togglemarket", function()
   -- DeleteWaypoint()
	local currentGasBlip = 0
	local coords = GetEntityCoords(PlayerPedId())
	local closest = 1000
	local closestCoords2

	for k,v in pairs(Shops) do
		local dstcheck = GetDistanceBetweenCoords(coords, v)

		if dstcheck < closest then
			closest = dstcheck
			closestCoords2 = v
		end
    end
    
    SetNewWaypoint(closestCoords2)
    exports["mythic_notify"]:SendAlert("inform", "En yakın market  GPS'de işaretlendi.", 3500)
end)

Garage = { 
vector3(223.48, -761.68, 30.82),
vector3(1737.59, 3710.2, 34.14),
vector3(733.62, -71.04,  41.75),
vector3(1852.75, 2578.97, 45.67 ),
vector3(1212.32, 339.94, 81.99),
vector3(282.01, 68.41, 94.37),
vector3(273.35, -343.33,  44.92),
vector3(-1594.85, -873.94, 9.94),
vector3(45.84, -1732.4, 29.3),
vector3(361.12, -1690.49, 32.53 ),
vector3(421.99, -1326.06, 46.05 ),
vector3(-569.87, 316.27, 84.46),
vector3(-1977.68, -291.78, 44.11), 
vector3(-693.9, -738.11, 29.36)
}

Bank = {     
	vector3(241.727, 220.706, 106.286), -- blip id, blip color, x, y, z, scale, name/label
	vector3(150.266, -1040.203, 29.374),
	vector3(-1212.980, -330.841, 37.787),
	vector3(-2962.582, 482.627, 15.703),
	vector3(-112.202, 6469.295, 31.626),
	vector3(314.187, -278.621, 54.170),
	vector3(-351.534, -49.529, 49.042),
	vector3(1175.0643310547, 2706.6435546875, 38.094036102295)
}

Shops = {     
	vector3( -48.37, -1757.93, 29.42),
	vector3(25.74672, -1347.16, 29.497),
	vector3(-1222.26, -906.86, 12.33),
	vector3(-1487.62, -378.60, 40.16),
	vector3(-707.31, -914.66, 19.22),
	vector3(1135.7, -982.79, 46.42),
	vector3(373.55, 325.52, 103.57),
	vector3(1163.67, -323.92,69.21),
	vector3(2557.44, 382.03, 108.62),
	vector3(-3039.16, 585.71, 7.91),
	vector3(-3242.11, 1001.20, 12.83),
	vector3(-2967.78, 391.49, 15.04),
	vector3(-1820.38, 792.69, 138.11),
	vector3(547.75, 2671.53, 42.16),
	vector3(1165.36, 2709.45, 38.16),
	vector3(2678.82, 3280.36, 55.24),
	vector3(1961.17, 3740.5, 32.34),
	vector3(1393.13, 3605.2, 34.98),
	vector3(1697.92, 4924.46, 42.06)
}

ClotheShop = {
	vector3(72.3, -1399.1, 29.4),
	vector3(-703.8, -152.3, 37.4),
	vector3(-167.9, -299.0, 39.7),
	vector3(428.7, -800.1, 29.5),
	vector3(-829.4, -1073.7, 11.3),
	vector3(-1447.8, -242.5, 49.8),
	vector3(11.6, 6514.2, 31.9),
	vector3(123.6, -219.4, 54.6),
	vector3(1696.3, 4829.3, 42.1),
	vector3(618.1, 2759.6, 42.1),
	vector3(1190.6, 2713.4, 38.2),
	vector3(-1193.4, -772.3, 17.3),
	vector3(-3172.5, 1048.1, 20.9),
	vector3(-1108.4, 2708.9, 19.1)
}

TattoShops = {
	vector3(1322.6, -1651.9, 51.2),
	vector3(-1153.6, -1425.6, 3.9),
	vector3(322.1, 180.4, 102.5),
	vector3(-3170.0, 1075.0, 19.8),
	vector3(1864.6, 3747.7, 32.0),
	vector3(-293.7, 6200.0, 30.4)
}

BarberShops = {
	vector3(-814.3, -183.8, 37.6),
	vector3(136.8, -1708.4, 29.3),
	vector3(-1282.6, -1116.8, 7.0),
	vector3(1931.5, 3729.7, 32.8),
	vector3(1212.8, -472.9, 66.2),
	vector3(-32.9, -152.3, 57.1),
	vector3(-278.1, 6228.5, 31.7)
}

GasStations = {
	vector3(49.4187, 2778.793, 58.043),
	vector3(263.894, 2606.463, 44.983),
	vector3(1039.958, 2671.134, 39.550),
	vector3(1207.260, 2660.175, 37.899),
	vector3(2539.685, 2594.192, 37.944),
	vector3(2679.858, 3263.946, 55.240),
	vector3(2005.055, 3773.887, 32.403),
	vector3(1687.156, 4929.392, 42.078),
	vector3(1701.314, 6416.028, 32.763),
	vector3(179.857, 6602.839, 31.868),
	vector3(-94.4619, 6419.594, 31.489),
	vector3(-2554.996, 2334.40, 33.078),
	vector3(-1800.375, 803.661, 138.651),
	vector3(-1437.622, -276.747, 46.207),
	vector3(-2096.243, -320.286, 13.168),
	vector3(-724.619, -935.1631, 19.213),
	vector3(-526.019, -1211.003, 18.184),
	vector3(-70.2148, -1761.792, 29.534),
	vector3(265.648, -1261.309, 29.292),
	vector3(819.653, -1028.846, 26.403),
	vector3(1208.951, -1402.567,35.224),
	vector3(1181.381, -330.847, 69.316),
	vector3(620.843, 269.100, 103.089),
	vector3(2581.321, 362.039, 108.468),
	vector3(176.631, -1562.025, 29.263),
	vector3(176.631, -1562.025, 29.263),
	vector3(-319.292, -1471.715, 30.549),
	vector3(1784.324, 3330.55, 41.253)
}
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- BLİP Kısmı BİTİŞ --





--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- PROP KISMI BAŞLANGIÇ --
local dropkey = 161 -- change this number based on the key you want to use to drop the item 
local carry = false
function GlobalObject(object)
    NetworkRegisterEntityAsNetworked(object)
    local netid = ObjToNet(object)
    SetNetworkIdExistsOnAllMachines(netid, true)
    NetworkSetNetworkIdDynamic(netid, true)
    SetNetworkIdCanMigrate(netid, false) 
    for i = 1, 255 do
        SetNetworkIdSyncToPlayer(netid, i, true)
    end
    print("New networked object: " .. netid)
end -- not needed anymore

attachedPropPerm = 0
function removeAttachedPropPerm()
    if DoesEntityExist(attachedPropPerm) then
        DeleteEntity(attachedPropPerm)
        attachedPropPerm = 0
    end
end

RegisterCommand("TVmic", function(source, args, raw)
    local arg = args[1]
    if arg ~= nil then
    TriggerEvent("XP:removeall")
    else
    TriggerEvent("attach:tvmic")
    end
end, false)
RegisterCommand("boombox", function(source, args, raw)
    local arg = args[1]
    if arg ~= nil then
    TriggerEvent("XP:removeall")
    else
    TriggerEvent("attach:boombox")
    end
end, false)

RegisterCommand("briefcase", function(source, args, raw)
    local arg = args[1]
    if arg ~= nil then
    TriggerEvent("XP:removeall")
    else
    TriggerEvent("attach:suitcase")
    end
end, false)

RegisterNetEvent('XP:DestroyProp')
AddEventHandler('XP:DestroyProp', function()
    removeAttachedPropPerm()
end)

RegisterNetEvent('prop:sil')
AddEventHandler('prop:sil', function()
    removeAttachedPropPerm()
    DeleteObject(attachedPropPerm)
    ClearPedTasks(GetPlayerPed(-1))
    exports['mythic_notify']:SendAlert('error', 'Prop silindi!')
end)


local APPbone = 0
local APPx = 0.0
local APPy = 0.0
local APPz = 0.0
local APPxR = 0.0
local APPyR = 0.0
local APPzR = 0.0

local holdingPackage = false

RegisterNetEvent('XP:attachProp')
AddEventHandler('XP:attachProp', function(attachModelSent,boneNumberSent,x,y,z,xR,yR,zR)
    --exports['mythic_notify']:DoHudText('inform', "Press 7 to drop or pickup the object. Do /RE to delete the prop") -- Add your own notification system here instead 
    removeAttachedPropPerm()
    holdingPackage = true
    attachModel = GetHashKey(attachModelSent)
    boneNumber = boneNumberSent
    SetCurrentPedWeapon(GetPlayerPed(-1), 0xA2719263) 
    local bone = GetPedBoneIndex(GetPlayerPed(-1), boneNumberSent)
    RequestModel(attachModel)
    while not HasModelLoaded(attachModel) do
        Citizen.Wait(100)
    end
    attachedPropPerm = CreateObject(attachModel, 1.0, 1.0, 1.0, 1, 1, 0)
    AttachEntityToEntity(attachedPropPerm, GetPlayerPed(-1), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)

    APPbone = bone
    APPx = x
    APPy = y
    APPz = z
    APPxR = xR
    APPyR = yR
    APPzR = zR
end)
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

function randPickupAnim()
  local randAnim = math.random(7)
    loadAnimDict('random@domestic')
    TaskPlayAnim(GetPlayerPed(-1),'random@domestic', 'pickup_low',5.0, 1.0, 1.0, 48, 0.0, 0, 0, 0)
end


-- Citizen.CreateThread( function()
--     while true do 
--         if attachedPropPerm ~= 0 then
--             Citizen.Wait(1)
--             if IsDisabledControlJustPressed(0, dropkey) or (GetHashKey("WEAPON_UNARMED") ~= GetSelectedPedWeapon(GetPlayerPed(-1)) and holdingPackage) then
--                 if not holdingPackage then
--                     local dst = GetDistanceBetweenCoords(GetEntityCoords(attachedPropPerm) ,GetEntityCoords(GetPlayerPed(-1)),true)                 
--                     if dst < 2 then
--                         holdingPackage = not holdingPackage
--                         randPickupAnim()
--                         Citizen.Wait(1000)
--                         PropCarryAnim()
--                         ClearPedTasks(GetPlayerPed(-1))
--                         ClearPedSecondaryTask(GetPlayerPed(-1))
--                         AttachEntityToEntity(attachedPropPerm, GetPlayerPed(-1), APPbone, APPx, APPy, APPz, APPxR, APPyR, APPzR, 1, 1, 0, 0, 2, 1)
--                     end
--                 else
--                     holdingPackage = not holdingPackage
--                     ClearPedTasks(GetPlayerPed(-1))
--                     ClearPedSecondaryTask(GetPlayerPed(-1))
--                     randPickupAnim()
--                     Citizen.Wait(500)
--                     DetachEntity(attachedPropPerm)
--                 end
--             end
--         else
--             Citizen.Wait(1)
--         end
--     end
-- end)

function PropCarryAnim()
    loadAnimDict( "anim@heists@box_carry@" )
    TaskPlayAnim((GetPlayerPed(-1)),"anim@heists@box_carry@","idle",4.0, 1.0, -1,49,0, 0, 0, 0)
-- add animations you want here for things like cameras 
end

attachedProp = 0
function removeAttachedProp()
    if DoesEntityExist(attachedProp) then
        DeleteEntity(attachedProp)
        attachedProp = 0
    end
end

RegisterNetEvent('XP:destroyProp')
AddEventHandler('XP:destroyProp', function()
    removeAttachedProp()
end)

--[[RegisterNetEvent('attachProp')
AddEventHandler('attachProp', function(attachModelSent,boneNumberSent,x,y,z,xR,yR,zR)
    removeAttachedProp()
    attachModel = GetHashKey(attachModelSent)
    boneNumber = boneNumberSent
    SetCurrentPedWeapon(GetPlayerPed(-1), 0xA2719263) 
    local bone = GetPedBoneIndex(GetPlayerPed(-1), boneNumberSent)
    RequestModel(attachModel)
    while not HasModelLoaded(attachModel) do
        Citizen.Wait(100)
    end
    attachedProp = CreateObject(attachModel, 1.0, 1.0, 1.0, 1, 1, 0)
    AttachEntityToEntity(attachedProp, GetPlayerPed(-1), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
end)]] 

attachedPropPhone = 0
function removeAttachedPropPhone()
    if DoesEntityExist(attachedPropPhone) then
        DeleteEntity(attachedPropPhone)
        attachedPropPhone = 0
    end
end

attachPropList = {

    ["pump"] = { 
        ["model"] = "prop_gas_pump_1d", ["bone"] = 28422, ["x"] = 0.18,["y"] = -0.3,["z"] = 0.50,["xR"] = 50.0,["yR"] = -100.0, ["zR"] = 0.0
    },

    ["barrier"] = { 
        ["model"] = "prop_barrier_work05", ["bone"] = 28422, ["x"] = 0.88,["y"] = -0.10,["z"] = -0.2,["xR"] = 135.0,["yR"] = -100.0, ["zR"] = 0.0 
    },

    ["cone"] = { 
        ["model"] = "prop_mp_cone_01", ["bone"] = 28422, ["x"] = 0.88,["y"] = -0.10,["z"] = -0.2,["xR"] = 135.0,["yR"] = -100.0, ["zR"] = 0.0 
    },

    ["cigar01"] = { 
        ["model"] = "prop_cigar_03", ["bone"] = 28422, ["x"] = 0.062,["y"] = 0.02,["z"] = 0.0,["xR"] = 0.0,["yR"] = 0.0, ["zR"] = 0.0 
    },

    ["cig01"] = { 
        ["model"] = "prop_amb_ciggy_01", ["bone"] = 28422, ["x"] = -0.024,["y"] = 0.0,["z"] = 0.0,["xR"] = 0.0,["yR"] = 0.0, ["zR"] = 0.0 
    },

    ["cig02"] = { 
        ["model"] = "prop_amb_ciggy_01", ["bone"] = 58867, ["x"] = 0.06,["y"] = 0.0,["z"] = -0.02,["xR"] = 0.0,["yR"] = 0.0, ["zR"] = 90.0 
    },

    ["healthpack01"] = { 
        ["model"] = "prop_ld_health_pack", ["bone"] = 28422, ["x"] = 0.18,["y"] = 0.0,["z"] = 0.0,["xR"] = 135.0,["yR"] = -100.0, ["zR"] = 0.0 
    },

    ["briefcase01"] = { 
        ["model"] = "prop_ld_case_01", ["bone"] = 28422, ["x"] = 0.08,["y"] = 0.0,["z"] = 0.0,["xR"] = 315.0,["yR"] = 288.0, ["zR"] = 0.0 
    },

    ["cashcase01"] = { 
        ["model"] = "prop_cash_case_01", ["bone"] = 28422, ["x"] = 0.05,["y"] = 0.0,["z"] = 0.0,["xR"] = 135.0,["yR"] = -100.0, ["zR"] = 0.0 
    },

    ["cashbag01"] = { 
        ["model"] = "prop_cs_heist_bag_01", ["bone"] = 28422, ["x"] = -0.09,["y"] = 0.15,["z"] = -0.15,["xR"] = 135.0,["yR"] = -100.0, ["zR"] = 0.0 
    },

    ["notepad01"] = { 
        ["model"] = "prop_notepad_01", ["bone"] = 60309, ["x"] = 0.0,["y"] = -0.0,["z"] = -0.0,["xR"] = 0.0,["yR"] = 0.0, ["zR"] = 0.0 
    },

    ["phone01"] = { 
        ["model"] = "prop_player_phone_01", ["bone"] = 57005, ["x"] = 0.14,["y"] = 0.01,["z"] = -0.02,["xR"] = 110.0,["yR"] = 120.0, ["zR"] = -15.0 
    },

    ["tablet01"] = { 
        ["model"] = "prop_cs_tablet", ["bone"] = 60309, ["x"] = 0.03,["y"] = 0.002,["z"] = -0.0,["xR"] = 10.0,["yR"] = 160.0, ["zR"] = 0.0 
    },


    ["pencil01"] = { 
        ["model"] = "prop_pencil_01", ["bone"] = 58870, ["x"] = 0.04,["y"] = 0.0225,["z"] = 0.08,["xR"] = 320.0,["yR"] = 0.0, ["zR"] = 220.0 
    },

    ["drugpackage01"] = { 
        ["model"] = "prop_meth_bag_01", ["bone"] = 28422, ["x"] = 0.1,["y"] = 0.0,["z"] = -0.01,["xR"] = 135.0,["yR"] = -100.0, ["zR"] = 40.0 
    },

    ["drugpackage02"] = { 
        ["model"] = "prop_weed_bottle", ["bone"] = 28422, ["x"] = 0.09,["y"] = 0.0,["z"] = -0.03,["xR"] = 135.0,["yR"] = -100.0, ["zR"] = 40.0 
    },

    ["drugtest01"] = { 
        ["model"] = "prop_cash_case_02", ["bone"] = 28422, ["x"] = -0.01,["y"] = -0.1,["z"] = -0.138,["xR"] = 0.0,["yR"] = 0.0, ["zR"] = 0.0 
    },

    ["box01"] = { 
        ["model"] = "prop_cs_cardbox_01", ["bone"] = 28422, ["x"] = 0.01,["y"] = 0.01,["z"] = 0.0,["xR"] = -255.0,["yR"] = -120.0, ["zR"] = 40.0 
    },

    ["spike"] = { 
        ["model"] = "p_ld_stinger_s", ["bone"] = 28422, ["x"] = 0.01,["y"] = -0.1,["z"] = -0.1,["xR"] = 180.0,["yR"] = -180.0, ["zR"] = 90.0 
    },

    ["bomb01"] = { 
        ["model"] = "prop_ld_bomb", ["bone"] = 28422, ["x"] = 0.22,["y"] = -0.01,["z"] = 0.0,["xR"] = -25.0,["yR"] = -100.0, ["zR"] = 0.0 
    },

    ["money01"] = { 
        ["model"] = "prop_anim_cash_note", ["bone"] = 28422, ["x"] = 0.1,["y"] = 0.04,["z"] = 0.0,["xR"] = 25.0,["yR"] = 0.0, ["zR"] = 10.0 
    },

    ["armor01"] = { 
        ["model"] = "prop_armour_pickup", ["bone"] = 28422, ["x"] = 0.3,["y"] = 0.01,["z"] = 0.0,["xR"] = 255.0,["yR"] = -90.0, ["zR"] = 10.0 
    },

    ["terd01"] = { 
        ["model"] = "prop_big_shit_01", ["bone"] = 61839, ["x"] = 0.015,["y"] = 0.0,["z"] = -0.01,["xR"] = 3.0,["yR"] = -90.0, ["zR"] = 180.0 
    },

    ["boombox01"] = { 
        ["model"] = "prop_boombox_01", ["bone"] = 28422, ["x"] = 0.2,["y"] = 0.0,["z"] = 0.0,["xR"] = -35.0,["yR"] = -100.0, ["zR"] = 0.0 
    },

    ["bowlball01"] = { 
        ["model"] = "prop_bowling_ball", ["bone"] = 28422, ["x"] = 0.12,["y"] = 0.0,["z"] = 0.0,["xR"] = 75.0,["yR"] = 280.0, ["zR"] = -80.0 
    },

    ["bowlpin01"] = { 
        ["model"] = "prop_bowling_pin", ["bone"] = 28422, ["x"] = 0.12,["y"] = 0.0,["z"] = 0.0,["xR"] = 75.0,["yR"] = 280.0, ["zR"] = -80.0 
    },

    ["crate01"] = { 
        ["model"] = "prop_cs_cardbox_01", ["bone"] = 57005, ["x"] = 0.0,["y"] = 0.0,["z"] = 0.0,["xR"] = 0.0,["yR"] = 0.0, ["zR"] = 0.0 
    },

    ["tvcamera01"] = { 
        ["model"] = "prop_v_cam_01", ["bone"] = 57005, ["x"] = 0.13,["y"] = 0.25,["z"] = -0.03,["xR"] = -85.0,["yR"] = 0.0, ["zR"] = -80.0 
    },

    ["boomMIKE01"] = { 
        ["model"] = "prop_v_bmike_01", ["bone"] = 57005, ["x"] = 0.1,["y"] = 0.0,["z"] = -0.03,["xR"] = 85.0,["yR"] = 0.0, ["zR"] = 96.0 
    },

    ["minigameThermite"] = { 
        ["model"] = "prop_oiltub_06", ["bone"] = 57005, ["x"] = 0.1,["y"] = 0.0,["z"] = -0.09,["xR"] = 145.0,["yR"] = 20.0, ["zR"] = 80.0 
    },

    ["minigameDrill"] = { 
        ["model"] = "hei_prop_heist_drill", ["bone"] = 57005, ["x"] = 0.15,["y"] = 0.0,["z"] = -0.05,["xR"] = 0.0,["yR"] = 90.0, ["zR"] = 90.0 
    },

        -- 18905 left hand - 57005 right hand
    ["tvmic01"] = { 
        ["model"] = "p_ing_microphonel_01", ["bone"] = 18905, ["x"] = 0.1,["y"] = 0.05,["z"] = 0.0,["xR"] = -85.0,["yR"] = -80.0, ["zR"] = -80.0 
    },

    ["newspaper01"] = { 
        ["model"] = "prop_cliff_paper", ["bone"] = 28422, ["x"] = -0.07,["y"] = 0.0,["z"] = 0.0,["xR"] = 90.0,["yR"] = 0.0, ["zR"] = 0.0 
    },


    ["golfbag01"] = { 
        ["model"] = "prop_golf_bag_01", ["bone"] = 24816, ["x"] = 0.12,["y"] = -0.3,["z"] = 0.0,["xR"] = -75.0,["yR"] = 190.0, ["zR"] = 92.0 
    },

    ["golfputter01"] = { 
        ["model"] = "prop_golf_putter_01", ["bone"] = 57005, ["x"] = 0.0,["y"] = -0.05,["z"] = 0.0,["xR"] = 90.0,["yR"] = -118.0, ["zR"] = 44.0 
    },

    ["golfiron01"] = { 
        ["model"] = "prop_golf_iron_01", ["bone"] = 57005, ["x"] = 0.125,["y"] = 0.04,["z"] = 0.0,["xR"] = 90.0,["yR"] = -118.0, ["zR"] = 44.0 
    },
    ["golfiron03"] = { 
        ["model"] = "prop_golf_iron_01", ["bone"] = 57005, ["x"] = 0.126,["y"] = 0.041,["z"] = 0.0,["xR"] = 90.0,["yR"] = -118.0, ["zR"] = 44.0 
    },
    ["golfiron05"] = { 
        ["model"] = "prop_golf_iron_01", ["bone"] = 57005, ["x"] = 0.127,["y"] = 0.042,["z"] = 0.0,["xR"] = 90.0,["yR"] = -118.0, ["zR"] = 44.0 
    },
    ["golfiron07"] = { 
        ["model"] = "prop_golf_iron_01", ["bone"] = 57005, ["x"] = 0.128,["y"] = 0.043,["z"] = 0.0,["xR"] = 90.0,["yR"] = -118.0, ["zR"] = 44.0 
    },      
    ["golfwedge01"] = { 
        ["model"] = "prop_golf_pitcher_01", ["bone"] = 57005, ["x"] = 0.17,["y"] = 0.04,["z"] = 0.0,["xR"] = 90.0,["yR"] = -118.0, ["zR"] = 44.0 
    },

    ["golfdriver01"] = { 
        ["model"] = "prop_golf_driver", ["bone"] = 57005, ["x"] = 0.14,["y"] = 0.00,["z"] = 0.0,["xR"] = 160.0,["yR"] = -60.0, ["zR"] = 10.0 
    }   
}

RegisterNetEvent('XP:attachItem')
AddEventHandler('XP:attachItem', function(item)
    exports['mythic_notify']:SendAlert('error', 'Prop aldın!')
    TriggerEvent("XP:attachProp",attachPropList[item]["model"], attachPropList[item]["bone"], attachPropList[item]["x"], attachPropList[item]["y"], attachPropList[item]["z"], attachPropList[item]["xR"], attachPropList[item]["yR"], attachPropList[item]["zR"])
end)
--tvmic01
RegisterNetEvent('attach:tvmic')
AddEventHandler('attach:tvmic', function()
    TriggerEvent("XP:attachItem","tvmic01")
end)
--boomMIKE01
RegisterNetEvent('attach:tvcamera')
AddEventHandler('attach:tvcamera', function()
    TriggerEvent("XP:attachItem","tvcamera01")
end)
RegisterNetEvent('attach:suitcase')
AddEventHandler('attach:suitcase', function()
    TriggerEvent("XP:attachItem","briefcase01")
end)

RegisterNetEvent('attach:boombox')
AddEventHandler('attach:boombox', function()
    TriggerEvent("XP:attachItem","boombox01")
end)

RegisterNetEvent('attach:pump')
AddEventHandler('attach:pump', function()
    TriggerEvent("XP:attachItem","pump")
end)

function clear()
    ClearPedTasks(GetPlayerPed(-1))
end

RegisterNetEvent('attach:medkit')
AddEventHandler('attach:medkit', function()
    clear()
    TriggerEvent("XP:attachItem","healthpack01")
end)

RegisterNetEvent('attach:cone')
AddEventHandler('attach:cone', function()
    clear()
    TriggerEvent("XP:attachItem","cone")
end)

RegisterNetEvent('attach:cashbag')
AddEventHandler('attach:cashbag', function()
    clear()
    TriggerEvent("XP:attachItem","cashbag01")
end)

RegisterNetEvent('attach:box')
AddEventHandler('attach:box', function()
    TriggerEvent("XP:attachItem","box01")
    clear()
    PropCarryAnim()
    carry = true
end)

RegisterNetEvent('attach:spike')
AddEventHandler('attach:spike', function()
    TriggerEvent("XP:attachItem","spike")
    clear()
    PropCarryAnim()
    carry = true
end)

RegisterNetEvent('attach:barrier')
AddEventHandler('attach:barrier', function()
    TriggerEvent("XP:attachItem","barrier")
    clear()
    PropCarryAnim()
    carry = true
end)

RegisterCommand("RE", function() -- remove entity 
    TriggerEvent("disabledWeapons",false)
    TriggerEvent("XP:DestroyProp")
end, false)

RegisterNetEvent('XP:removeall')
AddEventHandler('XP:removeall', function()
    TriggerEvent("disabledWeapons",false)
    TriggerEvent("XP:DestroyProp")
end)

local function errorMsg(msg)
    TriggerEvent("chatMessage", "Error", {255, 0, 0}, msg)
end



local disabledWeapons = false
RegisterNetEvent("disabledWeapons")
AddEventHandler("disabledWeapons", function(sentinfo)
    SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("weapon_unarmed"), 1)
    disabledWeapons = sentinfo
end)

RegisterNetEvent('prop:briefcase')
AddEventHandler('prop:briefcase', function()
    clear()
    ExecuteCommand('briefcase')
end)

RegisterNetEvent('prop:boombox')
AddEventHandler('prop:boombox', function()
    clear()
    ExecuteCommand('boombox')
end)

RegisterNetEvent('prop:koy')
AddEventHandler('prop:koy', function()
    if not holdingPackage then
        local dst = GetDistanceBetweenCoords(GetEntityCoords(attachedPropPerm) ,GetEntityCoords(GetPlayerPed(-1)),true)                 
        if dst < 2 then
            holdingPackage = not holdingPackage
            randPickupAnim()
            Citizen.Wait(1000)
            
            ClearPedTasks(GetPlayerPed(-1))
            ClearPedSecondaryTask(GetPlayerPed(-1))
            if carry then
                PropCarryAnim()
                carry = false
            end
            AttachEntityToEntity(attachedPropPerm, GetPlayerPed(-1), APPbone, APPx, APPy, APPz, APPxR, APPyR, APPzR, 1, 1, 0, 0, 2, 1)
            exports['mythic_notify']:SendAlert('success', 'Prop yerden alındı!')
        end
    else
        holdingPackage = not holdingPackage
        ClearPedTasks(GetPlayerPed(-1))
        ClearPedSecondaryTask(GetPlayerPed(-1))
        randPickupAnim()
        Citizen.Wait(500)
        DetachEntity(attachedPropPerm)
        --SetEntityAsNoLongerNeeded(attachedPropPerm)
        exports['mythic_notify']:SendAlert('error', 'Prop yere bırakıldı!')
    end
end)


RegisterNetEvent('can:kaput')
AddEventHandler('can:kaput', function()
    clear()
    ExecuteCommand('kaput')
end)

RegisterNetEvent('can:bagaj')
AddEventHandler('can:bagaj', function()
    clear()
    ExecuteCommand('bagaj')
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- PROP KISMI BİTİŞ --

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Yürüyüşler başlangıç --

RegisterNetEvent('AnimSet:default');
AddEventHandler('AnimSet:default', function()
    ResetPedMovementClipset(PlayerPedId(), 0)
    AnimSet = "default";
    TriggerServerEvent("police:setAnimData", AnimSet)
    exports['mythic_notify']:SendAlert('error', 'Yürüyüşünü değiştirdin!')
end)

RegisterNetEvent('AnimSet:Hurry');
AddEventHandler('AnimSet:Hurry', function()
    RequestAnimSet("move_m@hurry@a")
    while not HasAnimSetLoaded("move_m@hurry@a") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@hurry@a", true)
    AnimSet = "move_m@hurry@a";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Business');
AddEventHandler('AnimSet:Business', function()
    RequestAnimSet("move_m@business@a")
    while not HasAnimSetLoaded("move_m@business@a") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@business@a", true)
    AnimSet = "move_m@business@a";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Brave');
AddEventHandler('AnimSet:Brave', function()
    RequestAnimSet("move_m@brave")
    while not HasAnimSetLoaded("move_m@brave") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@brave", true)
    AnimSet = "move_m@brave";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Tipsy');
AddEventHandler('AnimSet:Tipsy', function()
    RequestAnimSet("move_m@drunk@slightlydrunk")
    while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
        Citizen.Wait(0)
    end
    SetWalk(PlayerPedId(), "move_m@drunk@slightlydrunk", true)
    AnimSet = "move_m@drunk@slightlydrunk";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Injured');
AddEventHandler('AnimSet:Injured', function()
    RequestAnimSet("move_m@injured")
    while not HasAnimSetLoaded("move_m@injured") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@injured", true)
    AnimSet = "move_m@injured";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

function SetWalk(ped, movement, boolean)
    SetPedMovementClipset(ped, movement, boolean)
    exports['mythic_notify']:SendAlert('error', 'Yürüyüşünü değiştirdin!')
end

RegisterNetEvent('AnimSet:ToughGuy');
AddEventHandler('AnimSet:ToughGuy', function()
    RequestAnimSet("move_m@tough_guy@")
    while not HasAnimSetLoaded("move_m@tough_guy@") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@tough_guy@", true)
    AnimSet = "move_m@tough_guy@";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Sassy');
AddEventHandler('AnimSet:Sassy', function()
    RequestAnimSet("move_m@sassy")
    while not HasAnimSetLoaded("move_m@sassy") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@sassy", true)
    AnimSet = "move_m@sassy";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Sad');
AddEventHandler('AnimSet:Sad', function()
    RequestAnimSet("move_m@sad@a")
    while not HasAnimSetLoaded("move_m@sad@a") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@sad@a", true)
    AnimSet = "move_m@sad@a";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('vevo:aracidevret');
AddEventHandler('vevo:aracidevret', function()
	ExecuteCommand('aracdevret')
end)

RegisterNetEvent('vevo:anahtarver');
AddEventHandler('vevo:anahtarver', function()
	ExecuteCommand('anahtarver')
end)

RegisterNetEvent('AnimSet:Posh');
AddEventHandler('AnimSet:Posh', function()
    RequestAnimSet("move_m@posh@")
    while not HasAnimSetLoaded("move_m@posh@") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@posh@", true)
    AnimSet = "move_m@posh@";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Alien');
AddEventHandler('AnimSet:Alien', function()
    RequestAnimSet("move_m@alien")
    while not HasAnimSetLoaded("move_m@alien") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@alien", true)
    AnimSet = "move_m@alien";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:NonChalant');
AddEventHandler('AnimSet:NonChalant', function()
    RequestAnimSet("move_m@non_chalant")
    while not HasAnimSetLoaded("move_m@non_chalant") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@non_chalant", true)
    AnimSet = "move_m@non_chalant";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Hobo');
AddEventHandler('AnimSet:Hobo', function()
    RequestAnimSet("move_m@hobo@a")
    while not HasAnimSetLoaded("move_m@hobo@a") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@hobo@a", true)
    AnimSet = "move_m@hobo@a";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Money');
AddEventHandler('AnimSet:Money', function()
    RequestAnimSet("move_m@money")
    while not HasAnimSetLoaded("move_m@money") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@money", true)
    AnimSet = "move_m@money";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Swagger');
AddEventHandler('AnimSet:Swagger', function()
    RequestAnimSet("move_m@swagger")
    while not HasAnimSetLoaded("move_m@swagger") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@swagger", true)
    AnimSet = "move_m@swagger";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Joy');
AddEventHandler('AnimSet:Joy', function()
    RequestAnimSet("move_m@joy")
    while not HasAnimSetLoaded("move_m@joy") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@joy", true)
    AnimSet = "move_m@joy";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Moon');
AddEventHandler('AnimSet:Moon', function()

    RequestAnimSet("move_m@powerwalk")
    while not HasAnimSetLoaded("move_m@powerwalk") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@powerwalk", true)
    AnimSet = "move_m@powerwalk";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Shady');
AddEventHandler('AnimSet:Shady', function()
    RequestAnimSet("move_m@shadyped@a")
    while not HasAnimSetLoaded("move_m@shadyped@a") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@shadyped@a", true)
    AnimSet = "move_m@shadyped@a";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Tired');
AddEventHandler('AnimSet:Tired', function()
    RequestAnimSet("move_m@tired")
    while not HasAnimSetLoaded("move_m@tired") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_m@tired", true)
    AnimSet = "move_m@tired";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:Sexy');
AddEventHandler('AnimSet:Sexy', function()
    RequestAnimSet("move_f@sexy")
    while not HasAnimSetLoaded("move_f@sexy") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_f@sexy", true)
    AnimSet = "move_f@sexy";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:ManEater');
AddEventHandler('AnimSet:ManEater', function()
    RequestAnimSet("move_f@maneater")
    while not HasAnimSetLoaded("move_f@maneater") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_f@maneater", true)
    AnimSet = "move_f@maneater";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

RegisterNetEvent('AnimSet:ChiChi');
AddEventHandler('AnimSet:ChiChi', function()
    RequestAnimSet("move_f@chichi")
    while not HasAnimSetLoaded("move_f@chichi") do Citizen.Wait(0) end
    SetWalk(PlayerPedId(), "move_f@chichi", true)
    AnimSet = "move_f@chichi";
    TriggerServerEvent("police:setAnimData", AnimSet)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Yürüyüşler Bitiş --

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Motor başlangıç --

RegisterNetEvent('arac:kaput')
AddEventHandler('arac:kaput', function()
   ExecuteCommand('engine')
end)
RegisterNetEvent('arac:cam')
AddEventHandler('arac:cam', function()
   ExecuteCommand('windowfront')
   ExecuteCommand('windowback')
end)
RegisterNetEvent('neon:all')
AddEventHandler('neon:all', function()
   ExecuteCommand('neonai')
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Motor Bitiş --



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Neon başlangıç --

local isOn	=	false


RegisterCommand("neonai", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--left
        if isOn then
            SetVehicleNeonLightEnabled(veh, 0, false)
            SetVehicleNeonLightEnabled(veh, 1, false)
            SetVehicleNeonLightEnabled(veh, 2, false)
            SetVehicleNeonLightEnabled(veh, 3, false)
			
            isOn = false
            exports['mythic_notify']:SendAlert('error', 'Neonlar kapandı!', 6000)
        else
            SetVehicleNeonLightEnabled(veh, 0, true)
            SetVehicleNeonLightEnabled(veh, 1, true)
            SetVehicleNeonLightEnabled(veh, 2, true)
            SetVehicleNeonLightEnabled(veh, 3, true)
			
            isOn = true
            exports['mythic_notify']:SendAlert('inform', 'Neonlar açıldı!', 6000)
        end
    end
end, false)

RegisterCommand("neonaikaire", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--left
        if IsVehicleNeonLightEnabled(veh, 0) then
            SetVehicleNeonLightEnabled(veh, 0, false)
            exports['mythic_notify']:SendAlert('error', 'Sol neon kapandı!', 6000)
        else
            SetVehicleNeonLightEnabled(veh, 0, true)
			
            isOn = true
            exports['mythic_notify']:SendAlert('inform', 'Sol neon açıldı!', 6000)
        end
    end
end, false)

RegisterCommand("neonaidesine", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--right
        if IsVehicleNeonLightEnabled(veh, 1) then
            SetVehicleNeonLightEnabled(veh, 1, false)
            exports['mythic_notify']:SendAlert('error', 'Sağ neon kapandı!', 6000)
        else
            SetVehicleNeonLightEnabled(veh, 1, true)
			
            isOn = true
            exports['mythic_notify']:SendAlert('inform', 'Sağ neon açıldı!', 6000)
        end
    end
end, false)

RegisterCommand("neonaipriekis", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--front
        if IsVehicleNeonLightEnabled(veh, 2) then
            SetVehicleNeonLightEnabled(veh, 2, false)
            exports['mythic_notify']:SendAlert('error', 'Ön neon kapandı!', 6000)
        else
            SetVehicleNeonLightEnabled(veh, 2, true)
			
            isOn = true
            exports['mythic_notify']:SendAlert('inform', 'Ön neon açıldı!', 6000)
        end
    end
end, false)

RegisterCommand("neonaigalas", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
		--back
        if IsVehicleNeonLightEnabled(veh, 3) then
            SetVehicleNeonLightEnabled(veh, 3, false)
            exports['mythic_notify']:SendAlert('error', 'Arka neon kapandı!', 6000)
        else
            SetVehicleNeonLightEnabled(veh, 3, true)
			
            isOn = true
            exports['mythic_notify']:SendAlert('inform', 'Arka neon açıldı!', 6000)
        end
    end
end, false)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', "/neonai", "turn neons on/off or try /neonaipriekis etc")
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Neon Bitiş --


--- Araç Temizle Başlangıç --

RegisterNetEvent('st:mechclean')
AddEventHandler('st:mechclean', function()
    local playerPed = PlayerPedId()
			local vehicle   = ESX.Game.GetVehicleInDirection()
			local coords    = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = "Araçta olmamalısın."})
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
				Citizen.CreateThread(function()
					Citizen.Wait(10000)

					SetVehicleDirtLevel(vehicle, 0)
					ClearPedTasksImmediately(playerPed)

					TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = "Araç temizlendi."})
					isBusy = false
				end)
			else
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = "Yakınında araç yok."})
			end
end)

--- Araç Temizle Bitiş --

-- Kıyafet Fonksiyonlari Baslangic --

RegisterNetEvent('darkleaf:sapka')
AddEventHandler('darkleaf:sapka', function()
   ExecuteCommand('sapka')
end)
RegisterNetEvent('darkleaf:gozluk')
AddEventHandler('darkleaf:gozluk', function()
   ExecuteCommand('gozluk')
end)
RegisterNetEvent('darkleaf:maske')
AddEventHandler('darkleaf:maske', function()
   ExecuteCommand('maske')
end)
RegisterNetEvent('darkleaf:shirt')
AddEventHandler('darkleaf:shirt', function()
   ExecuteCommand('shirt')
end)
RegisterNetEvent('darkleaf:yelek')
AddEventHandler('darkleaf:yelek', function()
   ExecuteCommand('yelek')
end)
RegisterNetEvent('darkleaf:pantolon')
AddEventHandler('darkleaf:pantolon', function()
   ExecuteCommand('pantolon')
end)
RegisterNetEvent('darkleaf:ayakkabı')
AddEventHandler('darkleaf:ayakkabı', function()
   ExecuteCommand('ayakkabı')
end)
RegisterNetEvent('darkleaf:kulak')
AddEventHandler('darkleaf:kulak', function()
   ExecuteCommand('kulak')
end)
RegisterNetEvent('darkleaf:saat')
AddEventHandler('darkleaf:saat', function()
   ExecuteCommand('saat')
end)
RegisterNetEvent('darkleaf:bilezik')
AddEventHandler('darkleaf:bilezik', function()
   ExecuteCommand('bilezik')
end)
RegisterNetEvent('darkleaf:kolye')
AddEventHandler('darkleaf:kolye', function()
   ExecuteCommand('boyun')
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Blip Açma Kapama Sistemi --

local showTattoo = false
local showClothes = false
local showBarber = false
local showAtm = false
local showBenzin = false
local showMarket = false
local showMegamall = false
local showMekanik = false
local showTeknoloji = false
blipsTattoo = {}
blipsClothes = {}
blipsBarber = {}
blipsAtm = {}
blipsBenzin = {}
blipsGaraj = {}
blipsMarket = {}
blipsMekanik = {}
blipsMegamall = {}
blipsTeknoloji = {}

function blipOlustur(coords, sprite, colour, disp, scale, text, which)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
	SetBlipDisplay(blip, disp)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, scale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
	if which == 'Dövmeciler' then
		table.insert(blipsTattoo, blip)
	elseif which == 'Kıyafet' then
		table.insert(blipsClothes, blip)
	elseif which == 'Berber' then
		table.insert(blipsBarber, blip)
	elseif which == 'Atm' then
        table.insert(blipsAtm, blip)
    elseif which == 'Benzin' then
		table.insert(blipsBenzin, blip)
	elseif which == 'Garaj' then
		table.insert(blipsGaraj, blip)
	elseif which == 'Mekanik' then
		table.insert(blipsMekanik, blip)
	elseif which == 'Megamall' then
		table.insert(blipsMegamall, blip)
	elseif which == 'Teknoloji' then
		table.insert(blipsTeknoloji, blip)
	elseif which == 'Market' then
		table.insert(blipsMarket, blip)
	end
end

RegisterNetEvent('blips:fantasticTattoo')
AddEventHandler('blips:fantasticTattoo',function()
	showTattoo = not showTattoo
    if showTattoo then
        for k, v in pairs(tattoShops) do
            blipOlustur(v, 75, 34, 4, 0.9, 'Dövme Salonu', 'Dövmeciler')
        end
        exports["mythic_notify"]:SendAlert("inform", "Dövmeci Blipleri Açıldı.", 3500)
    else
        for k, v in pairs(blipsTattoo) do
            RemoveBlip(v)
        end
		exports["mythic_notify"]:SendAlert("inform", "Dövmeci Blipleri Kapatıldı.", 3500)
    end
end)

RegisterNetEvent('blips:fantasticClothes')
AddEventHandler('blips:fantasticClothes',function()
	showClothes = not showClothes
    if showClothes then
        for k, v in pairs(clotheShops) do
            blipOlustur(v, 73, 17, 4, 0.9, 'Kıyafet Dükkanı', 'Kıyafet')
        end
		exports["mythic_notify"]:SendAlert("inform", "Kıyafet Dükkanı Blipleri Açıldı.", 3500)
    else
        for k, v in pairs(blipsClothes) do
            RemoveBlip(v)
        end
		exports["mythic_notify"]:SendAlert("inform", "Kıyafet Dükkanı Blipleri Kapatıldı.", 3500)
    end
end)

RegisterNetEvent('blips:fantasticBarber')
AddEventHandler('blips:fantasticBarber',function()
	showBarber = not showBarber
    if showBarber then
        for k, v in pairs(barberShops) do
            blipOlustur(v, 71, 17, 4, 0.9, 'Berber Dükkanı', 'Berber')
        end
		exports["mythic_notify"]:SendAlert("inform", "Berber Dükkanı Blipleri Açıldı.", 3500)
    else
        for k, v in pairs(blipsBarber) do
            RemoveBlip(v)
        end
		exports["mythic_notify"]:SendAlert("inform", "Berber Dükkanı Blipleri Kapatıldı.", 3500)
    end
end)

RegisterNetEvent('blips:fantasticMarket')
AddEventHandler('blips:fantasticMarket',function()
	showMarket = not showMarket
    if showMarket then
        for k, v in pairs(Market) do
            blipOlustur(v, 59, 2, 4, 0.9, 'Market', 'Market')
        end
		exports["mythic_notify"]:SendAlert("inform", "Market Blipleri Açıldı.", 3500)
    else
        for k, v in pairs(blipsMarket) do
            RemoveBlip(v)
        end
		exports["mythic_notify"]:SendAlert("inform", "Market Blipleri Kapatıldı.", 3500)
    end
end)

RegisterNetEvent('blips:fantasticAtm')
AddEventHandler('blips:fantasticAtm',function()
	showAtm = not showAtm
    if showAtm then
        for k, v in pairs(ATMs) do
            blipOlustur(v, 277, 2, 4, 1.3, 'Banka', 'Atm')
        end
		exports["mythic_notify"]:SendAlert("inform", "Banka Blipleri Açıldı.", 3500)
    else
        for k, v in pairs(blipsAtm) do
            RemoveBlip(v)
        end
		exports["mythic_notify"]:SendAlert("inform", "Banka Blipleri Kapatıldı.", 3500)
    end
end)

RegisterNetEvent('blips:fantasticBenzin')
AddEventHandler('blips:fantasticBenzin',function()
	showBenzin = not showBenzin
    if showBenzin then
        for k, v in pairs(BenzinS) do
            blipOlustur(v, 361, 1, 4, 0.9, 'Benzin İstasyonu', 'Benzin')
        end
		exports["mythic_notify"]:SendAlert("inform", "Benzin istasyonu Blipleri Açıldı.", 3500)
    else
        for k, v in pairs(blipsBenzin) do
            RemoveBlip(v)
        end
		exports["mythic_notify"]:SendAlert("inform", "Benzin istasyonu Blipleri Kapatıldı.", 3500)
    end
end)

RegisterNetEvent('blips:fantasticGaraj')
AddEventHandler('blips:fantasticGaraj',function()
	showGaraj = not showGaraj
    if showGaraj then
        for k, v in pairs(GarajS) do
            blipOlustur(v, 290, 53, 4, 0.9, 'Garaj', 'Garaj')
        end
		exports["mythic_notify"]:SendAlert("inform", "Garaj Blipleri Açıldı.", 3500)
    else
        for k, v in pairs(blipsGaraj) do
            RemoveBlip(v)
        end
		exports["mythic_notify"]:SendAlert("inform", "Garaj Blipleri Kapatıldı.", 3500)
    end
end)

RegisterNetEvent('blips:fantasticMekanik')
AddEventHandler('blips:fantasticMekanik',function()
	showMekanik = not showMekanik
    if showMekanik then
        for k, v in pairs(Mekaniks) do
            blipOlustur(v, 446, 3, 4, 0.9, 'Mekanik', 'Mekanik')
        end
		exports["mythic_notify"]:SendAlert("inform", "Mekanik Blipleri Açıldı.", 3500)
    else
        for k, v in pairs(blipsMekanik) do
            RemoveBlip(v)
        end
		exports["mythic_notify"]:SendAlert("inform", "Mekanik Blipleri Kapatıldı.", 3500)
    end
end)

RegisterNetEvent('blips:fantasticMegamall')
AddEventHandler('blips:fantasticMegamall',function()
	showMegamall = not showMegamall
    if showMegamall then
        for k, v in pairs(Megamalls) do
            blipOlustur(v, 52, 46, 4, 0.9, 'Megamall', 'Megamall')
        end
		exports["mythic_notify"]:SendAlert("inform", "Megamall Blipleri Açıldı.", 3500)
    else
        for k, v in pairs(blipsMegamall) do
            RemoveBlip(v)
        end
		exports["mythic_notify"]:SendAlert("inform", "Megamall Blipleri Kapatıldı.", 3500)
    end
end)

RegisterNetEvent('blips:fantasticTeknoloji')
AddEventHandler('blips:fantasticTeknoloji',function()
	showTeknoloji = not showTeknoloji
    if showTeknoloji then
        for k, v in pairs(Teknolojis) do
            blipOlustur(v, 521, 46, 4, 0.9, 'Teknoloji Marketi', 'Teknoloji')
        end
		exports["mythic_notify"]:SendAlert("inform", "Teknoloji Marketi Blipleri Açıldı.", 3500)
    else
        for k, v in pairs(blipsTeknoloji) do
            RemoveBlip(v)
        end
		exports["mythic_notify"]:SendAlert("inform", "Teknoloji Marketi Blipleri Kapatıldı.", 3500)
    end
end)


BenzinS = {
    vector3(49.4187, 2778.793, 58.043),
	vector3(263.894, 2606.463, 44.983),
	vector3(1039.958, 2671.134, 39.550),
	vector3(1207.260, 2660.175, 37.899),
	vector3(2539.685, 2594.192, 37.944),
	vector3(2679.858, 3263.946, 55.240),
	vector3(2005.055, 3773.887, 32.403),
	vector3(1687.156, 4929.392, 42.078),
	vector3(1701.314, 6416.028, 32.763),
	vector3(179.857, 6602.839, 31.868),
	vector3(-94.4619, 6419.594, 31.489),
	vector3(-2554.996, 2334.40, 33.078),
	vector3(-1800.375, 803.661, 138.651),
	vector3(-1437.622, -276.747, 46.207),
	vector3(-2096.243, -320.286, 13.168),
	vector3(-724.619, -935.1631, 19.213),
	vector3(-526.019, -1211.003, 18.184),
	vector3(-70.2148, -1761.792, 29.534),
	vector3(265.648, -1261.309, 29.292),
	vector3(819.653, -1028.846, 26.403),
	vector3(1208.951, -1402.567,35.224),
	vector3(1181.381, -330.847, 69.316),
	vector3(620.843, 269.100, 103.089),
	vector3(2581.321, 362.039, 108.468),
	vector3(176.631, -1562.025, 29.263),
	vector3(176.631, -1562.025, 29.263),
	vector3(-319.292, -1471.715, 30.549),
	vector3(1784.324, 3330.55, 41.253)
}

GarajS = {
    vector3(223.797, -760.415, 30.646),
    vector3(273.01, -342.81, 44.92),
    vector3(22.22, 544.32, 176.03),
    vector3(966.65, -1019.81, 40.85),
    vector3(1367.43,  1156.56, 113.75),
    vector3(169.59,  -3178.59, 5.82),
    vector3(51.85,  3727.61, 39.51),
    vector3(-165.97,  932.7, 235.66),
    vector3(-1790.48, 458.25, 128.31),
    vector3(-445.19, -800.73, 30.54),
    vector3(2519.65, 1991.02, 19.97),
    vector3(-295.23, -422.64,30.24),
    vector3(-105.58, 826.19, 235.72),
    vector3(-1040.29, -1006.44,2.15),

}

Megamalls = {
    vector3(46.56, -1749.71, 29.63),
    vector3(-138.57, -249.92, 43.85),
}

Teknolojis = {
    vector3(392.92, -831.94, 29.29),
    vector3(-41.52, -1036.74, 28.49),
    vector3(1705.543, 3780.161, 34.758),
    vector3(-657.386, -854.780, 24.507),
    vector3(161.8722, 6636.262, 31.567),
}

ATMs = {
    vector3(150.266,  -1040.203, 28.374),
    vector3(-1212.980, -330.841,  36.787),
    vector3(-2962.582,  482.627,  14.703),
    vector3(-112.202,  6469.295,  30.626),
    vector3(314.187,  -278.621,  53.170),
    vector3(-351.534,  -49.529,  48.042),
    vector3(236.92,  217.57,  105.29),
    vector3(1175.0643310547,  2706.6435546875,  37.094036102295),

}

tattoShops = {
	vector3(1322.6, -1651.9, 52.3),
	vector3(-1153.6, -1425.6, 4.9),
	vector3(322.1, 180.4, 103.5),
	vector3(-3170.0, 1075.0, 20.8),
	vector3(1864.6, 3747.7, 33.0),
	vector3(-293.7, 6200.0, 31.4)
}

clotheShops = {
  vector3(72.254, -1399.102, 28.376),
  vector3(-703.776, -152.258, 36.415),
  vector3(-167.863, -298.969, 38.733),
  vector3(428.694, -800.106, 28.491),
  vector3(-829.413, -1073.710, 10.328),
  vector3(-1447.797, -242.461, 48.820),
  vector3(11.632, 6514.224, 30.877),
  vector3(123.646, -219.440, 53.557),
  vector3(1696.291, 4829.312, 41.063),
  vector3(618.093, 2759.629, 41.088),
  vector3(1190.550, 2713.441, 37.222),
  vector3(-1193.429, -772.262, 16.324),
  vector3(-3172.496, 1048.133, 19.863),
  vector3(-1108.441, 2708.923, 18.107),
  vector3(-1125.54, -1438.47, 4.23)
}

barberShops = {
	vector3(-814.308, -183.823, 36.568),
	vector3(136.826, -1708.373, 28.291),
	vector3(-1282.604, -1116.757, 5.990),
	vector3(1931.513, 3729.671, 31.844),
	vector3(1212.840, -472.921, 65.208),
	vector3(-32.885, -152.319, 56.076),
	vector3(-278.077, 6228.463, 30.695)
}

Market = {
	vector3(25.73, -1347.27, 29.5),
    vector3(-48.37, -1757.93, 29.42),
    vector3(-1222.26, -906.86, 12.33),
    vector3(-1487.62, -378.60, 40.16),
    vector3(-707.31, -914.66, 19.22),
    vector3(1135.7, -982.79, 46.42),
    vector3(373.55, 325.52, 103.57),
    vector3(1163.67, -323.92, 69.21),
    vector3(2557.44, 382.03, 108.62),
    vector3(-3039.16, 585.71, 7.91),
    vector3(-3242.11, 1001.20, 12.83),
    vector3(-2967.78, 391.49, 15.04),
    vector3(-1820.38, 792.69, 138.11),
    vector3(547.75, 2671.53, 42.16),
    vector3(1165.36, 2709.45, 38.16),
    vector3(2678.82, 3280.36, 55.24),
    vector3(1961.17, 3740.5, 32.34),
    vector3(1393.13, 3605.2, 34.98),
    vector3(1697.92, 4924.46, 42.06),
    vector3(1728.78, 6414.41, 35.04),
    vector3(-2544.05, 2316.02, 33.22),
    vector3(-92.63, 6409.87, 31.64)
}

Mekaniks = {
	vector3(-347.291, -133.370, 38.009),
    vector3(719.5338, -1088.76, 22.297),
    vector3(536.2176, -179.205, 54.401),
    vector3(-207.8, -1321.04, 30.89)
}


Citizen.CreateThread(function()
    while true do
      Citizen.Wait(1)
      RemoveAllPickupsOfType(0xDF711959)
      RemoveAllPickupsOfType(0xF9AFB48F)
      RemoveAllPickupsOfType(0xA9355DCD)
    end
  end)
  
  ------------------------------------
  RegisterCommand('editor', function(source, args)
	Citizen.Wait(0)
	if args[1] == "baslat" or args[1] == "kayit" then
		StartRecording(1)
	elseif args[1] == "iptal" then
		StopRecordingAndDiscardClip()
	elseif args[1] == "durdur" then
		StopRecordingAndSaveClip()
	elseif args[1] == "tekrar" then
		StartRecording(0)
	elseif args[1] == "ac" then
		NetworkSessionLeaveSinglePlayer()
		ActivateRockstarEditor()
	else
		return
	end
end)
TriggerEvent('chat:addSuggestion', '/' .. 'baslat, kayit, iptal, durdur, tekrar, ac')

RegisterNetEvent('darkleaf:kayit')
AddEventHandler('darkleaf:kayit', function()
   ExecuteCommand('editor kayit')
end)

RegisterNetEvent('darkleaf:baslat')
AddEventHandler('darkleaf:baslat', function()
   ExecuteCommand('editor baslat')
end)

RegisterNetEvent('darkleaf:iptal')
AddEventHandler('darkleaf:iptal', function()
   ExecuteCommand('editor iptal')
end)

RegisterNetEvent('darkleaf:durdur')
AddEventHandler('darkleaf:durdur', function()
   ExecuteCommand('editor durdur')
end)

RegisterNetEvent('darkleaf:kac')
AddEventHandler('darkleaf:kac', function()
   ExecuteCommand('editor ac')
end)

RegisterNetEvent('darkleaf:tekrar')
AddEventHandler('darkleaf:tekrar', function()
   ExecuteCommand('editor tekrar')
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Menü bağlama başlangıç --

local menuOn = false

local keybindControls = {
	["F1"] = 289, ["F2"] = 289, ["F3"] = 170, ["TAB"] = 192
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local keybindControl = keybindControls["TAB"]
        if IsControlPressed(0, keybindControl) then
            
            SendNUIMessage({
                type = 'init',
                resourceName = GetCurrentResourceName()
            })
            SetCursorLocation(0.5, 0.5)
            SetNuiFocus(true, true)
               ExecuteCommand('menu')
            while menuOn == true do Citizen.Wait(100) end
            Citizen.Wait(100)
            while IsControlPressed(0, keybindControl) do Citizen.Wait(100) end
        end
    end
end)

---------------

--------------------
RegisterCommand("menu" , function()
    exports['srnetwork-menu']:SetTitle("SR-Network v0.3 Menü")
    exports['srnetwork-menu']:AddButton("📑 Kimlik Goster" , "Yakındaki kişiye kimlik gösterir" ,'idcard:goster' ,'example button 1' , 'kimlik')
    exports['srnetwork-menu']:AddButton("📑 Kimlik Gör" , "Kimliğinizi görürsünüz" ,'idcard:gor' ,'example button 2' , "kimlik" )
	exports['srnetwork-menu']:AddButton("📑 Ehliyet Göster" , "Ehliyet Görürsünüz" ,'idcard:ehliyetgoster' ,'example button 1' , 'kimlik')
    exports['srnetwork-menu']:AddButton("📑 Ehliyet Gör" , "Ehliyetinizi görürsünüz" ,'idcard:ehliyetgor' ,'example button 2' , "kimlik" )
    exports['srnetwork-menu']:AddButton("📑 Silah Ruhsatı Goster" , "Yakındaki kişiye Silah Ruhsatı gösterir" ,'idcard:ruhsatgoster' ,'example button 1' , 'kimlik')
    exports['srnetwork-menu']:AddButton("📑 Silah Ruhsatı Gör" , "Silah Ruhtatınızı görürsünüz" ,'idcard:ruhsatgor' ,'example button 2' , "kimlik" )
    exports['srnetwork-menu']:AddButton("🤸🏾‍♂️ Animasyon Menüsü" , "Animasyon Menüsünü Açar" ,'dp:RecieveMenu' ,'example button 3' , "animasyon" )
	exports['srnetwork-menu']:AddButton("❌ Animasyon İptal" , "Animasyonu İptal Eder" ,'fishing:break' ,'example button 3' , "animasyon" )  
	exports['srnetwork-menu']:AddButton("🧑🏽‍🤝‍🧑🏽 Omuzla" , "" ,'moxha:omuzla' ,'example button 3' , "kucaklama" )
	exports['srnetwork-menu']:AddButton("🧑🏽‍🤝‍🧑🏽 Sırtla" , "" ,'moxha:sirtla' ,'example button 3' , "kucaklama" )
	exports['srnetwork-menu']:AddButton("📌 Benzinlik" , "" ,'lexia:togglegas' ,'example button 3' , "blip" )
	exports['srnetwork-menu']:AddButton("📌 Kıyafetçi" , "" ,'lexia:toggleclothes' ,'example button 3' , "blip" )
	exports['srnetwork-menu']:AddButton("📌 Banka" , "" ,'lexia:togglebank' ,'example button 3' , "blip" )
	exports['srnetwork-menu']:AddButton("📌 Market" , "" ,'lexia:togglemarket' ,'example button 3' , "blip" )
	exports['srnetwork-menu']:AddButton("📌 Garaj" , "" ,'lexia:togglegarage' ,'example button 3' , "blip" )
	exports['srnetwork-menu']:AddButton("📌 Berber" , "" ,'lexia:togglebarber' ,'example button 3' , "blip" )
	exports['srnetwork-menu']:AddButton("📌 Dövmeci" , "" ,'lexia:toggletattos' ,'example button 3' , "blip" )
	exports['srnetwork-menu']:AddButton("❌ Sil" , "" ,'prop:sil' ,'example button 3' , "prop" )
	exports['srnetwork-menu']:AddButton("⬇️ Yere Koy/Al" , "" ,'prop:koy' ,'example button 3' , "prop" )
	exports['srnetwork-menu']:AddButton("⏺ Kutu" , "" ,'attach:box' ,'example button 3' , "prop" )
	exports['srnetwork-menu']:AddButton("⏺ Çanta" , "" ,'prop:briefcase' ,'example button 3' , "prop" )
	exports['srnetwork-menu']:AddButton("⏺ Koni" , "" ,'attach:cone' ,'example button 3' , "prop" )
	exports['srnetwork-menu']:AddButton("⏺ Para Çantası" , "" ,'attach:cashbag' ,'example button 3' , "prop" )
	exports['srnetwork-menu']:AddButton("⏺ Medkit" , "" ,'attach:medkit' ,'example button 3' , "prop" )
	exports['srnetwork-menu']:AddButton("⏺ Teyp" , "" ,'prop:boombox' ,'example button 3' , "prop" )
    exports['srnetwork-menu']:AddButton("✅ Normal" , "" ,'AnimSet:default' ,'example button 3' , "yuruyus" )
	exports['srnetwork-menu']:AddButton("🚹 Cesur" , "" ,'AnimSet:Brave' ,'example button 3' , "yuruyus" )
	exports['srnetwork-menu']:AddButton("🚹 Acele" , "" ,'AnimSet:Hurry' ,'example button 3' , "yuruyus" )
	exports['srnetwork-menu']:AddButton("🚹 İş" , "" ,'AnimSet:Business' ,'example button 3' , "yuruyus" )
	exports['srnetwork-menu']:AddButton("🚹 Alkollü" , "" ,'AnimSet:Tipsy' ,'example button 3' , "yuruyus" )
	exports['srnetwork-menu']:AddButton("🚹 Yaralı" , "" ,'AnimSet:Injured' ,'example button 3' , "yuruyus" )
	exports['srnetwork-menu']:AddButton("🚹 Zorlu" , "" ,'AnimSet:ToughGuy' ,'example button 3' , "yuruyus" )
	exports['srnetwork-menu']:AddButton("🚹 Şımarık" , "" ,'AnimSet:Sassy' ,'example button 3' , "yuruyus" )
	exports['srnetwork-menu']:AddButton("🚹 Üzgün" , "" ,'AnimSet:Sad' ,'example button 3' , "yuruyus" )
	exports['srnetwork-menu']:AddButton("🚹 Serseri" , "" ,'AnimSet:Hobo' ,'example button 3' , "yuruyus" )
	exports['srnetwork-menu']:AddButton("🚹 Zengin" , "" ,'AnimSet:Money' ,'example button 3' , "yuruyus" )
	exports['srnetwork-menu']:AddButton("🚹 Gizemli" , "" ,'AnimSet:Shady' ,'example button 3' , "yuruyus" )
	exports['srnetwork-menu']:AddButton("🚹 Baştan Çıkaran" , "" ,'AnimSet:ManEater' ,'example button 3' , "yuruyus" )
	exports['srnetwork-menu']:AddButton("🚹 Çalımlı" , "" ,'AnimSet:Swagger' ,'example button 3' , "yuruyus" )
	exports['srnetwork-menu']:AddButton("🚗 Araba Motoru Aç/Kapat" , "" ,'arac:kaput' ,'example button 3' , "araba" )
	exports['srnetwork-menu']:AddButton("🚗 Araba Cam Aç/Kapat" , "" ,'arac:cam' ,'example button 3' , "araba" )
	exports['srnetwork-menu']:AddButton("🚗 Araba Neon Aç/Kapat" , "" ,'neon:all' ,'example button 3' , "araba" )	
	exports['srnetwork-menu']:AddButton("🚗 Araba Kaput Aç/Kapat" , "" ,'can:kaput' ,'example button 3' , "araba" )
	exports['srnetwork-menu']:AddButton("🚗 Araba Bagaj Aç/Kapat" , "" ,'can:bagaj' ,'example button 3' , "araba" )
	exports['srnetwork-menu']:AddButton("🚗 Aracı Temizle" , "" ,'st:mechclean' ,'example button 3' , "araba" )
	exports['srnetwork-menu']:AddButton("🎓 Şapka   Giy/Çıkar" , "" ,'darkleaf:sapka' ,'example button 3' , "kiyafet" )
	exports['srnetwork-menu']:AddButton("👓 Gözlük  Giy/Çıkar" , "" ,'darkleaf:gozluk' ,'example button 3' , "kiyafet" )
	exports['srnetwork-menu']:AddButton("🦸‍♂️ Maske  Giy/Çıkar" , "" ,'darkleaf:maske' ,'example button 3' , "kiyafet" )
	exports['srnetwork-menu']:AddButton("👚 Shirt  Giy/Çıkar" , "" ,'darkleaf:shirt' ,'example button 3' , "kiyafet" )
	exports['srnetwork-menu']:AddButton("🦺 Yelek  Giy/Çıkar" , "" ,'darkleaf:yelek' ,'example button 3' , "kiyafet" )
	exports['srnetwork-menu']:AddButton("👖 Pantolon  Giy/Çıkar" , "" ,'darkleaf:pantolon' ,'example button 3' , "kiyafet" )
	exports['srnetwork-menu']:AddButton("🥾 Ayakkabı  Giy/Çıkar" , "" ,'darkleaf:ayakkabı' ,'example button 3' , "kiyafet" )
	exports['srnetwork-menu']:AddButton("🦻🏻 Kulak Aksesuarı  Giy/Çıkar" , "" ,'darkleaf:kulak' ,'example button 3' , "kiyafet" )
	exports['srnetwork-menu']:AddButton("⏱ Saat  Giy/Çıkar" , "" ,'darkleaf:saat' ,'example button 3' , "kiyafet" )
	exports['srnetwork-menu']:AddButton("🔘 Bilezik  Giy/Çıkar" , "" ,'darkleaf:bilezik' ,'example button 3' , "kiyafet" )
	exports['srnetwork-menu']:AddButton("🦹🏼‍♂️ Kolye  Giy/Çıkar" , "" ,'darkleaf:kolye' ,'example button 3' , "kiyafet" )
	exports['srnetwork-menu']:AddButton("📌 Market Blip Ac/Kapat" , "" ,'blips:fantasticMarket' ,'example button 3' , "blip2" )
	exports['srnetwork-menu']:AddButton("📌 Dovmeci Blip Ac/Kapat" , "" ,'blips:fantasticTattoo' ,'example button 3' , "blip2" )
	exports['srnetwork-menu']:AddButton("📌 Kıyafetci Blip Ac/Kapat" , "" ,'blips:fantasticClothes' ,'example button 3' , "blip2" )
	exports['srnetwork-menu']:AddButton("📌 Berber Blip Ac/Kapat" , "" ,'blips:fantasticBarber' ,'example button 3' , "blip2" )
	exports['srnetwork-menu']:AddButton("📌 Benzinci Blip Ac/Kapat" , "" ,'blips:fantasticBenzin' ,'example button 3' , "blip2" )
	exports['srnetwork-menu']:AddButton("📌 Garaj Blip Ac/Kapat" , "" ,'blips:fantasticGaraj' ,'example button 3' , "blip2" )  
	exports['srnetwork-menu']:AddButton("📌 Banka Blip Ac/Kapat" , "" ,'blips:fantasticAtm' ,'example button 3' , "blip2" )
	exports['srnetwork-menu']:AddButton("📌 Mekanik Blip Ac/Kapat" , "" ,'blips:fantasticMekanik' ,'example button 3' , "blip2" )
	exports['srnetwork-menu']:AddButton("📌 Megamall Blip Ac/Kapat" , "" ,'blips:fantasticMegamall' ,'example button 3' , "blip2" )
	exports['srnetwork-menu']:AddButton("📌 Teknoloji Marketi Blip Ac/Kapat" , "" ,'blips:fantasticTeknoloji' ,'example button 3' , "blip2" )
	exports['srnetwork-menu']:AddButton("🎥 Kayıt Yap" , "" ,'darkleaf:kayit' ,'example button 3' , "rockstar" )
	exports['srnetwork-menu']:AddButton("🎥 Editor'u Başlat" , "" ,'darkleaf:baslat' ,'example button 3' , "rockstar" )
	exports['srnetwork-menu']:AddButton("🎥 Editor'u Iptal Et" , "" ,'darkleaf:iptal' ,'example button 3' , "rockstar" )
	exports['srnetwork-menu']:AddButton("🎥 Editor'u Durdur" , "" ,'darkleaf:durdur' ,'example button 3' , "rockstar" )
	exports['srnetwork-menu']:AddButton("🎥 Editor'u Ac" , "" ,'darkleaf:kac' ,'example button 3' , "rockstar" )
	exports['srnetwork-menu']:AddButton("🎥 Editor Tekrar" , "" ,'darkleaf:tekrar' ,'example button 3' , "rockstar" )
    exports['srnetwork-menu']:SubMenu("📋 Belge İşlemleri" , "Kimlik, Ehliyet, Ruhsat" , "kimlik" )
    exports['srnetwork-menu']:SubMenu("🤸🏾‍♂️ Animasyonlar" , "Animasyonları Menü ve İptal" , "animasyon" )
	exports['srnetwork-menu']:SubMenu("👩🏽‍🦼 Omuzlama" , "Sırtlama, Omuzlama" , "kucaklama" )
	exports['srnetwork-menu']:SubMenu("🧥 Kıyafet" , "Kıyafet Menüsü" , "kiyafet" )
	exports['srnetwork-menu']:SubMenu("📌 En Yakın" , "En yakın blipleri işaretler" , "blip" )
	exports['srnetwork-menu']:SubMenu("📌 Blipler" , "Blipleri Ac/Kapat" , "blip2" )
	exports['srnetwork-menu']:SubMenu("📦 Prop" , "Prop Menüyü açar" , "prop" )
	exports['srnetwork-menu']:SubMenu("🚹 Yürüyüş Stilleri" , "Yürüyüş Menüsünü açar" , "yuruyus" )
	exports['srnetwork-menu']:SubMenu("🚗 Araba İşlemleri" , "Araba Menüsünü açar" , "araba" )
	exports['srnetwork-menu']:SubMenu("🎥 Rockstar Editor" , "Oyun ici kayit alir" , "rockstar" )
end)


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Menü Bağlama BİTİŞ --
