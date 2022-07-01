import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToasts {
  static successToast(message)async{
   return await Fluttertoast.showToast(msg:message);
  }
  static errorToast(String errorMessage)async{
    return await Fluttertoast.showToast(msg: errorMessage);
  }
}