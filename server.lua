local Proxy = module('vrp', 'lib/Proxy')
local vRP = Proxy.getInterface('vRP')

local Tunnel = module('vrp', 'lib/Tunnel')
local vRPclient = Tunnel.getInterface('vRP')


TabelaDinheiro = {}

Tunnel.bindInterface('tabela', TabelaDinheiro)  


function TabelaDinheiro.money()
  local userId = vRP.getUserId(source)
  local money = vRP.getMoney(userId)

  return money
end

function TabelaDinheiro.bankMoney()
  local userId = vRP.getUserId(source)
  local bankMoney = vRP.getBankMoney(userId)
  
  return bankMoney
end 


RegisterNetEvent('dispararInfo', function(tipo, value)
  local userId = vRP.getUserId(source) 
 
  if tipo == 'deposito' then
    if value == nil or value <= 0 or value > vRP.getMoney(userId) then
      vRPclient._notify(source, 'Negado, seu saldo é insuficiente')
    
    else 
      vRP.tryDeposit(userId, value)
      vRPclient._notify(source, 'Sucesso, voce depositou '..value..'$ reais')

    end
  
  elseif tipo == 'saque' then 
    if value == nil or value <= 0 or value > vRP.getBankMoney(userId) then
      vRPclient._notify(source, 'Negado, seu saldo bancário insuficiente')
    
    else 
      vRP.tryWithdraw(userId, value)
      vRPclient._notify(source, 'Sucesso, voce sacou '..value..'$ reais')
    end

  end
end)
