import 'package:flutter/material.dart';
import 'package:shop_app/models/User.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";

  @override
  Widget build(BuildContext context) {
    final OtpScreenArguments arguments =
        ModalRoute.of(context)!.settings.arguments as OtpScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(
        user: arguments.user,
      ),
    );
  }
}

class OtpScreenArguments {
  final User user;

  OtpScreenArguments({required this.user});
}
