# Give compasses to hunters
function manhunt:load/give-compass

# Start countdown
scoreboard players set .countdown Time 300
bossbar set countdown players @a
bossbar set countdown visible true
execute unless score .countdown Time matches 1.. run tellraw @a {"text":"Runners can now start!"}
function manhunt:loop/countdown