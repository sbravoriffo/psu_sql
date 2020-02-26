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
    b.INGRESO_FAMILIAR AS Ing_Bruto_Familiar,
    'PSU' AS Tipo_Ingreso

    --b.HORAS_DEDICA_TRABAJO AS Horas_Trabajo,
    --b.PERSONAS_GRUPO_FAMILIAR AS Grupo_Familiar,
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
    b.INGRESO_FAMILIAR AS Ing_Bruto_Familiar,
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
    b.INGRESO_FAMILIAR AS Ing_Bruto_Familiar,
    'PACE' AS Tipo_Ingreso

FROM 
    Archivo_E_PACE as e
    LEFT JOIN 
        Archivo_B AS b
        ON e.NUMERO_DOCUMENTO = b.NUMERO_DOCUMENTO
WHERE
    CODIGO IN ('11026', '11027', '11042')

