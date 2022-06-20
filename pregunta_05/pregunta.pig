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

lines = LOAD 'data.tsv' AS (letter:chararray, col2:BAG{tup:TUPLE(chararray)});

bags = FOREACH lines GENERATE FLATTEN(col2) as letters;

grouped_letters = GROUP bags BY letters;
response = FOREACH grouped_letters GENERATE group, COUNT(bags);
STORE response INTO 'output' USING PigStorage(',');