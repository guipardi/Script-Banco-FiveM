var body = document.querySelector('body')

var saldoBanco;
var saldoCarteira;
 
window.addEventListener('message', (event) => {
  saldoCarteira = event.data.money
  saldoBanco = event.data.bankMoney

  document.querySelector('.banco-p').textContent = parseFloat(saldoBanco)
  document.querySelector('.carteira-p').textContent = parseFloat(saldoCarteira)

  if (event.data.active == true) {
    body.classList.remove('body-desativado')
  }
})

document.onkeyup = function(data) {
  if (data.which == 27) {
    fetch("https://bancoFleeca/closeNui", { method: "POST", headers: { "Content-Type": "application/json" }, data: { action: "Nui fechou" } })
    toMain()
    body.classList.add('body-desativado')
  }
};
 