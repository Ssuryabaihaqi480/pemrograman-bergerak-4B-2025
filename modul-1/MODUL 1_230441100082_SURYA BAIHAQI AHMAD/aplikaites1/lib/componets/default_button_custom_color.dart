import 'package:flutter/material.dart';
import '../size_config.dart';

class DefaultButtonCustomeColor extends StatelessWidget {
  const DefaultButtonCustomeColor({Key? key, this.text, this.color, this.press})
    : super(key: key);

  final String? text;
  final Color? color;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: color ?? Colors.blue, // Default warna jika null
        ),
        onPressed: press as void Function()?,
        child: Text(
          text ?? "", // Mencegah error jika text null
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
