# Update the dimension scoreboard to reflect the current dimension
execute as @a store result score @s Dimension run data get entity @s Dimension

# Check if Hunter is in the same dimension as a runner and update compass
execute as @a[team=Hunter,nbt={SelectedItem: {id: "minecraft:compass"}}] at @s if score @s Dimension = @a[team=Runner,gamemode=!spectator,limit=1,sort=nearest] Dimension run function manhunt:loop/locate
execute as @a[team=Hunter,nbt={SelectedItem: {id: "minecraft:compass"}}] at @s if score .endgame manhunt-options matches 1 if score .endgame-active manhunt-options matches 1 run function manhunt:loop/locate

# Report success or failure to player if enabled
execute if score .compass-feedback manhunt-options matches 1 as @a[team=Hunter,nbt={SelectedItem: {id: "minecraft:compass"}}] at @s if score @s Dimension = @a[team=Runner,gamemode=!spectator,limit=1,sort=nearest] Dimension run title @s actionbar [{"text":"Compass Refreshed","color":"green"}]
execute if score .compass-feedback manhunt-options matches 1 as @a[team=Hunter,nbt={SelectedItem: {id: "minecraft:compass"}}] at @s unless entity @a[team=Runner,gamemode=!spectator,distance=0..] run title @s actionbar [{"text":"No player to track","color":"red"}]
execute if score .compass-feedback manhunt-options matches 1 as @a[team=Hunter,nbt={SelectedItem: {id: "minecraft:compass"}}] at @s unless entity @a[team=Runner,gamemode=!spectator,distance=0..] if entity @e[type=marker,tag=manhunt.end-portal,distance=0..] if score .endgame-active manhunt-options matches 1 run title @s actionbar [{"text":"Compass Refreshed","color":"yellow"}]
execute if score .compass-feedback manhunt-options matches 1 as @a[team=Hunter,nbt={SelectedItem: {id: "minecraft:compass"}}] at @s unless entity @a[team=Runner,gamemode=!spectator,distance=0..] unless entity @e[type=marker,tag=manhunt.end-portal,distance=0..] if score .endgame-active manhunt-options matches 1 run title @s actionbar [{"text":"No player to track","color":"red"}]


# Update the dimension scoreboard to reflect the current dimension
execute as @a store result score @s Dimension run data get entity @s Dimension
