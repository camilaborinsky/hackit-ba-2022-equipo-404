import 'package:cashop_frontend/layout/responsive_interface.dart';
import 'package:cashop_frontend/style/color_palette.dart';
import 'package:cashop_frontend/ui/layouts/mobile_scaffold.dart';
import 'package:cashop_frontend/ui/layouts/web_scaffold.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        web: WebScaffold(
          withFloating: false,
          child: _buildComponent(context),
        ),
        mobile: MobileScaffold(
          child: _buildComponent(context),
          withFloating: false,
        ),
        tablet: MobileScaffold(
          child: _buildComponent(context),
          withFloating: false,
        ),
        other: MobileScaffold(
          child: _buildComponent(context),
          withFloating: false,
        ));
  }

  Widget _buildComponent(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children:[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: ColorPalette.doveGrey,
                )),
            Container(
              alignment: Alignment.center,
              child:
                Text("FAQ", textAlign: TextAlign.center, style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.bold),),
            )
            ]
          ),
        ),
        // Flexible(
        //   fit: FlexFit.tight,
        //   child: Container()
          ListView(
            shrinkWrap: true,
            children: FAQ.faqs.map<ExpansionTile>((FAQ item) {
              return ExpansionTile(
                      title: Text(item.question, style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),),  
                  children:[ 
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(item.answer, style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 18),),
                     ),]
                  );
            }).toList(),
          ),
        // ),
      ],
    );
  }
}

class FAQ {
  static List<FAQ> faqs = [
    FAQ(
        question: "¿Qué es Cashop?",
        answer:
            "Cashop es una aplicación móvil y web para que comerciantes puedan recibir pagos en crypto monedas."),
    FAQ(
        question: "¿Cómo se hace para cobrar?",
        answer:
            "¡Es muy simple!\n 1. Desde la pantalla principal de la aplicación, seleccionar la opción de \"cobrar\"\n2. Ingresar el monto y elegir la opción de \"Generar QR\" \n3. Elegir la moneda en que va a pagar el cliente\n4. ¡Listo! Mostrarle al cliente el QR para que lo escanee desde su billetera digital para poder pagar."),
    FAQ(
        question:
            "¿El cliente tiene que tener cuenta de Cashop para poder pagar?",
        answer:
            "No. El cliente puede realizar la transacción desde cualquier billetera que le permita transferir en cryptos. La aplicación de Cashop es solo para comerciantes."),
    FAQ(
        question: "¿Los pagos se pueden realizar en cualquier criptomoneda?",
        answer:
            "No. Para garantizar tiempos de transacción razonables para comercios a la calle en Cashop limitamos las criptomonedas disponibles para el pago. Se pueden realizar pagos en las siguientes criptos: Bitcoin Lightning Network, Ripple, UST, Binance Smart Chain")
  ];
  FAQ({required this.question, required this.answer});
  final String question;
  final String answer;
}
