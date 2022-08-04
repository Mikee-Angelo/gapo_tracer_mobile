import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginLoading extends StatefulWidget {
  const LoginLoading({Key? key}) : super(key: key);

  @override
  _LoginLoadingState createState() => _LoginLoadingState();
}

class _LoginLoadingState extends State<LoginLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFadingFour(
            color: Colors.white,
            size: 4.h,
          ),
          SizedBox(height: 1.5.h),
          Text(
            'Logging in',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
