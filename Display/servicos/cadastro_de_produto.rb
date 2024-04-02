def cadastro_produto
  mensagem("Iniciando cadastro de produto...", true, true, 1)
  mensagem("Digite o nome do produto: ", false, false)
  nome = gets.chomp.to_s
  limpar_tela

  mensagem_azul("Digite a descrição do produto (#{verde(nome)}): ", false, false)
  descricao = gets.chomp.to_s
  limpar_tela

  mensagem_azul("Digite o preço do produto (#{verde(nome)}): ", false, false)
  preco = gets.to_f
  limpar_tela

  mensagem_azul("Digite a quantidade em estoque do produto (#{verde(nome)}): ", false, false)
  quantidade_em_estoque = gets.to_i
  limpar_tela

  #hash de produtos
  id = Time.now.to_i
  p = Produto.new({
    "id" => id,
    "nome" => nome,
    "descricao" => descricao,
    "preco" => preco,
    "quantidade" => quantidade_em_estoque
  })

  ProdutoServico.adicionar(p)

  mensagem("O produto #{verde(nome)} foi cadastrado com sucesso", true, true, 1)
  mensagem_amarelo("Digite enter para continuar...", false, false)
  gets
  limpar_tela
end