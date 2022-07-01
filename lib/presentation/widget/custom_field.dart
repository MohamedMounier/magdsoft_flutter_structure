import 'package:flutter/cupertino.dart';
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
      obscureText: isShown,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: widget.hint,
        prefixIcon:widget.isPass? GestureDetector(onTap: (){
          setState(() {
            isShown=!isShown;
          });
        }, child:Icon(isShown? Icons.remove_red_eye:Icons.remove_red_eye_outlined,color: AppColor.bordersColor,)):SizedBox(),
      ),
      validator: (value){

      },


    );


  }
}
