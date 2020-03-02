SELECT f.*, 
       ROUND((s.Mate_Colegio+s.Lenguaje_Colegio)/(s.Personas_Colegio*2),2) AS Promedio_PSU_Colegio, 
       s.Personas_Colegio AS Total_Alumnos_Colegio

FROM

(
SELECT 
    RIGHT(e.NUMERO_DOCUMENTO, 9) AS Cod_Persona,
    e.AÑO_PROCESO AS Año_Proceso, 
    SWITCH(CODIGO = '11026', 'CA', CODIGO = '11027', 'IICG', CODIGO = '11042', 'IC') AS Tipo_Alumno, 
    SWITCH(ESTADO_DE_POSTULACION = '24', 'Convocado', ESTADO_DE_POSTULACION = '25', 'Lista Espera') AS Estado_Postulacion,
    PREFERENCIA AS Preferencia_Carrera, MATEMATICA AS Ptje_PSU_Matematica, LENGUAJE_Y_COMUNICACION AS Ptje_PSU_Lenguaje,
    e.PTJE_RANKING AS Ptje_Ranking,
    e.LOCAL_EDUCACIONAL AS Local_Educacional,
    e.UNIDAD_EDUCATIVA AS Unidad_Educativa,
    SWITCH(e.GRUPO_DEPENDENCIA = '1', 'Particular Pagado', 
        e.GRUPO_DEPENDENCIA = '2', 'Particular Subvencionado', 
        e.GRUPO_DEPENDENCIA = '3', 'Municipal') AS Grupo_Dependencia,
    a.CODIGO_COMUNA AS Colegio_Cod_Comuna,
    e.COD_COMUNA AS Domicilio_Cod_Comuna,
    SWITCH (POND_AÑO_ACAD = '1', 'Actual', POND_AÑO_ACAD = '2', 'Anterior') AS PSU_Utilizada,
    b.INGRESO_BRUTO_FAMILIAR AS Ing_Bruto_Familiar,
    'PSU' AS Tipo_Ingreso

FROM 
    ((Archivo_E as e
    LEFT JOIN 
        Archivo_B AS b
        ON e.NUMERO_DOCUMENTO = b.NUMERO_DOCUMENTO)
 LEFT JOIN 
        Archivo_A AS a
        ON e.LOCAL_EDUCACIONAL = a.LOCAL_EDUCATIVA AND e.UNIDAD_EDUCATIVA = a.UNIDAD_EDUCATIVA )
WHERE
    CODIGO IN ('11026', '11027', '11042')

UNION ALL

SELECT 
    RIGHT(e.NUMERO_DOCUMENTO, 9) AS Cod_Persona,
    e.AÑO_PROCESO AS Año_Proceso, 
    'LIBRE' AS Tipo_Alumno, 
    SWITCH(ESTADO_DE_POSTULACION = '24', 'Convocado', ESTADO_DE_POSTULACION = '25', 'Lista Espera') AS Estado_Postulacion,
    PREFERENCIA AS Preferencia_Carrera, MATEMATICA AS Ptje_PSU_Matematica, LENGUAJE_Y_COMUNICACION AS Ptje_PSU_Lenguaje,
    e.PTJE_RANKING AS Ptje_Ranking,
    e.LOCAL_EDUCACIONAL AS Local_Educacional,
    e.UNIDAD_EDUCATIVA AS Unidad_Educativa,
    SWITCH(e.GRUPO_DEPENDENCIA = '1', 'Particular Pagado', 
        e.GRUPO_DEPENDENCIA = '2', 'Particular Subvencionado', 
        e.GRUPO_DEPENDENCIA = '3', 'Municipal') AS Grupo_Dependencia,
    a.CODIGO_COMUNA AS Colegio_Cod_Comuna,
    e.COD_COMUNA AS Domicilio_Cod_Comuna,
    SWITCH (POND_AÑO_ACAD = '1', 'Actual', POND_AÑO_ACAD = '2', 'Anterior') AS PSU_Utilizada,
    b.INGRESO_BRUTO_FAMILIAR AS Ing_Bruto_Familiar,
    'BACHILLERATO' AS Tipo_Ingreso

FROM 
    ((Archivo_E as e
    LEFT JOIN 
        Archivo_B AS b
        ON e.NUMERO_DOCUMENTO = b.NUMERO_DOCUMENTO)
 LEFT JOIN 
        Archivo_A AS a
        ON e.LOCAL_EDUCACIONAL = a.LOCAL_EDUCATIVA AND e.UNIDAD_EDUCATIVA = a.UNIDAD_EDUCATIVA )

WHERE
(((e.NUMERO_DOCUMENTO)="175983813" Or (e.NUMERO_DOCUMENTO)="176805323" Or (e.NUMERO_DOCUMENTO)="184592967" Or (e.NUMERO_DOCUMENTO)="184708000" Or (e.NUMERO_DOCUMENTO)="186422759" Or (e.NUMERO_DOCUMENTO)="186674324" Or (e.NUMERO_DOCUMENTO)="187229626" Or (e.NUMERO_DOCUMENTO)="187664950" Or (e.NUMERO_DOCUMENTO)="18822895K" Or (e.NUMERO_DOCUMENTO)="188526489" Or (e.NUMERO_DOCUMENTO)="188995640" Or (e.NUMERO_DOCUMENTO)="189346506" Or (e.NUMERO_DOCUMENTO)="189367732" Or (e.NUMERO_DOCUMENTO)="18975583K" Or (e.NUMERO_DOCUMENTO)="190774333" Or (e.NUMERO_DOCUMENTO)="191377044" Or (e.NUMERO_DOCUMENTO)="182106534" Or (e.NUMERO_DOCUMENTO)="186483200" Or (e.NUMERO_DOCUMENTO)="187672228" Or (e.NUMERO_DOCUMENTO)="187693993" Or (e.NUMERO_DOCUMENTO)="188887228" Or (e.NUMERO_DOCUMENTO)="189260903" Or (e.NUMERO_DOCUMENTO)="189556284" Or (e.NUMERO_DOCUMENTO)="189603053" Or (e.NUMERO_DOCUMENTO)="191355210" Or (e.NUMERO_DOCUMENTO)="191375564" Or (e.NUMERO_DOCUMENTO)="191378679" Or (e.NUMERO_DOCUMENTO)="191859979" Or (e.NUMERO_DOCUMENTO)="192400449" Or (e.NUMERO_DOCUMENTO)="192451795" Or (e.NUMERO_DOCUMENTO)="192798655" Or (e.NUMERO_DOCUMENTO)="192822653" Or (e.NUMERO_DOCUMENTO)="193733727" Or (e.NUMERO_DOCUMENTO)="194816367"))
AND CODIGO IN('11078')


UNION ALL

SELECT 
    RIGHT(e.NUMERO_DOCUMENTO, 9) AS Cod_Persona,
    e.AÑO_PROCESO AS Año_Proceso, 
   SWITCH(CODIGO = '11026', 'CA', CODIGO = '11027', 'IICG', CODIGO = '11042', 'IC') AS Tipo_Alumno, 
    SWITCH(ESTADO_DE_POSTULACION = '24', 'Convocado', ESTADO_DE_POSTULACION = '25', 'Lista Espera') AS Estado_Postulacion,
    PREFERENCIA AS Preferencia_Carrera, MATEMATICA AS Ptje_PSU_Matematica, LENGUAJE_Y_COMUNICACION AS Ptje_PSU_Lenguaje,
    e.PTJE_RANKING AS Ptje_Ranking,
    e.LOCAL_EDUCACIONAL AS Local_Educacional,
    e.UNIDAD_EDUCATIVA AS Unidad_Educativa,
    SWITCH(e.GRUPO_DEPENDENCIA = '1', 'Particular Pagado', 
        e.GRUPO_DEPENDENCIA = '2', 'Particular Subvencionado', 
        e.GRUPO_DEPENDENCIA = '3', 'Municipal') AS Grupo_Dependencia,
    a.CODIGO_COMUNA AS Colegio_Cod_Comuna,
    e.COD_COMUNA AS Domicilio_Cod_Comuna,
    SWITCH (POND_AÑO_ACAD = '1', 'Actual', POND_AÑO_ACAD = '2', 'Anterior') AS PSU_Utilizada,
    b.INGRESO_BRUTO_FAMILIAR AS Ing_Bruto_Familiar,
    'DEPORTIVO' AS Tipo_Ingreso

FROM 
    ((Archivo_E_deportistas as e
    LEFT JOIN 
        Archivo_B AS b
        ON e.NUMERO_DOCUMENTO = b.NUMERO_DOCUMENTO)
 LEFT JOIN 
        Archivo_A AS a
        ON e.LOCAL_EDUCACIONAL = a.LOCAL_EDUCATIVA AND e.UNIDAD_EDUCATIVA = a.UNIDAD_EDUCATIVA )
WHERE
    CODIGO IN ('11026', '11027', '11042')

UNION ALL

SELECT 
    RIGHT(e.NUMERO_DOCUMENTO, 9) AS Cod_Persona,
    e.AÑO_PROCESO AS Año_Proceso, 
   SWITCH(CODIGO = '11026', 'CA', CODIGO = '11027', 'IICG', CODIGO = '11042', 'IC') AS Tipo_Alumno, 
    SWITCH(ESTADO_DE_POSTULACION = '24', 'Convocado', ESTADO_DE_POSTULACION = '25', 'Lista Espera') AS Estado_Postulacion,
    PREFERENCIA AS Preferencia_Carrera, MATEMATICA AS Ptje_PSU_Matematica, LENGUAJE_Y_COMUNICACION AS Ptje_PSU_Lenguaje,
    e.PTJE_RANKING AS Ptje_Ranking,
    e.LOCAL_EDUCACIONAL AS Local_Educacional,
    e.UNIDAD_EDUCATIVA AS Unidad_Educativa,
    SWITCH(e.GRUPO_DEPENDENCIA = '1', 'Particular Pagado', 
        e.GRUPO_DEPENDENCIA = '2', 'Particular Subvencionado', 
        e.GRUPO_DEPENDENCIA = '3', 'Municipal') AS Grupo_Dependencia,
    a.CODIGO_COMUNA AS Colegio_Cod_Comuna,
    e.COD_COMUNA AS Domicilio_Cod_Comuna,
    SWITCH (POND_AÑO_ACAD = '1', 'Actual', POND_AÑO_ACAD = '2', 'Anterior') AS PSU_Utilizada,
    b.INGRESO_BRUTO_FAMILIAR AS Ing_Bruto_Familiar,
    'BEA 5% SUPERIOR' AS Tipo_Ingreso

FROM 
    ((Archivo_E_BEA as e
    LEFT JOIN 
        Archivo_B AS b
        ON e.NUMERO_DOCUMENTO = b.NUMERO_DOCUMENTO)
 LEFT JOIN 
        Archivo_A AS a
        ON e.LOCAL_EDUCACIONAL = a.LOCAL_EDUCATIVA AND e.UNIDAD_EDUCATIVA = a.UNIDAD_EDUCATIVA )
WHERE
    CODIGO IN ('11026', '11027', '11042')

) AS f

LEFT JOIN (SELECT ae.LOCAL_EDUCACIONAL, 
 SWITCH(ae.GRUPO_DEPENDENCIA = '1', 'Particular Pagado', 
        ae.GRUPO_DEPENDENCIA = '2', 'Particular Subvencionado',
        ae.GRUPO_DEPENDENCIA = '3', 'Municipal') AS GRUPO_DEPENDENCIA,
             ae.GRUPO_DEPENDENCIA, 
             ae.UNIDAD_EDUCATIVA,
            SUM(ae.MATEMATICA) AS Mate_Colegio,
            SUM(LENGUAJE_Y_COMUNICACION) AS Lenguaje_Colegio,
             COUNT(ae.NUMERO_DOCUMENTO) AS Personas_Colegio
 
FROM Archivo_E as ae

GROUP BY  ae.LOCAL_EDUCACIONAL, ae.GRUPO_DEPENDENCIA, ae.UNIDAD_EDUCATIVA
)  AS s 

ON (f.Grupo_Dependencia=s.Grupo_Dependencia) AND (f.Unidad_Educativa=s.UNIDAD_EDUCATIVA) AND (f.Local_Educacional=s.LOCAL_EDUCACIONAL)