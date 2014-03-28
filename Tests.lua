local debug = false

local _print = print

local print = function(...)
    if debug == true then
        _print(...)
    end
end

function testBounds(c1, c2, x1, y1, x2, y2)
    return c1 >= x1 and c1 <= x2 and c2 >= y1 and c2 <= y2
end
    
function validityTest(x1, y1, x2, y2)
    local a, b, c, d = x1, y1, x2, y2
    if x1 == x2 and y1 == y2 then
        print("Identical coords")
        return false 
    end
        
    if x1 >= x2 then
        x1, x2 = x2, x1
    end
    if y1 >= y2 then
        y1, y2 = y2, y1
    end
    
    local col1 = t.tiles[b][a]
    local col2 = t.tiles[d][c]
    
    if col1 ~= col2 then
        print("Color mismatch!")
        return false
    end
    
    for x = x1, x2 do
        for y = y1, y2 do
            if t.tiles[y][x] ~= 0 and not((x == a and y == b) or (x == c and y == d)) then
                print("Tile found at " .. x .. ", " .. y .. " (color: " .. t.tiles[y][x] .. ")")
                return false
            end
        end
    end
    
    t.tiles[b][a] = 0
    t.tiles[d][c] = 0
    
    print(a, b, c, d)
    
end
