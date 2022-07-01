import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_state.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<LoginCubit,LoginStates>(
        builder: (context,state){
          if(state is LoginSuccessInfoState){
            return userInfoWidget(state);
          }else{
            return Center( child: Container(color: Colors.deepPurple,),);
          }
        },
      ),
    );
  }

  Column userInfoWidget(LoginSuccessInfoState state) {
    return Column(
            children: [
              SizedBox(height: 150,),
              Text('Name is : ${state.accountModel.name}'),
              Text('Email is : ${state.accountModel.email}'),
              Text('Phone is : ${state.accountModel.phone}'),
            ],
          );
  }
}
