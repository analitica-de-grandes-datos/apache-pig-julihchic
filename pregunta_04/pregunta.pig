/*
Pregunta
===========================================================================

El archivo `data.csv` tiene la siguiente estructura:

  driverId       INT
  truckId        INT
  eventTime      STRING
  eventType      STRING
  longitude      DOUBLE
  latitude       DOUBLE
  eventKey       STRING
  correlationId  STRING
  driverName     STRING
  routeId        BIGINT
  routeName      STRING
  eventDate      STRING

Escriba un script en Pig que carge los datos y obtenga los primeros 10 
registros del archivo para las primeras tres columnas, y luego, ordenados 
por driverId, truckId, y eventTime. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

         >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (driverId:int, truckId:int, eventTime:STRING, eventType:STRING, longitude:DOUBLE, latitude:DOUBLE, eventKey: STRING,correlationId:STRING, driverName:STRING, routeId:BIGINT, routeName:STRING, eventDate:STRING);
limite = LIMIT data 10;
result = FOREACH limite GENERATE driverId, truckId,eventTime;
ordered_data = ORDER result BY driverId, truckId,eventTime;

STORE ordered_data INTO 'output/' USING PigStorage(',');