import 'package:flutter/cupertino.dart';

import 'package:firebase_testv2/screens/widgets/input_text/input_text_widget.dart';

class LoginInputsWidget extends StatelessWidget {
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  LoginInputsWidget(
      {Key? key,
      required this.emailTextController,
      required this.passwordTextController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 22, 20, 27),
          child: InputTextWidget(
              placeHolder: "Usuario",
              textEditingController: this.emailTextController),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: InputTextWidget(
            placeHolder: "Contraseña",
            textEditingController: this.passwordTextController,
          ),
        ),
      ],
    );
  }
}
