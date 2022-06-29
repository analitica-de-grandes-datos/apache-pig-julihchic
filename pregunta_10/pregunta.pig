/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data_table = LOAD 'data.csv' USING PigStorage(',')
    AS (
        Num:int,
        Name:chararray,
        Last:chararray,
        Date:datetime,
        Color:chararray,
        Cant:int
    );

column_last = FOREACH data_table GENERATE Last , SIZE(Last) AS tmn;
order_columns = ORDER column_last BY tmn desc, Last;
result = LIMIT order_columns 5;
STORE result INTO 'output' USING PigStorage(',');

