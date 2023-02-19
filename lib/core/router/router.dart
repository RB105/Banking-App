import 'package:bankingapp/view/add_card_page.dart';
import 'package:bankingapp/view/card_page.dart';
import 'package:flutter/material.dart';


class RouteGenerator {
  static final RouteGenerator _generator = RouteGenerator._init();

  static RouteGenerator get router => _generator;

  RouteGenerator._init();

  Route<dynamic>? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _navigate(const CardPage());
      case 'add_card':
        return _navigate(const AddCardPage());
    }
  }

  MaterialPageRoute _navigate(Widget page) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}
