(* checks if an element is in a given list *)

fun contains(x, []) = false
   |contains(x, a::rest) = if a = x then true
                           else contains(x, rest);
                           
             
(* takes the difference of two sets using 'contains' *)

fun difference(xx, []) = xx
   |difference([], yy) = []
   |difference(x::xRest, yy) = if contains(x, yy) then difference(xRest, yy)
                               else x::difference(xRest, yy); 
                               

(* takes a list and makes it a set by taking away any repeated values using 'contains'*)

fun makeNoRepeats([]) = []
   |makeNoRepeats(x::xRest) = if contains(x, xRest) then makeNoRepeats(xRest)
                                                    else x::makeNoRepeats(xRest);


(* removes the first given value from a list *)

fun removeFirst(x, []) = []
   |removeFirst(x, y::rest) = if x = y then rest
                                       else y::removeFirst(x, rest);
                                       
(* returns the minimum value of a list *)

fun listMin([x]) = x
   |listMin(x::rest) = if x<listMin(rest) then x
                                          else listMin(rest);


(* sorts a list using 'makeNoRepeats' and 'listMin' *)

fun sort([]) = []
   |sort(xx) = [listMin(xx)]@sort(removeFirst(listMin(xx), xx);


(* given two lists, checks if all of the int values in the first list multiplied by 2, are in the second list *)

fun allHaveDouble([], yy) = true
   |allHaveDouble(x::xRest, yy) = 
       let fun hasDouble([]) = false
              |hasDouble(y::yRest) = if 2*x = y
                                     then true
                                     else hasDouble(yRest);
       in
           hasDouble(yy) andalso allHaveDouble(xRest, yy)
       end;
