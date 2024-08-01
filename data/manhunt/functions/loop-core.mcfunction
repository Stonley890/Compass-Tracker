# Update compasses
function manhunt:loop/detect_dimension

# If holding compass, replace with updated compass
execute as @a[team=Hunter] at @s in minecraft:overworld if entity @s[nbt={SelectedItem:{id:"minecraft:compass",count:1,components:{"minecraft:item_name":'{"color":"aqua","italic":false,"text":"Tracker Compass"}'}}}] if entity @a[team=Runner,distance=0..] run item replace entity @s weapon.mainhand from block 0 0 0 container.0
execute as @a[team=Hunter] at @s in minecraft:the_nether if entity @s[nbt={SelectedItem:{id:"minecraft:compass",count:1,components:{"minecraft:item_name":'{"color":"aqua","italic":false,"text":"Tracker Compass"}'}}}] if entity @a[team=Runner,distance=0..] run item replace entity @s weapon.mainhand from block 0 0 0 container.0
execute as @a[team=Hunter] at @s in minecraft:the_end if entity @s[nbt={SelectedItem:{id:"minecraft:compass",count:1,components:{"minecraft:item_name":'{"color":"aqua","italic":false,"text":"Tracker Compass"}'}}}] if entity @a[team=Runner,distance=0..] run item replace entity @s weapon.mainhand from block 0 0 0 container.0

execute as @a[team=Hunter] at @s in minecraft:overworld if entity @s[nbt={SelectedItem:{id:"minecraft:compass",count:1,components:{"minecraft:item_name":'{"color":"aqua","italic":false,"text":"Tracker Compass"}'}}}] if score .endgame-active manhunt-options matches 1 run item replace entity @s weapon.mainhand from block 0 0 0 container.0
execute as @a[team=Hunter] at @s in minecraft:the_nether if entity @s[nbt={SelectedItem:{id:"minecraft:compass",count:1,components:{"minecraft:item_name":'{"color":"aqua","italic":false,"text":"Tracker Compass"}'}}}] if score .endgame-active manhunt-options matches 1 run item replace entity @s weapon.mainhand from block 0 0 0 container.0
execute as @a[team=Hunter] at @s in minecraft:the_end if entity @s[nbt={SelectedItem:{id:"minecraft:compass",count:1,components:{"minecraft:item_name":'{"color":"aqua","italic":false,"text":"Tracker Compass"}'}}}] if score .endgame-active manhunt-options matches 1 run item replace entity @s weapon.mainhand from block 0 0 0 container.0

# Lives
execute as @a[team=Runner,scores={Deaths=1..}] run scoreboard players remove @s RemainingLives 1
execute as @a[team=Runner,scores={Deaths=1..,RemainingLives=2..}] run tellraw @a [{"selector":"@s","color":"gold"},{"text":" has "},{"score":{"name":"@s","objective":"RemainingLives"}},{"text":" lives left."}]
execute as @a[team=Runner,scores={Deaths=1..,RemainingLives=1}] run tellraw @a [{"selector":"@s","color":"red"},{"text":" has only one life left."}]
execute as @a[team=Runner,scores={Deaths=1..,RemainingLives=0}] run tellraw @a [{"selector":"@s","color":"red"},{"text":" has no more lives."}]
execute as @a[team=Runner,scores={Deaths=1..,RemainingLives=0}] run gamemode spectator @s
execute as @a[team=Runner,scores={Deaths=1..}] run scoreboard players set @s Deaths 0

# Remove compasses from runners
clear @a[team=Runner] compass[custom_name='{"text":"Tracker Compass","color": "aqua","italic": false}']

# Options
## Change countdown
execute as @a[scores={Countdown=0..}] store result score .countdown manhunt-options run scoreboard players get @s Countdown
execute as @a[scores={Countdown=0..}] run scoreboard players enable @s Countdown
execute as @a[scores={Countdown=0..}] run scoreboard players set @s Countdown -1
## Change lives
execute as @a[scores={Lives=0..}] store result score .lives manhunt-options run scoreboard players get @s Lives
execute as @a[scores={Lives=0..}] run scoreboard players enable @s Lives
execute as @a[scores={Lives=0..}] run scoreboard players set @s Lives -1
## Change compass feedback
execute as @a[scores={manhunt-options=2}] run scoreboard players set .compass-feedback manhunt-options 0
execute as @a[scores={manhunt-options=3}] run scoreboard players set .compass-feedback manhunt-options 1
## Change endgame
execute as @a[scores={manhunt-options=4}] run scoreboard players set .endgame manhunt-options 0
execute as @a[scores={manhunt-options=5}] run scoreboard players set .endgame manhunt-options 1
## Menu tellraw
execute as @a[scores={manhunt-options=1..}] run tellraw @s [{"text":"\n"},{"text":"- Manhunt Settings -\n","color":"red","bold":true},{"text":"\n> Countdown Timer\n","color":"white","bold":false},{"text":"Set the number of ticks (1/20th of a second) to wait before hunters can begin.\n","color":"gray","bold":false},{"text":"[","color":"dark_gray"},{"score":{"name":".countdown","objective":"manhunt-options"},"color":"gray","bold":false,"underlined":true,"clickEvent":{"action":"suggest_command","value":"/trigger Countdown set "}},{"text":" ticks","color":"gray","underlined":true,"clickEvent":{"action":"suggest_command","value":"/trigger Countdown set "}},{"text":"]\n","color":"dark_gray"},{"text":"\n> Runner Lives\n","color":"white","bold":false},{"text":"Set the number of lives runners are granted. Set to 0 for infinite.\n","color":"gray","bold":false},{"text":"[","color":"dark_gray"},{"score":{"name":".lives","objective":"manhunt-options"},"color":"gray","bold":false,"underlined":true,"clickEvent":{"action":"suggest_command","value":"/trigger Lives set "}},{"text":" lives","color":"gray","underlined":true,"clickEvent":{"action":"suggest_command","value":"/trigger Lives set "}},{"text":"]","color":"dark_gray"},{"text":"\n\n> Compass feedback","color":"white"},{"text":"\nWhether to show if the compass can track a player or not.","color":"gray"}]
execute as @a[scores={manhunt-options=1..}] if score .compass-feedback manhunt-options matches 1 run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"Enabled","color":"green","underlined":true,"clickEvent":{"action":"run_command","value":"/trigger manhunt-options set 2"}},{"text":"]","color":"dark_gray"}]
execute as @a[scores={manhunt-options=1..}] unless score .compass-feedback manhunt-options matches 1 run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"Disabled","color":"red","underlined":true,"clickEvent":{"action":"run_command","value":"/trigger manhunt-options set 3"}},{"text":"]","color":"dark_gray"}]
execute as @a[scores={manhunt-options=1..}] run tellraw @s [{"text":"\n> Cornucopia Endgame\n","color":"white","bold":false},{"text":"Decreases abuse by requiring all living runners to enter the end before the dragon can be damaged. Also reduces lives of runners to 1 upon entering and makes the end portal trackable.","color":"gray","bold":false}]
execute as @a[scores={manhunt-options=1..}] if score .endgame manhunt-options matches 1 run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"Enabled","color":"green","underlined":true,"clickEvent":{"action":"run_command","value":"/trigger manhunt-options set 4"}},{"text":"]","color":"dark_gray"}]
execute as @a[scores={manhunt-options=1..}] unless score .endgame manhunt-options matches 1 run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"Disabled","color":"red","underlined":true,"clickEvent":{"action":"run_command","value":"/trigger manhunt-options set 5"}},{"text":"]","color":"dark_gray"}]
## Reset trigger
execute as @a[scores={manhunt-options=1..}] run scoreboard players enable @s manhunt-options
execute as @a[scores={manhunt-options=1..}] run scoreboard players set @s manhunt-options 0

# Loop

schedule function manhunt:loop-core 10t