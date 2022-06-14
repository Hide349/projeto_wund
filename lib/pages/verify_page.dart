import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wund/services/auth_services.dart';
import 'package:wund/widgets/auth_check.dart';

class VerifyEmailPage extends StatefulWidget {
  VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  void initState() {
    context.read<AuthService>().checkEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      context.read<AuthService>().isEmailVerified
          ? AuthCheck()
          : Scaffold(
              appBar: AppBar(
                title: Text('Verificando email'),
              ),
            );
}
