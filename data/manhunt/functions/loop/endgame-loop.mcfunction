# Make dragon vulnerable
execute in the_end unless entity @a[team=Runner,gamemode=!spectator,advancements={manhunt:enter_end=false}] run data modify entity @e[type=ender_dragon,limit=1] Invulnerable set value false
execute in the_end run title @a[team=Runner,distance=0..] actionbar [{"text":"The dragon cannot be hurt until all living runners enter the end.","color":"red"}]

execute in the_end if entity @a[team=Runner,gamemode=!spectator,advancements={manhunt:enter_end=false}] run schedule function manhunt:loop/endgame-loop 10