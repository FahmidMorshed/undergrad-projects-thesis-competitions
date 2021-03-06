%{


extern int yylex(void);


#include "symboltable.h" // symboltable header file
#include "y.tab.h" // generated by yacc -d
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
using namespace std;

bool bonus = false;

int number_of_lines = 0;

SymbolTable symtab;

void print(char *);

int countNewLineChar(char *text){
	char *p=text;
	int i=0;
	while(*p){
		if(*p == '\n'){
			i++;
		}
	p++;
	}
	return i;
}

%}
%option noyywrap
delimeter [  \t]
whitespace [  \t]+ 
RELOP    =|<>|<=|<|>=|>
ADDOP	 "+"|"-"
MULOP	 "*"|"/"|"div"|"mod"


%%


\{([^\n}])*\}	{

			//printf("single line comment %s\n",yytext);
		}


\/\*([^*]|\*+[^*/])*\*+\/	{

			//printf("multiline comment %s\n",yytext);
			number_of_lines += countNewLineChar(yytext);		
		}
		

\"[^"]*	{
	
			if(yytext[yyleng-1] == '\\'){
				yymore();
			}	
			else{
				number_of_lines += countNewLineChar(yytext);
				//printf("under quote %s%c\n",yytext,yyinput());
			}	
		}

"+"|"-"	{	
		return *yytext;	
	}


[+-]?[0-9]*(\.[0-9]+)?([eE][+-]?[0-9]+)?	{
			yylval.dval = atof(yytext);
			return NUM;
			}


"("|")"|";"|","|":"|"["|"]"	{
	if(yytext[0] == ';')
		bonus = false;
	//printf("Found in lex %s\n",yytext);
	return *yytext;	}

\.\.	{ //print(yytext);
	return DOTDOT;	}
":="	{ //print(yytext);
	return ASSIGNOP;	}



"/"|"*"|"div"|"mod"|"and"	{
		//print(yytext);
		
		int sum = 0,i =0;
		for(i = 0 ; yytext[i] ; i++)
			sum += yytext[i];
		
		//printf("Total sum is %d\n",sum);
		
		yylval.ival = sum;
		
		return MULOP;
	}

=|<>|<|<=|>=|>		{	
	//print(yytext);
	strcpy(yylval.string,yytext);
	return RELOP; 
	}

write	{	return WRITE;	}
program	{ //print(yytext);
		return PROGRAM; }
begin	{ //print(yytext);
		return BEGIN1;	}
end		{ //print(yytext);
		return END;	}

var		{ //print(yytext);
		 bonus = true; 
		 return VAR;	}
array	{ //print(yytext);
		return ARRAY;	}
integer	{ //print(yytext);
		return INTEGER;	}
real		{ //print(yytext);
		return REAL;	}
of		{ //print(yytext);
		return OF;	}
do		{ //print(yytext);
		return DO;	}
if		{ //print(yytext);
		return IF;	}
then		{ //print(yytext);
		return THEN;	}
else		{ //print(yytext);
		return ELSE;	}
while	{ //print(yytext);
		return WHILE;	}
not		{ //print(yytext);
		return NOT;	}
or		{ //print(yytext);
		return OR;	}
procedure	{ //print(yytext);
		return PROCEDURE;	}
function	{ //print(yytext);
		return FUNCTION;	}

dump {
	//printf("Dump it\n");
	symtab.Dump();
	}


[_a-zA-Z][_a-zA-Z0-9]*	{
			yylval.symp = symtab.Insert(yytext,"ID");
			if(bonus)
				(yylval.symp)->typeVal=true;
			else (yylval.symp)->typeVal=false;
			
			//printf("Found the id %s in Lex\n",yytext);
			return ID;
			
		}

{whitespace};
\.	{	return *yytext;	}
	
%%

void print(char *s){
	printf("Found %s in lex\n",s);
}
