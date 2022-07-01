import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final ResponseModel responseModel;

  LoginSuccessState(this.responseModel);
}
class LoginFailureState extends LoginStates{
  final String error;

  LoginFailureState(this.error);
}

class LoginSuccessInfoState extends LoginStates{
  final AccountModel accountModel;

  LoginSuccessInfoState(this.accountModel);
}