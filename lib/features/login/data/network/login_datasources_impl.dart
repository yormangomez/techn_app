import 'package:techn_app/core/errors/exceptions.dart';
import 'package:techn_app/features/login/data/datasources/login_datasources.dart';
import 'package:http/http.dart' as http;

class LoginDataSourceImpl extends LoginDataSources {
  LoginDataSourceImpl();

  @override
  Future<dynamic> auth(String user, String password) async {
    try {
      final data = {
        "user": user,
        "password": password,
      };

      final response = await http.post(
          Uri.parse(
              'https://a.zencillo.net/ZS_APICapturadorConsolidador/v1/post_command'),
          headers: <String, String>{
            "Accept": "application/json",
            "Content-Type": 'application/json',
          },
          body: data);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw GeneralException(
            response.reasonPhrase ?? "Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
