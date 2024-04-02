class Produto
  def initialize(produto_hash)
    @id = produto_hash["id"]
    @nome = produto_hash["nome"]
    @descricao = produto_hash["descricao"]
    @preco = produto_hash["preco"]
    @quantidade = produto_hash["quantidade"]
  end

  attr_accessor :id, :nome, :descricao, :preco, :quantidade
end