local initialize = {}
--funzione per initializzare la matrice di gioco vuota
function initialize.initialize_board()
    local i,j        
    matrix={}
    for i=1,6 do
        matrix[i]={}
        for j=1,7 do
            matrix[i][j] = 0
        end
    end
end

return initialize