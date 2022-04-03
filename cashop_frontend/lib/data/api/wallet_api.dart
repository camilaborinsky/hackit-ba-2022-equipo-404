import 'package:equatable/equatable.dart';

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

class CryptoCoin extends Equatable{
  static List<CryptoCoin> availableCoins = [
    CryptoCoin(currency: 'Bitcoin', abbreviation: 'BTC', iconPath: '/crypto_icons/bitcoin_icon.png', performance: 0.6),
    CryptoCoin(currency: 'BNB', abbreviation: 'BNB', iconPath: '/crypto_icons/bnb_icon.png', performance: 0.2),
    CryptoCoin(currency: 'Ripple', abbreviation: 'XRP', iconPath: '/crypto_icons/xrp_icon.png', performance: -0.44)
  ];

  CryptoCoin(
      {required this.currency,
      required this.abbreviation,
      this.performance = 0,
      required this.iconPath});
  final String currency, abbreviation, iconPath;
  final double performance;

  factory CryptoCoin.fromJson(Map<String, dynamic> json) {
    return CryptoCoin(
        currency: json['currency'],
        abbreviation: json["abbreviation"],
        iconPath: json["amount"]);
  }

  @override
  List<Object?> get props => [abbreviation];

  
}
