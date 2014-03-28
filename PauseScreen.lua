function pauseScreen()
    fill(0, 0, 0, 194)
    stroke(0, 0, 0, 109)
    strokeWidth(10)
    rect(screenx, screeny, endx - 100, endy - 100)
    
    fill(255, 255, 255, 255)
    
    textAlign(CENTER)
    text("BOX-OFF Version " .. VER .. "\n\nPAUSED", WIDTH / 2, endy - 70)
    textAlign(LEFT)
    
    text(DESC, WIDTH / 2, HEIGHT / 2)
    text("Resume", WIDTH / 2, screeny + 35)
end
