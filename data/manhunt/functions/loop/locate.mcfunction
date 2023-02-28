# Set dimension
execute as @a[nbt={SelectedItem:{id: "minecraft:compass", Count: 1b, tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}}}}] if data entity @s {Dimension:"minecraft:overworld"} if entity @a[team=Runner,distance=0..] run data modify storage manhunt:test Item set value {id: "minecraft:compass", tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}, LodestoneTracked: 0b, LodestoneDimension:"minecraft:overworld", LodestonePos: {X:0,Y:0,Z:0}}, Count: 1b}
execute as @a[nbt={SelectedItem:{id: "minecraft:compass", Count: 1b, tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}}}}] if data entity @s {Dimension:"minecraft:the_end"} if entity @a[team=Runner,distance=0..] run data modify storage manhunt:test Item set value {id: "minecraft:compass", tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}, LodestoneTracked: 0b, LodestoneDimension:"minecraft:the_end", LodestonePos: {X:0,Y:0,Z:0}}, Count: 1b}
execute as @a[nbt={SelectedItem:{id: "minecraft:compass", Count: 1b, tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}}}}] if data entity @s {Dimension:"minecraft:the_nether"} if entity @a[team=Runner,distance=0..] run data modify storage manhunt:test Item set value {id: "minecraft:compass", tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}, LodestoneTracked: 0b, LodestoneDimension:"minecraft:the_nether", LodestonePos: {X:0,Y:0,Z:0}}, Count: 1b}

# Get loc
execute as @a[nbt={SelectedItem:{id: "minecraft:compass", Count: 1b, tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}}}}] at @s if entity @a[team=Runner,distance=0..] store result storage manhunt:test Item.tag.LodestonePos.X int 1 run data get entity @a[team=Runner,limit=1,sort=nearest] Pos[0]
execute as @a[nbt={SelectedItem:{id: "minecraft:compass", Count: 1b, tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}}}}] at @s if entity @a[team=Runner,distance=0..] store result storage manhunt:test Item.tag.LodestonePos.Y int 1 run data get entity @a[team=Runner,limit=1,sort=nearest] Pos[1]
execute as @a[nbt={SelectedItem:{id: "minecraft:compass", Count: 1b, tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}}}}] at @s if entity @a[team=Runner,distance=0..] store result storage manhunt:test Item.tag.LodestonePos.Z int 1 run data get entity @a[team=Runner,limit=1,sort=nearest] Pos[2]

execute as @a[nbt={SelectedItem:{id: "minecraft:compass", Count: 1b, tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}}}}] at @s unless entity @a[team=Runner,distance=0..] run title @s actionbar {"text":"No player in dimension","color":"red"}
execute as @a[nbt={SelectedItem:{id: "minecraft:compass", Count: 1b, tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}}}}] at @s if entity @a[team=Runner,distance=0..] run title @s actionbar {"text":"Compass Refreshed","color":"green"}


data modify block 0 -64 0 Items append from storage manhunt:test Item

# Loop
schedule function manhunt:loop/locate 10
