import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:minto_softroniics/controller/provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login_bg_3.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 2.0, sigmaY: 2.0), // Adjust blur intensity
            child: Container(
              color: Colors.black
                  .withOpacity(0.5), // Adjust the background color and opacity
            ),
          ),
          Positioned(
            // left: width / 20,
            top: height / 6,
            child: SizedBox(
              width: width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to,',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontFamily: 'Poppins'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'MINTO',
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: width,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(107, 0, 0, 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'How to address you?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'SofiaPro'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Consumer<UserProvider>(
                          builder: (context, provider, _) {
                            return Form(
                              key: provider.formKey,
                              child: TextFormField(
                                textCapitalization: TextCapitalization.words,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '* required field';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: provider.nameController,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SofiaPro'),
                                decoration: const InputDecoration(
                                  hintText: 'Username',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'SofiaPro'),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Consumer<UserProvider>(
                                builder: (context, provider, _) {
                              return ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.black)),
                                onPressed: () {
                                  if (provider.formKey.currentState!
                                      .validate()) {
                                    provider.onContinueButton(context).then(
                                        (value) => provider.getUserName());
                                  } else {
                                    return;
                                  }
                                },
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(
                                      fontFamily: 'SofiaPro',
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                              );
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
