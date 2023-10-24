import 'package:flutter/material.dart';
import 'package:minto_softroniics/controller/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.getUserName();
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.userName!),
      ),
      body: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
