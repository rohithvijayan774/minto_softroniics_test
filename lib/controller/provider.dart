import 'package:flutter/material.dart';
import 'package:minto_softroniics/views/home_screen.dart';
import 'package:minto_softroniics/views/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginKey = "UserLoggedIn";
  final formKey = GlobalKey<FormState>();
  String? userName;

  //-----------------For Splash Screen-----------------------------------------

  Future<void> checkUserLogin(context) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPrefs.getString(loginKey);
    if (userLoggedIn == null || userLoggedIn.isEmpty) {
      getLoginPage(context);
    } else {
      getHomePage(context);
    }
    notifyListeners();
  }

  Future<void> getLoginPage(context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      ),
    );
    notifyListeners();
  }

  Future<void> getHomePage(context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    ).then((value) => getUserName()).then(
          (value) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          ),
        );
    notifyListeners();
  }

  //-----------------For Login Screen-----------------------------------------

  Future<void> onContinueButton(context) async {
    final username = nameController.text.toString();

    if (username.isNotEmpty) {
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setString(loginKey, username);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      return;
    }
    nameController.clear();
    print('Logged In');
    notifyListeners();
  }

  //-----------------For Home Screen-----------------------------------------

  Future<void> getUserName() async {
    final sharedPref = await SharedPreferences.getInstance();

    userName = sharedPref.getString(loginKey);

    notifyListeners();
  }
}
