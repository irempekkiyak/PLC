## OVERVIEW ✨
This documentation contains general semantic rules and briefly summarizes details regarding the lexical analyzer.

## How to run <br>
`flex irem.l` <br>
`bison irem.y -d` <br>
`gcc irem.tab.c -lfl -o irem` <br>
`./irem` <br>


## Variables
**Types** 
* **number**: represents integers and float numbers.
* **text**: represents all alphabet characters singular, or plural

**Variables declaration** <br>
all variables identifiers should start with an underscore and every statement should end with a newline, no semicolons needed.

**Variables assignment** <br>
assignment can be done upon declaration or in a new statement

*example*: <br>
`int: xx` <br>
`xx=5` <br>
or <br>
`float: value=9.`<br>
`int: value2=2/(value + xx)`<br>
<br>

## Arithmatic operations
* `+` addition operator 
* `-` substraction operator
*  `*` multiplication operator
* `/` division operator

*example*:<br>
`value2= value2 * 2` <br>
<br>


## IF/ELSE Statement
*semantic and structure* <br>
`if expression` <br>(
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`statements` )<br>
`else` <br>(
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`statements` )<br>

*example* <br>
`if int: newValue=2 < int: newValue2=3` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( <br>
    `char: irem`  <br>
    `get <irem> ` <br>
    `print irem ` <br>
    `newValue=newValue + 1` <br>
) <br>
`else` <br> ( <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`irem = 5` <br> ) <br>
<br>

## While Loop
*semantic and structure* <br>
`while expression` <br> ( <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`statements` <br> ) <br>

*example* <br>
`while _age x > 5` <br> ( <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`print x` <br> ) <br>
<br>

## Presedence Rules
`/ * - +` left to right <br>
`equals, not equals, bigger than, less than` left to right <br>
