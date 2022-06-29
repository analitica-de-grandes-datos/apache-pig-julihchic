/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv'  AS (ltr1:CHARARRAY, ltr2:BAG{elm1: TUPLE(elm2; CHARARRAY)}, ltr3:MAP[]);
columns = FOREACH data GENERATE ltr2,ltr3;
flt = FOREACH columns GENERATE FLATTEN(lrt2), FLATTEN(ltr3);
grouped_flt = GROUP flt BY ($0, $1);
result = FOREACH grouped_flt GENERATE group, COUNT ($1);
DUMP result
 

STORE result INTO 'output/' USING PigStorage(',');