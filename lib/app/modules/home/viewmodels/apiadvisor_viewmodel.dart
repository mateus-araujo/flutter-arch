import 'package:arch/app/modules/home/models/apiadvisor_model.dart';
import 'package:arch/app/modules/home/repositories/apiadvisor_repository_interface.dart';
import 'package:flutter/foundation.dart';

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
