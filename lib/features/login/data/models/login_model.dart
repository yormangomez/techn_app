class LoginModel {
  LoginModel({
    this.idcompania,
    this.idempleado,
    this.login,
    this.pass,
    this.empleado,
    this.identificacion,
  });

  int? idcompania;
  int? idempleado;
  String? login;
  String? pass;
  String? empleado;
  int? identificacion;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        idcompania: json["idcompania"],
        idempleado: json["idempleado"],
        login: json["login"],
        pass: json["pass"],
        empleado: json["empleado"],
        identificacion: json["identificacion"],
      );

  Map<String, dynamic> toJson() => {
        "idcompania": idcompania,
        "idempleado": idempleado,
        "login": login,
        "pass": pass,
        "empleado": empleado,
        "identificacion": identificacion,
      };
}
