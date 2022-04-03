import 'package:cashop_frontend/data/api/api_response.dart';
import 'package:cashop_frontend/data/api/charges_api.dart';
import 'package:cashop_frontend/data/api/wallet_api.dart';
import 'package:cashop_frontend/ui/components/charge_row_item.dart';
import 'package:flutter/material.dart';

class ApiMethodsTest extends StatefulWidget {
  ApiMethodsTest({Key? key}) : super(key: key);

  @override
  State<ApiMethodsTest> createState() => _ApiMethodsTestState();
}

class _ApiMethodsTestState extends State<ApiMethodsTest> {
  List<Charge> charges = [];
  List<Coin> wallet = [];
  late ChargesApi chargesApi;
  late WalletApi walletApi;

  @override
  void initState() {
    chargesApi = ChargesApi("http://localhost:8000");
    walletApi = WalletApi("http://localhost:8000");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(children: [
          TextButton(
            child: Text("Get Charges"),
            onPressed: () async {
              ApiResponse<List<Charge>> apiResponseCharges =
                  await chargesApi.getCharges();
              if (apiResponseCharges.success) {
                List<Charge>? chargesData = apiResponseCharges.data;
                if (chargesData != null) {
                  setState(() {
                    charges = chargesData
                        .map((e) => Charge(e.id, e.price, e.addresses, e.state))
                        .toList();
                  });
                }
              }
            },
          ),
          TextButton(
            child: Text("Add Charge"),
            onPressed: () async {
              Price newChargePrice = Price("ARS", 999);
              ApiResponse<Charge> apiResponseCreateCharge =
                  await chargesApi.createCharge(newChargePrice);
              if (apiResponseCreateCharge.success) {
                Charge? chargesData = apiResponseCreateCharge.data;
              }
            },
          )
        ]),
        ...charges.map((e) => ChargeRowItem(e)).toList(),
        Text("WALLET"),
        TextButton(
            onPressed: () async {
              ApiResponse<List<Coin>> apiResponseWallet =
                  await walletApi.getWallet();
              if (apiResponseWallet.success) {
                List<Coin>? coins = apiResponseWallet.data;
                if (coins != null) {
                  wallet = coins;
                  print("WALLET=======");
                  print(wallet);
                }
              }
            },
            child: Text("GET WALLET INFO"))
      ]),
    );
  }
}
