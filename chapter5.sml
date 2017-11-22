(* tests if a relation is symmetric *)

fun isRelatedTo(a, b, []) = false
   |isRelatedTo(a, b, (h1, h2)::rest = 
      (a = h1 andalso b = h2) orelse isRelatedTo(a, b, rest);

fun testOnePair((a, b), []) = true
   |testOnePair((a, b), (c, d)::rest = 
           ((not (b=c)) orelse isRelatedTo(a, d, relation))
           andalso testOnePair((a, b), rest);

fun testOnePair((a, b), []) = true
   |testOnePair((a, b), (c, d)::rest) = 
           ((not (b = d andalso a = c)) orelse isRelatedTo(b, a, relation))
           andalso testOnePair((a, b), rest);

fun isRelatedTo(a, b, []) = false
   |isRelatedTo(a, b, (h1, h2)::rest) = 
      (a = h1 andalso b = h2) orelse isRelatedTo(a, b, rest);

fun isSymmetric(relation) = 
 let fun testOnePair((a, b), []) = true
        |testOnePair((a, b), (c, d)::rest) = 
	((not (b = d andalso a = c)) orelse isRelatedTo(b, a, relation))
        andalso testOnePair((a, b), rest);
    fun test([]) = true
       |test((a, b)::rest) = 
               testOnePair((a, b), relation)
               andalso test(rest);
  in 
    test(relation)
  end;
  
  
  (* tests if a relation is counter symmetric *)
  
  5.6.3 counterSymmetric (all tests passed)

fun isRelatedTo(a, b, []) = false
   |isRelatedTo(a, b, (h1, h2)::rest) = 
      (a = h1 andalso b = h2) orelse isRelatedTo(a, b, rest);

fun counterSymmetric(relation) = 
 let fun testOnePair((a, b), []) = []
        |testOnePair((a, b), (c, d)::rest) = 
	(if ((not (b = d andalso a = c)) orelse isRelatedTo(b, a, relation))
        then [] else [(b, a)])
        @ testOnePair((a, b), rest);
    fun test([]) = []
       |test((a, b)::rest) = 
               testOnePair((a, b), relation) @ test(rest);
  in 
    test(relation)
  end;
  
  
  (* tests if a relation has symmetric closure *)
  
  fun makeNoRepeats([]) = []
   |makeNoRepeats([x]) = [x]
   |makeNoRepeats(a::rest) = if contains(a, rest) then makeNoRepeats(rest)
                                                  else a::makeNoRepeats(rest);

fun symmetricClosure(relation) = 
  if isSymmetric(relation)
           then relation
           else symmetricClosure(makeNoRepeats(counterSymmetric(relation))@relation);
