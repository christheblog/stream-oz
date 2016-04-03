functor  
export
	append:Append
	head:Head
	tail:Tail
	take:Take
	unbound:Unbound
	map: Map
	filter:Filter
	newstream:NewStream
define   
   
   % New stream creation
   fun {NewStream}  
     local X in 
     	X # X
     end 
   end
   
   % Appending to a stream
   fun {Append S X} 
     local Y in case S of
	   H # L then 
	   	L = X|Y  
	    H # Y
	   else raise("Error: Invalid stream") end
	 end end   
   end
   
   % Head of a stream
   fun {Head S} 
     case S of
	   (H|_) # _ then H
	   else raise("Error: head of an empty stream") end 
	 end  
   end
   
   % Tail of a stream
   fun {Tail S} 
     case S of
	   (_|T) # _ then T 
	   else nil
	 end  
   end

   % Take n first elements of a stream
   fun {Take S N}
     case S of
	   (H|T) # U then H | {Take (T # U) N-1 }
	   else nil
	 end  
   end
   
   % End of a stream
   fun {Unbound S} 
     case S of
	   _ # L then !!L 
	   else nil
	 end  
   end
   
   
   %
   % Higher-order functions
   %
   
   % Map a function over a stream
   fun lazy {Map S F} 
     case S of
	   (H|T) # L then ({F H} | {Map (T # L) F})  
	   else nil
	 end  
   end
   
   % Filter
   fun lazy {Filter S P} 
     case S of
	   (H|T) # L then 
	   	  if {P H} then (H | {Filter (T # L) P})
	   	  else {Filter (T # L) P} end
	   else nil
	 end  
   end
   
end