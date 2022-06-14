import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:wund/database/db_firestore.dart';
import 'package:wund/services/auth_services.dart';

class UserRepository extends ChangeNotifier {
  late FirebaseFirestore db;
  late AuthService auth;
  String nome = '';
  UserRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await readName();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  saveName(String nome) async {
    try {
      await db
          .collection('usuarios/${auth.usuario!.uid}/detalhes')
          .doc(auth.usuario!.uid)
          .set({
        'nome': nome,
        'idade': 20,
      });
    } catch (err) {
      debugPrint('Permissão requirida no Firestore: $err');
    }
    notifyListeners();
  }

  readName() async {
    if (auth.usuario != null) {
      final snapshot = await db
          .collection('usuarios/${auth.usuario!.uid}/detalhes')
          .doc(auth.usuario!.uid)
          .get();
      nome = snapshot.get('nome');
      notifyListeners();
    }
  }
}
