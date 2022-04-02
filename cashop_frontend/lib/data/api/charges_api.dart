import 'package:cashop_frontend/data/api/api_response.dart';
import 'package:cashop_frontend/data/api/cashop_api.dart';
import 'package:flutter/foundation.dart';

class ChargesApi extends CashopApi {
  ChargesApi(String apiUrl) : super(apiUrl);

  Future<ApiResponse<List<Charge>>> getCharges() {
    return super.get(
        url: "/charges",
        mapper: (json) => (json['data'] as List<dynamic>)
            .map((e) => Charge.fromJson(e))
            .toList());
  }
}

class Charge {
  int id;
  Price price;
  List<Address> addresses;
  String state;

  Charge(this.id, this.price, this.addresses, this.state);

  factory Charge.fromJson(Map<String, dynamic> json) {
    return Charge(
        json['id'],
        Price.fromJson(json['price']),
        (json['addresses'] as List<dynamic>)
            .map((e) => Address.fromJson(e))
            .toList(),
        json['state']);
  }

  @override
  String toString() {
    return "Charge:{id:$id, price: $price, addresses: $addresses, state:$state}";
  }
}

class Address {
  String currency;
  String address;
  double amount;

  Address(this.currency, this.address, this.amount);

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(json["currency"], json['address'], json['amount']);
  }

  @override
  String toString() {
    return "Address:{currency: " +
        currency +
        ", address: " +
        address +
        ", amount:" +
        amount.toString() +
        "}";
  }
}

class Price {
  String currency;
  double amount;
  Price(this.currency, this.amount);

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(json['currency'], json['amount']);
  }

  @override
  String toString() {
    return "Price{currency:$currency,amount:$amount}";
  }
}
