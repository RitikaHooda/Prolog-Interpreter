type token =
  | IF
  | LP
  | RP
  | COMMA
  | DOT
  | NOT
  | CONST of (string)
  | VAR of (string)
  | EQUALS
  | EOF
  | CUT
  | NEWLINE
  | SEMICOLON
  | GOAL

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Lexing
open Types
# 23 "parser.ml"
let yytransl_const = [|
  257 (* IF *);
  258 (* LP *);
  259 (* RP *);
  260 (* COMMA *);
  261 (* DOT *);
  262 (* NOT *);
  265 (* EQUALS *);
    0 (* EOF *);
  266 (* CUT *);
  267 (* NEWLINE *);
  268 (* SEMICOLON *);
  269 (* GOAL *);
    0|]

let yytransl_block = [|
  263 (* CONST *);
  264 (* VAR *);
    0|]

let yylhs = "\255\255\
\002\000\002\000\001\000\001\000\001\000\004\000\004\000\003\000\
\003\000\005\000\006\000\006\000\007\000\007\000\007\000\000\000\
\000\000"

let yylen = "\002\000\
\002\000\003\000\000\000\002\000\002\000\002\000\004\000\001\000\
\003\000\004\000\001\000\003\000\001\000\001\000\001\000\002\000\
\002\000"

let yydefred = "\000\000\
\003\000\000\000\000\000\000\000\000\000\000\000\017\000\000\000\
\000\000\004\000\005\000\000\000\000\000\001\000\000\000\000\000\
\000\000\006\000\000\000\013\000\015\000\000\000\000\000\002\000\
\009\000\000\000\010\000\000\000\007\000\012\000"

let yydgoto = "\003\000\
\004\000\007\000\008\000\011\000\009\000\022\000\023\000"

let yysindex = "\009\000\
\000\000\250\254\000\000\251\254\006\255\250\254\000\000\255\254\
\012\255\000\000\000\000\002\255\005\255\000\000\008\255\013\255\
\013\255\000\000\006\255\000\000\000\000\018\255\019\255\000\000\
\000\000\017\255\000\000\005\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\025\000\000\000\000\000\000\000\000\000\
\021\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\011\255\000\000\000\000\000\000\024\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\022\000\001\000\000\000\252\255\002\000\000\000"

let yytablesize = 30
let yytable = "\012\000\
\005\000\005\000\017\000\015\000\006\000\010\000\018\000\013\000\
\021\000\001\000\002\000\019\000\020\000\014\000\014\000\016\000\
\025\000\026\000\024\000\005\000\027\000\029\000\028\000\021\000\
\016\000\008\000\011\000\014\000\000\000\030\000"

let yycheck = "\004\000\
\007\001\007\001\001\001\005\001\011\001\011\001\005\001\002\001\
\013\000\001\000\002\000\007\001\008\001\003\001\004\001\004\001\
\016\000\017\000\011\001\007\001\003\001\005\001\004\001\028\000\
\000\000\005\001\003\001\006\000\255\255\028\000"

let yynames_const = "\
  IF\000\
  LP\000\
  RP\000\
  COMMA\000\
  DOT\000\
  NOT\000\
  EQUALS\000\
  EOF\000\
  CUT\000\
  NEWLINE\000\
  SEMICOLON\000\
  GOAL\000\
  "

let yynames_block = "\
  CONST\000\
  VAR\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Types.term list) in
    Obj.repr(
# 26 "parser.mly"
                        (_2)
# 118 "parser.ml"
               : Types.term list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_formula_list) in
    Obj.repr(
# 27 "parser.mly"
                                       (_1)
# 125 "parser.ml"
               : Types.term list))
; (fun __caml_parser_env ->
    Obj.repr(
# 29 "parser.mly"
                             ([])
# 131 "parser.ml"
               : Types.term list list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Types.term list list) in
    Obj.repr(
# 30 "parser.mly"
                           (_1)
# 138 "parser.ml"
               : Types.term list list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Types.term list list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'clause) in
    Obj.repr(
# 31 "parser.mly"
                                (_2 :: _1)
# 146 "parser.ml"
               : Types.term list list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_formula) in
    Obj.repr(
# 36 "parser.mly"
                                         ([_1])
# 153 "parser.ml"
               : 'clause))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'atomic_formula) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_formula_list) in
    Obj.repr(
# 37 "parser.mly"
                                                                                (_1::_3)
# 161 "parser.ml"
               : 'clause))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_formula) in
    Obj.repr(
# 41 "parser.mly"
                                     ([_1])
# 168 "parser.ml"
               : 'atomic_formula_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_formula) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_formula_list) in
    Obj.repr(
# 42 "parser.mly"
                                                             (_1 :: _3)
# 176 "parser.ml"
               : 'atomic_formula_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'term_list) in
    Obj.repr(
# 46 "parser.mly"
                                                  (A(_1,_3))
# 184 "parser.ml"
               : 'atomic_formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 50 "parser.mly"
                                        ([_1])
# 191 "parser.ml"
               : 'term_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term_list) in
    Obj.repr(
# 51 "parser.mly"
                                             (_1 :: _3)
# 199 "parser.ml"
               : 'term_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 57 "parser.mly"
                            (V(_1))
# 206 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 58 "parser.mly"
                              (Const(_1))
# 213 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_formula) in
    Obj.repr(
# 59 "parser.mly"
                                                   (_1)
# 220 "parser.ml"
               : 'term))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry query *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Types.term list list)
let query (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 2 lexfun lexbuf : Types.term list)
;;
