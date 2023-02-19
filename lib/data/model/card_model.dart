class CardModel {
  String? number;
  String? date;
  String? user;
  String? phone;
  String? balance;

  CardModel({this.number, this.date, this.user, this.phone, this.balance});

  CardModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    date = json['date'];
    user = json['user'];
    phone = json['phone'];
    balance = json['balance'];
  }
}
