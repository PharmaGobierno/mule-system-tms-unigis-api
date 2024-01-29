fun error (error_code: String) = error_code match{
        case "1" -> {
            "CODIGO": "1",
            "ORIGEN ENTIDAD": "ERROR_OPERACION",
            "DESCRIPCIÓN": "Validar el código de Operación enviado en las estructuras."
        }
        case "2" -> {
            "CODIGO": "2",
            "ORIGEN ENTIDAD": "ERROR_VEHICULO_INEXISTENTE",
            "DESCRIPCIÓN": "El campo Dominio que se envía no está registrado"
        }
        case "3" -> {
            "CODIGO": "3",
            "ORIGEN ENTIDAD": "ERROR_PRESTADOR_INEXISTENTE",
            "DESCRIPCIÓN": "El campo Prestador que se envía no está registrado"
        }
        case "4" -> {
            "CODIGO": "4",
            "ORIGEN ENTIDAD": "ERROR_SUCURSAL",
            "DESCRIPCIÓN": "Validar el código de Operación enviado en las estructuras."
        }
        case "5" -> {
            "CODIGO": "5",
            "ORIGEN ENTIDAD": "ERROR_REFERENCIA",
            "DESCRIPCIÓN": "Valida que exista la referencia del objeto que se haya enviado para modificación"
        }
        case "6" -> {
            "CODIGO": "6",
            "ORIGEN ENTIDAD": "ERROR_FECHA",
            "DESCRIPCIÓN": "Validar el formato de la fecha y/o que las fechas sean validas"
        }
        case "7" -> {
            "CODIGO": "7",
            "ORIGEN ENTIDAD": "ERROR_BASE_DE_DATOS",
            "DESCRIPCIÓN": "Problema con la conexión hacia la BD"
        }
        case "8" -> {
            "CODIGO": "8",
            "ORIGEN ENTIDAD": "ERROR_DEPOSITO",
            "DESCRIPCIÓN": "Validar el código de Depósito enviado en las estructuras."
        }
        case "9" -> {
            "CODIGO": "9",
            "ORIGEN ENTIDAD": "ERROR_ESTADO",
            "DESCRIPCIÓN": "El estado enviado para la entidad no es correcto"
        }
        case "10" -> {
            "CODIGO": "10",
            "ORIGEN ENTIDAD": "ERROR_TRANSPORTE",
            "DESCRIPCIÓN": "El campo Transporte que se envía no está registrado"
        }
        case "11" -> {
            "CODIGO": "11",
            "ORIGEN ENTIDAD": "ERROR_CONDUCTOR",
            "DESCRIPCIÓN": "Los datos enviados para Conductor no están registrados"
        }
        case "12" -> {
            "CODIGO": "12",
            "ORIGEN ENTIDAD": "ERROR_DOMINIO",
            "DESCRIPCIÓN": "Los datos de Dominio que se intenta agregar no son correctos"
        }
        case "13" -> {
            "CODIGO": "13",
            "ORIGEN ENTIDAD": "ERROR_RECORRIDO",
            "DESCRIPCIÓN": "No existe el recorrido que se envía para el viaje"
        }
        case "14" -> {
            "CODIGO": "14",
            "ORIGEN ENTIDAD": "ERROR_CLIENTEDADOR",
            "DESCRIPCIÓN": "El Cliente dador que se envía no está registrado"
        }
        case "15" -> {
            "CODIGO": "15",
            "ORIGEN ENTIDAD": "ERROR_CUSTODIO",
            "DESCRIPCIÓN": "El Custodio que se envía no está registrado"
        }
        case "16" -> {
            "CODIGO": "16",
            "ORIGEN ENTIDAD": "ERROR_RECURSO",
            "DESCRIPCIÓN": "Los datos del Recurso que se requiere crear/modificar no son correctos"
        }
        case "17" -> {
            "CODIGO": "17",
            "ORIGEN ENTIDAD": "ERROR_EMPRESA_CUSTODIA",
            "DESCRIPCIÓN": "Los datos de la empresa de Custodia no son correctos"
        }
        case "18" -> {
            "CODIGO": "18",
            "ORIGEN ENTIDAD": "ERROR_TIPO_RECURSO",
            "DESCRIPCIÓN": "No existe el Tipo Recurso que se intenta Crear/modificar"
        }
        case "19" -> {
            "CODIGO": "19",
            "ORIGEN ENTIDAD": "ERROR_TIPO_VEHICULO",
            "DESCRIPCIÓN": "No existe el Tipo de Vehículo que se envía."
        }
        case "20" -> {
            "CODIGO": "20",
            "ORIGEN ENTIDAD": "ERROR_DUPLICADO",
            "DESCRIPCIÓN": "Existe un Viaje con la misma ReferenciaExterna (Depende del parámetro CrearViaje_ValidarReferencia)"
        }
        case "21" -> {
            "CODIGO": "21",
            "ORIGEN ENTIDAD": "ERROR_REMITO",
            "DESCRIPCIÓN": "El campo NumeroRemito del Remito enviado está vacío"
        }
        case "22" -> {
            "CODIGO": "22",
            "ORIGEN ENTIDAD": "ERROR_CREAR_TRANSPORTE",
            "DESCRIPCIÓN": "El campo Transporte que se envía no está registrado y ocurrió un error al intentar crearlo"
        }
        case "23" -> {
            "CODIGO": "23",
            "ORIGEN ENTIDAD": "ERROR_JORNADA",
            "DESCRIPCIÓN": "No se puede obtener la Jornada"
        }
        case "24" -> {
            "CODIGO": "24",
            "ORIGEN ENTIDAD": "ERROR_CREAR_JORNADA",
            "DESCRIPCIÓN": "No se puede crear la Jornada"
        }
        case "25" -> {
            "CODIGO": "25",
            "ORIGEN ENTIDAD": "ERROR_CREAR_VIAJE_DUPLICADO",
            "DESCRIPCIÓN": "Existe un viaje con la misma referencia. No se puede crear el viaje."
        }
        case "26" -> {
            "CODIGO": "26",
            "ORIGEN ENTIDAD": "ERROR_CREAR_VEHICULO_CREAR_VIAJE",
            "DESCRIPCIÓN": "No se puede crear un nuevo vehículo al crear viajes."
        }
        case "27" -> {
            "CODIGO": "27",
            "ORIGEN ENTIDAD": "ERROR_COMPLETAR_CAMPO",
            "DESCRIPCIÓN": "Falta completar campo"
        }
        case "28" -> {
            "CODIGO": "28",
            "ORIGEN ENTIDAD": "ERROR_PRODUCTO",
            "DESCRIPCIÓN": "No existe el producto en el catálogo y no se envió la información necesaria para crearlo"
        }
        case "29" -> {
            "CODIGO": "29",
            "ORIGEN ENTIDAD": "ERROR_METODO_VIAJE_INVALIDO",
            "DESCRIPCIÓN": "No existe el método de creación de viajes que desea invocar (Aplica solo en el método CrearViajeCompleto)"
        }
        case "30" -> {
            "CODIGO": "30",
            "ORIGEN ENTIDAD": "ERROR_NO_EXISTE_EN_CATALOGO",
            "DESCRIPCIÓN": "Hay datos que no existente en el catálogo maestro"
        }
        case "99" -> {
            "CODIGO": "99",
            "ORIGEN ENTIDAD": "EXCEPCION_GENERAL",
            "DESCRIPCIÓN": "Error no controlado"
        }
        case "100" -> {
            "CODIGO": "100",
            "ORIGEN ENTIDAD": "ERROR_API_KEY",
            "DESCRIPCIÓN": "ApiKey Incorrecto"
        }
    }