# Check if Hunter is in the same dimension as a runner and update compass
execute as @a[team=Hunter,nbt={SelectedItem: {id: "minecraft:compass"}}] at @s if score @s Dimension = @a[team=Runner,limit=1,sort=nearest] Dimension run function manhunt:loop/locate

# Report success or failure to player if enabled
execute if score .compass-feedback manhunt-options matches 1 as @a[team=Hunter,nbt={SelectedItem: {id: "minecraft:compass"}}] at @s if score @s Dimension = @a[team=Runner,limit=1,sort=nearest,gamemode=!spectator] Dimension run title @s actionbar [{"text":"Compass Refreshed","color":"green"}]
execute if score .compass-feedback manhunt-options matches 1 as @a[team=Hunter,nbt={SelectedItem: {id: "minecraft:compass"}}] at @s unless score @s Dimension = @a[team=Runner,limit=1,sort=nearest,gamemode=!spectator] Dimension run title @s actionbar [{"text":"No player to track","color":"red"}]

# Update the dimension scoreboard to reflect the current dimension
execute as @a store result score @s Dimension run data get entity @s Dimension