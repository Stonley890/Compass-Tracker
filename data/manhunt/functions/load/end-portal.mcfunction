# Set endgame
execute if entity @s[team=Runner,gamemode=!spectator] run scoreboard players set .endgame-active manhunt-options 1

# Set remaining lives
execute if entity @s[team=Runner,gamemode=!spectator] if score @s RemainingLives matches 2.. run tellraw @s [{"text":"Your number of remaining lives has been reduced to one."}]
execute if entity @s[team=Runner,gamemode=!spectator] run scoreboard players set @s RemainingLives 1

# Make portal tracker
execute if entity @s[team=Runner,gamemode=!spectator] unless entity @e[type=marker,tag=manhunt.end-portal] run summon marker ~ ~ ~ {Tags:["manhunt.end-portal"]}
execute if entity @s[team=Runner,gamemode=!spectator] if score .endgame manhunt-options matches 1 run function manhunt:loop/endgame-loop

# Make ender dragon invulnerable
execute if entity @s[team=Runner,gamemode=!spectator] in the_end if entity @a[team=Runner,gamemode=!spectator,advancements={manhunt:enter_end=false}] run data modify entity @e[type=ender_dragon,limit=1] Invulnerable set value true