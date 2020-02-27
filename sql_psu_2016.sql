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
    SWITCH(CODIGO = '11026', 'CA', CODIGO = '11027', 'IICG', CODIGO = '11042', 'IC') AS Tipo_Alumno, 
    SWITCH(ESTADO_DE_POSTULACION = '24', 'Convocado', ESTADO_DE_POSTULACION = '25', 'Lista Espera') AS Estado_Postulacion,
    PREFERENCIA AS Preferencia_Carrera, MATEMATICA AS Ptje_PSU_Matematica,
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

UNION ALL

SELECT 
    RIGHT(e.NUMERO_DOCUMENTO, 9) AS Cod_Persona,
    e.AÑO_PROCESO AS Año_Proceso, 
    'LIBRE' AS Tipo_Alumno, 
    SWITCH(ESTADO_DE_POSTULACION = '24', 'Convocado', ESTADO_DE_POSTULACION = '25', 'Lista Espera') AS Estado_Postulacion,
    PREFERENCIA AS Preferencia_Carrera, MATEMATICA AS Ptje_PSU_Matematica,
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
    ((Archivo_E_BEA as e
    LEFT JOIN 
        Archivo_B AS b
        ON e.NUMERO_DOCUMENTO = b.NUMERO_DOCUMENTO)
 LEFT JOIN 
        Archivo_A AS a
        ON e.LOCAL_EDUCACIONAL = a.LOCAL_EDUCATIVA AND e.UNIDAD_EDUCATIVA = a.UNIDAD_EDUCATIVA )

WHERE
(((e.NUMERO_DOCUMENTO)="177402192" Or (e.NUMERO_DOCUMENTO)="189334664" Or (e.NUMERO_DOCUMENTO)="190770478" Or (e.NUMERO_DOCUMENTO)="19216799K" Or (e.NUMERO_DOCUMENTO)="192769620" Or (e.NUMERO_DOCUMENTO)="192935601" Or (e.NUMERO_DOCUMENTO)="194270178" Or (e.NUMERO_DOCUMENTO)="194835000" Or (e.NUMERO_DOCUMENTO)="195146616" Or (e.NUMERO_DOCUMENTO)="196352112" Or (e.NUMERO_DOCUMENTO)="197456523" Or (e.NUMERO_DOCUMENTO)="197737867" Or (e.NUMERO_DOCUMENTO)="198021687" Or (e.NUMERO_DOCUMENTO)="198601543" Or (e.NUMERO_DOCUMENTO)="198805181" Or (e.NUMERO_DOCUMENTO)="199537105" Or (e.NUMERO_DOCUMENTO)="181680369" Or (e.NUMERO_DOCUMENTO)="190047431" Or (e.NUMERO_DOCUMENTO)="194923643" Or (e.NUMERO_DOCUMENTO)="197181192" Or (e.NUMERO_DOCUMENTO)="197712759" Or (e.NUMERO_DOCUMENTO)="197815434" Or (e.NUMERO_DOCUMENTO)="198053341" Or (e.NUMERO_DOCUMENTO)="198272507" Or (e.NUMERO_DOCUMENTO)="199935526"))
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

ON f.Local_Educacional=s.LOCAL_EDUCACIONAL AND f.Unidad_Educativa=s.UNIDAD_EDUCATIVA AND f.Grupo_Dependencia=s.Grupo_Dependencia;