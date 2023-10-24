import 'package:flutter/material.dart';
import 'package:minto_softroniics/controller/provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.checkUserLogin(context);
    return Scaffold(
      body: Center(
        child: Container(
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Minto-logos_transparent.png'),
            ),
          ),
        ),
      ),
    );
  }
}
