import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/screens/login/login_screen.dart';

import '../widgets/dialogs/dialogue_widget.dart';

class AuthController extends GetxController{

  @override
  void onReady(){
    initAuth();
    super.onReady();
  }

// for firebase authentication
  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;
// for firebase authentication

  void initAuth()async{
    await Future.delayed(Duration(seconds: 3));

    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
     });

    navigateToIntroduction();
  }

  void navigateToIntroduction(){
    Get.offAllNamed("/introduction_screen");
  }


  signInWithGoogle()async{
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {

      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if(account!=null){
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
          idToken: _authAccount.idToken,
          accessToken: _authAccount.accessToken
        );

        await _auth.signInWithCredential(_credential);
        await saveUser(account);
        navigateToHome();
      }

    } on Exception catch (e) {
      print("googleSiginEror in authCont:..${e.toString()}");
    }
  }

  User? getUser(){
    _user.value = _auth.currentUser;
    return _user.value;
  }

  saveUser(GoogleSignInAccount account){
    userRF.doc(account.email).set({
      "email":account.email,
      "name":account.displayName,
      "profilepic":account.photoUrl,
    });
  }

 Future<void> signOut()async{
     print("Signing out...");
     try {
      await _auth.signOut();
      navigateToHome();
     } on FirebaseAuthException catch (e) {
        print("googleSignOutEror in authCont:..${e.toString()}");
     }
  }

  void navigateToHome(){
    Get.offAllNamed("/home_screen");
  }


  void showLoginAlertDialogue(){
    Get.dialog(
      Dialogs.questionStartDialogue(onTap: () {
        Get.back();
        navigateToLoginPage();
      },),
      barrierDismissible: false,
    );
  }

   void navigateToLoginPage(){
    Get.toNamed("/login_screen");
   }


  bool isLoggedIn(){
    return _auth.currentUser != null; //true mean already loggeedIn 
  }

}