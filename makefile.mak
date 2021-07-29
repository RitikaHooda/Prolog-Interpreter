make:
	ocamlc -c types.ml
	ocamllex lexer.mll
	ocamlyacc -v parser.mly
	ocamlc -c parser.mli
	ocamlc -c lexer.ml
	ocamlc -c parser.ml
	ocamlc -c main.ml
	ocamlc -c printhelper.ml
	ocamlc -c prolog.ml
	ocamlc -o execute lexer.cmo parser.cmo main.cmo printhelper.cmo prolog.cmo 
	