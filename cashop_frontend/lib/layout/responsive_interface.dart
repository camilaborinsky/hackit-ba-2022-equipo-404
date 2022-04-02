import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget(
      {required this.web,
      required this.mobile,
      required this.tablet,
      required this.other});

  final Widget web;
  final Widget tablet;
  final Widget mobile;
  final Widget other;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.desktop:
            return web;
          case DeviceScreenType.tablet:
            return tablet;
          case DeviceScreenType.mobile:
            return mobile;
          default:
            return other;
        }
      },
    );
  }
}
