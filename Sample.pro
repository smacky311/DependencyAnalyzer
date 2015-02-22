:- initialization main.

query :-
        current_prolog_flag(argv, Argv),
        concat_atom(Argv, ' ', Atom),
        read_term_from_atom(Atom, Term, []),
        call(Term).

main :-
        catch(query, E, (print_message(error, E), fail)),
        writeln(true),
        halt.
main :-
        writeln(false),
        halt(1).

a(b).
a(b,c).
projectReferences('myProject', 'system').
projectReferences('myProject', 'myProject2').
projectReferences('myProject2', 'myProject3').

directReference(A,B) :- projectReferences(A,B).
transitiveReference(A,C) :- directReference(A,B),directReference(B,C).
transitiveReferenceD1(A,D) :- transitiveReference(A,C),directReference(C,D).
transitiveReferenceD2(A,E) :- transitiveReferenceD1(A,D),directReference(D,E).
