# Compass-Tracker
A data pack that allows any number of hunters to track any number of runners in all three dimensions.

- Use `/team join Runner` to become a runner.
- Use `/function manhunt:start` to give all other players compasses.
- Use `/trigger manhunt-options` to open the settings menu.

Each individual compass is updated by holding it. It will point to the nearest runner. It will not update if there are no runners in your dimension.

![2022-06-03_17 47 02](https://user-images.githubusercontent.com/79172597/172061011-94f2d10c-ed50-485c-b350-fcefc32ab7ea.png)

## Features
### Multi-runner
Compass Tracker supports any number of hunters and any number of survivors. Each hunter tracks the runner closest to them.
### Multi-life
Runners can be given a configurable number of lives before being set to spectator mode after losing their last life.
### Auto-compass
The Tracker Compass updates automatically while held and provides feedback (configurable) if there is a runner to track. The compass remains locked on its last target.
### Anti-abuse Endgame
Enable Cornucopia Endgame to keep multiple runners from separating. All living runners must enter the end to damage the dragon. Upon reaching the end, runners will be reduced to one life and the end portal will become trackable by the Tracker Compass.

## Showcase
Watch the showcase/tutorial video:
[![https://youtu.be/Yghy4-SpHOg](https://i.ytimg.com/vi/Yghy4-SpHOg/maxresdefault.jpg)](https://youtu.be/Yghy4-SpHOg)

You can also watch a real game played with this data pack from Waffle Irons Gaming:
[![https://youtu.be/2bnbDVBrILw](https://i.ytimg.com/vi/WLK8N9r1rh4/maxresdefault.jpg)](https://youtu.be/WLK8N9r1rh4)

## Install
Download the [latest release](https://github.com/Stonley890/Compass-Tracker/releases). Do not extract the file. Move the file to `SERVER_ROOT/WORLD/datapacks/` where `SERVER_ROOT` is the server folder name and `WORLD` is the world folder name. If in singleplayer, open the world folder from the edit menu in Minecraft's world select menu and move the file to the `datapacks` folder.

Make sure the data pack is enabled using `/datapack list`, then `/reload` (or `/minecraft:reload` on Bukkit-based servers) to ensure everything is loaded correctly.

## Feedback
Please create an issue on GitHub if you have a feature request, bug report, or anything else of the sort: https://github.com/Stonley890/Compass-Tracker.

## Contribution
I would love if you opened a pull request! Contributions are warmly welcomed.

## Support
If you find value in this project, you can support me financially on [Liberapay](https://liberapay.com/Stonley890/) or [PayPal](https://www.paypal.com/paypalme/Stonley890).
