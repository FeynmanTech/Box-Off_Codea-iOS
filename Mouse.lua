rsx, rsy = 118, 41
    
touched = function(touch)
    if active then
        if touch.state == BEGAN and --[
        math.floor(touch.x / t.size) <= t.sizex - 1 and -- IF
        math.floor(touch.y / t.size) <= t.sizey - 1 
        and not(touch.x > WIDTH - 200 and touch.y > HEIGHT - 50) then --]
            
            t.firstx = math.floor(touch.x / t.size)
            t.firsty = math.floor(touch.y / t.size)
            t.currentx = math.floor(touch.x / t.size)
            t.currenty = math.floor(touch.y / t.size)
            selecting = true
            elseif touch.state == ENDED and selecting and not(touch.x > WIDTH - 200 and touch.y > HEIGHT - 50) then
            t.secondx = math.floor(touch.x / t.size)
            t.secondy = math.floor(touch.y / t.size)
            validityTest(t.firstx + 1, t.firsty + 1, t.currentx + 1, t.currenty + 1)
            selecting = false
            --print(touch.x, touch.y)
            
            elseif touch.x > WIDTH - 100 and touch.y > HEIGHT - 50 and touch.state == ENDED and not(selecting) then
            valid = loadBoard()
            
            elseif testBounds(touch.x, touch.y, WIDTH - 200, HEIGHT - 50, WIDTH - 150, HEIGHT) and not(selecting) and touch.state == ENDED then
            
            t.sizex = t.sizex + 2
            t.sizey = t.sizey + 2
            valid = loadBoard()
            
            elseif testBounds(touch.x, touch.y, WIDTH - 150, HEIGHT - 50, WIDTH - 100, HEIGHT) and not(selecting) and touch.state == ENDED and t.sizex > 2 and t.sizey > 2 then
            
            t.sizex = t.sizex - 2
            t.sizey = t.sizey - 2
            valid = loadBoard()
            
            elseif testBounds(touch.x, touch.y, WIDTH - 250, HEIGHT - 50, WIDTH - 200, HEIGHT) and not(selecting) and touch.state == ENDED then
            active = false
            
            else
            t.currentx = math.floor(touch.x / t.size)
            t.currenty = math.floor(touch.y / t.size)
        end
    else
        if testBounds(touch.x, touch.y, WIDTH / 2 - rsx / 2 - 10, 135 - rsy / 2 - 10, WIDTH / 2 + rsx / 2 + 10, 135 + rsy / 2 + 10) then
            active = true
        end
    end
end
