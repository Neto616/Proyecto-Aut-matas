package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%


/* Espacios en blanco */
{espacio} {/*Ignore*/}
"*" { return new Symbol(sym.InicioPrograma, yychar, yyline, yytext()); }
"**" { return new Symbol(sym.FinPrograma, yychar, yyline, yytext()); }
"enteros" { return new Symbol(sym.TipoEntero, yychar, yyline, yytext()); }
"decimales" { return new Symbol(sym.TipoDecimal, yychar, yyline, yytext()); }
"cadenas" { return new Symbol(sym.TipoCadena, yychar, yyline, yytext()); }
"booleana" { return new Symbol(sym.TipoBooleano, yychar, yyline, yytext()); }
"true" { return new Symbol(sym.RTrue, yychar, yyline, yytext());  }
"false" { return new Symbol(sym.RFalse, yychar, yyline, yytext());  }
[0-9]+\.[0-9]+ { return new Symbol(sym.NUMDECIMAL, yychar, yyline, yytext()); }

"igual" { return new Symbol(sym.SignoIgual, yychar, yyline, yytext()); }
"suma" { return new Symbol(sym.Suma, yychar, yyline, yytext()); }
"resta" { return new Symbol(sym.Resta, yychar, yyline, yytext()); }
"xpor3" { return new Symbol(sym.Multiplicacion, yychar, yyline, yytext()); }
"entre" { return new Symbol(sym.Division, yychar, yyline, yytext()); }

"Si" { return new Symbol(sym.InicioIf, yychar, yyline, yytext()); }
"FinSi" { return new Symbol(sym.FinIf, yychar, yyline, yytext()); }
"DEOTRA" { return new Symbol(sym.Else, yychar, yyline, yytext()); }
"FinDEOTRA" { return new Symbol(sym.FinElse, yychar, yyline, yytext()); }
"@@".* {  return new Symbol(sym.Comentario, yychar, yyline, yytext()); }

"MaQ" { return new Symbol(sym.MayorQue, yychar, yyline, yytext()); }
"MeQ" { return new Symbol(sym.MenorQue, yychar, yyline, yytext()); }
"IQ" { return new Symbol(sym.IgualQue, yychar, yyline, yytext()); }
"DQ" { return new Symbol(sym.DiferenteQue, yychar, yyline, yytext()); }
"Ma=Q" { return new Symbol(sym.MayorIgualQue, yychar, yyline, yytext()); }
"Me=Q" { return new Symbol(sym.MenorIgualQue, yychar, yyline, yytext()); }

"Mientras" { return new Symbol(sym.InicioWhile, yychar, yyline, yytext()); }
"FinMientras" { return new Symbol(sym.FinWhile, yychar, yyline, yytext()); }
"DMientras" { return new Symbol(sym.InicioDoWhile, yychar, yyline, yytext()); }
"DFinMientras" { return new Symbol(sym.FinDoWhile, yychar, yyline, yytext()); }
"For" { return new Symbol(sym.InicioFor, yychar, yyline, yytext()); }
"FinFor" { return new Symbol(sym.FinFor, yychar, yyline, yytext()); }

";" { return new Symbol(sym.PuntoComa, yychar, yyline, yytext()); }
"(" { return new Symbol(sym.AbreParentesis, yychar, yyline, yytext()); }
")" { return new Symbol(sym.CierraParentesis, yychar, yyline, yytext()); }
\"[^\"\\]*(\\.[^\"\\]*)*\" { return new Symbol(sym.CadenaDeTexto, yychar, yyline, yytext()); }

[0-9]+[a-zA-Z_]+ {  return new Symbol(sym.NoNumero, yychar, yyline, yytext()); }
[0-9]+ {  return new Symbol(sym.Numero, yychar, yyline, yytext()); }
[a-zA-Z_]+[a-zA-Z_0-9]* {  return new Symbol(sym.Identificador, yychar, yyline, yytext()); }
. { return new Symbol(sym.ERROR, yychar, yyline, yytext()); }

