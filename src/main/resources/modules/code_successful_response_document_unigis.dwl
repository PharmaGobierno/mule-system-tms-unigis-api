fun success (success_code: String) = success_code match {
	case "1" -> {
		"CODIGO": "1",
        "ORIGEN ENTIDAD": "CARGA_EXITOSA",
        "DESCRIPCIÓN": "Documento creado correctamente en Unigis."
	}
}