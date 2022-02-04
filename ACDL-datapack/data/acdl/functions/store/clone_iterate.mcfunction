## get the first element of the data array
data modify storage acdl:storage root.temp.compare.data set from storage acdl:storage root.temp.compare.storage[0]

## add to score to grab the index of the current element
scoreboard players add $element_index acdl.temp 1

## set the dimension id to compare against
data modify storage acdl:storage root.temp.compare.input set from storage acdl:storage root.temp.store.dimension

## check if they match
execute store success score $different acdl.temp run data modify storage acdl:storage root.temp.compare.data.dimension set from storage acdl:storage root.temp.compare.input

## if they match then set the output to the data of the element and the index
execute if score $different acdl.temp matches 0 run data modify storage acdl:storage root.temp.compare.output set from storage acdl:storage root.temp.compare.data.data
execute if score $different acdl.temp matches 0 run scoreboard players operation $matched_element_index acdl.temp = $element_index acdl.temp
#execute if score $different acdl.temp matches 0 run execute store result storage acdl:storage root.temp.compare.index int 1 run scoreboard players get $element_index acdl.temp
#execute if score $different acdl.temp matches 0 run data modify storage acdl:storage root.temp.compare.index_array append from storage acdl:storage root.temp.compare.index

## if they dont match then removes the first element of the data array and set it back to dimension id
execute if score $different acdl.temp matches 1 run data remove storage acdl:storage root.temp.compare.storage[0]
execute if score $different acdl.temp matches 1 run execute store success score $array_empty acdl.temp run data get storage acdl:storage root.temp.compare.storage[0]

## if the array is empty then it removes the array entirely
execute if score $array_empty acdl.temp matches 0 run data remove storage acdl:storage root.temp.compare.storage

## unless the array is gone and if the compared dimension ids are different, iterate the function again
execute if score $array_empty acdl.temp matches 1 if score $different acdl.temp matches 1 run function acdl:store/clone_iterate
