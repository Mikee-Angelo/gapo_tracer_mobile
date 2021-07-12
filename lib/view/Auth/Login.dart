import 'package:app/controller/provider/AuthProvider.dart';
import 'package:app/view/Auth/Register.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _phone = TextEditingController();
  final _password = TextEditingController();
  _onRegisterPage({required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Register()));
  }

  _onLogin({required BuildContext context}) {
    Provider.of<AuthProvider>(context, listen: false)
        .login(context: context, phone: _phone, password: _password);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Adaptive.h(
            double.parse(GlobalConfiguration().get('padding')),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              child: Image.asset('images/logo.png'),
            ),
            Text(
              'Contact Tracing App',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 4.5.h),
            TextFormField(
              controller: _phone,
              maxLength: 11,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: 'Phone Number',
                counterText: "",
              ),
              keyboardType: TextInputType.phone,
              // Only numbers can be entered
            ),
            SizedBox(height: 1.h),
            TextFormField(
              controller: _password,
              cursorColor: Theme.of(context).primaryColor,
              obscureText: true,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 3.5.h),
            MaterialButton(
              onPressed: () => _onLogin(context: context),
              minWidth: double.infinity,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 6.h,
              elevation: 0.0,
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            GestureDetector(
              onTap: () {
                _onRegisterPage(context: context);
              },
              child: Text(
                'Create Account',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
