import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          "assets/images/logo-univesp.png",
        ));
  }
}
