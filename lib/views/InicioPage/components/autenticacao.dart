import 'package:farm/views/InicioPage/InicioScreen.dart';
import 'package:farm/views/MenuPage/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AutenticaGoogle {
  //Determine if the user is authenticated.
  confereLogado() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return NaviBar();
        } else {
          return InicioScreen();
        }
      },
    );
  }

  //Forma 1 de Login
  fazerLoginGoogle1() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<User?> fazerLoginGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      //abre uma tela de login do Google para o usuário.
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        //acessada para obter as informações de autenticação do usuário
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        //é necessária para realizar a autenticação com o Firebase
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        //autentica o usuário no Firebase usando as credenciais do Google
        final UserCredential authResult =
            await _auth.signInWithCredential(credential);

        //usuário autenticado no Firebase
        final User? user = authResult.user;

        return user;
      }
    } catch (error) {}
  }

  //Sign out
  void fazerLogout() {
    FirebaseAuth.instance.signOut();
  }

  //Sign out
  static fazerLogout2() async {
    await GoogleSignIn(scopes: <String>["email"]).signOut();
    await FirebaseAuth.instance.signOut();
  }
}
