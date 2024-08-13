# Initialize
team add Runner
team modify Runner color red
team modify Runner seeFriendlyInvisibles true
team add Hunter
team modify Hunter color blue
team modify Hunter seeFriendlyInvisibles true
scoreboard objectives add Dimension dummy
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
scoreboard players set .compass-feedback manhunt-options 1
scoreboard players enable @a manhunt-options
scoreboard players enable @a Countdown
scoreboard players enable @a Lives
bossbar add countdown {"text":"Countdown"}
bossbar set countdown visible false

execute in minecraft:overworld run forceload add 0 0
execute in minecraft:the_nether run forceload add 0 0
execute in minecraft:the_end run forceload add 0 0

execute in minecraft:overworld run setblock 0 0 0 yellow_shulker_box
execute in minecraft:the_nether run setblock 0 0 0 yellow_shulker_box
execute in minecraft:the_end run setblock 0 0 0 yellow_shulker_box

data modify storage manhunt:test Item set value {id: "minecraft:compass",count:1,components:{"minecraft:custom_name":'{"color":"aqua","italic":false,"text":"Tracker Compass"}',"minecraft:lodestone_tracker":{target:{dimension:"minecraft:overworld",pos:[0,0,0]},tracked:0b}}}

execute in minecraft:overworld run data modify block 0 0 0 Items append from storage manhunt:test Item
execute in minecraft:the_nether run data modify block 0 0 0 Items append from storage manhunt:test Item
execute in minecraft:the_end run data modify block 0 0 0 Items append from storage manhunt:test Item

# Loop
schedule function manhunt:loop-core 1t
schedule function manhunt:load/recover-compass 1t

# Hello World
function manhunt:load/hw
