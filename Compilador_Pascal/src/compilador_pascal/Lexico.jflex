package compilador_pascal;
import java_cup.runtime.*;
import java.io.*;
import calculadora.TablaSimbolos;
import calculadora.Simbolo;


/**
 *
 * @author Fredy Zamora
 */


%%
%{
 private TablaSimbolos tabla;
   public Yylex(Reader in, TablaSimbolos t){
        this(in);
        this.tabla = t;

   }
%}
%unicode
%cup
%line
%column
%%
"+"  { return new Symbol(sym.OpAritm); }
"-"  { return new Symbol(sym.OpAritm); }
"*"  { return new Symbol(sym.OpAritm); }
"/"  { return new Symbol(sym.OpAritm); }
";"  { return new Symbol(sym.PUNTOYCOMA); }
"("  { return new Symbol(sym.LPAREN); }
")"  { return new Symbol(sym.RPAREN); }
"="  { return new Symbol(sym.ASIG); }
"<"  { return new Symbol(sym.RELATIONAL-OP); }
"<="  { return new Symbol(sym.RELATIONAL-OP); }
"<>"  { return new Symbol(sym.RELATIONAL-OP); }
"=>"  { return new Symbol(sym.RELATIONAL-OP); }
">"  { return new Symbol(sym.RELATIONAL-OP); }
"begin"  { return new Symbol(sym.BEGIN); }
"for"  { return new Symbol(sym.FOR); }
"while"  { return new Symbol(sym.WHILE); }
"constant"  { return new Symbol(sym.CONSTANT); }
"case"  { return new Symbol(sym.CASE); }
"if"  { return new Symbol(sym.IF); }
"integer"  { return new Symbol(sym.INTEGER); }
"real"  { return new Symbol(sym.REAL); }
"string"  { return new Symbol(sym.STRING); }
"array"  { return new Symbol(sym.ARRAY); }
"proc"  { return new Symbol(sym.PROC); }
"func"  { return new Symbol(sym.FUNC); }
"End."  { return new Symbol(sym.END); }
"Write"  { return new Symbol(sym.PRINT); }

[:jletter:][:jletterdigit:]* 
{
    Simbolo s;

if ((s = tabla.buscar(yytext())) == null)
          s = tabla.insertar(yytext());
           return new Symbol(sym.ID, s);
}
[:digit:]+ { return new Symbol(sym.NUMERO, new Double(yytext())); }
[ \t\n]+ {;}
. { System.out.println("Error lexico."+yytext() +"-"); }
