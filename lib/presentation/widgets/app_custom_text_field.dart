
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appTextFormWidget({
  String? labelText,
  String? hintText,
  double? width,
  bool obscureText = false,
  Color labelTextColor = Colors.black,
  Color hintTextColor = Colors.grey,
  var onChanged
}
    ) {

  return Container(
    padding: EdgeInsets.only(
        left: 2.5, right: 5),
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Colors.grey,
                width: 0.5
            )
        )
    ),
    child: Row(
      children: [
        Container(
          width: 80,
          height: 45,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
              left: 5, top: 5, bottom: 5),
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(
                      color: Colors.grey,
                      width: 0.5
                  )
              )
          ),
          child: Text(
            labelText!,
            style: TextStyle(
              color: labelTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        Container(
            width: width,
            height: 45,
            padding: EdgeInsets.only(
                left: 15),
            child: TextFormField(
              cursorColor: Colors.green[900],
              obscureText: obscureText,
              style: TextStyle(
                fontSize: 15,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                    color: hintTextColor
                ),
              ),
              onChanged: onChanged,
            )
        ),
      ],
    ),
  );
}

class CustomTextFormWidget extends StatelessWidget {

  String? labelText;
  String? hintText;
  double? width;
  bool? obscureText;
  Color? labelTextColor;
  Color? hintTextColor;
  String? initialValue;
  var onChanged;


  CustomTextFormWidget({
    this.labelText,
    this.hintText,
    this.width,
    this.obscureText = false,
    this.labelTextColor = Colors.black,
    this.hintTextColor = Colors.grey,
    this.initialValue,
    this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 2.5, right: 5),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.5
              )
          )
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 45,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
                left: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                        color: Colors.grey,
                        width: 0.5
                    )
                )
            ),
            child: Text(
              labelText!,
              style: TextStyle(
                color: labelTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Container(
              width: width,
              height: 45,
              padding: EdgeInsets.only(
                  left: 15),
              child: TextFormField(
                cursorColor: Colors.green[900],
                obscureText: obscureText!,
                initialValue: initialValue,
                style: TextStyle(
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: hintTextColor
                  ),
                ),
                onChanged: onChanged,
              )
          ),
        ],
      ),
    );
  }

}