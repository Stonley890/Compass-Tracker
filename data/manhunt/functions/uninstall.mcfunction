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
setblock 0 -64 0 bedrock 
tellraw @a "Compass Tracker uninstalled. Use \"/datapack disable <name>\" to disable the data pack."