import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;
  bool isEmailVerified = false;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  registrar(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
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
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        throw AuthException('Email não encontrado.');
      } else if (err.code == 'wrong-password') {
        throw AuthException('Senha incorreta.');
      }
    }
  }

  checkEmail() {
    isEmailVerified = _auth.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendEmailVerification();
    }
    notifyListeners();
  }

  Future sendEmailVerification() async {
    try {
      _getUser();
      final user = _auth.currentUser;
      await user!.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }

  logout() async {
    await _auth.signOut();
  }
}
