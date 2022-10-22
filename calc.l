%{
#include "calc.tab.h"
%}
%%
"+"				{ return Add; }
"-"				{ return Sub; }
"*"				{ return Mul; }
"/"				{ return Div; }
"%"				{ return Mod; }
"("				{ return LParen; }
")"				{ return RParen; }
"#".*				{ /*ignore comments */ }
[+-]?([1-9][0-9]*|0)?\.?[0-9]*	{ yylval = atoi(yytext); return Number; }
\n				{ return EOL; }
[ \t]				{ /* ignore tabs and spaces */ }
.				{ printf("Mystery character %c\n", *yytext); }
%%
