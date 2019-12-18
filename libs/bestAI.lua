
local bestAI = {}
local goodAI = require "libs/goodAI"
--Funzione per la scelta del movimento dell'AI attraverso l'algoritmo MIN MAX
function bestAI.bestMove(player,skill)

    max=-100                
    best=-1                             
    res={}
    for i=1,7 do
        for j=6,1,-1 do
            if matrix[j][i] ==0 then    
                matrix[j][i]=player                                     --ipotizzo una mossa
                value= (-1)*goodAI.goodness(-player,skill,i,200)        --stimo il punteggio della mossa e delle sue relative conseguenze
                res[i]=value;                                           --salvo il punteggio della mossa ottenuto
                matrix[j][i]=0                                          --annullo la mossa ipotizzata
                if(value>max) then                          
                    max=value                                           --aggiorno massimo punteggio ottenut
                    best=i                                              --aggiorno posizione dove inserire prossima pedina
                end
            end
        end
    end
    if best==-1 then                                                    --se non è stata ottenuta nessuna mossa positiva
        for r=1,6 do                                                    --cerco la prima casella vuota dispoonibile
            for c=1,7 do if matrix[r][c] then return c end end
        end
    end
    return best                                                         
end

return bestAI