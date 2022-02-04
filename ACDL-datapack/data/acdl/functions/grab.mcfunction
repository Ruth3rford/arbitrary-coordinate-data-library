## forceloads
execute in acdl:storage run forceload add ~ ~

## grabs the data
execute in acdl:storage run data modify storage acdl:storage root.temp.compare.storage set from block ~ ~ ~ RecordItem.tag.acdl.dimensions

## if no dimension parameter is set it grabs the current one
execute unless data storage acdl:storage root.temp.store.dimension positioned ~ -200 ~ run function acdl:dimension

## grabs the correct dimensional data
function acdl:grab/iterate

## removes forceload
execute in acdl:storage run forceload remove ~ ~
