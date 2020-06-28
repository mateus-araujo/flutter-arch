import 'package:home_module/src/models/apiadvisor_model.dart';
import 'package:home_module/src/repositories/apiadvisor_repository_interface.dart';

import 'package:core_module/core_module.dart';

class ApiAdvisorRepository implements IApiAdvisor {
  final IClientHttp client;

  ApiAdvisorRepository(this.client);

  @override
  Future<ApiAdvisorModel> getWeather() async {
    var json = await client.get(
        "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f");

    ApiAdvisorModel model = ApiAdvisorModel.fromJson(json[0]);
    return model;
  }
}
