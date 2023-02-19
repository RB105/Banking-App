import 'package:bankingapp/data/service/card_service.dart';
import 'package:flutter/material.dart';

class AddCardProvider extends ChangeNotifier {
  AddCardProvider(){
    addCards();
  }
  CardService cardService = CardService();

  TextEditingController cardNumberController= TextEditingController();
  TextEditingController dateController = TextEditingController();

  bool isLoading = false;
  String error = "";
  dynamic data;

  void addCards() async {
    isLoading = true;
    notifyListeners();
    await cardService.addCards(cardNumber: cardNumberController.text,date: dateController.text).then((dynamic response) {
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
