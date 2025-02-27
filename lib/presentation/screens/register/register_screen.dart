import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:magdsoft_flutter_structure/presentation/screens/login/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../../../business_logic/user_cubit/user_cubit.dart';
import '../../../business_logic/user_cubit/user_states.dart';
import '../../widget/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameController=TextEditingController();

  TextEditingController _emailController=TextEditingController();

  TextEditingController _phoneController=TextEditingController();

  TextEditingController _passwordController=TextEditingController();

  TextEditingController _passwordConfirmController=TextEditingController();

  GlobalKey<FormState> registerKey=GlobalKey<FormState>();


  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body:BlocConsumer<UserCubit,UserCubitStates>(
        listener: (context,state){
          if(state is RegisterSuccessState){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>LoginScreen()));
          }
        },
        builder: (context,state) {
          return Form(
            key:registerKey ,
            child: Column(
              children: [
                SizedBox(height: screenSize.height*.02,),
                const Center(child:  Image(image:  AssetImage('assets/images/logoFlutter.png'))),
                SizedBox(height: screenSize.height*.02,),
                Expanded(child: Container(
                  decoration:const   BoxDecoration(
                      color: AppColor.white,
                      borderRadius:  BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: screenSize.height*.06,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 63.0,vertical: 9.0),
                          child: CustomTextFormField(
                            controller: _nameController,
                            hint: 'Name',
                            isPass: false,
                          ),
                        ),
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
                            controller: _phoneController,
                            hint: 'Phone',
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 63.0,vertical: 9.0),
                          child: CustomTextFormField(
                            controller: _passwordConfirmController,
                            hint: 'Confirm Password',
                            isPass: true,
                          ),
                        ),
                        SizedBox(height: screenSize.height*.08,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton(text: 'Login',
                                    onPressed: (){
                              Navigator.pushReplacementNamed(context, '/');
                            }),
                            CustomButton(text:'Register',
                                    onPressed: (){
                              if(_passwordController.text==_passwordConfirmController.text){
                                if(registerKey.currentState!.validate()){
                                  UserCubit.get(context).register(_emailController.text, _passwordController.text, _nameController.text, _phoneController.text);
                                }
                              }else{
                                AppToasts.errorToast('Passwords does not match');
                              }


                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
          );
        }
      ) ,
    );
  }


}
