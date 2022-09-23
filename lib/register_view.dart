// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SafeArea(
        child: RegisterViewStatefullWidget(),
      ),
    );
  }
}

class RegisterViewStatefullWidget extends StatefulWidget {
  const RegisterViewStatefullWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _registerStatefullWidget();
}

class _registerStatefullWidget extends State<RegisterViewStatefullWidget> {
  @override
  Widget build(BuildContext context) {
    //
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Quay lại!')),
          ],
        ),
      ),
    );
  }
}
