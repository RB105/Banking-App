import 'package:bankingapp/core/router/router.dart';
import 'package:bankingapp/provider/add_card_provider.dart';
import 'package:bankingapp/provider/get_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => GetCardProvider(),),
    ChangeNotifierProvider(create: (context) => AddCardProvider(),)
  ],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      onGenerateRoute: RouteGenerator.router.onGenerate,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}