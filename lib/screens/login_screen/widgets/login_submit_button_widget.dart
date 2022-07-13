import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/button/submit_button_widget.dart';

class LoginSubmitButtonWidget extends StatelessWidget {
  final Function onSubmit;
  const LoginSubmitButtonWidget({Key? key, required this.onSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.only(top: 30, right: 23),
        child: ButtonWidget(
          text: 'Entrar',
          onPressed: this.onSubmit,
        ),
      ),
    );
  }
}
