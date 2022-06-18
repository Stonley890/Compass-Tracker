# If holding compass, replace with updated compass
execute as @a[team=Hunter] at @s if entity @s[nbt={SelectedItem:{id: "minecraft:compass", Count: 1b, tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}}}}] if entity @a[team=runner,distance=0..] if entity @a[team=Runner,distance=0..] run data modify storage manhunt:test Item.slot set value 0b
execute as @a[team=Hunter] at @s if entity @s[nbt={SelectedItem:{id: "minecraft:compass", Count: 1b, tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}}}}] if entity @a[team=runner,distance=0..] if entity @a[team=Runner,distance=0..] run data modify block 0 -64 0 Items append from storage manhunt:test Item
execute as @a[team=Hunter] at @s if entity @s[nbt={SelectedItem:{id: "minecraft:compass", Count: 1b, tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}}}}] if entity @a[team=runner,distance=0..] if entity @a[team=Runner,distance=0..] run loot replace entity @s weapon.mainhand 1 mine 0 -64 0 air{drop_contents: 1b}
# Give another compass upon death
execute as @a[team=Hunter,scores={hunterDeath=1..}] run give @s compass{display:{Name:'{"text":"Tracker Compass","color": "aqua","italic": false}'}}
execute as @a[team=Hunter,scores={hunterDeath=1..}] run scoreboard players set @s hunterDeath 0

schedule function manhunt:loop-core 1
