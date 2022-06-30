/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT
       firstname,
       color
   FROM 
       u
   WHERE color = 'blue' OR firstname LIKE 'K%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/
data = LOAD 'data.csv' USING PigStorage(',')
    AS (
        Num:int,
        Firstname:chararray,
        Last:chararray,
        Date:datetime,
        Color:chararray,
        Cant:int
    );
col = FOREACH data GENERATE Firstname, Color;
filtro = FILTER col BY Color == 'blue' OR STARTSWITH(Firstname, 'K');
result = FOREACH filtro GENERATE CONCAT(Firstname, ' ', Color);

STORE result INTO 'output' USING PigStorage(',');