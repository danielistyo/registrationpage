import 'package:registrationpage/screens/Welcome.dart';
import 'package:registrationpage/widgets/SelectedStep.dart';
import 'package:registrationpage/widgets/SectionNumber.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _UserRegisterScreeState createState() => _UserRegisterScreeState();
}

class _UserRegisterScreeState extends State<RegistrationScreen> {
  int currentPage = 0;
  var _viewPageController = PageController();

  void onNextPressed(int val) {
    if (val == 4) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => WelcomeScreen()),
        ModalRoute.withName('/'),
      );
    } else {
      _viewPageController.animateToPage(val,
          duration: Duration(milliseconds: 100), curve: Curves.linear);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            /*TOP CIRCLES*/ Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SectionNumber(
                    level: '1',
                    colorBb: currentPage >= 0 ? Colors.green : Colors.white,
                  ),
                  SizedBox(
                      width: 30.0,
                      child: Divider(
                        color: Colors.black,
                        thickness: 4.0,
                      )),
                  SectionNumber(
                    level: '2',
                    colorBb: currentPage >= 1 ? Colors.green : Colors.white,
                  ),
                  SizedBox(
                      width: 30.0,
                      child: Divider(
                        color: Colors.black,
                        thickness: 4.0,
                      )),
                  SectionNumber(
                    level: '3',
                    colorBb: currentPage >= 2 ? Colors.green : Colors.white,
                  ),
                  SizedBox(
                      width: 30.0,
                      child: Divider(
                        color: Colors.black,
                        thickness: 4.0,
                      )),
                  SectionNumber(
                    level: '4',
                    colorBb: currentPage >= 3 ? Colors.green : Colors.white,
                  )
                ],
              ),
            ),
            Expanded(child: SelectedStep())
          ],
        ),
      ),
    );
  }
}
