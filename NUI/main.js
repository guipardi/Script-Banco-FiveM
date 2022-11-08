var botoes = document.querySelectorAll('.botao')
var form = document.querySelector('.form')

for (let j = 0; j < botoes.length; j++) {
  let botao = botoes[j]

  botao.addEventListener('click', (event) => {

    let childrens = botao.parentElement.children

    for (let i = 0; i < childrens.length; i++) {
      let children = childrens[i]
      children.classList.add('desativado')
    }

    form.style.display = 'flex'

  })
}



var toMain = () => {
  for (let i = 0; i < botoes.length; i++) {
    let botao = botoes[i]
    let childrens = botao.parentElement.children

    for (let j = 0; j < childrens.length; j++) {
      let children = childrens[i]
      children.classList.remove('desativado')
    }

    form.style.display = 'none'
  }
}
