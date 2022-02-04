## grabs the first index to a score
execute store result score $matched_element_index acdl.temp run data get storage acdl:storage root.temp.compare.index_temp_array[0]

## checks if the index score matches the clone index and set score to -1
execute if score $matched_element_index acdl.temp = $element_index acdl.temp run scoreboard players set $matched_element_index acdl.temp -1

## cycle to the next element

## checks whether the array is empty
data remove storage acdl:storage root.temp.compare.index_temp_array[0]
execute store success score $array_empty acdl.temp run data get storage acdl:storage root.temp.compare.index.temp_array[0]

## if array is still full run it again
execute if score $array_empty acdl.temp matches 1 run function acdl:store/index_array
