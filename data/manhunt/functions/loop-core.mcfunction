# If holding compass, replace with updated compass
execute as @a[team=Hunter] if entity @s[nbt={SelectedItem:{id: "minecraft:compass", Count: 1b, tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}}}}] run loot replace entity @s weapon mine 0 -64 0 air{drop_contents: 1b}
# Give another compass upon death
execute as @a[team=Hunter,scores={hunterDeath=1..}] run give @s compass{display:{Name:'{"text":"Tracker Compass","color": "aqua","italic": false}'}}
execute as @a[team=Hunter,scores={hunterDeath=1..}] run scoreboard players set @s hunterDeath 0

schedule function manhunt:loop-core 1
