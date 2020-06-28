import 'package:arch/app/modules/home/home_page.dart';
import 'package:arch/app/modules/home/repositories/apiadvisor_repository.dart';
import 'package:arch/app/modules/home/repositories/apiadvisor_repository_interface.dart';
import 'package:arch/app/modules/home/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

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
