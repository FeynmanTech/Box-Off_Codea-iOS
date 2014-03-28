function codeSetup()
--#####GLOBALS#####
VER = "7.5.0"
DESC = [[
Rules:
Drag to select tiles
To remove a pair of tiles, they must be of the same color, 
and there must be no other tiles in between them.
The goal of the game is to remove all the tiles.
]]

--#####MISC#####
function math.round(num)
    if num - math.floor(num) < 0.5 then
        return math.floor(num)
    else
        return math.ceil(num)
    end
end

--#####TILES#####
--Tile Info Table
t = {}

--Size
t.sizex = 6
t.sizey = 4

--Colors
t.colors = {
    color(255, 0, 0),
    color(255, 255, 255),
    color(0, 0, 0)
}

t.types = #t.colors

--Tile Table
t.tiles = {}
    
valid = false --Solvable

-- Board Setup
function loadBoard()
    local valid = true --Is it valid?
    local tiles = {} -- Tile colors table: used to count number of each type of tile
    for y = 1, t.sizey do
        t.tiles[y] = {} -- Horizontal arrays
        for x = 1, t.sizex do
            local n = math.random(t.types) -- Random color of tile
            t.tiles[y][x] = n -- Set tile
            tiles[n] = tiles[n] and tiles[n] + 1 or 1 -- Add 1 to number of tiles of type n
        end
    end
        
    -- Get tile box size
    if (WIDTH - 20) / t.sizex < (HEIGHT - 20) / t.sizey then
        t.size = math.floor((WIDTH - 20) / t.sizex)
    else
        t.size = math.floor((HEIGHT - 20) / t.sizey)
    end

    -- Validity check
    for k = 1, t.types do
        if math.floor(tiles[k] / 2) * 2 ~= tiles[k] then -- If number of tiles of type k == odd
            valid = false -- Invalid board!
        end
    end
    if valid == false then return loadBoard() end -- If not a valid board then recurse!
    return true
end
valid = loadBoard()

strokeWidth(0.5) -- For Retina display, set to 1 if regular display
displayMode(FULLSCREEN) -- Set display mode

fontSize(35) -- Font size

font("HelveticaNeue-UltraLight") -- Should be fairly thin, small: set to HelveticaNeue-Light if not retina

--#####UI#####
selecting = false
active = true
screenx, screeny = 100, 100
endx, endy = WIDTH - 100, HEIGHT - 100
t.currentx, t.firstx, t.currenty, t.firsty = 0, 0, 0, 0
end
