
local bestAI = require "libs/bestAI" --modulo per per l'AI
local checkAll = require "libs/checkAll"-- modulo per il controllo della vittoria
local pause = require "libs/sleep" -- modulo per l'esecuzione della funzione di wait
local manage = require "libs/manage" --gestisce la turnazione dei giocatori 
local initialize = require "libs/initialize" --inizializza il campo di gioco
local center = require "libs/center"
local splashy = require 'libs/splashy'


function love.load() --inizializza i parametri 
    
    min_dt = 1/2 --fps
    love.window.setTitle( '4 IN A ROW' )
    icon = love.image.newImageData( 'img/icon.ico' )
    success = love.window.setIcon(icon)
    next_time = love.timer.getTime()
    c4 = love.graphics.newImage("img/fourinarow.png")
    voidCell = love.graphics.newImage("img/null.png") 
    redCell = love.graphics.newImage("img/red.png")
    yellowCell = love.graphics.newImage("img/yellow.png")
    font = love.graphics.newFont('font/neuropolitical rg.ttf', 20, 'normal')
    decoder = love.sound.newDecoder( 'audio/tetris.mp3', 2048 )
    sound = love.audio.newSource(decoder)    
    --splashy.addSplash(love.graphics.newImage('img/love.png'))
    --splashy.onComplete(function() print("Hurray! This runs once after the splash screens are over.") end) -- Runs the argument once all splashes are done.
    center:setupScreen(700, 700)
    center:setBorders(80,0,0,0)
    center:apply()
    vittoria = 0
    giocatore = -1
    splashy.onComplete(function() print('Game starts now!')end)
    initialize.initialize_board()
end

function love.update(dt) --esegue costantemente le operazioni al suo interno 
    splashy.update(dt)
    win=0
    math.randomseed(os.time())
    coin=40
    ris=0;
    if vittoria == 0 then manage.manageTurn() end
end

function love.draw() --stampa i componenti del campo di gioco
    splashy.draw()
    local i,j
    local posx=0
    local posy=0
    local textx = 30
    local texty = 100

    
    love.audio.play(sound)
    love.graphics.setFont(font)
    center:start()
    for i=1,6 do
        for j=1,7 do
            if matrix[i][j] == 0 then love.graphics.draw(voidCell,posx,posy)  end
            if matrix[i][j] == 1 then love.graphics.draw(redCell,posx,posy)  end 
            if matrix[i][j] == -1 then love.graphics.draw(yellowCell,posx,posy)  end
            posx = posx + 100
        end
        posx = 0
        posy = posy + 100
    end

    center:finish()

    if giocatore == 1 then love.graphics.printf("IA PC:", 275, 20, 100,"center") end
    if giocatore == -1 then love.graphics.printf("Silly PC:", 275, 20, 100, "center") end

    love.graphics.printf("Press R to Restart, ESC to Quit", 133, 620, 390, "center")
    --love.graphics.printf("Press ESC to Quit", 0, 540, 300, "left")


    if(checkAll.checkwin(1)==1) then love.graphics.printf("Silly PC wins!", 275, 20, 100, 'center')
        love.audio.stop() end
    if(checkAll.checkwin(-1)==1) then love.graphics.printf("IA PC wins!", 275, 20, 100, 'center') 
        love.audio.stop() end
    

end



function love.resize(width, height)
    center:resize(width, height)
    center:setBorders(top, right, bottom, left)
    
  end

  function love.keypressed(k)
    if vittoria == 1 and k == 'escape' then
       love.event.quit()
    elseif vittoria == 1 and k == 'r' then
        love.load()   
    end

    if key == 'm' then
        love.audio.stop(sound)
    end
    if  key == 'l' then 
       splashy.skipSplash()
    end
 end
