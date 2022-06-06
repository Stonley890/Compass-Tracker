# Initialize
team add Runner
team modify Runner color red
team modify Runner seeFriendlyInvisibles true
team add Hunter
team modify Hunter color blue
team modify Hunter seeFriendlyInvisibles true
scoreboard objectives add hunterDeath deathCount
setblock 0 -64 0 yellow_shulker_box 

# Loop
schedule function manhunt:loop-core 1

# Hello World
function manhunt:load/hw
