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

# Variaveis de cores 

yellow=$(tput setaf 3) # Cor amarela
green=$(tput setaf 2) # Cor verde
red=$(tput setaf 1) # Cor vermelha
off=$(tput sgr0) # Sem cor

#-------------------------------TESTES-----------------------------------------|

# Verifica se o usiario é administrador do sistema.

[[ "$UID" -ne '0' ]] && { clear ; printf "${red}E: Execute com root!$off" ; exit 100 ; }


# Verifica a existencia do apache no sistema

[[ $(which apache2) ]] || { clear ; printf "${red}E: Apache não esta Instalado.$off" ; exit 1 ; }

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
        	clear ; printf "${green}Reiniciando o serviço do Apache.$off"
                { sleep 2s ; systemctl restart apache2.service ; sleep 2s ; _init ; }
                ;;
                
        2)
        	clear ; printf "${green}Iniciando serviço do Apache.$off" 
                { sleep 2s ; systemctl start apache2.service ; sleep 2s ; _init ; }
                ;;
                
        3)	
        	clear ; printf "${red}Parando o serviço do Apache.$off"
                { sleep 2s ; systemctl stop apache2.service ; sleep 2s ; _init ; }
                ;;
                
        4)
                clear ; printf "${green}APACHE STATUS$off"
                { sleep 2s ; systemctl status apache2 ; _init ; }
                ;;
                
        0)
        	{ clear ; printf "${green}Saindo...$off" ; sleep 2s ; tput reset ; exit 0 ; }
        	;;
        	
        *)
                { clear ; printf "${red}Opção inválida$off" ; sleep 1s ; _init ; }
                ;;
esac

}

_init
