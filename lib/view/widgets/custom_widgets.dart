import 'package:flutter/material.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

Widget customDivider = Container(
  width: double.infinity,
  height: .5,
  color: Colors.white,
);

class TitleText extends StatelessWidget {
  TitleText({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: defSpacing, bottom: defSpacing / 4),
        child: Row(children: [
          Text("$title", style: TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.w900))
        ]));
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.hint, this.iconData, required this.onSaved, this.controller});

  final String hint;
  final IconData? iconData;
  final Function onSaved;
  final TextEditingController? controller;

  String _getErrorMessage() {
    switch (hint) {
      case 'Enter your name':
        return 'Name is empty!';
      case 'Enter your email':
        return 'Email is empty!';
      case 'Enter your password':
        return 'Password is empty!';
    }
    return 'Value is empty';
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller != null ? controller : null,
        validator: (value) {
          if (value == null || value.trim().isEmpty) return _getErrorMessage();
        },
        onSaved: (value) {
          onSaved(value);
        },
        obscureText: hint == 'Enter your password' ? true : false,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(iconData),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: kSignInputBorder,
            disabledBorder: kSignInputBorder,
            focusedBorder: kSignInputBorder,
            border: kSignInputBorder));
  }
}

class CustomTextFieldData extends StatelessWidget {
  CustomTextFieldData(
      {required this.hint, this.iconData, required this.onSaved, this.controller, this.isString = true});

  final String hint;
  final IconData? iconData;
  final Function onSaved;
  final TextEditingController? controller;
  final bool isString;

  String _getErrorMessage() {
    return 'Value is empty';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(defSpacing / 4),
        child: TextFormField(
            inputFormatters: inputFormatterDetectors(hint),
            keyboardType: isString ? TextInputType.text : TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: controller != null ? controller : null,
            validator: (value) {
              if (value == null || value.trim().isEmpty) return _getErrorMessage();
            },
            onSaved: (value) {
              onSaved(value);
            },
            obscureText: hint == 'Secure Code' ? true : false,
            cursorColor: KColor1,
            enableInteractiveSelection: false,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: hint,
                fillColor: kLightGray,
                filled: true,
                enabledBorder: kCustomInputBorderB,
                focusedBorder: kCustomInputBorderB,
                border: kCustomInputBorderB)));
  }

  inputFormatterDetectors(hint) {
    if (hint == 'Card Number') {
      return [MaskedInputFormatter('####-####-####-####')];
    } else if (hint == 'Expiration') {
      return [MaskedInputFormatter('##/##')];
    } else if (hint == 'Zip Code') {
      return [MaskedInputFormatter('#####')];
    } else if (hint == 'Secure Code') {
      return [MaskedInputFormatter('###')];
    } else {
      return null;
    }
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({required this.title, required this.onPressed, this.titleColor, this.backColor});

  final String title;
  final Color? titleColor;
  final Color? backColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 18.0, color: titleColor ?? Colors.white),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(defSpacing * .75)),
          shape:
              MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(defSpacing * .75))),
          backgroundColor: MaterialStateProperty.all(backColor ?? primaryColor),
        ));
  }
}

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(icon, color: primaryColor),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          onPressed();
        });
  }
}

class CustomCircularProgress extends StatelessWidget {
  CustomCircularProgress(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: color));
  }
}
