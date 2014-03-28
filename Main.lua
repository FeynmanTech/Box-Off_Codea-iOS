-- Box-Off

function setup()
    supportedOrientations(ANY)
    displayMode(FULLSCREEN)
    codeSetup()
    function orientationChanged(orient)
        if (WIDTH - 20) / t.sizex < (HEIGHT - 20) / t.sizey then
            t.size = math.floor((WIDTH - 20) / t.sizex)
            else
            t.size = math.floor((HEIGHT - 20) / t.sizey)
        end
    end
end

function draw()
    drawBoard()
end
