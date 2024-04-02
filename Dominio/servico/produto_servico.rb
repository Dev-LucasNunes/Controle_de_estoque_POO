class ProdutoServico
  @arquivo = "db/produtos.json"
  def self.todos
    dados = JsonRepositorio.ler(@arquivo)
    produtos = []
    if dados
      dados.each do |dado|
        produtos << Produto.new(dado)
      end
    else
      puts "Não foi possível ler os dados do arquivo JSON."
    end
    produtos
  end

  def self.adicionar(produto)
    produto_hash = self.transformar_para_hash(produto)
    dados = JsonRepositorio.adicionar(@arquivo, produto_hash)
  end

  def self.atualizar(produto)
    dados = JsonRepositorio.ler(@arquivo)
    produto_hash = dados.find{|dado| dado["id"] == produto.id}  # Corrigido aqui
    if produto_hash
      produto_hash["nome"] = produto.nome  # Corrigido aqui
      produto_hash["descricao"] = produto.descricao  # Corrigido aqui
      produto_hash["preco"] = produto.preco  # Corrigido aqui
      produto_hash["quantidade"] = produto.quantidade  # Corrigido aqui

      JsonRepositorio.gravar(@arquivo, dados)
    else
      puts "Produto não encontrado para atualizar."
    end
  end


  private
  def self.transformar_para_hash(produto)
    produto.instance_variables.each_with_object({}) do |var, hash|
      hash[var.to_s.delete("@")] = produto.instance_variable_get(var)
    end
  end
end

