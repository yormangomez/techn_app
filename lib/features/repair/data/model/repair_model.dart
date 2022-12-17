class RepairModel {
  RepairModel({
    this.id,
    this.brand,
    this.model,
    this.location,
    this.description,
    this.userId,
    this.phoneProduct,
    this.proceso,
    this.feedback,
    this.documentoUser,
  });
  String? id;
  String? brand;
  String? model;
  String? location;
  String? description;
  String? userId;
  String? documentoUser;
  String? phoneProduct;
  Proceso? proceso;
  String? feedback;

  factory RepairModel.fromJson(Map<String, dynamic> json) => RepairModel(
        id: json["id"],
        brand: json["brand"],
        model: json["model"],
        location: json["location"],
        description: json["description"],
        userId: json["userID"],
        documentoUser: json["documentoUser"],
        phoneProduct: json["phoneProduct"],
        proceso: Proceso.fromJson(json["proceso"]),
        feedback: json["feedback"],
      );

  Map<String, dynamic> toJson() => {
        "brand": brand,
        "model": model,
        "location": location,
        "description": description,
        "userID": userId,
        "phoneProduct": phoneProduct,
        "proceso": proceso?.toJson(),
        "feedback": feedback,
        "documentoUser": documentoUser,
      };
}

class Proceso {
  Proceso({
    this.estadoDispositivo,
    this.descripcion,
  });

  String? estadoDispositivo;
  String? descripcion;

  factory Proceso.fromJson(Map<String, dynamic> json) => Proceso(
        estadoDispositivo: json["estadoDispositivo"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "estadoDispositivo": estadoDispositivo,
        "descripcion": descripcion,
      };
}

/*
class Proceso {
  Proceso({
    this.espera,
    this.procesoReparacion,
    this.finalizado,
    this.rechazadoEspera,
    this.rechazadoCotizacion,
  });

  bool? espera;
  bool? procesoReparacion;
  bool? finalizado;
  bool? rechazadoEspera;
  bool? rechazadoCotizacion;

  factory Proceso.fromJson(Map<String, dynamic> json) => Proceso(
        espera: json["espera"],
        procesoReparacion: json["procesoReparacion"],
        finalizado: json["finalizado"],
        rechazadoEspera: json["rechazadoEspera"],
        rechazadoCotizacion: json["rechazadoCotizacion"],
      );

  Map<String, dynamic> toJson() => {
        "espera": espera,
        "procesoReparacion": procesoReparacion,
        "finalizado": finalizado,
        "rechazadoEspera": rechazadoEspera,
        "rechazadoCotizacion": rechazadoCotizacion,
      };
}
 */
