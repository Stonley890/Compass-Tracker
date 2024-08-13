team remove Runner
team remove Hunter
scoreboard objectives remove Deaths
scoreboard objectives remove RemainingLives
scoreboard objectives remove Time
scoreboard objectives remove manhunt-options
scoreboard objectives remove Countdown
scoreboard objectives remove Lives
bossbar remove countdown
forceload remove 0 0
execute in overworld run setblock 0 0 0 air
execute in the_nether run setblock 0 0 0 bedrock
execute in the_end run setblock 0 0 0 air
tellraw @a "Compass Tracker uninstalled. Use \"/datapack disable <name>\" to disable the data pack."