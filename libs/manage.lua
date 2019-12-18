local manage = {}
local getMove = require "libs/getMove"
local checkAll = require "libs/checkAll"
local bestAI = require "libs/bestAI"
local pause = require "libs/sleep"
 

function manage.manageTurn()
    
    if ris==0 and coin >0  then
        if(coin>35) then 
            skill=2 
        else
            skill=1000
        end
    end
    --inserimento silly pc
    if giocatore == 1 then
            
            getMove.getMove(giocatore,math.random(1,7))             --genero numero a caso compreso tra 1,7 e lo inserisco
            coin=coin-1                                             --diminuisco il numero di pedine disponibili
            if(checkAll.checkwin(1)==1) then vittoria = 1   end     --controllo eventuale vincita
            giocatore = giocatore * -1                              --cambio turno giocatore
        
        else

            move=bestAI.bestMove(-1,skill)                          --richiamo il metodo per generare la mossa dell'ai
            getMove.getMove(-1,move)                                --inserisco la mossa
            coin=coin-1                                             --diminuisco numero pedine disponibilie
            if(checkAll.checkwin(-1)==1) then vittoria = 1 end      --controllo eventuale vincita
            giocatore = giocatore * -1                              --cambio turno giocatore
    end

    pause.sleep(1.5)                                               

end

return manage