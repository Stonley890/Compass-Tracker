execute as @a[team=Hunter] if entity @s[nbt={SelectedItem:{id: "minecraft:compass", Count: 1b, tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}}}}] run loot replace entity @s weapon mine 0 -64 0 air{drop_contents: 1b}
execute as @a[team=Hunter] if entity @s[nbt={SelectedItem:{id: "minecraft:compass", Count: 1b, tag: {display: {Name: '{"text":"Tracker Compass","color": "aqua","italic": false}'}}}}] run title @s actionbar {"text":"Compass Refreshed","color":"green"}

schedule function manhunt:loop-core 1