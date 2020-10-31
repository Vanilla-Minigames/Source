# In der Lobby ist PvP deaktiviert
effect give @a[tag=ww] weakness 1 255 true
# Spawnpunkt der Spieler setzen, damit sie nicht in der Lobby respawnen
execute in ww:1 run spawnpoint @a[tag=wwig] 0 52 0

# scoreboard objectives add wwtod deathCount
# scoreboard objectives add wwkill playerKillCount
execute as @a[scores={wwtod=1..},tag=wwig] if entity @a[scores={wwkill=1..},tag=wwig] run tellraw @a[tag=wwig] [{"text":"[","color":"gray"},{"text":"Wool Wars","color":"yellow"},{"text":"] "},{"selector":"@s"},{"text":" wurde von ","color":"aqua"},{"selector":"@a[scores={wwkill=1..},tag=wwig]"},{"text":" getötet.","color":"aqua"}]
execute as @a[scores={wwtod=1..},tag=wwig] unless entity @a[scores={wwkill=1..},tag=wwig] run tellraw @a[tag=wwig] [{"text":"[","color":"gray"},{"text":"Wool Wars","color":"yellow"},{"text":"] "},{"selector":"@s"},{"text":" ist gestorben.","color":"aqua"}]
scoreboard players set @a[scores={wwtod=1..},tag=wwig] Spec -1
scoreboard players reset @a wwtod
scoreboard players reset @a wwkill

# Beenden vom Spiel wenn nur noch ein Spieler lebt
execute store result score #ww number if entity @a[tag=wwig]
execute if score #ww number matches 1 run title @a[tag=wwig] title {"text":"Sieg!","color":"green"}
execute if score #ww number matches 1 run title @a[tag=wwig] subtitle {"text":"Alle Spieler sind gestorben","color":"green"}
execute if score #ww number matches 1 run scoreboard players set @a[tag=wwig] Spec -1

# Lobbysystem
scoreboard players set #wwwarten spieler 0
execute unless entity @a[tag=wwig] as @a[tag=ww] run scoreboard players add #wwwarten spieler 1
execute if entity @a[tag=wwig] run title @a[tag=ww] actionbar {"text":"Aktuell läuft noch ein Spiel!","color":"red"}
execute unless entity @a[tag=wwig] if score #wwwarten spieler matches 1 run title @a[tag=ww] actionbar {"text":"Warten auf weitere Spieler...","color":"yellow"}

execute if score #wwwarten spieler matches 2.. run scoreboard players add #wwwarten number 1
execute if score #wwwarten spieler matches ..1 run scoreboard players set #wwwarten number 0
execute if score #wwwarten spieler matches 2.. if score #wwwarten number matches 1 run tellraw @a[tag=ww] [{"text":"[","color":"gray"},{"text":"Wool Wars","color":"yellow"},{"text":"] "},{"text":"Spiel startet in 10 Sekunden!","color":"aqua"}]
execute if score #wwwarten spieler matches 2.. if score #wwwarten number matches 100 run tellraw @a[tag=ww] [{"text":"[","color":"gray"},{"text":"Wool Wars","color":"yellow"},{"text":"] "},{"text":"Spiel startet in 5 Sekunden!","color":"aqua"}]

execute if score #wwwarten spieler matches 2.. if score #wwwarten number matches 200.. run tag @a[tag=ww] add wwig
execute if score #wwwarten spieler matches 2.. if score #wwwarten number matches 200.. run tag @a[tag=wwig] remove ww
execute if score #wwwarten spieler matches 2.. if score #wwwarten number matches 200.. run tellraw @a[tag=wwig] [{"text":"[","color":"gray"},{"text":"Wool Wars","color":"yellow"},{"text":"] "},{"text":"Das Spiel startet!","color":"aqua"}]
execute if score #wwwarten spieler matches 2.. if score #wwwarten number matches 200.. run # Sonstige Befehle wie z.B. zurücksetzen der Map
execute if score #wwwarten spieler matches 2.. if score #wwwarten number matches 200.. run scoreboard players set #wwwarten spieler 0
