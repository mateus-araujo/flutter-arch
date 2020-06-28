import 'package:arch/app/modules/home/components/custom_switch_widget.dart';
import 'package:arch/app/modules/home/home_controller.dart';
import 'package:arch/app/modules/home/models/apiadvisor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.cloud),
          onPressed: () {
            controller.getWeather();
          }),
      body: Center(
          child: Column(
        children: [
          CustomSwitchWidget(),
          Padding(
            padding: EdgeInsets.all(20),
            child: ValueListenableBuilder<ApiAdvisorModel>(
                valueListenable: controller.weather,
                builder: (context, model, child) {
                  if (model?.text == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Text(model.text, textAlign: TextAlign.justify);
                }),
          )
        ],
      )),
    );
  }
}
