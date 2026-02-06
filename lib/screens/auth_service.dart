import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> entrarUsuario(
      {required String email, required String senha}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'Usuário não encontrado';
        case 'wrong-password':
          return 'Senha incorreta';
      }

      return e.code;
    }

    return null;
  }

  Future<String?> cadastrarUsuario({required String email, required String
  Senha, required String nome}) async{ try {
    await _auth.createUserWithEmailAndPassword(email: email, password:
  Senha;
  } on FirebaseAuthExeption catch (e) {
    switch(e.code) {
      case 'weak-password':
        return 'Senha fraca';
      case 'email-already-in-use':
        return 'Email já existe';
    }}return null}
  }
}
