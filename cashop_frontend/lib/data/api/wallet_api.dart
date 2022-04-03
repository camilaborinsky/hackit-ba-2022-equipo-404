import 'api_response.dart';
import 'cashop_api.dart';

class WalletApi extends CashopApi {
  WalletApi(String apiUrl) : super(apiUrl);

  Future<ApiResponse<List<Coin>>> getWallet() {
    return super.get(
        url: "/wallet",
        mapper: (json) => (json["data"] as List<dynamic>)
            .map((e) => Coin.fromJson(e))
            .toList());
  }
}

class Coin {
  String currency, abbreviation;
  double amount;

  Coin(this.currency, this.abbreviation, this.amount);

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(json['currency'], json["abbreviation"], json["amount"]);
  }

  @override
  String toString() {
    return "Coin:{currency:$currency,abbreviation:$abbreviation,amoun:$amount}";
  }
}
