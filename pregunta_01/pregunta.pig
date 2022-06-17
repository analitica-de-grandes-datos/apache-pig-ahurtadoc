/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.tsv' USING PigStorage('\t') AS (letter:chararray, date:chararray, value:int);
letters = GROUP lines BY letter;
res = FOREACH letters GENERATE group, COUNT(lines);
STORE res INTO 'output' USING PigStorage(',');
