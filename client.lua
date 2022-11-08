local Tunnel = module('vrp', 'lib/Tunnel')
local vRP = Tunnel.getInterface("vRP")


local bancoCoords = vec3(161.87, -1040.18, 28.33)
local onNui = false
local tabela = Tunnel.getInterface("tabela")

Citizen.CreateThread(function()
  while true do  
    DrawMarker(
      27, 
      bancoCoords, 
      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
      5.0, 5.0, 5.0, 
      255, 0, 0, 255, 
      false, false, false, true
    )

    Citizen.Wait(0)
  end
end)

Citizen.CreateThread(function()
  while true do
    local pedCoords = GetEntityCoords(PlayerPedId())
    local distance = #(pedCoords - bancoCoords)
 
    if distance < 3.5 and IsControlJustPressed(0, 38) then

      saldoCarteira = tabela.money()
      saldoBanco = tabela.bankMoney() 
 
      SendNUIMessage({
        money = saldoCarteira,
        bankMoney = saldoBanco,
        active = true
      }) 

      SetNuiFocus(true, true)
    end

    Citizen.Wait(0)
  end
end)

--[=[ function abrirNUI()
  onNui = not onNui --[[ Inverte o valor da variável ]]

  if onNui then 
    SetNuiFocus(true, true)

    SendNUIMessage({
      active = true
    })
  else 
    SetNuiFocus(false)
    SendNUIMessage({
      active = false
    })
  end
end ]=]

RegisterNUICallback('closeNui', function(data)
 --[[  print(json.encode(data))
  print(json.encode(cb)) ]]

  SetNuiFocus(false, false)
  SendNUIMessage({
    active = false
  })
end)


RegisterNUICallback("giveInfos", function(data)
  TriggerServerEvent('dispararInfo', data.tipo, data.value)
end)

RegisterNUICallback('att', function(data)
  SendNUIMessage({
    active = data.active
  })
end)