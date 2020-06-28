import 'package:arch/app/modules/home/models/apiadvisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiAdvisorModel> getWeather();
}
