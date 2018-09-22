uppercase_letter                [A-Z]
lowercase_letter                [a-z]
letter                          {uppercase_letter}|{lowercase_letter}
identifier                      {letter}+{integer_literal}?({letter}*)?
digit                           [0-9]                      
integer_literal                 {digit}+
float_literal                   {digit}*(\.){digit}+
number_literal                  {{integer_literal}|{float_literal}}
boolean                         (false|true)
string_literal                  \"[^"\n]*["\n"]
assign_operator					[=|+=|-=|*=|/=|%=]
operator                        [+|-|*|/|%]
ip_address						({digit}{1,3})\.({digit}{1,3})\.({digit}{1,3})\.({digit}{1,3})
protocol						http:\/\/|https:\/\/|ftp:\/\/|pop:\/\/|smtp:\/\/|imap:\/\/                       
subdomain						www|{identifier}
domain_name						({identifier}\.{identifier})|({identifier}\.{identifier}\.{letter}{letter})|{ip_address}
port							(:{integer_literal})
path                            {identifier}|(\/{identifier})|\/|\/{identifier}\.{identifier}
query							\?
webparameters                   ({identifier}={identifier})|(&{identifier}={identifier})
fragment						(#{identifier})
parameters                      \(.*\)
%{
#include <stdio.h>
void skipcmnts();
%}
%%

(0[1-9]|[12][0-9]|30)\.(0[1-9]|1[0-2])\.([0-2][0-9]{3})        { printf("Date: %s ", yytext); }
((44|47)[0-9]{2})[ ]([0-9]{4})[ ]([0-9]{4})[ ]([0-9]{4})       { printf("Credit Card: %s ", yytext); }
((\(0312\))[ ][0-9]{3})[ ]([0-9]{2})[ ]([0-9]{2})              { printf("Telephone No: %s ", yytext); }
([0-2][0-9]{2})(0[1-9]|[12][0-9]|30)([0-9]{3})                 { printf("Under Graduate Student ID: %s ", yytext); }
(N|H)([0-9]{2})(0[1-9]|[12][0-9]|30{2})([0-9]{4})              { printf("Graduate Student ID: %s ", yytext); }
(0[1-9]|[1-7][0-9]|8[01])[ ]([A-Z]+)[ ]([0-9]+)                { printf("Plate No: %s ", yytext); }
{protocol}?{subdomain}?{domain_name}{port}?{path}?{query}?{webparameters}?{fragment}? { printf("Web Adress: %s ", yytext); }


"while"                         { printf("While Loop  "); }
"for"                           { printf("For Loop  "); }
"if"                            { printf("If Condition  "); }
"else"                          { printf("Else Condition  "); }
"elseif"                        { printf("ElseIf Condition  "); }
"switch"                        { printf("Switch Condition  "); }
"case"                          { printf("Case Condition  "); }
"default"                       { printf("Default Condition  "); }
"return"                        { printf("Return Type  "); }

"int"                       	{ printf("IntegerType "); }
"float"                         { printf("FloatType "); }
"boolean"                       { printf("BooleanType  "); }
"array"                         { printf("ArrayType  "); }
"string"                        { printf("StringType  "); }
"char"                          { printf("CharType  "); }




"void"                          { printf("VoidReturnTypeFunction "); }
"PrintLine"						{ printf("PrintFunctionWithNewline "); }
"Print"							{ printf("PrintFunction "); }
"open"							{ printf("OpenFunction "); }
"close"							{ printf("CloseFunction "); }
"read"							{ printf("ReadFunction "); }
"file"							{ printf("FileFunction "); }
"find"							{ printf("FindFunction "); }
"count"							{ printf("CountFunction "); }
"edit"							{ printf("EditFunction "); }
"to_upper"						{ printf("to_upperFunction "); }
"to_lower"						{ printf("to_lowerFunction "); }
"strcmp"						{ printf("strcmpFunction "); }
"atoi"							{ printf("atoiFunction "); }

[\t]                			{ printf("\t "); }
[\s]                			{ printf(" "); }
[\n]							{ printf("\n ");}
[\r]							{ printf("\r ");}

"+"                             { printf("Plus "); }
"-"                             { printf("Minus "); }
"*"                             { printf("Times "); }
"/"                             { printf("Divide "); }
"%"                             { printf("Modulus "); }

"++"                            { printf("Increase "); }
"--"                            { printf("Decrease "); }

">"                             { printf("Greater "); }
"<"                             { printf("Smaller "); }
"<="                            { printf("SmallEqual "); }
">="                            { printf("GreaterEqual "); }
"=="                            { printf("Equal "); }
"!="                            { printf("NotEqual "); }
"="                             { printf("Assign "); }
"+="                            { printf("PlusAssign "); }
"-="                            { printf("MinusAssign "); }
"*="                            { printf("TimesAssign "); }
"/="                            { printf("DivideAssign "); }
"%="                            { printf("ModulusAssign "); }

"&&"                            { printf("And "); }
"||"                            { printf("Or "); }
"?"                             { printf("QuestionMark "); }
"("                             { printf("LeftParenthesis "); }
")"                             { printf("RightParenthesis "); }
"["                             { printf("LeftSquareParenthesis "); }
"]"                             { printf("RightSquareParenthesis "); }
"{"                             { printf("LeftCurlyParenthesis "); }
"}"                             { printf("RightCurlyParenthesis "); }
","                             { printf("Comma "); }
"."                             { printf("Dot "); }
";"                             { printf("SemiColon "); }

{identifier}  					{ printf("identifier "); }
{integer_literal} 	        	{ printf("IntegerLiteral "); }

%%
yywrap(){
        return(1);
}
