import 'package:home_module/src/models/apiadvisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiAdvisorModel> getWeather();
}
