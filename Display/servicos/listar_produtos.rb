require 'bundler/setup'
require 'terminal-table'

def listar_produtos
  limpar_tela
  mensagem_amarelo("==========Lista de produtos==========", false, false)

  # Obtém a lista de produtos
  produtos = ProdutoServico.todos

  # Filtra os produtos para remover aqueles com quantidade zero
  produtos = produtos.reject { |produto| produto.quantidade.zero? }

  # Verifica se a lista de produtos está vazia após a filtragem
  if produtos.empty?
    puts "Não há produtos disponíveis."
  else
    # Cria a tabela com os produtos restantes
    table = Terminal::Table.new do |t|
      t.headings = %w[ID Nome Descrição Preço Quantidade]
      produtos.each do |produto|
        t.add_row [produto.id, produto.nome, produto.descricao, produto.preco, produto.quantidade]
      end
    end

    # Exibe a tabela
    puts table
  end

  mensagem_amarelo("Digite enter para continuar...", false, false)
  gets
  limpar_tela
end
