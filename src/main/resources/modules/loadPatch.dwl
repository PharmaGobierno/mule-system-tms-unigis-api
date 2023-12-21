fun validationStatus(status: String) = !isEmpty([
	"check_out","loading","unloading",
	"check_in","loaded","unloaded",
	"cb_yard_arrival","cb_cross_border_departure","cb_customs_arrival_mex_g",
	"cb_customs_arrival_mex_r","cb_customs_arrival_usa_g","cb_customs_arrival_usa_r",
	"cb_customs_departure_mex","cb_customs_departure_usa","cb_customer_arrival"] 
	find status)
	
fun validationTender(status: String) = !isEmpty(["accepted","reject","cancel"] find status)

fun typeTmsflow (operationName: String, valTender: Boolean, valStatus: Boolean, status: String) = operationName match{
    case operationName if (operationName == "changeTender" and valTender) -> "changeTenderGeneral"
    case operationName if (operationName == "changeStatus" and valStatus) -> "changeStatusGeneral"
    case operationName if (operationName == "changeStatus" and status == "POD") -> "changeStatusPod"
    else -> "invalid"
    }

fun validationTms (typeTmsflow: String) = typeTmsflow match{
    case "changeTenderGeneral" -> true
    case "changeStatusGeneral" -> true
    case "changeStatusPod" -> true
    else -> false
    }
    
fun flowTms (typeTmsflow: String, status: String) = typeTmsflow match{
    case "changeTenderGeneral" -> status match{
											case "accepted" -> "clients-tms-tender_accepted_txp"
											case "reject" -> "clients-tms-tender_rejected_txp"
											case "cancel" -> "clients-tms-tender_cancel_txp"
										}
    case "changeStatusGeneral" -> "clients-tms-stauts-trailer_activities"
    case "changeStatusPod" -> "clients-tms-set_shipment_pod_txp"
    }
    
fun whenReject (typeTmsflow: String, status: String, request) = typeTmsflow match{
    case "changeTenderGeneral" ->  status match{
											case "accepted" -> {
		    	expression: request.body.processTenderAcceptResponse.ResponseHeader.CompletedSuccessfully == "false",
		    	message: request.body.processTenderAcceptResponse.ResponseHeader.Error.SystemMessage
		    	}
											case "reject" -> {
		    	expression: request.body.processTenderRejectResponse.ResponseHeader.CompletedSuccessfully == "false",
		    	message: request.body.processTenderRejectResponse.ResponseHeader.Error.SystemMessage
		    	}
											case "cancel" -> {
		    	expression: request.body.processTenderCancelResponse.ResponseHeader.CompletedSuccessfully == "false",
		    	message: request.body.processTenderCancelResponse.ResponseHeader.Error.SystemMessage
		    	}
										}
    	
    case "changeStatusGeneral" -> {
    	expression: request.body.processTrailerActivitiesResponse.ResponseHeader.CompletedSuccessfully == "false",
    	message: request.body.processTrailerActivitiesResponse.ResponseHeader.Error.SystemMessage
    	}
    	
    case "changeStatusPod" -> {
    	expression: request.body.processSetShipmentProofOfDeliveryResponse.ResponseHeader.CompletedSuccessfully == "false",
    	message: request.body.processSetShipmentProofOfDeliveryResponse.ResponseHeader.Error.SystemMessage
    	}
    }
    
fun requestTender (request) =   {
					ApiHeader: {
						OperationName: request.operation
					},
					LoadTenderData: {
						SystemLoadID: request.system_load_id as Number,
						CarrierCode: request.carrier_code,
						ServiceCode: request.service_code,
						EquipmentTypeCode: request.equipment_type_code}
			
			             ++ (if(request.status == "accepted") 
			             {
						TenderAcceptedBy: request.tender_accepted_by,
						TrailerNumber: request.trailer_number , //Numero Economico Trailer(Caja)
						TrailerLicenseNumber: request.trailer_plates default "", // Placas del Trailer
						TractorNumber: request.tractor_number,  //Numero Economico Tractor
						TractorLicenseNumber: request.tractor_plates default "", // Placas del Tractor
						DriverCode: request.driver_name,
						SealNumber: request.gps_id default ""//Campo para almacenar el GpsId
			            }
			            else
			            {CurrentLoadOperationalStatusEnumVal: request.current_load_operational})
			
					
				}
			
fun requestTms (typeTmsflow: String, request) = typeTmsflow match{
    case "changeTenderGeneral" -> 
				request.status match{
						case "accepted" -> processTenderAccept: requestTender(request)
					    case "reject" -> processTenderReject: requestTender(request)
					    case "cancel" -> processTenderCancel: requestTender(request)
					}			
			
	case "changeStatusGeneral" ->{
				processTrailerActivities: {
					ApiHeader: {
						OperationName: "processTrailerActivities"
					},
					TrailerActivity: {
						SystemLoadID: request.system_load_id,
						StopSequenceNumber: request.stop_sequence_number,
						TrailerActivityTypeEnumVal: request.trailer_activity,
						ActivityDateTime: request.event_date_time ,
						ReasonCode: request.reason_code,
						UpdateFlag: "False"
					}
				}
			}
			

	case "changeStatusPod" ->{
				processSetShipmentProofOfDelivery: {
					ApiHeader: {
						OperationName: "processSetShipmentProofOfDelivery"
					},
					ShipmentUpdateProgressData: {
						ShipmentNumber: request.shipment_number default "",
						SystemLoadID: request.system_load_id as String,
						ShipmentSequenceNumber: request.shipment_number default 0,
						CarrierCode: request.carrier_code,
						ProofOfDelivery: {
							PODDateTime: request.pod_date_time as String {
								format: "YYYY-MM-dd'T'HH:mm:ss"},
							EventReasonCode: "POD"
						},
						SECInformation: {
							SECCode: "POD",
							MovementDateTime: now() as String {
								format: "YYYY-MM-dd'T'HH:mm:ss"
							}
						}
					}
				}
			}
			
}
