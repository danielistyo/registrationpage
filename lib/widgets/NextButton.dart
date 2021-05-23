import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    required Function onPressed,
    required Key key,
  })  : _onPressed = onPressed,
        super(key: key);

  final Function _onPressed;

  buildOnPressed() => _onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buildOnPressed(),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60.0,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(9.0))),
        child: Center(
            child: Text(
          'Next',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18.0),
        )),
      ),
    );
  }
}
