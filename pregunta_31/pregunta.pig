/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.csv' USING PigStorage(',') AS (id, name, lastname, birthday:datetime);

years = FOREACH lines GENERATE GetYear(birthday) as year;
grouped = GROUP years BY year;
result = FOREACH grouped GENERATE group, COUNT(years);

STORE result INTO 'output' USING PigStorage(',');