/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' AS (letter:chararray, bags:chararray, maps:chararray);

mapped = FOREACH lines GENERATE letter, TOKENIZE(bags, ',') as c2, TOKENIZE(maps,',') as c3;
counted = FOREACH mapped GENERATE letter, COUNT(c2) as count2, COUNT(c3) as count3;

result = ORDER counted BY letter, count2, count3 ASC;

STORE result INTO 'output' USING PigStorage(',');