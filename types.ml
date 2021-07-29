type variable = string;;
type symbol = string;;
type term = V of variable | A of atomic_formula | Const of string and atomic_formula = symbol * (term list);;
type substitution = Q of (variable * term);;
type sig_list = Sig of (symbol*int) list;;