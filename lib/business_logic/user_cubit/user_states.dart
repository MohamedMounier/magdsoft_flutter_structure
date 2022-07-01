import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

abstract class UserCubitStates{}

class UserInitialState extends UserCubitStates{}
class LoginSuccessState extends UserCubitStates{
  final ResponseModel responseModel;

  LoginSuccessState(this.responseModel);
}
class LoginFailureState extends UserCubitStates{
  final String error;

  LoginFailureState(this.error);
}

class LoginSuccessInfoState extends UserCubitStates{
  final AccountModel accountModel;

  LoginSuccessInfoState(this.accountModel);
}

class RegisterSuccessState extends UserCubitStates{
  final ResponseModel responseModel;

  RegisterSuccessState(this.responseModel);
}
class RegisterFailureState extends UserCubitStates{
  final String error;

  RegisterFailureState(this.error);
}