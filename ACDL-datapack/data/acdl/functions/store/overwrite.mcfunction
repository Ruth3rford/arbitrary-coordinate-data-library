function acdl:store/merge

## appends it to the reconstruction
data modify storage acdl:storage root.temp.compare.reconstruct append from storage acdl:storage root.temp.reconstruction

## applies it to the jukebox
execute in acdl:storage run data modify block ~ ~ ~ RecordItem.tag.acdl.dimensions set from storage acdl:storage root.temp.compare.reconstruct
