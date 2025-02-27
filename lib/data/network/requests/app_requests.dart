import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

class AppRequests {
 static Future<Response>login(String email,String password)async{
   var data= await DioHelper.postData(url: loginUrl, body: {
     'email':email,
     'password':password});

   return  data;
  }

 static Future<Response>register(String email,String password,String name,String phone)async{
   var data= await DioHelper.postData(url: registerUrl, body: {
     'email':email,
     'password':password,
     'name':name,
     'phone':phone,

   });

   return  data;
 }

}