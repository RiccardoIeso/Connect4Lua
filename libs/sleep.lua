local pause = {}
clock = os.clock

    function pause.sleep(n)  -- seconds
        local t0 = clock()
        while clock() - t0 <= n do end
    end
return pause