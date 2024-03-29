import 'package:flutter/material.dart';

class Dialogs{
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs(){
    return _singleton;
  }

  static Widget questionStartDialogue({required VoidCallback onTap}){
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children:  [  
            Text(
              "Hi...",
              style: TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "Please login before you start",
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: onTap, child: Text("Confirm"))
        ],
    );
  }

}