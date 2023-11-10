import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async{
    String res="Some error occured";
    try{
      if(email.isNotEmpty || password.isNotEmpty ||username.isNotEmpty ||bio.isNotEmpty||file!=null){
        UserCredential cred= await _auth.createUserWithEmailAndPassword(email: email, password: password);
        
        String photoUrl=await StorageMethods().uploadImageToStorage('profilePics',file, false!);

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username':username,
          'uid':cred.user!.uid,
          'email':email,
          'bio':bio,
          'followers':[],  
          'following':[],
          'photoUrl': photoUrl,
        });
        res="success";
      }
    }
    //  on FirebaseAuthException catch(err){
    //   if(err.code=='invalid-email'){
    //     res='The email is badly formatted';
    //   }
    //   else if(err.code=='weak-password'){
    //     res=='Password should be atleast 6 characters';
    //   }
    // }
    catch(err){
      res=err.toString();
    }
    return res;
  }
}