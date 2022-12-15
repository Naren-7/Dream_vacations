# Vacaciones Soñadas

<img align="right" alt="coding" width="400" src="https://i.pinimg.com/236x/af/83/79/af83793ad02d7a94ff91a79960f639d6.jpg">

Este código en **PostgreSQL** crea tres tablas en la base de datos: empleados, vacaciones, y relacion.

La tabla empleados almacena información sobre los empleados de una empresa incluyendo:

- ID
- nombre
- apellido
- sexo
- fecha de nacimiento
- salario.


La tabla vacaciones almacena información sobre las vacaciones de los empleados, incluyendo:

- ID de la vacación
- el ID del empleado
- la fecha de inicio 
- fin de las vacaciones
- estado (si están activas o rechazadas)
- cantidad de días de vacaciones.


Finalmente, la tabla relacion almacena la relación entre las vacaciones y los empleados, enlazando el **ID de la vacación y el ID del empleado.**

_El código también contiene sentencias SQL para insertar valores en las tablas empleados y vacaciones, y para mostrar los valores en las tablas creadas mediante la sentencia **SELECT * FROM [nombre de la tabla]**._
