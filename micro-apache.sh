#!/usr/bin/env bash

#-------------------------------TESTES-----------------------------------------|

# Verifica se o usiario é administrador do sistema.

[[ "$UID" -ne '0' ]] && { clear ; printf 'E: Execute com root!' ; exit 100 ; }


# Verifica a existencia do apache no sistema

[[ $(which apache2) ]] || { clear ; printf "\033[01;31m E: Apache não esta Instalado. \033[01;31m" ; exit 1 ; }

#------------------------------------------------------------------------------|

# Inicio do programa 
function _init() {

clear ; read -p "
          _   _   _   _   _   _   _   _   _   _   _   _  
         / \ / \ / \ / \ / \ / \ / \ / \ / \ / \ / \ / \ 
        ( M | I | C | R | O | - | A | P | A | C | H | E )
         \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/  
         
                   version 1.0 - by_Microjus

        Escolha uma opção para gerenciar o Webserver Apache

        - 1 - Iniciar o serviço do Apache
        - 2 - Parar o serviço do Apache
        - 3 - Reiniciar o serviço do Apache
        - 4 - Mostrar status do Apache
        - 0 - Sair do menu

[+] " _OPC

case $_OPC in

        1)
                clear ; printf "\033[01;32m Iniciando o serviço do Apache \033[01;32m"
                { sleep 2s ; systemctl start apache2.service ; sleep 2s ; _init ; }
                ;;
        2)
                clear ; printf "\033[01;31m Parando o serviço do Apache \033[01;31m"
                { sleep 2s ; systemctl stop apache2.service ; sleep 2s ; _init ; }
                ;;
        3)
                clear ; printf "\033[01;33m Reiniciando o serviço do Apache \033[01;33m"
                { sleep 2s ; systemctl restart apache2.service ; sleep 2s ; _init ; }
                ;;
        4)
                clear ; printf 'APACHE STATUS'
                { sleep 2s ; systemctl status apache2 ; }
                ;;
        0)
                { clear ; printf 'Saindo...' ; sleep 2s ; exit 0 ; }
                ;;
        *)
                { clear ; printf "\033[01;31mOpção inválida\033[01;31m" ; sleep 2s ; sleep 2s ; _init ; }
                ;;
esac

}

_init
