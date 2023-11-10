import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods{
  final FirebaseStorage storage=FirebaseStorage.instance;
  final FirebaseAuth auth=FirebaseAuth.instance;
  Future<String> uploadImageToStorage(String childName, Uint8List file, bool isPost) async{
   Reference ref= storage.ref().child(childName).child(auth.currentUser!.uid);
  
  UploadTask uploadTask= ref.putData(file);
  TaskSnapshot snap= await uploadTask; 
  String downloadedURL= await snap.ref.getDownloadURL();
  return downloadedURL;
  }
}