import 'package:registrationpage/constants.dart';
import 'package:flutter/material.dart';

import 'NextButton.dart';

class PersonalInformationWidget extends StatefulWidget {
  final Function(int) _onPressed;

  const PersonalInformationWidget({
    required Key key,
    required Function(int) onPressed,
  })  : _onPressed = onPressed,
        super(key: key);

  @override
  _PersonalInformationWidgetState createState() =>
      _PersonalInformationWidgetState();
}

class _PersonalInformationWidgetState extends State<PersonalInformationWidget> {
  List<String>? goals = ['Choice1', 'Choice2', 'Choice3'];
  List<String>? income = ['Choice1', 'Choice2', 'Choice3'];
  List<String>? expense = ['Choice1', 'Choice2', 'Choice3'];

  String? _selectedTypeGoal = 'Choice1';
  String? _selectedTypeIncome = 'Choice1';
  String? _selectedTypeExp = 'Choice1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: NextButton(
          key: Key('NextButton'),
          onPressed: () {
            widget._onPressed(4);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              'Personal Information',
              textAlign: TextAlign.left,
              style: kTextTitleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
            child: Text(
              'Please fill in the information below and your goal for digital savings.',
              textAlign: TextAlign.left,
              style: kTextDescStyle,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Please set your Goal',
                  style: TextStyle(color: Colors.black),
                )),
          ),
          /*GOALS*/ Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60.0,
            decoration: BoxDecoration(
                color: kInputBG,
                borderRadius: BorderRadius.all(Radius.circular(9.0))),
            padding: EdgeInsets.all(10.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  items: goals?.map((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                  hint: Text(_selectedTypeGoal!),
                  onChanged: (String? val) {
                    if (val == null) return;
                    setState(() {
                      _selectedTypeGoal = val;
                    });
                  }),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Please select your Income',
                  style: TextStyle(color: Colors.black),
                )),
          ),
          /*INCOME*/ Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60.0,
            decoration: BoxDecoration(
                color: kInputBG,
                borderRadius: BorderRadius.all(Radius.circular(9.0))),
            padding: EdgeInsets.all(10.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  items: income?.map((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                  hint: Text(_selectedTypeIncome!),
                  onChanged: (String? val) {
                    if (val == null) return;
                    setState(() {
                      _selectedTypeIncome = val;
                    });
                  }),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Please select your Expense',
                  style: TextStyle(color: Colors.black),
                )),
          ),
          /*EXPENSE*/ Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60.0,
            decoration: BoxDecoration(
                color: kInputBG,
                borderRadius: BorderRadius.all(Radius.circular(9.0))),
            padding: EdgeInsets.all(10.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  items: expense?.map((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                  hint: Text(_selectedTypeExp!),
                  onChanged: (String? val) {
                    if (val == null) return;
                    setState(() {
                      _selectedTypeExp = val;
                    });
                  }),
            ),
          )
        ],
      ),
    );
  }
}
