# Initialize
team add Runner
team modify Runner color red
team modify Runner seeFriendlyInvisibles true
team add Hunter
team modify Hunter color blue
team modify Hunter seeFriendlyInvisibles true
scoreboard objectives add Deaths deathCount
scoreboard objectives add RemainingLives dummy
scoreboard objectives add Time dummy
scoreboard objectives add manhunt-options trigger
scoreboard objectives add Countdown trigger
scoreboard objectives add Lives trigger
scoreboard players set @a Countdown -1
scoreboard players set @a Lives -1
scoreboard players set .countdown manhunt-options 200
scoreboard players set .lives manhunt-options 1
scoreboard players enable @a manhunt-options
scoreboard players enable @a Countdown
scoreboard players enable @a Lives
bossbar add countdown {"text":"Countdown"}
bossbar set countdown visible false
bossbar set countdown max 300
forceload add 0 0
setblock 0 -64 0 yellow_shulker_box 

# Loop
schedule function manhunt:loop/locate 1
schedule function manhunt:loop-core 1

# Hello World
function manhunt:load/hw
