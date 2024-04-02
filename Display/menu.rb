def iniciar_menu
  loop do
    mensagem_amarelo("==========Escolha uma das opções abaixo==========", false, false)
    mensagem_azul("1 - Cadastro de produtos", false, false)
    mensagem_azul("2 - Lista de produtos", false, false)
    mensagem_azul("3 - Retirada de estoque", false, false)
    mensagem_azul("4 - sair", false, false)

    opcao = gets.to_i

    case opcao
    when  1
      cadastro_produto
    when 2
      listar_produtos
    when 3
      retirar_estoque
    when 4
      limpar_tela
      exit
    else
      mensagem("opção inválida")
    end
  end
end