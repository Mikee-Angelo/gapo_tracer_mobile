import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Tips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TipsState();
  }
}

class TipsState extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety Tips'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Adaptive.h(
            double.parse(GlobalConfiguration().get('padding')),
          ),
          vertical: 3.0.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Safety Tips',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 2.0.h),
            Text(
              '         Your safety is more important! You and your loved one can help us make sure that you stay safe and recover quickly by following these simple safety steps.',
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 4.0.h),
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/washing-hands.png'),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text(
                    'Wash your hands regularly',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.5.h,
                    ),
                    child: Text(
                      'Clean hands will help to lower the risk of infection your visitors and the people who take care of you at home should also wash their hands or use hand sanitizer often.',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#707070'),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.0.h),
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/social-distancing.png'),
                  SizedBox(height: 1.5.h),
                  Text(
                    'Social Distancing',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.0.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: Text(
                      'Keep social distancing and stay at least 2 feet from other people whenever possible.',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#707070'),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.0.h),
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/face-mask.png'),
                  SizedBox(height: 1.5.h),
                  Text(
                    'Always wear your mask',
                    style: TextStyle(
                      fontSize: 1.8.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.0.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.6.h,
                    ),
                    child: Text(
                      'Wearing a face mask in public helps prevent the spread of COVID-19 — but only if worn properly, covering both your nose and mouth.',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HexColor('#707070'),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
