data remove storage acdl:storage root.temp.reconstruction

## sets the template
data modify storage acdl:storage root.temp.reconstruction set value {data:{},dimension:"null"}

## sets the dimension to the current id
data modify storage acdl:storage root.temp.reconstruction.dimension set from storage acdl:storage root.temp.store.dimension

## merges original data with new provided data
data modify storage acdl:storage root.temp.reconstruction.data set from storage acdl:storage root.temp.compare.output
data modify storage acdl:storage root.temp.reconstruction.data merge from storage acdl:storage root.temp.store.data