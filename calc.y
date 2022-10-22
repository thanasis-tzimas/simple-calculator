%{
#include <stdio.h>
#include <stdlib.h>
%}

%token Number
%token Add Sub Mul Div Mod
%token EOL
%token LParen RParen

%%

calclist:
	| calclist expr EOL { printf("= %d\n", $2); }
	;

expr: factor
    | expr Add factor { $$ = $1 + $3; }
    | expr Sub factor { $$ = $1 - $3; }
    ;

factor: term
      | expr Mul factor { $$ = $1 * $3; }
      | expr Div factor { $$ = $1 / $3; }
      | expr Mod factor { $$ = $1 % $3; }
      ;

term: Number
    | LParen expr RParen { $$ = $2; }
    ;
%%

int main(int argc, char** argv) {
	yyparse();
}

yyerror(char* s) {
	fprintf(stderr, "error: ");
	fprintf(stderr, "%s\n", s);
	exit(-1);
}
