execute as @a[team=Hunter,scores={Deaths=1..}, nbt={DeathTime:0s}] run give @s minecraft:compass[custom_name='{"text":"Tracker Compass","color": "aqua","italic": false}']
execute as @a[team=Hunter,scores={Deaths=1..}, nbt={DeathTime:0s}] run scoreboard players set @s Deaths 0

schedule function manhunt:load/recover-compass 100
