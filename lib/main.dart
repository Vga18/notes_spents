import 'package:flutter/material.dart';

import 'core/navigation/app_routes.dart';
import 'injection_container.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Iniciaamos inyeccion de dependencias
  setupLocator();
  
  await Supabase.initialize(
    url: 'https://cxsrxuetcutmjrquzjyo.supabase.co',
    publishableKey: 'sb_publishable_Gvm-EcyzGaA8I3M_0iy6bg_InHanhyg',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      routerConfig: AppRoutes.router,
    );
  }
}
