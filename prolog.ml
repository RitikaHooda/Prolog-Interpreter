open Types
open Printf
open Printhelper
open Main
let lexbuf = Lexing.from_channel (open_in Sys.argv.(1));;
let clauselist = Parser.program Lexer.token lexbuf;;
let unify e t1 t2 = try (true, (composition e (mgu (subst e t1) (subst e t2)) ))

      with NOT_UNIFIABLE -> (false, []);;
let filter c = match c with
    |V(_) -> false
    |Const(_) -> false
    |_ -> true;;
let clauses = 
    let list_filter = List.filter (filter) in 
    List.map list_filter clauselist;;
let rec copy_all list = 
    let rec copy_term t= match t with
    | V(x) -> V(x^"'")
    | Const(x) -> Const(x)
    | A(x,y) -> (A (x,(List.map (copy_term) y)))
    in List.map (List.map (copy_term)) list;;
let rec get_first_match f l = match l with
    | [] -> (false,[],[])
    | x::xs ->  match f x with
    |(true,_,_) -> f x
    |(false,_,_) -> get_first_match f xs;;
let rec solve data e qList clause = match (unify e (List.hd clause) (List.hd qList)) with
    | (false,old_sub_list) -> (false,data,old_sub_list)
    | (true,new_sub_list) -> solve_all (data,new_sub_list) ((List.tl clause)@(List.tl qList))
    and solve_all (data,e) total_goals = match total_goals with
    | [] -> (true,data,e)
    | _ ->let new_data = copy_all data in get_first_match (solve new_data e total_goals) new_data
    and solve_stuff data qList = match (solve_all (data,[]) qList) with
    |(x,_,e) -> (x,e);;
let filter2 g = match g with
   |A(_,_) -> true
   |_ -> false;;

let main () =
    try
    while true do
    let () = print_string "?- " in 
    let _ = flush stdout in
    let goal = (Parser.query Lexer.token (Lexing.from_channel stdin)) 
	in 
		let doit qlist =  (print_answer (solve_stuff (List.rev clauses) (List.filter filter2 qlist)));
	in  
	doit goal;
    done
    	with _ -> exit 0
let _ = Printexc.print main () 

