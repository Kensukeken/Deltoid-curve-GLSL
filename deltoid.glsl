float deltoidCurve(vec2 p, float m) {
    float a = 1.;
    float b = 3.;
    float t = atan(p.y, p.x);
    vec2 r = m * vec2((b-a)*cos(t) + a*cos(((b-a)/a)*t), (b-a)*sin(t) - a*sin(((b-a)/a)*t));
    return length(r - p);
}


void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    float timer = iTime*2.;
    vec2 uv = fragCoord.xy / iResolution.xy;
    uv = uv * 5.0 - 2.5;
    uv.x *= iResolution.x / iResolution.y;
    uv = mat2(vec2(cos(timer),-sin(timer)),vec2(sin(timer),cos(timer)))*uv;

    float d = deltoidCurve(uv, abs(sin(iTime)));
    vec3 col = d > 0.5 ? vec3(0,0.5,0.5) : vec3(0,1,1);
    
    fragColor = vec4(col,1.0);
    
}
