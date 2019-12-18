--funzioni per il controllo della vincita nelle righe / colonne / diagonali
local check = {}

--funzione per il controllo nella riga specificata la presenza di 4 pedine vicine dello stesso giocatore
function check.checkRow(n,player)
    local count=0
    for i=1,7 do
        
        elem=matrix[n][i]
        if elem==player then
            count=count+1
            if count==4 then 
                return 1
            end
        else
            count=0
        end
    end

    return 0
end
--funzione per il controllo nellacolonna specificata la presenza di 4 pedine vicine dello stesso giocatore
function check.checkColumn(col,player)
    local count=0
    for i=6,1,-1 do
        local elem=matrix[i][col]
        if elem == player then
            count=count+1
            if count==4 then 
                return 1
            end
        else
            count=0
        end
    end
    return 0
end

--funzione per il controllo nella diagonale specificata attraverso il coefficiente di spostamento
--e la cella di partenza
--la presenza di 4 pedine vicine dello stesso giocatore
function check.checkDiagonal(player,r,c,coeffC)
    local count=0
    while r>0 and c>0 and c<8  do
        elem=matrix[r][c]
        if elem==player then
            count=count+1
            if count==4 then 
                return 1
            end
        else
            count=0
        end
        r=r-1
        c=c+coeffC
    end
    return 0
end

return check