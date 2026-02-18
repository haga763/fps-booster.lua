local decalsyeeted = true
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain

sethiddenproperty(l, "Technology", Enum.Technology.Compatibility)
sethiddenproperty(t, "Decoration", false)

t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0

l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0

settings().Rendering.QualityLevel = "Level01"

for _, v in pairs(g:GetDescendants()) do
    if v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif decalsyeeted and v:IsA("Decal") then
        v.Transparency = 1
    end
end

for _, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end

settings().Network.IncomingReplicationLag = 0
setfpscap(60)

print("FPS Boost & Ping Optimizer Applied!")
