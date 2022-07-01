import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;

  final bool isPass;
  final TextEditingController controller;



   CustomTextFormField({Key? key, required this.hint, required this.isPass,required this.controller}) : super(key: key);
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {


  bool isShown=true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: widget.controller,
      textAlign: TextAlign.end,
      obscureText: widget.hint.contains('Pass')?isShown:false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: widget.hint,
        prefixIcon:widget.isPass? GestureDetector(onTap: (){
          setState(() {
            isShown=!isShown;
          });
        }, child:Icon(isShown? Icons.remove_red_eye:Icons.remove_red_eye_outlined,color: AppColor.bordersColor,)):const SizedBox(),
      ),
      validator: (value){
        if(widget.hint=='Email'){

          if(!value!.contains('@')) return 'email should contain @';
        }
        if(value!.isEmpty){
          return 'this field can not be empty';
        }
        if(widget.hint=='Phone'){
    if(value.length>15 ||value.length<11) return 'phone can not be more than 15 numbers or less than 11 numbers';
        }
        //validatorFunction(value!);

      },


    );


  }
  //  String validatorFunction(String value){
  //   switch (widget.hint) {
  //     case 'Email':
  //       if(!value.contains('@')) return 'email should contain @';
  //
  //       if(value.isEmpty){
  //         return 'email can not be empty';
  //       }else{
  //
  //       }
  //     case 'Phone':
  //       if(value.length>15 ||value.length<11){
  //         return 'phone can not be more than 15 numbers or less than 11 numbers';
  //       }
  //
  //   }
  //
  // }
}
