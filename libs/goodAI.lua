local goodAI = {}
local checkAll = require "libs/checkAll"

function goodAI.goodness(player,depth,column,trigger)
    local max,i,value,j;
    max = -200
    if (checkAll.checkwin(-player)==1) then return -128 end         --Se la mossa ipotizzata precedentemente ha portato alla vincita dell'avversario ritorna un numero negativo
    if depth==0 then return 0 end                                   --se il numero di iterazioni possibili è giunto a 0
    for i=1,7 do  --col
        for j=6,1,-1 do        --row
            if matrix[j][i]==0 then                                 --Se la cella è vuota ipotizzo una mossa da parte del giocatore
                matrix[j][i]=player
                value=-goodAI.goodness(-player,depth-1,i,-max)/2    --ricorsione
                matrix[j][i]=0                                      --annullo la modifica della matrice precedentemente supposta
                if value>max then max = value end                   --se la mossa ha portato un punteggio più alto delle altre mosse imposto il massimo
                if value > trigger then return max end              --se supero il trigger interrompo la funzione
            end
        end
    end
    return max                                                      --ritorno il valore massimo ottenuto
end

return goodAI                                                       --esporto la funzione