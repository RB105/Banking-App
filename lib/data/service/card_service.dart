import 'package:bankingapp/core/constants/urls/end_point_urls.dart';
import 'package:bankingapp/core/network/dio_catch_error.dart';
import 'package:dio/dio.dart';

class CardService {
  Future<dynamic> getCards() async {
    try {
      Response response = await Dio().get(BankingAppEndPoints.getCards);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      DioCatchErrorConfig().catchError(e).toString();
    }
  }

  Future<dynamic> addCards(
      {required String cardNumber, required String date}) async {
    try {
      Response response = await Dio().post(BankingAppEndPoints.addCards, data: {
        "number": cardNumber,
        "date": date,
        "user": "Jango Rajabov",
        "phone": "+998912345565",
        "balance": "5000"
      },options: Options(contentType: "application/json"));
      print(response.statusCode);
      if (response.statusCode == 201) {
        return response.data;
      } else {
        return response.statusMessage.toString();
      }
    } catch (e) {}
  }
}
