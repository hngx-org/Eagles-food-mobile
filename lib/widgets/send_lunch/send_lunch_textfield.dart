import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';


class SendLunchTextField extends StatelessWidget {
  final keyboardType;
  final suffixIcon;


  
  const SendLunchTextField({
    super.key,
    this.keyboardType,
    this.suffixIcon,

    });




  @override
  Widget build(BuildContext context) {
    return  TextField(
                      keyboardType: keyboardType,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      textAlign: TextAlign.center,
                      cursorColor: ColorUtils.Green,
                      decoration: InputDecoration(
                        suffixIcon: suffixIcon,
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorUtils.Green,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorUtils.Green,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    );
  }
}