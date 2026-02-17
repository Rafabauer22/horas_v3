import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> entrarUsuario({
    required String email,
    required String senha,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'Usuário não encontrado';
        case 'wrong-password':
          return 'Senha incorreta';
        default:
          return e.message;
      }
    }
  }

  Future<String?> cadastrarUsuario({
    required String email,
    required String senha,
    required String nome,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      await userCredential.user!.updateDisplayName(nome);
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'Email já está em uso';
        case 'weak-password':
          return 'Senha fraca';
        default:
          return e.message;
      }
    }
  }

  Future<String?> redefinicaoSenha({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'Usuário não encontrado';
        default:
          return e.message;
      }
    }
  }

  Future<bool> deslogar() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      debugPrint('Erro ao deslogar $e');
      return false;
    }
  }

  Future<String?> excluirConta({required String senha}) async {
    try {
      User? user = _auth.currentUser;

      if (user == null) {
        return 'Usuário não está logado';
      }

      // Reautenticar
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: senha,
      );

      await user.reauthenticateWithCredential(credential);

      // Deletar conta
      await user.delete();

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
