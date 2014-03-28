//
// Renders a stroked ellipse
//

//Default precision qualifier
precision highp float;

//This represents the current texture on the mesh
uniform lowp sampler2D texture;

//The interpolated texture coordinate for this fragment
varying highp vec2 vTexCoord;

//Ellipse parameters
uniform lowp vec4 fillColor;
uniform lowp vec4 strokeColor;

uniform highp vec2 radius;
uniform highp float strokeWidth;

void main()
{
    highp vec2 RadiusAA = vec2(radius.x - 2.0, radius.y - 2.0);
    
    highp vec2 scaledPointSq = vec2( (vTexCoord.x * radius.x) *
    (vTexCoord.x * radius.x),
    (vTexCoord.y * radius.y) *
    (vTexCoord.y * radius.y) );
    
    highp float c = (scaledPointSq.x / (radius.x*radius.x)) +
    (scaledPointSq.y / (radius.y*radius.y));
    
    highp float cAA = (scaledPointSq.x / (RadiusAA.x*RadiusAA.x)) +
    (scaledPointSq.y / (RadiusAA.y*RadiusAA.y));
    
    highp vec2 innerRadius = vec2( radius.x - strokeWidth * 2.0,
    radius.y - strokeWidth * 2.0 );
    
    highp vec2 innerRadiusAA = vec2( radius.x - strokeWidth * 2.0 - 2.0,
    radius.y - strokeWidth * 2.0 - 2.0 );
    
    highp float cInner = (scaledPointSq.x / (innerRadius.x*innerRadius.x)) +
    (scaledPointSq.y / (innerRadius.y*innerRadius.y));
    
    highp float cInnerAA = (scaledPointSq.x /
    (innerRadiusAA.x*innerRadiusAA.x)) +
    (scaledPointSq.y /
    (innerRadiusAA.y*innerRadiusAA.y));
    
    //Premult
    lowp vec4 fragCol = mix( fillColor, strokeColor,
    smoothstep( cInner / cInnerAA, 1.0, cInner ) );
    
    gl_FragColor = mix( fragCol, vec4(0,0,0,0),
    smoothstep( c / cAA, 1.0, c ) );
}
