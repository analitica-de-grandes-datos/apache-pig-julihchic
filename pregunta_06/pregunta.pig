/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' USING PigStorage('\t') AS (ltr1:CHARARRAY, ltr2:CHARARRAY, ltr3:MAP[]);
columns = FOREACH data GENERATE ltr3;
words = FOREACH columns GENERATE FLATTEN(ltr3);
grouped_words = GROUP words BY $0;
wordcount =  FOREACH grouped_words GENERATE group, COUNT($1); 

STORE wordcount INTO 'output/' USING PigStorage(',');