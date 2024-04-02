def retirar_estoque
  limpar_tela

  mensagem_amarelo("==========Escolha um dos produtos abaixo==========", false, false)

  table = Terminal::Table.new do |t|
    t.headings = %w[ID Nome Quantidade]
    ProdutoServico.todos.each do |produto|
      t.add_row [produto.id, produto.nome, produto.quantidade]
    end
  end

  puts table

  mensagem_azul("Digite o ID do produto:", false, false)
  id = gets.to_i
  produto = ProdutoServico.todos.find { |p| p.id == id }
  unless produto
    mensagem_vermelho("Produto do ID (#{id}) não encontrado na lista", false, false, 2)
    mensagem_amarelo("Deseja digitar novamente? (s/n)", false, false, 2)
    opcao = gets.chomp.downcase
    limpar_tela
    if opcao == "s" || opcao == "sim"
      retirar_estoque
    end
    return
  end

  limpar_tela
  mensagem_azul("Digite a quantidade que deseja retirar do estoque do produto #{amarelo(produto.nome)}:", false, false)
  quantidade_retirada = gets.to_i

  if quantidade_retirada > produto.quantidade
    mensagem_vermelho("Quantidade retirada não pode ser maior que a quantidade em estoque.", false, false, 2)
    mensagem_amarelo("Deseja tentar novamente? (s/n)", false, false, 2)
    opcao = gets.chomp.downcase
    limpar_tela
    if opcao == "s" || opcao == "sim"
      retirar_estoque
    end
    return
  end

  produto.quantidade -= quantidade_retirada

  ProdutoServico.atualizar(produto)

  if produto.quantidade.zero?
    # Se a quantidade se tornar zero após a atualização, remove o produto do arquivo JSON
    dados = JsonRepositorio.ler(ProdutoServico.instance_variable_get(:@arquivo))
    dados.reject! { |dado| dado["id"] == produto.id }
    JsonRepositorio.gravar(ProdutoServico.instance_variable_get(:@arquivo), dados)
  end

  mensagem_verde("Retirada realizada com sucesso", true, true, 2)
  listar_produtos
end
