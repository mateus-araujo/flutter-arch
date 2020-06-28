import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_module/src/repositories/apiadvisor_repository.dart';
import 'package:home_module/src/repositories/apiadvisor_repository_interface.dart';
import 'package:home_module/src/viewmodels/apiadvisor_viewmodel.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => ApiAdvisorViewModel(i.get())),
        Bind<IApiAdvisor>((i) => ApiAdvisorRepository(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (context, args) => HomePage()),
      ];
}
