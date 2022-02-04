## forceloads the area in the storage dimension
execute in acdl:storage run forceload add ~ ~

## if reset is active it'll clear the jukebox

execute in acdl:storage if data storage acdl:storage root.temp.store.reset run setblock ~ ~ ~ bedrock

##if theres no jukebox it initialises a template one

execute in acdl:storage unless block ~ ~ ~ jukebox run setblock ~ ~ ~ jukebox{RecordItem:{id:"minecraft:structure_block",Count:1b,tag:{acdl:{dimensions:[{data:{},dimension:"minecraft:overworld"},{data:{},dimension:"minecraft:the_nether"},{data:{},dimension:"minecraft:the_end"}]}}}}

## if no dimension parameter is set it grabs the current one
execute unless data storage acdl:storage root.temp.store.dimension positioned ~ -200 ~ run function acdl:dimension

## clears the storage and index count, sets it to the current jukebox
data remove storage acdl:storage root.temp.compare
scoreboard players reset $element_index acdl.temp
scoreboard players reset $matched_element_index acdl.temp

execute in acdl:storage run data modify storage acdl:storage root.temp.compare.storage set from block ~ ~ ~ RecordItem.tag.acdl.dimensions


## iteration to check for clone
function acdl:store/clone_iterate

##if there is a clone then reconstruct the array and merge the two
scoreboard players reset $element_index acdl.temp
data modify storage acdl:storage root.temp.compare.storage set from block ~ ~ ~ RecordItem.tag.acdl.dimensions
execute if score $different acdl.temp matches 0 run function acdl:store/reconstruct

##if there is not then just merge the two + append to the end of the array
execute if score $different acdl.temp matches 1 run function acdl:store/merge
execute if score $different acdl.temp matches 1 in acdl:storage run data modify block ~ ~ ~ RecordItem.tag.acdl.dimensions append from storage acdl:storage root.temp.reconstruction

## remove forceloaded area in dimension
execute in acdl:storage run forceload remove ~ ~
