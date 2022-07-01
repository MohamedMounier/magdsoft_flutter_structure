class ResponseModel{
  int? _status;
  String? _message;
 List<dynamic> _accountInfo=[];
 int? get status=>_status;
 String? get message=>_message;
  List<dynamic> get accountInfo=>_accountInfo;

  ResponseModel.fromJson(Map<String,dynamic> json){
    _status=json['status'];
    _message=json['message'];
    _accountInfo=json['account']??[];

    // json['account'].forEach((accountInfoJson){
    //   _accountInfo.add(AccountModel.fromJson(accountInfoJson));
    // });

  }
}
class AccountModel{
  int? _id;
  String? _name;
  String? _email;
  String? _password;
  String? _phone;
  String? _updatedAt;
  String? _createdAt;

  int? get id=>_id;
  String? get name=>_name;
  String? get email=>_email;
  String? get password=>_password;
  String? get phone=>_phone;
  String? get updatedAt=>_updatedAt;
  String? get createdAt=>_createdAt;

  AccountModel.fromJson(Map<String,dynamic>json){
    _id=json['id'];
    _name=json['name'];
    _email=json['email'];
    _password=json['password'];
    _phone=json['phone'];
    _updatedAt=json['updated_at'];
    _createdAt=json['created_at'];
  }

}