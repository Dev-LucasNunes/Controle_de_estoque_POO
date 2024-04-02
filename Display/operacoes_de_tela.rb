def mensagem(msg, usar_limpar_tela = true, usar_timer = true, timer=5)
  limpar_tela if usar_limpar_tela
  puts msg
  sleep(timer) if usar_timer
  limpar_tela if usar_limpar_tela
end

def mensagem_verde(msg, usar_limpar_tela = true, usar_timer = true, timer=5)
  msg = verde(msg)
  mensagem(msg, usar_limpar_tela, usar_timer, timer)
end

def mensagem_vermelho(msg, usar_limpar_tela = true, usar_timer = true, timer=5)
  msg = vermelho(msg)
  mensagem(msg, usar_limpar_tela, usar_timer, timer)
end

def mensagem_amarelo(msg, usar_limpar_tela = true, usar_timer = true, timer=5)
  msg = amarelo(msg)
  mensagem(msg, usar_limpar_tela, usar_timer, timer)
end

def mensagem_azul(msg, usar_limpar_tela = true, usar_timer = true, timer=5)
  msg = azul(msg)
  mensagem(msg, usar_limpar_tela, usar_timer, timer)
end

def verde(msg)
  "\e[38;2;0;255;0m#{msg}\e[0m"
end

def vermelho(msg)
  "\e[38;2;255;0;0m#{msg}\e[0m"
end

def amarelo(msg)
  "\e[38;2;255;255;0m#{msg}\e[0m"
end

def azul(msg)
  "\e[38;2;51;153;255m#{msg}\e[0m"
end
def limpar_tela
  if Gem.win_platform?
    system("cls") #no windows
  else
    system("clear") #unix/linux
  end
end