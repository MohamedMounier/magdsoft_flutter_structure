import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_state.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../../data/models/account_model.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);


  login(String email,String password)async{

    try {
      ResponseModel responseModel=await LoginResponse().loginResponse(email, password);

      successOrErrorLoginHandler(responseModel);

    }catch(error){

     AppToasts.errorToast(error.toString());
     emit(LoginFailureState(error.toString()));
    }



  }
  successOrErrorLoginHandler(ResponseModel responseModel)async{
    AccountModel? accountModel;
    if(responseModel.status!=200){
      AppToasts.errorToast(responseModel.message!);
      emit(LoginFailureState(responseModel.message!));
    }else{
      if(responseModel.accountInfo.isNotEmpty){

        responseModel.accountInfo.forEach((element) {
          accountModel=AccountModel.fromJson(element);
        });}

      emit(LoginSuccessInfoState(accountModel!));
      AppToasts.successToast( 'Logged in Successfully !');
    }
  }




}