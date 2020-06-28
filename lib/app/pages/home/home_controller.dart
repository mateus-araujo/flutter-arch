import 'package:arch/app/model/apiadvisor_model.dart';
import 'package:arch/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final ApiAdvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiAdvisorModel> get weather => viewModel.apiAdvisorModel;

  getWeather() {
    viewModel.fill();
  }
}
