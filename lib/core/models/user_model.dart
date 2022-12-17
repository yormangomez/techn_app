class UserModel {
  UserModel({
    this.id,
    this.name,
    this.phoneNumer,
    this.surName,
  });

  String? id;
  String? name;
  int? phoneNumer;
  String? surName;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        phoneNumer: json["phoneNumer"],
        surName: json["surName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phoneNumer": phoneNumer,
        "surName": surName,
      };
}
