import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:minto_softroniics/controller/provider.dart';
import 'package:minto_softroniics/views/open_table.dart';
import 'package:minto_softroniics/widgets/table_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool occupied = false;
    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.getUserName();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login_bg_2.jpg'), fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome ${provider.userName},',
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      const Text(
                        'Choose a table',
                        style: TextStyle(
                            fontFamily: 'SofiaPro',
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        occupied = true;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OpenTable(
                                table: 'Table ${index + 1}',
                                occupied: occupied),
                          ),
                        );
                      },
                      child: TableCard(
                        occupied: occupied,
                        index: index + 1,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
