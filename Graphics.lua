pixMode("STANDARD")

--resetButtonTextWidth, resetButtonTextHeight = textSize("Reset")
    
function drawBoard()
    
    background(255)
    stroke(0, 0, 0, 255)
    
    strokeWidth(0.5)
    
    local currentx, firstx, currenty, firsty = t.currentx, t.firstx, t.currenty, t.firsty
    if currentx < firstx then
        currentx, firstx = firstx, currentx
    end
    if currenty < firsty then
        currenty, firsty = firsty, currenty
    end
    
    for x = 0, t.sizex - 1 do
        for y = 0, t.sizey - 1 do
            fill(255)
            
            if selecting then
                
                if x == t.currentx and y == t.currenty then
                    fill(127, 127, 127, 255)
                elseif x >= firstx and x <= currentx and y >= firsty and y <= currenty then
                    fill(139, 224, 132, 255)
                end
            end
            
            rect(
                x * t.size + 10, y * t.size + 10, 
                t.size - 1, t.size - 1
            )
            
            if not(t.tiles[y + 1][x + 1] == 0) then
            
                fill(
                    t.colors[t.tiles[y + 1][x + 1]]
                )
            
                ellipse(
                    x * t.size + t.size / 2 + 10, y * t.size + t.size / 2 + 10, 
                    t.size - 10, t.size - 10
                )
            end
        end
    end
    
    noStroke()
    fill(127, 127, 127, 73)
    
    rect(WIDTH - 100, HEIGHT - 50, 100, 50)
    fill(255, 0, 0, 73)
    rect(WIDTH - 150, HEIGHT - 50, 50, 50)
    fill(0, 255, 0, 73)
    rect(WIDTH - 200, HEIGHT - 50, 50, 50)
    fill(127, 127, 127, 73)
    rect(WIDTH - 250, HEIGHT - 50, 50, 50)
    fill(0, 0, 0, 255)
    --fontSize(35)
    text("Reset", WIDTH - 50, HEIGHT - 25)

    text("-1", WIDTH - 125, HEIGHT - 25)
    text("+1", WIDTH - 175, HEIGHT - 25)
    text("P", WIDTH - 225, HEIGHT - 25)
    text(valid and "SOLVABLE" or "UNSOLVABLE", WIDTH / 2, HEIGHT - 25)
    if not active then
        pauseScreen()
    end
    
end
