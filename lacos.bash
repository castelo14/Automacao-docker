#! /bin/bash

function verificar_conflito() {

    local arquivo="$1"
    if grep -q -E '<<<<<<<|=======|>>>>>>>' "$arquivo"; then
        echo "O arquivo $arquivo contem marcação de conflito"
    fi
}

 
#directorio=$1

#funcao recursiva

#function verificar_directorio() {
    
#    local directorio="$1"
#    local arquivo

#    for arquivo in "$directorio"/*; do
#        if [ -f "$arquivo" ]; then
#            verificar_conflito "$arquivo"

#        elif [ -d "$arquivo" ]; then
#            verificar_directorio "$arquivo"
#        fi
#    done  
#}


function verificar_directorio() {
    
    local directorio="$1"
    local arquivo
    local arquivos=("$directorio"/*)
    local i=0

    #faz a contagem da quantidade de arquvos
    while [ $i -lt ${#arquivos[@]} ]; do
        arquivo="${arquivos[$i]}"
        if [ -f "$arquivo" ]; then
            verificar_conflito "$arquivo"

        elif [ -d "$arquivo" ]; then
            verificar_directorio "$arquivo"
        fi
        ((i++))
    done  
}
#verifica a quantidade de parametro passada pelo user
if [  $# -ne 1 ]; then
    echo "Uso: $0 <directorio> "
    exit 1
fi


verificar_directorio "$1"

