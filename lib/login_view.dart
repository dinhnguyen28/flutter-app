import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        //physics: const NeverScrollableScrollPhysics(),
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
            // Form(
            // onChanged: () {
            //   Form.of(primaryFocus!.context!)!.save();
            // },
            // child:
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
                  //controller: ,

                  onChanged: (email) {
                    debugPrint(email);
                  }),
            ),
            // ),
            Container(
              //color: Colors.redAccent,
              margin: const EdgeInsets.only(top: 20, bottom: 36),
              child: TextFormField(
                //controller: ,
                obscureText: _isObscure,

                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: 'Password',
                ),
              ),
            ),
            // Container(
            // color: Colors.redAccent,
            // child:
            Row(
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                      activeColor: const Color(0xFF209F84),
                      shape: const CircleBorder(),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                ),
                const Text(
                  'Ghi nhớ đăng nhập',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF424242),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                InkWell(
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
              ],
            ),
            ////

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF209F84),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                //todo
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
                GestureDetector(
                  onTap: () {
                    //todo
                    debugPrint('Google');
                  },
                  child: Image.asset(
                    'assets/images/btnGoogle.png',
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                GestureDetector(
                  onTap: () {
                    //todo
                    debugPrint('Facebook');
                  },
                  child: Image.asset(
                    'assets/images/btnFacebook.png',
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Chưa có tài khoản?',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Color(0xFFB0B2BE)),
                  ),
                  InkWell(
                    onTap: () {
                      //todo
                      debugPrint('Tạo tài khoản');
                    },
                    child: const Text('Tạo tài khoản',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Color(0xFF209F84),
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                //todo
                debugPrint('Tạo tài khoản');
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
    );
  }
}
