/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage(',') AS (ltr1:CHARARRAY, ltr2:BAG{dict:TUPLE(letra:CHARARRAY)}, ltr3:MAP[]);
columns = FOREACH data GENERATE ltr2;
words = FOREACH columns GENERATE FLATTEN(ltr2) AS word;
grouped_words = GROUP words BY word;
wordcount =  FOREACH grouped_words GENERATE group, COUNT(words);

STORE wordcount INTO 'output/' USING PigStorage(','); 