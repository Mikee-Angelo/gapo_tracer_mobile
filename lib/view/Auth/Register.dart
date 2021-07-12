import 'package:app/controller/provider/AuthProvider.dart';
import 'package:app/view/Auth/Login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _address = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _age = TextEditingController();
  final _provider = AuthProvider();

  bool checkBoxValue = false;
  int _gender = 0;
  List<String> _genderList = ['Male', 'Female'];

  void _onLoginPage({required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
  }

  _onRegister({required BuildContext context}) {
    Provider.of<AuthProvider>(context, listen: false).register(
      context: context,
      firstName: _firstName,
      lastName: _lastName,
      address: _address,
      age: _age,
      phone: _phone,
      password: _password,
      gender: _gender,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal:
                Adaptive.h(double.parse(GlobalConfiguration().get('padding')))),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 3.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 2.0.h),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non finibus metus.',
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 3.5.h),
              TextFormField(
                controller: _firstName,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'First Name',
                  counterText: "",
                ),
                keyboardType: TextInputType.name,
                // Only numbers can be entered
              ),
              SizedBox(height: 1.h),
              TextFormField(
                controller: _lastName,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Last Name',
                  counterText: "",
                ),
                keyboardType: TextInputType.name,
                // Only numbers can be entered
              ),
              SizedBox(height: 1.h),
              TextFormField(
                controller: _address,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Address',
                  counterText: "",
                ),
                keyboardType: TextInputType.streetAddress,
                // Only numbers can be entered
              ),
              SizedBox(height: 1.h),
              DropdownButtonFormField(
                isDense: true,
                onChanged: (int? value) {
                  setState(() {
                    _gender = value!;
                  });
                },
                value: _gender,
                items: _genderList
                    .map(
                      (e) => DropdownMenuItem(
                        value: _genderList.indexOf(e),
                        child: Text(
                          e,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    )
                    .toList(),
              ),
              TextFormField(
                controller: _age,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Age',
                  counterText: "",
                ),
                keyboardType: TextInputType.phone,
                // Only numbers can be entered
              ),
              SizedBox(height: 1.h),
              TextFormField(
                controller: _phone,
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
              Row(
                children: [
                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: checkBoxValue,
                    onChanged: (value) => {
                      setState(() {
                        // checkBoxValue = value;
                        checkBoxValue = checkBoxValue ? false : true;
                      })
                    },
                    activeColor: Theme.of(context).primaryColor,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: 'I agree to the ',
                        style: TextStyle(
                          color: HexColor('#212121'),
                          fontSize: 14.sp,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              },
                          ),
                          TextSpan(
                            text: ' and ',
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: ' of this app',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.5.h),
              MaterialButton(
                onPressed: () {
                  _onRegister(context: context);
                },
                minWidth: double.infinity,
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 6.h,
                elevation: 0.0,
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              GestureDetector(
                onTap: () {
                  _onLoginPage(context: context);
                },
                child: Text(
                  'Login Here',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
