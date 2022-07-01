import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_field.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
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
                  SizedBox(height: screenSize.height*.06,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 63.0,vertical: 9.0),
                    child: CustomTextFormField(
                      hint: 'Email',
                      isPass: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 63.0,vertical: 9.0),
                    child: CustomTextFormField(
                      hint: 'Email',
                      isPass: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 63.0,vertical: 9.0),
                    child: CustomTextFormField(
                      hint: 'Email',
                      isPass: false,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 63.0,vertical: 9.0),
                    child: CustomTextFormField(
                      hint: 'Password',
                      isPass: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 63.0,vertical: 9.0),
                    child: CustomTextFormField(
                      hint: 'Password',
                      isPass: true,
                    ),
                  ),
                  SizedBox(height: screenSize.height*.08,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customButton('Login',(){
                        Navigator.pushReplacementNamed(context, '/');
                      }),
                      customButton('Register',(){}),
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
