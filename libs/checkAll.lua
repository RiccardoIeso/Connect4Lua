--Funzioni per il controllo di tutte le righe/colonne/diagonali presenti
local checkAll = {}
local check = require "libs/check"

--Funzione per il controllo di tutte le righe
function checkAll.checkAllRows(player)
    
    for i=1,6 do
        if(check.checkRow(i,player)==1) then return 1 end
    end
    return 0
end

--Funzione per il controllo di tutte le colonne
function checkAll.checkAllColumns(player)
    for i=1,7 do
        if(check.checkColumn(i,player)==1) then return 1 end
    end
    return 0
end

--Funzion per il controllo delle diagonali presenti nella matrice
function checkAll.checkAllDiagonals(player)
  
    for i=6,4,-1 do
        if(check.checkDiagonal(player,i,1,1)==1) then return 1 end      --[6,1];[5,1];[4,1]
        if(check.checkDiagonal(player,i,7,-1) == 1) then return 1 end   --[6,7];[5,7];[4,7]

    end
    for i=2,4 do
        if(check.checkDiagonal(player,6,i,1)==1) then return 1 end      --[6,2];[6,3];[6,4]
        if(check.checkDiagonal(player,6,2+i,-1)==1) then return 1 end   --[6,4];[6,5];[6,6]
    end
    return 0
end

--Funzione per unire tutti i controlli riguardanti la matrice
function checkAll.checkwin(player)
    local r=checkAll.checkAllRows(player)
    local c=checkAll.checkAllColumns(player)
    local d=checkAll.checkAllDiagonals(player)
    --Nel caso un controllo avesse segnalato una vincita
    if r==1 then return 1 end
    if c==1 then return 1 end
    if d==1 then return 1 end

    return 0
end

return checkAll         --esporto le funzioni