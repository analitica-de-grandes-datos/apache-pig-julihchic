/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
salida esperada es la siguiente:

  (Hamilton)
  (Holcomb)
  (Garrett)
  (Fry)
  (Kinney)
  (Klein)
  (Diaz)
  (Guy)
  (Estes)
  (Jarvis)
  (Knight)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD './data.csv' USING PigStorage(',')
    AS (
        Num:int,
        Name:chararray,
        Last:chararray,
        Date:chararray,
        Color:chararray,
        Cant:int
    );

filtro = FILTER data BY Last MATCHES '[D-K].*';
result = FOREACH filtro GENERATE Last;

STORE result INTO 'output' USING PigStorage(',');
