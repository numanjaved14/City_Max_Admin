
import 'package:city_max_admin/main/mainscreen.dart';
import 'package:city_max_admin/providers/circularprogressindicatorvalue.dart';
import 'package:city_max_admin/widgets/customdialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/constant.dart';


class AuthUtils{

   login(
      String email,
      String password,
       BuildContext context
      )async{
  await  firebaseFirestore.collection('admin').get().
  then((QuerySnapshot querySnapshot) =>   querySnapshot.docs.forEach((doc) {
    if(doc['password']==password && doc['email']==email){
      Customdialog().showInSnackBar("Logged in", context);
      Provider.of<CircularProgressProvider>(context,listen: false).setValue(false);
Customdialog.closeDialog(context);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>MainScreen()), (route) => false);

    }
    else{
      Provider.of<CircularProgressProvider>(context,listen: false).setValue(false);
      print(      Provider.of<CircularProgressProvider>(context).getValue);
      Customdialog().showInSnackBar("wrong", context);
      Customdialog.closeDialog(context);
    }
  })).catchError((w){ Customdialog().showInSnackBar(w, context);
  });
  }
}