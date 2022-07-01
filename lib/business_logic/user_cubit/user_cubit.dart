import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:magdsoft_flutter_structure/business_logic/user_cubit/user_states.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../../data/models/account_model.dart';

class UserCubit extends Cubit<UserCubitStates>{
  UserCubit() : super(UserInitialState());
  static UserCubit get(context) => BlocProvider.of(context);


  login(String email,String password)async{

    try {
      ResponseModel responseModel=await ServicesResponses().loginResponse(email, password);

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


  register(String email,String password,String name,String phone)async{

    try {
      ResponseModel responseModel=await ServicesResponses().registerResponse(email, password,name,phone);

      successOrErrorRegisterHandler(responseModel);

    }catch(error){

      AppToasts.errorToast(error.toString());
      emit(RegisterFailureState(error.toString()));
    }



  }
  successOrErrorRegisterHandler(ResponseModel responseModel)async{

    if(responseModel.status!=200){
      AppToasts.errorToast(responseModel.message!);
      emit(RegisterFailureState(responseModel.message!));
    }else{

      AppToasts.successToast( '${responseModel.message}');
      emit(RegisterSuccessState(responseModel));

    }
  }



}