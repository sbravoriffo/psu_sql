SELECT f.*,
     ROUND((s.Mate_Colegio+s.Lenguaje_Colegio)/(s.Personas_Colegio*2),2) AS Promedio_PSU_Colegio, s.Personas_Colegio AS Total_Alumnos_Colegio

FROM

(
SELECT 
    RIGHT(e.NUMERO_DOCUMENTO, 9) AS Cod_Persona,
    e.AÑO_PROCESO AS Año_Proceso, 
    SWITCH(CODIGO = '11026', 'CA', CODIGO = '11027', 'IICG', CODIGO = '11042', 'IC') AS Tipo_Alumno, 
    SWITCH(ESTADO_DE_POSTULACION = '24', 'Convocado', ESTADO_DE_POSTULACION = '25', 'Lista Espera') AS Estado_Postulacion,
    PREFERENCIA AS Preferencia_Carrera, MATEMATICA AS Ptje_PSU_Matematica,
    e.PTJE_RANKING AS Ptje_Ranking,
    e.LOCAL_EDUCACIONAL AS Local_Educacional,
    e.UNIDAD_EDUCATIVA AS Unidad_Educativa,
    SWITCH(e.GRUPO_DEPENDENCIA = '1', 'Particular Pagado', 
        e.GRUPO_DEPENDENCIA = '2', 'Particular Subvencionado',
        e.GRUPO_DEPENDENCIA = '3', 'Municipal') AS Grupo_Dependencia,
    e.CODIGO_COMUNA AS Colegio_Cod_Comuna,
    e.COD_COMUNA AS Domicilio_Cod_Comuna,
    SWITCH (POND_AÑO_ACAD = '1', 'Actual', POND_AÑO_ACAD = '2', 'Anterior') AS PSU_Utilizada,
    b.INGRESO_BRUTO_FAMILIAR AS Ing_Bruto_Familiar,
    'PSU' AS Tipo_Ingreso

FROM 
    Archivo_E as e
    LEFT JOIN 
        Archivo_B AS b
        ON e.NUMERO_DOCUMENTO = b.NUMERO_DOCUMENTO
WHERE
    CODIGO IN ('11026', '11027', '11042')

UNION ALL

SELECT 
    RIGHT(e.NUMERO_DOCUMENTO, 9) AS Cod_Persona,
    e.AÑO_PROCESO AS Año_Proceso, 
    SWITCH(CODIGO = '11026', 'CA', CODIGO = '11027', 'IICG', CODIGO = '11042', 'IC') AS Tipo_Alumno, 
    SWITCH(ESTADO_DE_POSTULACION = '24', 'Convocado', ESTADO_DE_POSTULACION = '25', 'Lista Espera') AS Estado_Postulacion,
    PREFERENCIA AS Preferencia_Carrera, MATEMATICA AS Ptje_PSU_Matematica,
    e.PTJE_RANKING AS Ptje_Ranking,
    e.LOCAL_EDUCACIONAL AS Local_Educacional,
    e.UNIDAD_EDUCATIVA AS Unidad_Educativa,
    SWITCH(e.GRUPO_DEPENDENCIA = '1', 'Particular Pagado', 
        e.GRUPO_DEPENDENCIA = '2', 'Particular Subvencionado',
        e.GRUPO_DEPENDENCIA = '3', 'Municipal') AS Grupo_Dependencia,
    e.CODIGO_COMUNA AS Colegio_Cod_Comuna,
    e.COD_COMUNA AS Domicilio_Cod_Comuna,
    SWITCH (POND_AÑO_ACAD = '1', 'Actual', POND_AÑO_ACAD = '2', 'Anterior') AS PSU_Utilizada,
    b.INGRESO_BRUTO_FAMILIAR AS Ing_Bruto_Familiar,
    'BEA 5% SUPERIOR' AS Tipo_Ingreso

FROM 
    Archivo_E_BEA as e
    LEFT JOIN 
        Archivo_B AS b
        ON e.NUMERO_DOCUMENTO = b.NUMERO_DOCUMENTO
WHERE
    CODIGO IN ('11026', '11027', '11042')

UNION ALL

SELECT 
    RIGHT(e.NUMERO_DOCUMENTO, 9) AS Cod_Persona,
    e.AÑO_PROCESO AS Año_Proceso, 
    SWITCH(CODIGO = '11026', 'CA', CODIGO = '11027', 'IICG', CODIGO = '11042', 'IC') AS Tipo_Alumno, 
    SWITCH(ESTADO_DE_POSTULACION = '24', 'Convocado', ESTADO_DE_POSTULACION = '25', 'Lista Espera') AS Estado_Postulacion,
    PREFERENCIA AS Preferencia_Carrera, MATEMATICA AS Ptje_PSU_Matematica,
    e.PTJE_RANKING AS Ptje_Ranking,
    e.LOCAL_EDUCACIONAL AS Local_Educacional,
    e.UNIDAD_EDUCATIVA AS Unidad_Educativa,
    SWITCH(e.GRUPO_DEPENDENCIA = '1', 'Particular Pagado', 
        e.GRUPO_DEPENDENCIA = '2', 'Particular Subvencionado',
        e.GRUPO_DEPENDENCIA = '3', 'Municipal') AS Grupo_Dependencia,
    e.CODIGO_COMUNA AS Colegio_Cod_Comuna,
    e.COD_COMUNA AS Domicilio_Cod_Comuna,
    'Actual' AS PSU_Utilizada,
    b.INGRESO_BRUTO_FAMILIAR AS Ing_Bruto_Familiar,
    'PACE' AS Tipo_Ingreso

FROM 
    Archivo_E_PACE as e
    LEFT JOIN 
        Archivo_B AS b
        ON e.NUMERO_DOCUMENTO = b.NUMERO_DOCUMENTO
WHERE
    CODIGO IN ('11026', '11027', '11042')


UNION ALL

SELECT 
    RIGHT(e.NUMERO_DOCUMENTO, 9) AS Cod_Persona,
    e.AÑO_PROCESO AS Año_Proceso, 
    SWITCH(CODIGO = '11026', 'CA', CODIGO = '11027', 'IICG', CODIGO = '11042', 'IC') AS Tipo_Alumno, 
    SWITCH(ESTADO_DE_POSTULACION = '24', 'Convocado', ESTADO_DE_POSTULACION = '25', 'Lista Espera') AS Estado_Postulacion,
    PREFERENCIA AS Preferencia_Carrera, MATEMATICA AS Ptje_PSU_Matematica,
    e.PTJE_RANKING AS Ptje_Ranking,
    e.LOCAL_EDUCACIONAL AS Local_Educacional,
    e.UNIDAD_EDUCATIVA AS Unidad_Educativa,
    SWITCH(e.GRUPO_DEPENDENCIA = '1', 'Particular Pagado', 
        e.GRUPO_DEPENDENCIA = '2', 'Particular Subvencionado',
        e.GRUPO_DEPENDENCIA = '3', 'Municipal') AS Grupo_Dependencia,
    e.CODIGO_COMUNA AS Colegio_Cod_Comuna,
    e.COD_COMUNA AS Domicilio_Cod_Comuna,
    SWITCH (POND_AÑO_ACAD = '1', 'Actual', POND_AÑO_ACAD = '2', 'Anterior') AS PSU_Utilizada,
    b.INGRESO_BRUTO_FAMILIAR AS Ing_Bruto_Familiar,
    'ESCUELA DE TALENTOS' AS Tipo_Ingreso

FROM 
    Archivo_E_EDT as e
    LEFT JOIN 
        Archivo_B AS b
        ON e.NUMERO_DOCUMENTO = b.NUMERO_DOCUMENTO
WHERE
    CODIGO IN ('11026', '11027', '11042')

UNION ALL

SELECT 
    RIGHT(e.NUMERO_DOCUMENTO, 9) AS Cod_Persona,
    e.AÑO_PROCESO AS Año_Proceso, 
    SWITCH(CODIGO = '11026', 'CA', CODIGO = '11027', 'IICG', CODIGO = '11042', 'IC') AS Tipo_Alumno, 
    SWITCH(ESTADO_DE_POSTULACION = '24', 'Convocado', ESTADO_DE_POSTULACION = '25', 'Lista Espera') AS Estado_Postulacion,
    PREFERENCIA AS Preferencia_Carrera, MATEMATICA AS Ptje_PSU_Matematica,
    e.PTJE_RANKING AS Ptje_Ranking,
    e.LOCAL_EDUCACIONAL AS Local_Educacional,
    e.UNIDAD_EDUCATIVA AS Unidad_Educativa,
    SWITCH(e.GRUPO_DEPENDENCIA = '1', 'Particular Pagado', 
        e.GRUPO_DEPENDENCIA = '2', 'Particular Subvencionado',
        e.GRUPO_DEPENDENCIA = '3', 'Municipal') AS Grupo_Dependencia,
    e.CODIGO_COMUNA AS Colegio_Cod_Comuna,
    e.COD_COMUNA AS Domicilio_Cod_Comuna,
    SWITCH (POND_AÑO_ACAD = '1', 'Actual', POND_AÑO_ACAD = '2', 'Anterior') AS PSU_Utilizada,
    b.INGRESO_BRUTO_FAMILIAR AS Ing_Bruto_Familiar,
    'DEPORTIVO' AS Tipo_Ingreso

FROM 
    Archivo_E_SIDD as e
    LEFT JOIN 
        Archivo_B AS b
        ON e.NUMERO_DOCUMENTO = b.NUMERO_DOCUMENTO
WHERE
    CODIGO IN ('11026', '11027', '11042')

UNION ALL

SELECT 
    RIGHT(e.NUMERO_DOCUMENTO, 9) AS Cod_Persona,
    e.AÑO_PROCESO AS Año_Proceso, 
    SWITCH(CODIGO = '11026', 'CA', CODIGO = '11027', 'IICG', CODIGO = '11042', 'IC') AS Tipo_Alumno, 
    SWITCH(ESTADO_DE_POSTULACION = '24', 'Convocado', ESTADO_DE_POSTULACION = '25', 'Lista Espera') AS Estado_Postulacion,
    PREFERENCIA AS Preferencia_Carrera, MATEMATICA AS Ptje_PSU_Matematica,
    e.PTJE_RANKING AS Ptje_Ranking,
    e.LOCAL_EDUCACIONAL AS Local_Educacional,
    e.UNIDAD_EDUCATIVA AS Unidad_Educativa,
    SWITCH(e.GRUPO_DEPENDENCIA = '1', 'Particular Pagado', 
        e.GRUPO_DEPENDENCIA = '2', 'Particular Subvencionado',
        e.GRUPO_DEPENDENCIA = '3', 'Municipal') AS Grupo_Dependencia,
    e.CODIGO_COMUNA AS Colegio_Cod_Comuna,
    e.COD_COMUNA AS Domicilio_Cod_Comuna,
    SWITCH (POND_AÑO_ACAD = '1', 'Actual', POND_AÑO_ACAD = '2', 'Anterior') AS PSU_Utilizada,
    b.INGRESO_BRUTO_FAMILIAR AS Ing_Bruto_Familiar,
    'CUPO EQUIDAD' AS Tipo_Ingreso

FROM 
    Archivo_E_SIPEE as e
    LEFT JOIN 
        Archivo_B AS b
        ON e.NUMERO_DOCUMENTO = b.NUMERO_DOCUMENTO
WHERE
    CODIGO IN ('11026', '11027', '11042')


UNION ALL

SELECT 
    RIGHT(a.NUMERO_DOCUMENTO, 9) AS Cod_Persona,
    a.AÑO_PROCESO AS Año_Proceso, 
    'LIBRE' AS Tipo_Alumno, 
    SWITCH(ESTADO_DE_POSTULACION = '24', 'Convocado', ESTADO_DE_POSTULACION = '25', 'Lista Espera') AS Estado_Postulacion,
    PREFERENCIA AS Preferencia_Carrera, MATEMATICA AS Ptje_PSU_Matematica,
    a.PTJE_RANKING AS Ptje_Ranking,
    a.LOCAL_EDUCACIONAL AS Local_Educacional,
    a.UNIDAD_EDUCATIVA AS Unidad_Educativa,
    SWITCH(a.GRUPO_DEPENDENCIA = '1', 'Particular Pagado', 
        a.GRUPO_DEPENDENCIA = '2', 'Particular Subvencionado',
        a.GRUPO_DEPENDENCIA = '3', 'Municipal') AS Grupo_Dependencia,
    a.CODIGO_COMUNA AS Colegio_Cod_Comuna,
    a.COD_COMUNA AS Domicilio_Cod_Comuna,
    SWITCH (POND_AÑO_ACAD = '1', 'Actual', POND_AÑO_ACAD = '2', 'Anterior') AS PSU_Utilizada,
    b.INGRESO_BRUTO_FAMILIAR AS Ing_Bruto_Familiar,
    'BACHILLERATO' AS Tipo_Ingreso

FROM 
    Archivo_E as a
    LEFT JOIN 
        Archivo_B AS b
        ON a.NUMERO_DOCUMENTO = b.NUMERO_DOCUMENTO

WHERE
	(((a.NUMERO_DOCUMENTO)="00196205411" Or (a.NUMERO_DOCUMENTO)="00198333506" Or (a.NUMERO_DOCUMENTO)="00198928712" Or (a.NUMERO_DOCUMENTO)="00199325671" Or (a.NUMERO_DOCUMENTO)="00199862723" Or (a.NUMERO_DOCUMENTO)="00200030915" Or (a.NUMERO_DOCUMENTO)="00200533402" Or (a.NUMERO_DOCUMENTO)="00201191394" Or (a.NUMERO_DOCUMENTO)="00224573677" Or (a.NUMERO_DOCUMENTO)="0019708197K" Or (a.NUMERO_DOCUMENTO)="00197181192" Or (a.NUMERO_DOCUMENTO)="00198272507" Or (a.NUMERO_DOCUMENTO)="00181680369" Or (a.NUMERO_DOCUMENTO)="00198053341"))
AND CODIGO IN('11078')
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