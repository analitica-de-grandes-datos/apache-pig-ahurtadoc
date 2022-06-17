/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.tsv' AS (letter:chararray, col2:BAG{}, col3:MAP[]);

keys = FOREACH lines GENERATE Flatten(KEYSET(col3)) as key;
grouped = GROUP keys BY key;
result = FOREACH grouped GENERATE group, COUNT(keys);

STORE result INTO 'output' USING PigStorage(',');