-- Creacion de una vista  eliminando registros ceros 
CREATE OR REPLACE VIEW delitos_sincero AS
Select * from delitos where Enero!= 0 or Febrero!= 0 or Marzo!= 0 or Abril!= 0 or Mayo != 0 or Junio!= 0 or Julio != 0 or 
Agosto != 0 or Septiembre != 0 or Octubre != 0 or Noviembre != 0 or Diciembre!= 0 GROUP BY Año, Municipio, Modalidad;

-- Tabla con columna que suma las delitos.
DROP TABLE IF EXISTS delitos_totales;
CREATE TABLE delitos_totales AS
SELECT *,SUM(Enero+Febrero+Marzo+Abril+Mayo+Junio+Julio+Agosto+Septiembre+Octubre+Noviembre+Diciembre) as "Incidencias_Totales" 
FROM delitos_sincero GROUP by Año,Municipio,Modalidad;


-- Vista con el total de delitos por entidad
CREATE OR REPLACE VIEW Entidad_total AS
SELECT Entidad,SUM(Incidencias_Totales) AS suma_delitos FROM delitos_totales  where Entidad <> 'México' GROUP BY Entidad ORDER BY suma_delitos DESC;