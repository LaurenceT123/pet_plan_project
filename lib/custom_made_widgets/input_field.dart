import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const MyInputField({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  Widget build(BuildContext context)
  {
    return Container(
      margin: EdgeInsets.only(top:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.lato (textStyle: TextStyle(fontSize:15))),

          Container(
            height: 50,
            margin: EdgeInsets.only(top:8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width:1.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:5),
                    child: TextFormField(
                      readOnly: widget==null?false:true,
                      autofocus: false,
                      controller: controller,
                      decoration: InputDecoration(
                        hintText:hint,
                      ),
                    ),
                  ),
                ),

                widget ==null?Container():Container(child:widget),
              ],
            ),
          ),
        ]

      ),
    );
  }

}