import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/app_requests.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

class ServicesResponses{
  Future<ResponseModel> loginResponse(String email,String password)async{
    Response? loginResponse;
    ResponseModel responseModel;
    try{
      loginResponse=await AppRequests.login( email, password);

    }catch(errorMessage){
      AppToasts.errorToast(errorMessage.toString());
    }
    responseModel= ResponseModel.fromJson(loginResponse?.data);
   return responseModel;

  }
  Future<ResponseModel> registerResponse(String email,String password,String name,String phone)async{
    Response? loginResponse;
    ResponseModel responseModel;
    try{
      loginResponse=await AppRequests.register( email, password,name,phone);

    }catch(errorMessage){
      AppToasts.errorToast(errorMessage.toString());
    }
    responseModel= ResponseModel.fromJson(loginResponse?.data);
   return responseModel;

  }
}