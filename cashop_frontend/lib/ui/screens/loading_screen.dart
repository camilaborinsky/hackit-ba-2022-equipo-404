import 'package:cashop_frontend/layout/responsive_interface.dart';
import 'package:cashop_frontend/style/color_palette.dart';
import 'package:cashop_frontend/ui/layouts/mobile_scaffold.dart';
import 'package:cashop_frontend/ui/layouts/web_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProcessingPaymentScreen extends StatefulWidget {
  const ProcessingPaymentScreen({Key? key}) : super(key: key);

  @override
  State<ProcessingPaymentScreen> createState() =>
      _ProcessingPaymentScreenState();
}

class _ProcessingPaymentScreenState extends State<ProcessingPaymentScreen> {
  late bool loading;

  @override
  void initState() {
    loading = true;
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        web: WebScaffold(withFloating: false, child: _buildComponent(context)),
        mobile: MobileScaffold(
          withFloating: false,
          child: _buildComponent(context),
        ),
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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    loading ? "Procesando pago..." : "Acreditado",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                      width: 280,
                      height: 280,
                      child: Image.asset(loading
                          ? '/illustrations/Clock_perspecti.png'
                          : '/illustrations/Check_perspecti.png')),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: SizedBox(
                    width: 280,
                    child: Text(
                      loading
                          ? "El pago se estará acreditando en unos segundos. Puedes continuar usando la app. Nosotros te avisaremos cuando se acredite."
                          : "El pago se a realizado correctamente. Lo veras disponible en tu portfolio de monedas.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                          color: ColorPalette.dustyGray, fontSize: 16),
                    ),
                  ),
                ),
                
                if (loading)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LoadingAnimationWidget.horizontalRotatingDots(
                      color: ColorPalette.algaeGreen,
                      size: 80,
                    ),
                  ),
                TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(ColorPalette.athensGrey),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 30, vertical: 22))),
                  child: Text(
                    "Continuar usando la app ",
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        color: ColorPalette.emerald,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                 onPressed: () => Navigator.of(context).popUntil((Route r)=> false),
                )
              ],
            ))
      ],
    );
  }
}
