import 'package:app/controller/provider/AuthProvider.dart';
import 'package:app/view/Auth/Register.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
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
  bool _isObscure = true;
  final _phoneValidator =
      RequiredValidator(errorText: 'Phone number field is required');
  final _passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password field is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
  ]);

  final _formKey = GlobalKey<FormState>();
  final _phone = TextEditingController();
  final _password = TextEditingController();

  _onRegisterPage({required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Register()));
  }

  _onLogin({required BuildContext context}) {
    if (_formKey.currentState!.validate()) {
      Provider.of<AuthProvider>(context, listen: false)
          .login(context: context, phone: _phone, password: _password);
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Adaptive.h(
            double.parse(GlobalConfiguration().get('padding')),
          ),
        ),
        child: Form(
          key: _formKey,
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
      ),
    );
  }
}
