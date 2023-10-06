execute store result bossbar countdown value run scoreboard players remove .countdown Time 1
execute unless score .countdown Time matches 1.. run bossbar set countdown visible false
execute unless score .countdown Time matches 1.. run tellraw @a {"text":"Hunters can now start!","color":"blue","bold":true}
execute unless score .countdown Time matches 1.. run function manhunt:load/give-compass
execute if score .countdown Time matches 1.. run schedule function manhunt:loop/countdown 1t