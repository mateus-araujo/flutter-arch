import 'package:arch/app/app_controller.dart';
import 'package:arch/app/app_widget.dart';
import 'package:arch/app/interfaces/client_http_interface.dart';
import 'package:arch/app/interfaces/local_storage_interface.dart';
import 'package:arch/app/pages/home/home_controller.dart';
import 'package:arch/app/pages/home/home_page.dart';
import 'package:arch/app/pages/login/login_page.dart';
import 'package:arch/app/repositories/apiadvisor_repository.dart';
import 'package:arch/app/repositories/apiadvisor_repository_interface.dart';
import 'package:arch/app/services/client_http_service.dart';
import 'package:arch/app/services/shared_local_storage_service.dart';
import 'package:arch/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:arch/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => HomeController(i.get())),
      Bind((i) => ApiAdvisorViewModel(i.get())),
      Bind<IApiAdvisor>((i) => ApiAdvisorRepository(i.get())),
      Bind<IClientHttp>((i) => ClientHttpService()),
      Bind((i) => AppController(i.get()), lazy: false),
      Bind((i) => ChangeThemeViewModel(storage: i.get())),
      Bind<ILocalStorage>((i) => SharedLocalStorageService()),
    ];
  }

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router('/', child: (context, args) => LoginPage()),
        Router('/home', child: (context, args) => HomePage()),
      ];
}
