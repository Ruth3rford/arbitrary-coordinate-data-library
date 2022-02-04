# arbitrary coordinate data library
 allows you to store arbitrary data per coordinate in an optimised way

how it works:

in order to store data, you have three parameters

data, reset, and dimension

you set these like so:

```data remove storage acdl:storage root.temp.store```

this just clears the cache

```data modify storage acdl:storage root.temp.store set value {data:{},reset:1b,dimension:"dimension:id"}```

the dimension and reset parameters are optional, leaving the dimension blank will automatically grab the dimension the function is fired in and assign it a new element in the array or merge it with prexisting data for that dimension (although this applies regardless)

do not include the reset parameter unless you want to delete all the data across dimensions at that coordinate

then after setting the data in storage run function

```function acdl:store```

it should write your data to the respective dimension

in order to grab your data, use the same nbt path. this time the only parameter is dimension where the data is stored, and it is also optional. if left blank it will automatically grab the data of the dimension from where the function is fired

the data from the grab will be stored in ```root.temp.output``` 

have fun
