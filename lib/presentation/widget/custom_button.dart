import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButton({Key? key, required this.onPressed, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
