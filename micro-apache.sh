#!/usr/bin/env bash

#------------------------------CABEÇALHO---------------------------------------|
#
# AUTOR:             | Microjus <microjus.oficial@gmail.com>
# URL:               | https://github/Microjus/Micro-Apache/ 
# DATA:              | 2022-03-02
# PROGRAMA:          | Micro-Apache
# VERSÃO:            | final
# LICENÇA:           | GPL3
# DESCRIÇÃO:         | Desenvolvido para fins didaticos 
#		       porem util e pode ser utilizado 
#		       por qualqer tipo de usuario.
                     
                     
#------------------------------VARIAVEIS---------------------------------------|

declare -r ROOT_UID=0    # Somente usuários com $UID 0 têm privilégios de administrador.
declare -r NOT_ROOT=87   # Codigo de saida de erro para usuarios nao administrador.
declare -r NOT_FOUND=404 # Codigo de saidade  erro para programa nao encontrado.

# Variaveis de cores 

yellow=$(tput setaf 3) # Cor amarela
green=$(tput setaf 2) # Cor verde
red=$(tput setaf 1) # Cor vermelha
off=$(tput sgr0) # Sem cor

#-------------------------------TESTES-----------------------------------------|

# Verifica se o usiario é administrador do sistema.

[[ "$UID" -ne "$ROOT_UID" ]] && { printf "\033cE: Execute como adminstrador." ; exit $NOT_ROOT ; }

# Verifica a existencia do apache no sistema

[[ $(which apache2) ]] || { clear ; printf 'E: Apache não esta Instalado!' ; exit $NOT_FOUND ; }


#------------------------------------------------------------------------------|

#-------------------------------FUNÇOẼS----------------------------------------|

# Funçao de encerramento do programa ao pressionar CTRL C

trap ctrl_c INT ; ctrl_c() {

printf "\033c
[+] (Ctrl + C ) Detectado, Tentativa de saida ...\n
[+] Encerrando serviços , Aguarde  ...\n
[+] Obrigado por usar este programa  =)\n" ; exit 1 
}

#------------------------------------------------------------------------------|

# Inicio do programa 

function _init() {

tput civis ; clear ; read -p "${yellow}
          _   _   _   _   _   _   _   _   _   _   _   _  
         / \ / \ / \ / \ / \ / \ / \ / \ / \ / \ / \ / \ 
        ( M | I | C | R | O | - | A | P | A | C | H | E )
         \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/
         
		   version 1.0 - by_Microjus
			
	Escolha uma opção para gerenciar o Webserver Apache

	- 1 - Reiniciar o serviço do Apache
	- 2 - Iniciar o serviço do Apache
	- 3 - Parar o serviço do Apache
	- 4 - Mostrar status do Apache
	- 0 - Sair do menu

[+] ${off}" _OPC

case $_OPC in

        1)
        	printf "\033c${green}Reiniciando o serviço do Apache.$off"
                { sleep 2s ; systemctl restart apache2.service ; sleep 2s ; _init ; }
                ;;
                
        2)
        	printf "\033c${green}Iniciando serviço do Apache.$off" 
                { sleep 2s ; systemctl start apache2.service ; sleep 2s ; _init ; }
                ;;
                
        3)	
        	printf "\033c${red}Parando o serviço do Apache.$off"
                { sleep 2s ; systemctl stop apache2.service ; sleep 2s ; _init ; }
                ;;
                
        4)
                printf "\033c${green}APACHE STATUS$off"
                { sleep 2s ; systemctl status apache2 ; _init ; }
                ;;
                
        0)
        	{ printf "\033c${green}Saindo...$off" ; sleep 2s ; tput reset ; exit 0 ; }
        	;;
        	
        *)
                { printf "\033c${red}Opção inválida$off" ; sleep 1s ; _init ; }
                ;;
esac

}

_init
