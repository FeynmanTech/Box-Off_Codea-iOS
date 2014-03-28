local mode = 2

local shader_src = "Documents:Smooth_Ellipse"

noSmooth()
    
function pixMode(str)
    if str == "RETINA" then
        mode = 2
    else
        mode = 1
    end
end

function smoothMode(mode)
    if mode == true then
        shader_src = "Documents:Smooth_Ellipse"
    else
        shader_src = "Documents:Ellipse"
    end
end
    
function pixel(x, y)
    rect(x / mode, y / mode, 1 / mode, 1 / mode)
end

local ellipseMesh = mesh()

--[[
uniform lowp vec4 fillColor;
uniform lowp vec4 strokeColor;

uniform highp vec2 radius;
uniform highp float strokeWidth;
]]
 
ellipse = function(x, y, w, h, r, g, b)
    m = mesh()
    m.texture = CAMERA
    m.shader = shader(shader_src)
    local r, g, b, a = fill()
    m.shader.fillColor = vec4(r / 255, g / 255, b / 255, 1)
    local r, g, b, a = stroke()
    m.shader.strokeColor = vec4(r / 255, g / 255, b / 255, 1)
    m.shader.radius = vec2(161, 161)
    m.shader.strokeWidth = strokeWidth()

    rIdx = m:addRect(0, 0, 0, 0)
    m:setRect(rIdx, x / mode, y / mode, w / mode, h / mode)
    m:draw()
end
