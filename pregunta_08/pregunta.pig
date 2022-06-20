/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' AS (letter:chararray, bags:BAG{}, maps:MAP[]);

transformed = FOREACH lines GENERATE bags, KEYSET(maps) as keys;
flatted = FOREACH transformed GENERATE FLATTEN(bags) as f1, FLATTEN(keys) as f2;
grouped = GROUP flatted BY (f1, f2);
counted = FOREACH grouped GENERATE group, COUNT(flatted);
STORE counted INTO 'output' USING PigStorage(',');