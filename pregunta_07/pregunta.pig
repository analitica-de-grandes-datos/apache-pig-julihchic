/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (ltr1:CHARARRAY, tuplaltr:bag{}, arrayltr:map[]);
columns = FOREACH data GENERATE ltr1, (int)COUNT (tuplaltr) AS Col2, (int) SIZE (arrayltr) AS Col3;
result = ORDER columns BY ltr1, Col2, Col3;
 

STORE result INTO 'output/' USING PigStorage(',');