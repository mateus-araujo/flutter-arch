import 'package:arch/app/model/apiadvisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiAdvisorModel> getWeather();
}