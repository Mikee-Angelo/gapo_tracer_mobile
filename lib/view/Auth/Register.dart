import 'package:app/controller/provider/AuthProvider.dart';
import 'package:app/view/Auth/Login.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
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
  final _firstNameValidator =
      RequiredValidator(errorText: 'First name field is required');
  final _lastNameValidator =
      RequiredValidator(errorText: 'Last name field is required');
  final _addressValidator =
      RequiredValidator(errorText: 'Address field is required');
  final _ageValidator = RequiredValidator(errorText: 'Age field is required');
  final _phoneValidator =
      RequiredValidator(errorText: 'Phone field is required');
  final _passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password field is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
  ]);

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _address = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _age = TextEditingController();
  final _provider = AuthProvider();
  final _formKey = GlobalKey<FormState>();
  bool checkBoxValue = false;
  int _gender = 0;
  bool _isObscure = true;
  List<String> _genderList = ['Male', 'Female'];

  void _onLoginPage({required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
  }

  _onRegister({required BuildContext context}) {
    if (_formKey.currentState!.validate()) {
      if (!checkBoxValue) {
        CoolAlert.show(
          backgroundColor: Colors.white,
          context: context,
          type: CoolAlertType.info,
          title: 'Term\'s and Condition',
          text: 'Read and accept terms and condition before register',
          confirmBtnColor: Colors.red,
        );
      } else {
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
    }
  }

  _onObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
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
          child: Form(
            key: _formKey,
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
                  validator: _firstNameValidator,
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
                  validator: _lastNameValidator,
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
                  validator: _addressValidator,
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
                  validator: _ageValidator,
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
                  validator: _phoneValidator,
                  // Only numbers can be entered
                ),
                SizedBox(height: 1.h),
                TextFormField(
                  controller: _password,
                  cursorColor: Theme.of(context).primaryColor,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _onObscure();
                      },
                      child: Icon(
                          !_isObscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 2.2.h),
                    ),
                  ),
                  validator: _passwordValidator,
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
      ),
    );
  }
}
