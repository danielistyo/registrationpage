import 'package:registrationpage/constants.dart';
import 'package:flutter/material.dart';

import 'NextButton.dart';
import 'InputField.dart';

class EmailInputWidget extends StatefulWidget {
  const EmailInputWidget({
    required Key key,
    required Function(int) onPressed,
  })  : _onPressed = onPressed,
        super(key: key);

  final Function(int) _onPressed;

  @override
  _EmailInputWidgetState createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _validate = false;
  late String _name;
  late String _email;
  late String _mobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: NextButton(
          key: Key('NextButton'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              widget._onPressed(2);
            } else {
              // validation error
              setState(() {
                _validate = true;
              });
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*WELCOME TEXT*/ Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Welcome to',
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'GIN',
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Finans',
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 10.0, right: 20.0),
                        child: Text(
                          'Welcome to the Bank of The Future. Manage your tracks your account on the go.',
                          textAlign: TextAlign.left,
                          style: kTextDescStyle,
                        ),
                      )
                    ],
                  ),
                ),
                /*INPUT FIELDS*/ Container(
                  child: Form(
                      key: _formKey, autovalidate: _validate, child: FormUI()),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget FormUI() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: InputBoxWidget(
            key: Key('InputBoxWidget'),
            emailController: _emailController,
            icon: Icon(Icons.email),
            hint: 'Email',
            textInputType: TextInputType.emailAddress,
            validator: validateEmail,
            obscureText: false,
            onChanged: (String) {},
          ),
        ),
      ],
    );
  }

  String? validateEmail(String? value) {
    if (value == null) return null;

    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
