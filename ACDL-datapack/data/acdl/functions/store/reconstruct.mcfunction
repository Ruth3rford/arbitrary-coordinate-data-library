## counts down the index till it arrives on the correct element in the array (one that matches the dimension id)
scoreboard players add $element_index acdl.temp 1

## gets the first element of the array
data modify storage acdl:storage root.temp.compare.data set from storage acdl:storage root.temp.compare.storage[0]

## caches the current element unless its the matching one and appends it to the array reconstruction
#data modify storage acdl:storage root.temp.compare.index_temp_array set from storage acdl:storage root.temp.compare.index_array
#function acdl:store/index_array
execute unless score $matched_element_index acdl.temp = $element_index acdl.temp run data modify storage acdl:storage root.temp.compare.reconstruct append from storage acdl:storage root.temp.compare.data
#scoreboard players set $matched_element acdl.temp 1

## removes the element from the array
data remove storage acdl:storage root.temp.compare.storage[0]
execute store success score $array_empty acdl.temp run data get storage acdl:storage root.temp.compare.storage[0]

## if the array is empty then it removes the array entirely
execute if score $array_empty acdl.temp matches 0 run data remove storage acdl:storage root.temp.compare.storage

## if the array is gone that means the reconstruction is nearly complete and the merge needs to be done
execute if score $array_empty acdl.temp matches 0 run function acdl:store/overwrite

## unless the array is gone run the function again
execute if score $array_empty acdl.temp matches 1 run function acdl:store/reconstruct
