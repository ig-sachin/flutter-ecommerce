import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final Icon iconName;
  final String hintText;
  final String labelText;
  final validator;

  const TextInputWidget({
    Key? key,
    required this.iconName,
    required this.hintText,
    required this.labelText,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Color(0xFF474747),
              borderRadius: BorderRadius.circular(24),
            ),
            child: TextFormField(
              validator: validator,
              decoration: InputDecoration(
                icon: iconName,
                hintText: hintText,
                labelText: labelText,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
