import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CustomFirebase {
  CustomFirebase._();

  // - - - - - - - - - - - - - - - - - - REGISTER - - - - - - - - - - - - - - - - -  //
  Future<String?> register({ required FirebaseAuth firebaseAuth, required String email, required String password }) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    if(result.user == null) return null;
    return result.user!.uid;
  }

  // - - - - - - - - - - - - - - - - - - LOGIN - - - - - - - - - - - - - - - - -  //
  Future<String?> login({ required FirebaseAuth firebaseAuth, required String email, required String password }) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    if(result.user == null) return null;
    return result.user!.uid;
  }

  // - - - - - - - - - - - - - - - - - - GOOGLE - - - - - - - - - - - - - - - - -  //
  Future<String?> authWithGoogle({ required FirebaseAuth firebaseAuth, required String email, required String password }) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final result = await FirebaseAuth.instance.signInWithCredential(credential);
    if(result.user == null) return null;
    return result.user!.uid;
  }

  // - - - - - - - - - - - - - - - - - - FORGOT PASSWORD - - - - - - - - - - - - - - - - -  //
  Future<void> forgetPassword({ required FirebaseAuth firebaseAuth, required String email }) async {
    return await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // - - - - - - - - - - - - - - - - - - SIGN OUT - - - - - - - - - - - - - - - - -  //
  Future<void> signOut({ required FirebaseAuth firebaseAuth }) async{ await firebaseAuth.signOut(); }

  // - - - - - - - - - - - - - - - - - - SAVE IMAGE - - - - - - - - - - - - - - - - -  //
  static Future<String> saveImage({ required FirebaseStorage firebaseStorage, required String path, required String imgName, required String imgPath }) async{
    final result =  await firebaseStorage.ref(path).child(imgName).putFile(File(imgPath));
    final imgUrl = await result.ref.getDownloadURL();
    return imgUrl;
  }

  // - - - - - - - - - - - - - - - - - - DELETE IMAGE - - - - - - - - - - - - - - - - -  //
  static Future<void> deleteImage({ required FirebaseStorage firebaseStorage, required String path, required String imgName }) async{
    await firebaseStorage.ref(path).child(imgName).delete();
  }

}