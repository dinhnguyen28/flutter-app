import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: SafeArea(
          child: LoginViewStatefullWidget(),
        ),
      ),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            //color: Colors.greenAccent,
            alignment: Alignment.center,
            //margin: const EdgeInsets.only(top: 149, bottom: 707),
            child: const Text(
              'Đăng nhập',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF424242),
                fontSize: 32,
              ),
            ),
          ),
          Container(
            //color: Colors.lightBlueAccent,
            margin: const EdgeInsets.only(top: 20),
            child: TextField(
              //controller: ,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: 'Email của bạn'),
            ),
          ),
          Container(
            //color: Colors.redAccent,
            margin: const EdgeInsets.only(top: 20, bottom: 36),
            child: TextField(
              //controller: ,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: 'Password'),
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
              const Text(
                'Quên password?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  //fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFFEDAF14),
                ),
              ),
            ],
          ),
          ////
        ],
      ),
    );
  }
}
