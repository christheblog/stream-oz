# Simple Stream in Oz

## Description

Just an experiment with Oz. This is a very basic Stream API.

You can find out more about Oz/Mozart here : https://mozart.github.io/ and in this excellent book : http://www.amazon.co.uk/Concepts-Techniques-Models-Computer-Programming/dp/0262220695/


In Oz, a stream is a list where the last element is an unbound dataflow variable :
```oz
 % U is an unbound variable.
 1|2|3|4|5|6|7|U
```

A stream is therefore simply represented as Tuple (H # L) where H is Head of the stream, and U the unbound variable.
```oz
 % A stream could be represented liek this
 X = 1|2|3|4|5|6|7|U % X hold the head of the stream
 S = X # U
```


To append to a stream, one just need to bind the unbound dataflow variable with the new element and provide a new unbound variable.

```oz
   % Appending to a stream
   % S : the stream 
   % X : element to append
   fun {Append S X} 
     local Y in case S of
	   H # L then 
	   	L = X|Y  
	    H # Y
	   else raise("Error: Invalid stream") end
	 end end   
   end
```

The previous code is using pattern matching to destructure the stream S (represented by the tuple : <Head of List> # <Unbound variable>).
Note that the Unbound variable is the last element of the list. The fact it is exposed in the tuple is just to provide a O(1) to allow a fast append operation.
```oz
   local Y in case S of % Pattern matching on teh stream S
	 H # L then 		  % Destructuring the tuple (Head # Last)
	 L = X|Y  		  % Binding L to X|Y where X is the element to add, and Y a new unbound variable
	 H # Y			  % Returning a new tuple (Head # Y). Y will be the next variable to bind to add an element to the stream
	  ...
```

A few other functions are implemented.


