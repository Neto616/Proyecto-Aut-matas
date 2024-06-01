package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/* Salto de linea */
[\n] {return Linea;}

"*" { return InicioPrograma; }
"**" { return FinPrograma; }
"enteros" { return TipoEntero; }
"decimales" { return TipoDecimal; }
"cadenas" { return TipoCadena; }
"booleana" { return TipoBooleano; }
"true" { return RTrue; }
"false" { return RFalse; } 
[0-9]+\.[0-9]+ {lexeme=yytext(); return NUMDECIMAL; }

"igual" { return SignoIgual; }
"suma" { return Suma; }
"resta" { return Resta; }
"xpor3" { return Multiplicacion; }
"entre" { return Division; }

"Si" { return InicioIf; }
"FinSi" { return FinIf; }
"DEOTRA" { return Else; }
"FinDEOTRA" { return FinElse; }
"@@".* { lexeme = yytext(); return Comentario; }

"MaQ" { return MayorQue; }
"MeQ" { return MenorQue; }
"IQ" { return IgualQue; }
"DQ" { return DiferenteQue; }
"Ma=Q" { return MayorIgualQue; }
"Me=Q" { return MenorIgualQue; }

"Mientras" { return InicioWhile; }
"FinMientras" { return FinWhile; }
"DMientras" { return InicioDoWhile; }
"DFinMientras" { return FinDoWhile; }
"For" { return InicioFor; }
"FinFor" { return FinFor; }

";" { return PuntoComa; }
"(" { return AbreParentesis; }
")" { return CierraParentesis; }
\"[^\"\\]*(\\.[^\"\\]*)*\" { return CadenaDeTexto; }




[0-9]+[a-zA-Z_]+ { lexeme=yytext(); return NoNumero; }
[0-9]+ { lexeme=yytext(); return Numero; }
[a-zA-Z_]+[a-zA-Z_0-9]* { lexeme = yytext(); return Identificador; }
[ ,\t,\r]+ { /* ignora*/ }
. { return ERROR; }