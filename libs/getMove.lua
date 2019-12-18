--Metodo per l'inserimento di una pedina nella matrice
local getMove = {}

function getMove.getMove(player,col)
    for i=6,1,-1 do         --Partendo dal basso cerco la prima casella vuota dove inserire il disco
        if matrix[i][col]==0 then       --se la cella è vuota
            matrix[i][col]=player       --inserisco l'identificativo del giocatore
            break
        end
    end
end

return getMove                          --esporto la funzione