import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = auth.currentUser;
    notifyListeners();
  }

  registrar(String email, String senha) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (err) {
      if (err.code == 'weak-password') {
        throw AuthException('A senha é muito fraca!');
      } else if (err.code == 'email-already-in-use') {
        throw AuthException('Esse email já está cadastrado.');
      }
    }
  }

  login(String email, String senha) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        throw AuthException('Email não encontrado.');
      } else if (err.code == 'wrong-password') {
        throw AuthException('Senha incorreta.');
      }
    }
  }



  logout() async {
    await auth.signOut();
  }
}
