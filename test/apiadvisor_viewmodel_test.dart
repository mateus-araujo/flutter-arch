import 'package:arch/app/app_module.dart';
import 'package:arch/app/core/interfaces/client_http_interface.dart';
import 'package:arch/app/modules/home/home_module.dart';
import 'package:arch/app/modules/home/models/apiadvisor_model.dart';
import 'package:arch/app/modules/home/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientHttpMockito extends Mock implements IClientHttp {}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  initModule(AppModule(), changeBinds: [
    Bind<IClientHttp>((i) => ClientHttpMockito()),
  ]);

  initModule(HomeModule());

  group('ApiAdvisorViewModel', () {
    test('ApiAdvisorViewModel error', () async {
      when(Modular.get<IClientHttp>().get(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f"))
          .thenThrow(Exception("error"));

      final viewModel = Modular.get<ApiAdvisorViewModel>();
      await viewModel.fill();

      expect(viewModel.apiAdvisorModel.value, null);
    });

    test('ApiAdvisorViewModel success', () async {
      when(Modular.get<IClientHttp>().get(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f"))
          .thenAnswer((_) => Future.value([
                ApiAdvisorModel(
                        country: "BR",
                        date: '2020/06/14',
                        text: "Uma frente fria se aproxima...")
                    .toJson(),
              ]));
      final viewModel = Modular.get<ApiAdvisorViewModel>();
      await viewModel.fill();

      expect(viewModel.apiAdvisorModel.value, isA<ApiAdvisorModel>());
    });
  });
}
