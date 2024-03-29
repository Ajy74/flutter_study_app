import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../firebase_ref/references.dart';


class FirebaseStorageService extends GetxService{

  Future<String?> getImage(String? imgName) async{
    if(imgName==null){
      return null;
    }

    try{
     var urlRef =  firebaseStorage.child("question_paper_images")
      .child("${imgName.toLowerCase()}.png");
      var imgUrl =  await urlRef.getDownloadURL();
      // print(imgUrl);
      
      return imgUrl;

    }catch(e){
      print("fbs..error..$e");
      return null;
    }

  }

}