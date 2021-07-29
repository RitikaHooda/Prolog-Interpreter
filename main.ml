open Types
open Printf

let table = Hashtbl.create 100 ;;
let first (x,y) = x;;
let second (x,y) = y;;
let check_int (x:int) = if((x) >= 0) then true else false;;
let check_symbol (l:symbol) = try (Hashtbl.find table l; false) with Not_found -> true ;;
let rec check_signature (x:sig_list) = match x with
	| Sig([]) -> (Hashtbl.reset table; true)
	| Sig(l::ls) -> if (check_symbol (first l) && check_int (second l)) then (Hashtbl.replace table (first l) (second l);check_signature (Sig ls)) else (Hashtbl.reset table; false);;
let rec check_presence (s:symbol) (x:int) (y:sig_list) = match y with
	|Sig([]) -> false
	|Sig(l::ls) -> if(((first l) = s) && ((second l) = x) && (check_signature y)) then true else (check_presence s x (Sig ls));;
let rec wfterm (y:sig_list) (x:term)  = match x with
				|V(_) -> true
				|Const(a)-> (check_presence a 0 y)
				|A(a,b) -> (check_presence a (List.length b) y) && (List.for_all (wfterm y) b);;
let max x y = if (x>y) then x else y;;
let rec ht (x:term) = match x with
				|V(_) -> 0
				|Const(_)-> 0
				|A(a,b) -> 1 + (List.fold_right max (List.map ht b) 0);;
let add a b= a + b;;
let rec size (x:term) = match x with
				|V(_) -> 1 
				|Const(_)-> 1
				|A(_,b) -> 1 + (List.fold_right add (List.map size b) 0);;
let rec concatt l1 l2 = match l1 with
				|[] -> l2
				|h::t -> if(List.mem h l2) then concatt t l2 else concatt t (h::l2);;
let rec vars (t:term) = match t with
				|V(a) -> [a] 
				|Const(a) -> [a]
				|A(_,b) -> (List.fold_right concatt (List.map vars b) []);;
let getsymbol (s:substitution) = match s with
				|Q(a,b) -> a;;
let getterm (s:substitution) = match s with
        			|Q(a,b) -> b;;
let rec sigma (v : variable) (s : substitution list) = match s with
  				|[] -> V(v)
				|(x::xs) -> if (v=(getsymbol x)) then (getterm x) else (sigma v xs);;
let rec subst (s : substitution list) (t : term) = match t with
				|V(x) -> (sigma x s)
				|Const(x) -> Const(x)
			        |A(a,b) -> A(a,(List.map (subst s) b));;
let rec appears (x:variable) (t:term) = match t with
				| Const(_) -> false
				| V(v) -> if (v=x) then true else false
				| A(_,b) -> (List.exists (appears x) b);;
let rec check (s:substitution) (l:substitution list) = match (s,l) with
				|(_,[]) -> false
				|Q(x,_),Q(y,_)::x2 -> if(x=y) then true else (check s x2);; 
let rec concat_substitution (s1:substitution list) (s2:substitution list) = match (s1,s2) with
	   			|([],[]) -> []
				|(l1,[]) -> l1
				|([],l2) -> l2
				|(l,x::xs) -> if(check x l) then (concat_substitution xs l) else x::(concat_substitution xs l);; 
let funct (s:substitution list) (x:substitution) = match x with
   				|(Q(x,y)) -> Q(x,(subst s y));;
let rec composition (s1:substitution list) (s2:substitution list) = match (s1,s2) with
				|([],[]) -> []
				|([],x) -> x
				|(x,[]) -> x
				|(x,y) -> concat_substitution (List.map (funct s2) x) y;;
exception NOT_UNIFIABLE;;
let rec mgu (t1:term) (t2:term) : (substitution list) = match (t1,t2) with
				|(V(a),V(b)) -> if(a=b) then [] else [Q(a,V(b))]
				|(V(a),Const(b)) -> [Q(a,Const(b))]
				|(Const(b),V(a)) -> [Q(a,Const(b))]
				|(Const(a),Const(b)) -> if(a=b) then [] else raise NOT_UNIFIABLE
				|(Const(x), A(s,tl)) -> if ( ((List.length tl) = 0) && (x = s)) then [] else raise NOT_UNIFIABLE
				|(A(s,tl), Const(x)) -> if ( ((List.length tl) = 0) && (x = s)) then [] else raise NOT_UNIFIABLE
				|(V(a), A(b,[])) -> [Q(a,A(b,[]))]
				|(A(b,[]),V(a)) -> [Q(a,A(b,[]))]
				|(A(a,[]),A(b,[])) -> if(a=b) then [] else raise NOT_UNIFIABLE
				|(V(a),A(b,c)) -> if(appears a (A(b,c))) then (raise NOT_UNIFIABLE) else [Q(a,A(b,c))]
				|(A(b,c),V(a)) -> if(appears a (A(b,c))) then (raise NOT_UNIFIABLE) else [Q(a,A(b,c))]
				|(A(a,l1),A(b,l2)) -> if((a=b) && ((List.length l1)=(List.length l2)) && (a=b)) then
				let rec unify l1 l2 = match (l1,l2) with
				|(_,[]) |([],_) -> []
				|(x::xs,t::ts)->let unifier = (mgu x t) in composition (unify ( List.map ( subst unifier )  xs) (List.map(subst unifier) ts)) unifier
				in unify l1 l2;
				else (raise NOT_UNIFIABLE);;