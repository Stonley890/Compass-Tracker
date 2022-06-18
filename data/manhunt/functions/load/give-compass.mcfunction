team join Hunter @a[team=!Runner]
give @a[team=Hunter] compass{display:{Name:'{"text":"Tracker Compass","color": "aqua","italic": false}'}}
tellraw @a[team=Hunter] {"text":"Your compass will update when held. It will point toward the nearest player.","color":"aqua"}
data modify storage manhunt:test Item set value {id: "minecraft:compass", Count:1b, tag: {display:{Name:'{"text":"Tracker Compass","color": "aqua","italic": false}'}}}