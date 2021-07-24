# In der Lobby ist PvP deaktiviert
effect give @a[tag=wo] weakness 1 255 true
# Spawnpunkt der Spieler setzen, damit sie nicht in der Lobby respawnen
execute in wo:1 run spawnpoint @a[tag=woig] 0 52 0

# Aktionen ausführen wenn ein Spieler getötet wird oder stirbt
# Folgenden Scoreboards werden in der info.mcfunction erstellt
# scoreboard objectives add wotod deathCount {"text":"WOTod","color":"green"}
# scoreboard objectives add wokill playerKillCount {"text":"WOTod","color":"green"}
execute as @a[scores={wotod=1..},tag=woig] if entity @a[scores={wokill=1..},tag=woig] run tellraw @a[tag=woig] [{"text":"[","color":"gray"},{"text":"Woolwars","color":"yellow"},{"text":"] "},{"selector":"@s"},{"text":" wurde von ","color":"aqua"},{"selector":"@a[scores={wokill=1..},tag=woig]"},{"text":" getötet.","color":"aqua"}]
execute as @a[scores={wotod=1..},tag=woig] unless entity @a[scores={wokill=1..},tag=woig] run tellraw @a[tag=woig] [{"text":"[","color":"gray"},{"text":"Woolwars","color":"yellow"},{"text":"] "},{"selector":"@s"},{"text":" ist gestorben.","color":"aqua"}]
scoreboard players set @a[scores={wotod=1..},tag=woig] Spec -1
scoreboard players reset @a wotod
scoreboard players reset @a wokill

# Beenden vom Spiel wenn nur noch ein Spieler lebt
execute store result score #wo number if entity @a[tag=woig]
execute if score #wo number matches 1 run title @a[tag=woig] title {"text":"Sieg!","color":"green"}
execute if score #wo number matches 1 run title @a[tag=woig] subtitle {"text":"Alle Spieler sind gestorben","color":"green"}
execute if score #wo number matches 1 run scoreboard players set @a[tag=woig] Spec -1

# Lobbysystem
scoreboard players set #wowarten spieler 0
execute unless entity @a[tag=woig] as @a[tag=wo] run scoreboard players add #wowarten spieler 1
execute if entity @a[tag=woig] run title @a[tag=wo] actionbar {"text":"Aktuell läuft noch ein Spiel!","color":"red"}
execute unless entity @a[tag=woig] if score #wowarten spieler matches 1 run title @a[tag=wo] actionbar {"text":"Warten auf weitere Spieler...","color":"yellow"}

execute if score #wowarten spieler matches 2.. run scoreboard players add #wowarten number 1
execute if score #wowarten spieler matches ..1 run scoreboard players set #wowarten number 0
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 1 run xp set @a[tag=wo] 10 levels
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 1 run xp set @a[tag=wo] 26 points
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 20 run xp set @a[tag=wo] 9 levels
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 20 run xp set @a[tag=wo] 22 points
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 40 run xp set @a[tag=wo] 8 levels
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 40 run xp set @a[tag=wo] 18 points
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 60 run xp set @a[tag=wo] 7 levels
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 60 run xp set @a[tag=wo] 14 points
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 80 run xp set @a[tag=wo] 6 levels
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 80 run xp set @a[tag=wo] 11 points
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 100 run xp set @a[tag=wo] 5 levels
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 100 run xp set @a[tag=wo] 8 points
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 120 run xp set @a[tag=wo] 4 levels
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 120 run xp set @a[tag=wo] 6 points
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 140 run xp set @a[tag=wo] 3 levels
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 140 run xp set @a[tag=wo] 4 points
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 160 run xp set @a[tag=wo] 2 levels
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 160 run xp set @a[tag=wo] 2 points
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 180 run xp set @a[tag=wo] 1 levels
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 180 run xp set @a[tag=wo] 1 points
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 200.. run xp set @a[tag=wo] 0 levels
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 200.. run xp set @a[tag=wo] 0 points

execute if score #wowarten spieler matches 2.. if score #wowarten number matches 200.. run tag @a[tag=wo] add woig
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 200.. run tag @a[tag=woig] remove wo
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 200.. run tellraw @a[tag=woig] [{"text":"[","color":"gray"},{"text":"Woolwars","color":"yellow"},{"text":"] "},{"text":"Das Spiel startet!","color":"aqua"}]
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 200.. run # Sonstige Befehle wie z.B. das Zurücksetzen der Map
execute if score #wowarten spieler matches 2.. if score #wowarten number matches 200.. run scoreboard players set #wowarten spieler 0
