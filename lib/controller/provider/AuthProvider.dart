import 'package:app/controller/provider/NotificationProvider.dart';
import 'package:app/controller/services/AuthServices.dart';
import 'package:app/model/StatusModel.dart';
import 'package:app/view/Auth/Login.dart';
import 'package:app/view/Home.dart';
import 'package:app/view/LoginLoading.dart';
import 'package:app/view/RegisterLoading.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AuthProvider extends ChangeNotifier {
  var _profile = Hive.box('profile');
  final _services = AuthServices();
  final _notification = NotificationProvider();
  String? statusValue;
  String? message;

  Future<void> login({
    required BuildContext context,
    required TextEditingController phone,
    required TextEditingController password,
  }) async {
    String? token = await _notification.generateToken();

    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginLoading()));
    await _services
        .login(
      token: token!,
      phone: phone.text,
      password: password.text,
    )
        .then((res) {
      print('TOken: $res');
      if (res.accessToken == null) {
        Navigator.pop(context);
        CoolAlert.show(
          backgroundColor: Colors.white,
          context: context,
          type: CoolAlertType.error,
          title: 'Login Failed',
          text: 'Please check your phone or password',
          confirmBtnColor: Colors.red,
        );
      } else {
        _profile.putAll(res.toJson());

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Home()));
      }
    });
  }

  Future<void> register({
    required BuildContext context,
    required TextEditingController firstName,
    required TextEditingController lastName,
    required TextEditingController address,
    required TextEditingController phone,
    required TextEditingController password,
    required TextEditingController age,
    required int gender,
  }) async {
    String? token = await _notification.generateToken();

    Navigator.push(
        context, MaterialPageRoute(builder: (_) => RegisterLoading()));
    await _services
        .register(
      firstName: firstName.text,
      lastName: lastName.text,
      address: address.text,
      phone: phone.text,
      password: password.text,
      gender: gender.toString(),
      age: age.text,
      token: token!,
    )
        .then((res) {
      if (res.status == true) {
        _profile.putAll(res.toJson());

        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
        CoolAlert.show(
          confirmBtnColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.white,
          context: context,
          type: CoolAlertType.success,
          title: 'Registered Successfully',
          text:
              'You can now use your QR code when entering establishments, riding transportaion and even to other people.',
        );
      } else {
        CoolAlert.show(
          backgroundColor: Colors.white,
          context: context,
          type: CoolAlertType.error,
          title: 'Login Failed',
          text: 'Phone number already in use',
          confirmBtnColor: Colors.red,
        );
        Navigator.pop(context);
      }
    });
  }

  Future<void> status() async {
    List legend = [
      'Normal',
      'Suspected',
      'Negative',
      'Positive',
      'Recovered',
      'Death'
    ];
    await _services.status().then((value) {
      statusValue = legend[value.tracerStatus!];
      message = value.message;
      notifyListeners();
    });
  }
}
