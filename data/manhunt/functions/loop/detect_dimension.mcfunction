# Check if Hunter is in the same dimension as a runner and update compass
execute as @a[team=Hunter,nbt={SelectedItem:{id:"minecraft:compass"}}] at @s if score @s Dimension = @a[team=Runner,limit=1,sort=nearest] Dimension run function manhunt:loop/locate

# Update the dimension scoreboard to reflect the current dimension
execute as @a store result score @s Dimension run data get entity @s Dimension

schedule function manhunt:loop/detect_dimension 10t