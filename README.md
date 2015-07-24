#Matrix Multiplication

Used for graphing quadrilaterals resulting from multiplying a 1x1 square (represented by a 2x4 matrix) by a 2x2 transformation matrix starting at [1 0, 0 1]. 

I used [this][matrix] for most of the all matrix manipulations, mainly because I still struggle with Lua's `for` and iterating over tables. 

##Controls
To move the original square around use the arrow keys. To modify [T] use `qwas` and the space bar. 

*`q` is for 0,0

*`w` is for 0,1 

*`a` is for 1,0

*`s` is for 1,1 

Just pressing the keys will add one, holding down space first will subtract one. Lua tables start at 1, so they are implemented as n+1 in the code.

[matrix]: https://github.com/davidm/lua-matrix/blob/master/lua/matrix.lua

#TODO 

* Add license info 
* Possibly add support other polygons