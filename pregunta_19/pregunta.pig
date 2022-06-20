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
   WHERE 
       color REGEXP '^b';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */

--*/

lines = LOAD 'data.csv' USING PigStorage(',') AS (id, name:chararray, lastname, date, color:chararray);

colors = FOREACH lines GENERATE name, color;
result = FILTER colors BY (color matches '^b.*');

STORE result INTO 'output' USING PigStorage(',');
