import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../../business_logic/user_cubit/user_cubit.dart';
import '../../../business_logic/user_cubit/user_states.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle:  true,
      title: const Text('UserData'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: BlocBuilder<UserCubit,UserCubitStates>(
        builder: (context,state){
          if(state is LoginSuccessInfoState){
            return Center(child: userInfoWidget(state,context));
          }else{
            return Center( child: Container(color: Colors.deepPurple,),);
          }
        },
      ),
    );
  }

  Widget userInfoWidget(LoginSuccessInfoState state,BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              //mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 150,),
                Text('Name is : ${state.accountModel.name}',
                style: const TextStyle(color: AppColor.primaryColor,
                fontSize: 25
                ),
                ),
                Text('Email is : ${state.accountModel.email}',
                  style:const  TextStyle(color: AppColor.primaryColor,
                      fontSize: 25
                  ),
                ),
                Text('Phone is : ${state.accountModel.phone}',
                  style: const TextStyle(color: AppColor.primaryColor,
                      fontSize: 25
                  ),
                ),

                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 69.0),
                  child: SizedBox(
                      height:61 ,
                      width:152,
                      child: ElevatedButton(onPressed:(){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx)=>LoginScreen()), (route) => false);
                      },
                          style: ButtonStyle(
                            backgroundColor:MaterialStateProperty.all<Color>(AppColor.logoutColor) ,
                              shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ))
                          ),
                          child: const Text('Logout',
                            style: const TextStyle(fontSize: 20,
                            color: AppColor.white),
                          ))),
                ),
                const SizedBox(height: 150,),
              ],
            ),
    );
  }
}
