// ignore_for_file: camel_case_types

import 'package:ex_flutter_app_figma/api/api_service.dart';
import 'package:ex_flutter_app_figma/model/login_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ex_flutter_app_figma/register_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // home: Scaffold(
      backgroundColor: Color(0xFFE5E5E5),

      body: SafeArea(
        child: LoginViewStatefullWidget(),
      ),
      // ),
    );
  }
}

class LoginViewStatefullWidget extends StatefulWidget {
  const LoginViewStatefullWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _loginViewStatefullWidget();
}

class _loginViewStatefullWidget extends State<LoginViewStatefullWidget> {
  bool isChecked = false;
  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();
  final String _regexKeyEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final String _regexKeyPassword =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$';

  late LoginRequestModel requestModel;

  late LoginResponseModel repsonseData;

  @override
  void initState() {
    super.initState();
  }

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          //physics: const NeverScrollableScxrollPhysics(),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Đăng nhập',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF424242),
                  fontSize: 32,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: 'Email của bạn'),
                  //controller:
                  controller: emailTextEditingController,

                  validator: (emailInput) {
                    if (emailInput == null || emailInput.isEmpty) {
                      return 'Vui lòng nhập Email';
                    }

                    if (!RegExp(_regexKeyEmail).hasMatch(emailInput)) {
                      return 'Email không hợp lệ';
                    }

                    return null;
                  },
                  onSaved: (emailInput) => requestModel.email = emailInput!,
                ),
              ),
              // ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 36),
                child: TextFormField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    hintText: 'Password',
                    //hide || unhide text
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                  controller: passwordTextEditingController,
                  onSaved: (passwordInput) =>
                      requestModel.password = passwordInput!,
                  validator: (passwordInput) {
                    if (passwordInput == null || passwordInput.isEmpty) {
                      return 'Vui lòng nhập Password';
                    } else if (passwordInput.contains(' ')) {
                      return 'Password không được chứa khoảng trắng';
                    } else if (!RegExp(_regexKeyPassword)
                        .hasMatch(passwordInput.trim())) {
                      return '6 ký tự và ít nhất 1 số, chữ hoa, thường và kí tự đặc biệt';
                    }
                    return null;
                  },
                ),
              ),

              Row(
                children: [
                  Expanded(
                      child: CheckboxListTile(
                          title: const Text('Ghi nhớ đăng nhập'),
                          value: isChecked,
                          onChanged: (_) {})),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        debugPrint('Quên password');
                      },
                      child: const Text(
                        'Quên password?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          //fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFFEDAF14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF209F84),
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () async {
                  //todo
                  if (_formKey.currentState!.validate()) {
                    String iPassword = passwordTextEditingController.text;
                    String iEmail = emailTextEditingController.text;

                    repsonseData = await loginRequest(LoginRequestModel(
                        email: iEmail, password: iPassword, realm: ''));
                    debugPrint(repsonseData.data.accessToken);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterView()),
                    );
                  }
                },
                child: const Text(
                  'Đăng nhập',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25, bottom: 15),
                child: const Text(
                  'Hoặc',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
              ),

              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        //todo
                        debugPrint('Google');
                      },
                      child: Image.asset(
                        'assets/images/btnGoogle.png',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        //todo
                        debugPrint('Facebook');
                      },
                      child: Image.asset(
                        'assets/images/btnFacebook.png',
                      ),
                    ),
                  ),
                ],
              ),
              //

              Container(
                margin: const EdgeInsets.only(top: 20),
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: 'Chưa có tài khoản?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB0B2BE),
                      ),
                    ),
                    TextSpan(
                      text: 'Tạo tài khoản',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF209F84),
                      ),
                      // recognizer: TapGestureRecognizer()
                      //   ..onTap = () =>
                      //       // do something here
                      //       Navigator.of(context).pushAndRemoveUntil(
                      //           MaterialPageRoute(
                      //             builder: (BuildContext context) =>
                      //                 const RegisterView(),
                      //           ),
                      //           (Route route) => false),
                    ),
                  ]),
                ),
              ),
              InkWell(
                onTap: () {
                  //todo
                  debugPrint('Dùng không cần tạo tài khoản');
                },
                child: const Text(
                  'Dùng không cần tạo tài khoản',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Color(0xFF424242)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
