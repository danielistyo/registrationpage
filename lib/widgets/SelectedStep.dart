import 'package:registrationpage/widgets/Step1Widget.dart';
import 'package:registrationpage/widgets/Step2Widget.dart';
import 'package:registrationpage/widgets/Step3Widget.dart';
import 'package:registrationpage/widgets/Step4Widget.dart';
import 'package:flutter/cupertino.dart';

class SelectedStep extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SelectedStepState();
}

enum WidgetMarker { welcome, step1, step2, step3, step4 }

class SelectedStepState extends State<SelectedStep> {
  WidgetMarker _selectedWidgetMarker = WidgetMarker.welcome;

  Widget getCurrentStep() {
    switch (_selectedWidgetMarker) {
      case WidgetMarker.step1:
        return EmailInputWidget(
            key: Key('EmailInputWidget'),
            onPressed: (int step) {
              setState(() {
                _selectedWidgetMarker = WidgetMarker.step2;
              });
            });
      case WidgetMarker.step2:
        return InputPasswordWidget(onPressed: (int step) {
          setState(() {
            _selectedWidgetMarker = WidgetMarker.step3;
          });
        });
      case WidgetMarker.step3:
        return PersonalInformationWidget(
            key: Key('PersonalInformationWidget'),
            onPressed: (int step) {
              setState(() {
                _selectedWidgetMarker = WidgetMarker.step4;
              });
            });
      case WidgetMarker.step4:
        return ScheduleVideoCallWidget(
            key: Key('ScheduleVideoCallWidget'),
            onPressed: (int step) {
              setState(() {
                _selectedWidgetMarker = WidgetMarker.welcome;
              });
            });
      default:
        return EmailInputWidget(
            key: Key('EmailInputWidget'),
            onPressed: (int step) {
              setState(() {
                _selectedWidgetMarker = WidgetMarker.step2;
              });
            });
    }
  }

  @override
  Widget build(BuildContext context) {
    return getCurrentStep();
  }
}
