import 'package:depotkuota/model/home/list_home_model.dart';
import 'package:depotkuota/service/shared_pref_service.dart';

import '../../common/shared_code.dart';
import 'base_home_repository.dart';
import 'package:http/http.dart' as http;

class HomeRepository implements BaseHomeRepository {
  Future<ListHomeModel> getListHome() async {
    final response = await http.get(
      Uri.parse("${SharedCode.baseUrl}v1/ppob/menu/home"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${SharedPreferencesService.getAuthModel()!.token}',
      },
    );

    if (response.statusCode == 200) {
      return listHomeModelFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
