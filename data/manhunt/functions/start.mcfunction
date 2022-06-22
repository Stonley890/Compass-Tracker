execute store result score .countdown Time run scoreboard players get .countdown manhunt-options
execute store result bossbar countdown max run scoreboard players get .countdown manhunt-options
execute store result score @a[team=Runner] RemainingLives run scoreboard players get .lives manhunt-options
bossbar set countdown players @a
bossbar set countdown visible true
tellraw @a {"text":"Runners can now start!","color":"red","bold":true}
function manhunt:loop/countdown