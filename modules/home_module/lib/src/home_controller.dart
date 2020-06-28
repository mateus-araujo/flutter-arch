import 'package:flutter/foundation.dart';
import 'package:home_module/src/models/apiadvisor_model.dart';
import 'package:home_module/src/viewmodels/apiadvisor_viewmodel.dart';

class HomeController {
  final ApiAdvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiAdvisorModel> get weather => viewModel.apiAdvisorModel;

  getWeather() {
    viewModel.fill();
  }
}
