tag @a remove shift
execute as @a at @s if entity @s[y=~1.4,dx=0] unless entity @s[y=~1.5,dx=0] run tag @s add shift
tag @a add death
tag @a[type=player] remove death
scoreboard objectives add time dummy
scoreboard players set @a[tag=!neko] time 0
scoreboard players add @a[tag=neko] time 1
title @a[tag=neko,scores={time=2100}] title もうすぐ時間切れです
execute as @a[tag=neko,scores={time=2400..}] at @s run tp @s @e[type=minecraft:armor_stand,name=neko_spawn,c=1]
execute as @a[tag=neko,scores={time=2400..}] at @s run kill @e[type=minecraft:armor_stand,name=neko_spawn,c=1]
execute as @a[tag=neko,scores={time=2400..}] at @s run kill @e[name=neko_cat,c=1]
execute as @a[tag=neko,scores={time=2400..}] at @s run title @s title 時間切れにより変身を解除しました
tag @a[tag=neko,scores={time=2400..}] remove neko
# タグ管理
execute as @e[name="Neko!"] at @s as @p unless entity @s[tag=neko] run summon minecraft:cat neko_cat
execute as @e[name="Neko!"] at @s as @p unless entity @s[tag=neko] run summon minecraft:armor_stand neko_spawn
execute as @e[name="Neko!"] at @s as @p unless entity @s[tag=neko] run title @s title 
execute as @e[name="Neko!"] at @s as @p unless entity @s[tag=neko] run 
execute as @e[name="Neko!"] at @s as @p unless entity @s[tag=neko] run tag @s add neko
kill @e[name="Neko!"]
execute as @e[name="Neko!"] at @s as @p if entity @s[tag=neko] run kill @e[name=neko_cat,c=1]
execute as @e[name="Neko!"] at @s as @p if entity @s[tag=neko] run tp @s @e[type=minecraft:armor_stand,name=neko_spawn,c=1]
execute as @e[name="Neko!"] at @s as @p if entity @s[tag=neko] run kill @e[type=minecraft:armor_stand,name=neko_spawn,c=1]
execute as @e[name="Neko!"] at @s as @p if entity @s[tag=neko] run tag @s remove neko
kill @e[name="Neko!"]
# ネコ!が近い時の処理
execute as @a[tag=!neko,tag=nekotika] at @s unless entity @a[r=50,tag=neko] run tellraw @s [{"text":"§e嫌な気配が去った..."}]
execute as @a[tag=!neko,tag=nekotika] at @s unless entity @a[r=50,tag=neko] run gamemode s
execute as @a[tag=!neko,tag=nekotika] at @s unless entity @a[r=50,tag=neko] run tag @s remove nekotika
execute as @a[tag=!neko,tag=!nekotika] at @s if entity @a[r=50,tag=neko] run tellraw @s [{"text":"§e嫌な気配がする...隠れたほうが良さそうだ。"}]
execute as @a[tag=!neko,tag=!nekotika] at @s if entity @a[r=50,tag=neko] run gamemode a
execute as @a[tag=!neko,tag=!nekotika] at @s if entity @a[r=50,tag=neko] run tag @s add nekotika
execute as @a[tag=!neko,tag=nekotika] at @s run effect @s darkness 1 255 true
# ネコ!の色々動作管理
titleraw @a[tag=neko] actionbar {"rawtext":[{"text":"変身解除までの時間:2400/"},{"score":{"name":"@s","objective":"time"}}]}
execute as @e[type=minecraft:cat,name=neko_cat] at @s run tp @a[tag=neko,c=1]
effect @e[type=minecraft:cat,name=neko_cat] resistance 1 255 true
effect @a[tag=neko] invisibility 1 255 true
effect @a[tag=neko] resistance 1 255 true
effect @a[tag=neko] strength 1 255 true
effect @a[tag=neko,tag=!shift] speed 1 3 true
effect @a[tag=neko,tag=!shift] jump_boost 0 0 true
effect @a[tag=neko,tag=shift] speed 0 0 true
effect @a[tag=neko,tag=shift] jump_boost 1 3 true
execute as @a[tag=!neko] at @s if entity @a[tag=neko] anchored feet run particle minecraft:redstone_ore_dust_particle ~ ~ ~