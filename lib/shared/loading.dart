import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Center(
            //Change if needed https://pub.dev/packages/flutter_spinkit
            child: SpinKitChasingDots(color: Colors.blue, size: 50.0)));
  }
}
