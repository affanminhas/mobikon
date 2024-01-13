import 'package:flutter/material.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';

class AppDialogs {
  static void showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SuccessPopup(message: message);
      },
    );
  }
}

class SuccessPopup extends StatelessWidget {
  final String message;

  const SuccessPopup({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 10.0),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.close),
                ),
              ),
              Image.asset(Strings.checkIcon),
              const SizedBox(height: 16.0),
              Text(
                'Success',
                style: robotoCondensedBold.copyWith(fontSize: 24.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  message,
                  style: robotoCondensedRegular.copyWith(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 18.0),
            ],
          ),
        ),
      ],
    );
  }
}
