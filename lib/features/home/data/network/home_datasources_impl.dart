import 'package:http/http.dart' as http;
import 'package:techn_app/core/errors/exceptions.dart';
import 'package:techn_app/features/home/data/datasources/home_datasources.dart';

class HomeDataSourceImpl extends HomeDataSources {
  HomeDataSourceImpl();

  @override
  Future<dynamic> postUser() async {
    try {
      final response = await http.post(
        Uri.parse(
          'https://a.zencillo.net/ZS_APICapturadorConsolidador/v1/post_command',
        ),
        headers: <String, String>{
          "Accept": "application/json",
          "Content-Type": 'application/json',
        },
      );

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
