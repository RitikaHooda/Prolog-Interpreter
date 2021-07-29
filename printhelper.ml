open Printf
open Types
let rec printterm (t:term) = match t with
    |V(x) -> x
    |Const(x) -> x
    |A(x,y) -> x ^ "(" ^ (String.concat "," (List.map printterm y)) ^ ")"
let rec printsubstitution subs = match subs with
    |[] -> print_string "\n"
    |Q(v,t)::xs -> if(not (String.contains v ('\''))) then ((print_string (v ^ " = " ^ (printterm t) ^ "\n")); 
(printsubstitution xs)) else (printsubstitution xs);;
let print_answer answer = match answer with
    |(false,_) -> (print_string "No.\n")
    |(true,s) ->if (s = []) then (print_string "Yes.\n") else (print_string "Yes.\n");(printsubstitution s);;

