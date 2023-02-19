import 'package:bankingapp/data/service/card_service.dart';
import 'package:flutter/material.dart';

class GetCardProvider extends ChangeNotifier {
  GetCardProvider(){
    getCards();
  }
  CardService cardService = CardService();

  bool isLoading = false;
  String error = "";
  dynamic data;

  void getCards() async {
    isLoading = true;
    notifyListeners();
    await cardService.getCards().then((dynamic response) {
      if (response is String) {
        error = response;
        isLoading = false;
        notifyListeners();
      } else {
        data = response;
        isLoading= false;
        notifyListeners();
      }
    });
  }
}
