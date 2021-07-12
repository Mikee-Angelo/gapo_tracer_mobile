import 'package:app/view/Auth/Login.dart';
import 'package:app/view/Logs.dart';
import 'package:app/view/Privacy.dart';
import 'package:app/view/Tips.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppDrawerMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DrawerMobileState();
  }
}

class DrawerMobileState extends State<AppDrawerMobile> {
  var _profile = Hive.box('profile');

  _logout({required BuildContext context}) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => Login()));

    _profile.clear();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: FutureBuilder(
        builder: (context, snapshot) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    SizedBox(
                      height: 25.h,
                      child: DrawerHeader(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('images/avatar.png'),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              _profile.get('user')['full_name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                            Text(
                              _profile.get('user')['phone'],
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                _profile.get('user')['address'],
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: HexColor('#707070'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.list_alt_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 2.3.h,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Logs',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      onTap: () => Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Logs())),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.health_and_safety_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 2.3.h,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Safety Tips',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      onTap: () => Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Tips())),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.privacy_tip_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 2.3.h,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Privacy Policy',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Privacy())),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  _logout(context: context);
                },
                minWidth: double.infinity,
                color: Theme.of(context).primaryColor,
                height: 6.h,
                elevation: 0.0,
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
