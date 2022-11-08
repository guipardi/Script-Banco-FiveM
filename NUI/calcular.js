const botoesDepositarSacar = document.querySelectorAll('.botao-depositar-sacar')

botoesDepositarSacar.forEach( (botaoDepositarSacar) => {
  botaoDepositarSacar.addEventListener('click', (e) => {
    e.preventDefault()
    
    if ('botao-depositar-sacar botao-sacar' == e.target.className) {
      $.post("https://bancoFleeca/giveInfos", JSON.stringify({tipo: 'saque', value: parseFloat(form.sacar.value)}))
      form.reset()
      fetch("https://bancoFleeca/closeNui", { method: "POST", headers: { "Content-Type": "application/json" }, data: { action: "Nui fechou" } })
      body.classList.add('body-desativado')

    } else if ('botao-depositar-sacar botao-depositar') {
      $.post("https://bancoFleeca/giveInfos", JSON.stringify({tipo: 'deposito', value: parseFloat(form.depositar.value)}))
      form.reset()
      fetch("https://bancoFleeca/closeNui", { method: "POST", headers: { "Content-Type": "application/json" }, data: { action: "Nui fechou" } })
      body.classList.add('body-desativado')

    }

  })
})
   