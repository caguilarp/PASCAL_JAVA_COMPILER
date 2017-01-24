package compilador_pascal;
import java_cup.runtime.*;
import java.io.*;
import compilador_pascal.TablaSimbolos;
import compilador_pascal.Simbolo;


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
"program"  { return new Symbol(sym.PROGRAM); }
"type"  { return new Symbol(sym.TYPE); }
"VAR"  { return new Symbol(sym.TYPE); }
":"  { return new Symbol(sym.DOSPUNTO); }
";"  { return new Symbol(sym.PUNTOYCOMA); }
"+"  { return new Symbol(sym.OpAritm); }
"-"  { return new Symbol(sym.OpAritm); }
"*"  { return new Symbol(sym.OpAritm); }
"/"  { return new Symbol(sym.OpAritm); }
"div"  { return new Symbol(sym.OpAritm); }
";"  { return new Symbol(sym.PUNTOYCOMA); }
"("  { return new Symbol(sym.LPAREN); }
")"  { return new Symbol(sym.RPAREN); }
":="  { return new Symbol(sym.ASIG); }
"<"  { return new Symbol(sym.RELATIONAL-OP); }
"<="  { return new Symbol(sym.RELATIONAL-OP); }
"<>"  { return new Symbol(sym.RELATIONAL-OP); }
"=>"  { return new Symbol(sym.RELATIONAL-OP); }
">"  { return new Symbol(sym.RELATIONAL-OP); }
"begin"  { return new Symbol(sym.BEGIN); }
"for"  { return new Symbol(sym.FOR); }
"goto"  { return new Symbol(sym.GOTO); }
"repeat"  { return new Symbol(sym.REPEAT); }
"while"  { return new Symbol(sym.WHILE); }
"constant"  { return new Symbol(sym.CONSTANT); }
"case"  { return new Symbol(sym.CASE); }
"if"  { return new Symbol(sym.IF); }
"integer"  { return new Symbol(sym.INTEGER); }
"real"  { return new Symbol(sym.REAL); }
"string"  { return new Symbol(sym.STRING); }
"array"  { return new Symbol(sym.ARRAY); }
"procduce"  { return new Symbol(sym.PROCDUCE); }
"function"  { return new Symbol(sym.FUNCTION); }
"end"  { return new Symbol(sym.END); }
"write"  { return new Symbol(sym.PRINT); }

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
