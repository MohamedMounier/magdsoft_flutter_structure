import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_field.dart';

import '../../../business_logic/user_cubit/user_cubit.dart';
import '../../../business_logic/user_cubit/user_states.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return BlocConsumer<UserCubit,UserCubitStates>(
      listener: (context,state) {
        print('state is $state');
        if(state is LoginSuccessInfoState){
         // Navigator.pushReplacementNamed(context, '/profile');
           Navigator.push(context, MaterialPageRoute(builder: (ctx)=>UserProfileScreen()));
      }

        },
      builder: (context,state) {
        return Scaffold(
          backgroundColor: AppColor.primaryColor,
          body:Column(
            children: [
              SizedBox(height: screenSize.height*.02,),
              Center(child: Image(image: AssetImage('assets/images/logoFlutter.png'))),
              SizedBox(height: screenSize.height*.02,),
              Expanded(child: Container(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: screenSize.height*.2,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 63.0,vertical: 9.0),
                        child: CustomTextFormField(
                          controller: _emailController,
                          hint: 'Email',
                          isPass: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 63.0,vertical: 9.0),
                        child: CustomTextFormField(
                          controller: _passwordController,
                          hint: 'Password',
                          isPass: true,
                        ),
                      ),
                      SizedBox(height: screenSize.height*.2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(text: 'Login',
                                  onPressed: (){
                            UserCubit.get(context).login(_emailController.text,  _passwordController.text);
                          }),
                          CustomButton(text: 'Register',
                                  onPressed: (){
                            Navigator.pushNamed(context, '/register');
                          }),
                        ],
                      )
                    ],
                  ),
                ),
              ))
            ],
          ) ,
        );
      }
    );
  }

  SizedBox customButton(String text,VoidCallback onPressed) {
    return SizedBox(
                        height:61 ,
                        width:152,
                        child: ElevatedButton(onPressed:onPressed,
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ))
                            ),
                            child: Text(text,
                              style: TextStyle(fontSize: 20),
                            )));
  }
}
