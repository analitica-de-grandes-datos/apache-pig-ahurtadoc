/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.tsv' USING PigStorage('\t') AS (letter:chararray, date:chararray, value:int);

values = FOREACH lines GENERATE value;
sorted_values = ORDER values BY value ASC;
response = LIMIT sorted_values 5;

STORE response INTO 'output';