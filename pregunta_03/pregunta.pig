/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, num:int);
ordered_data = ORDER data BY num;
limite = LIMIT ordered_data 5;
result = FOREACH limite GENERATE num;

STORE result INTO 'output/' USING PigStorage(',');