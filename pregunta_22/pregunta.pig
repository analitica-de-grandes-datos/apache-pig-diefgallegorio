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
       color REGEXP '.n';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.csv' USING PigStorage(',') AS (f1:CHARARRAY, f2:CHARARRAY, f3:CHARARRAY, f4:CHARARRAY, f5:CHARARRAY);
column = FOREACH lines GENERATE f2, f5;
orden = FILTER column BY (f5 MATCHES '.*[n]$');
STORE orden INTO 'output' USING PigStorage(',');