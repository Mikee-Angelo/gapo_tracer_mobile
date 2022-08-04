import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterLoading extends StatefulWidget {
  const RegisterLoading({Key? key}) : super(key: key);

  @override
  _RegisterLoadingState createState() => _RegisterLoadingState();
}

class _RegisterLoadingState extends State<RegisterLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitPouringHourGlassRefined(
            color: Colors.white,
            size: 4.h,
          ),
          SizedBox(height: 1.5.h),
          Text(
            'Registering information, please wait',
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
