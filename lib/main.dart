import 'package:farm/common/Calculo.dart';
import 'package:farm/models/EntradaModel.dart';
import 'package:farm/stores/EventoGeral.dart';
import 'package:farm/stores/Resultado.dart';
import 'package:farm/themes/thema.dart';
import 'package:farm/views/InicioPage/InicioScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  getIt.registerSingleton<Resultado>(Resultado(), signalsReady: true);
  //getIt.registerSingleton<Calculo>(Calculo(), signalsReady: true);
  getIt.registerSingleton<EntradaModel>(EntradaModel(), signalsReady: true);
  getIt.registerSingleton<EventoGeral>(EventoGeral(), signalsReady: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'AgriDecode',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: const InicioScreen(),
    );
  }
}
