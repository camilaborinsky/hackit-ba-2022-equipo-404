import 'dart:math';

import 'package:cashop_frontend/data/api/api_response.dart';
import 'package:cashop_frontend/data/api/wallet_api.dart';
import 'package:cashop_frontend/layout/responsive_interface.dart';
import 'package:cashop_frontend/style/color_palette.dart';
import 'package:cashop_frontend/style/font_family.dart';
import 'package:cashop_frontend/ui/layouts/mobile_scaffold.dart';
import 'package:cashop_frontend/ui/layouts/web_scaffold.dart';
import 'package:cashop_frontend/ui/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../data/api/charges_api.dart';

class ChargeScreen extends StatefulWidget {
  const ChargeScreen({Key? key}) : super(key: key);

  @override
  State<ChargeScreen> createState() => _ChargeScreenState();
}

class _ChargeScreenState extends State<ChargeScreen> {
  late PageController pageController;
  late ChargesApi chargesApi;
  Charge? charge;

  @override
  void initState() {
    pageController = PageController();
    chargesApi = ChargesApi("http://localhost:8000");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        web: WebScaffold(withFloating: false, child: _buildComponent(context)),
        mobile: MobileScaffold(
            withFloating: false, child: _buildComponent(context)),
        tablet: MobileScaffold(
          withFloating: false,
          child: _buildComponent(context),
        ),
        other: MobileScaffold(
          withFloating: false,
          child: _buildComponent(context),
        ));
  }

  Widget _buildComponent(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  if (pageController.page == 0) {
                    Navigator.of(context).pop();
                  } else {
                    _previousPage();
                  }
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: ColorPalette.doveGrey,
                )),
            Text(
              'QR',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            IconButton(
              iconSize: 40,
              onPressed: () {
                Navigator.of(context).pushNamed("/faq");
              },
              icon: const Icon(
                Icons.help_outline_rounded,
                color: ColorPalette.doveGrey,
              ),
              color: ColorPalette.athensGrey,
            ),
          ],
        ),
        Flexible(
            fit: FlexFit.tight,
            child: PageView(
              controller: pageController,
              children: <Widget>[
                PriceInputPage(
                  onPriceSubmitted: (double price) async {
                    ApiResponse<Charge> apiResponseCreateCharge =
                        await chargesApi.createCharge(Price("ARS", price));
                    if (apiResponseCreateCharge.success) {
                      Charge? chargesData = apiResponseCreateCharge.data;
                      if (chargesData != null) {
                        setState(() {
                          charge = chargesData;
                        });
                      }
                    }
                    _nextPage();
                  },
                ),
                QRPage(charge)
              ],
            ))
      ],
    );
  }

  void _nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  void _previousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}

class PriceInputPage extends StatefulWidget {
  const PriceInputPage({
    Key? key,
    required this.onPriceSubmitted,
  }) : super(key: key);

  final void Function(double price) onPriceSubmitted;
  @override
  State<PriceInputPage> createState() => _PriceInputPageState();
}

class _PriceInputPageState extends State<PriceInputPage> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController =
        TextEditingController.fromValue(const TextEditingValue(text: '0'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Ingresar monto a cobrar",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.sfProDisplay),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Container(
            width: 200,
            child: TextFormField(
              textAlign: TextAlign.center,
              controller: _textEditingController,
              autofocus: true,
              showCursor: true,
              onChanged: (String? value) {},
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  prefixText: '\$',
                  prefixStyle: Theme.of(context).textTheme.headline1?.copyWith(
                      fontFamily: FontFamily.sfProDisplay, fontSize: 25)),
              keyboardType: TextInputType.number,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(fontFamily: FontFamily.sfProDisplay),
            ),
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ActionIconButton(
                primary: true,
                iconData: Icons.qr_code_2_rounded,
                text: 'Generar QR',
                onPressed: () {
                  widget.onPriceSubmitted(
                      double.parse(_textEditingController.value.text));
                }),
          ),
        )
      ],
    );
  }
}

class QRPage extends StatefulWidget {
  Charge? charge;
  QRPage(this.charge, {Key? key}) : super(key: key);

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  late int currentCoin;

  @override
  void initState() {
    currentCoin = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Text(
            'Recibo de dinero mediante el QR',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.sfProDisplay),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            width: 331,
            height: 331,
            child: _generateQRCode(widget.charge?.addresses[currentCoin]),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 24, left: 8, right: 8),
          child: Text(
            "SELECCI??N DE MONEDA",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.sfProDisplay),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GridView.builder(
            primary: false,
            // padding:  EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width - (200*2+24+24))/2),
            shrinkWrap: true,
            itemCount: CryptoCoin.availableCoins.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                mainAxisExtent: 80,
                childAspectRatio: 132 / 60),

            // crossAxisSpacing: 16,
            // mainAxisSpacing: 12,
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  if (index != currentCoin) {
                    setState(() {
                      currentCoin = index;
                    });
                    //TODO: regenerar QR
                  }
                },
                child: AvailableCoinItem(
                  selected: index == currentCoin,
                  cryptoCoin: CryptoCoin.availableCoins[index],
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionIconButton(
                  iconData: Icons.download_rounded,
                  text: 'Guardar',
                  onPressed: () {}),
              const SizedBox(
                width: 20,
              ),
              ActionIconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProcessingPaymentScreen()));
                },
                iconData: Icons.check_rounded,
                primary: true,
                text: 'Listo',
              ),
              const SizedBox(
                width: 20,
              ),
              ActionIconButton(
                onPressed: () {},
                iconData: Icons.share,
                text: 'Compartir',
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _generateQRCode(Address? address) {
    if (address == null) return Container();
    return Container(
        child: Center(
      child: QrImage(
        data: "0x${getRandomString(42)}",
        version: QrVersions.auto,
        size: 200.0,
      ),
    ));
  }

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}

class ActionIconButton extends StatelessWidget {
  const ActionIconButton({
    Key? key,
    required this.iconData,
    required this.text,
    required this.onPressed,
    this.primary = false,
  }) : super(key: key);

  final IconData iconData;
  final String text;
  final bool primary;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: primary
                      ? ColorPalette.algaeGreen
                      : ColorPalette.athensGrey,
                  shape: BoxShape.circle),
              width: primary ? 80 : 70,
              height: primary ? 80 : 70,
              child: Icon(
                iconData,
                size: primary ? 45 : 30,
                color: primary ? ColorPalette.white : ColorPalette.algaeGreen,
              )),
          const SizedBox(
            height: 8,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}

class AvailableCoinItem extends StatelessWidget {
  const AvailableCoinItem(
      {Key? key, required this.selected, required this.cryptoCoin})
      : super(key: key);

  final bool selected;
  final CryptoCoin cryptoCoin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      height: 68.18,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: selected
            ? Border.all(color: ColorPalette.yourPink, width: 1.5)
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: ColorPalette.transparent,
            backgroundImage: AssetImage(cryptoCoin.iconPath),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  cryptoCoin.abbreviation,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Text(
                    "${cryptoCoin.performance.abs().toStringAsFixed(2)}%",
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        color: cryptoCoin.performance > 0
                            ? ColorPalette.algaeGreen
                            : ColorPalette.yourPink),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.arrow_drop_up_outlined,
                    color: cryptoCoin.performance > 0
                        ? ColorPalette.algaeGreen
                        : ColorPalette.yourPink,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
