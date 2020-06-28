import 'package:flutter/foundation.dart';
import 'package:home_module/src/models/apiadvisor_model.dart';
import 'package:home_module/src/repositories/apiadvisor_repository_interface.dart';

class ApiAdvisorViewModel {
  final IApiAdvisor repository;

  final apiAdvisorModel = ValueNotifier<ApiAdvisorModel>(null);

  ApiAdvisorViewModel(this.repository);

  Future fill() async {
    try {
      apiAdvisorModel.value = await repository.getWeather();
    } catch (e) {}
  }
}
