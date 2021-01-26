// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int curStep = 0;
//   List<Step> registerSteps = [
//     Step(title: Text(''), content: Text('Start'), isActive: true),
//     Step(
//         title: Text(''),
//         content: Text('Process 2'),
//         state: StepState.indexed,
//         isActive: true),
//     Step(
//         title: Text(''),
//         content: Text('Process 3'),
//         state: StepState.indexed,
//         isActive: true),
//     Step(
//         title: Text(''),
//         content: Text('Process 4'),
//         state: StepState.indexed,
//         isActive: true),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.green,
//       child: Stepper(
//         steps: registerSteps,
//         currentStep: this.curStep,
//         type: StepperType.horizontal,
//         onStepTapped: (step) {
//           setState(() {
//             curStep = step;
//           });
//         },
//         onStepContinue: () {
//           setState(() {
//             if (curStep < registerSteps.length - 1) {
//               curStep = curStep + 1;
//             } else {
//               curStep = 0;
//             }
//           });
//         },
//         onStepCancel: () {
//           setState(() {
//             if (curStep > 0) {
//               curStep = curStep - 1;
//             } else {
//               curStep = 0;
//             }
//           });
//         },
//         controlsBuilder: (BuildContext context,
//             {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
//           return Row(
//             children: [],
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:finans/main.dart';
import 'package:finans/pages/Step1.dart';
import 'package:finans/pages/Step2.dart';
import 'package:finans/pages/Step3.dart';
import 'package:finans/pages/Step4.dart';
import 'package:finans/pages/acknowledgementScreen.dart';
import 'package:flutter/material.dart';

int currentStep = 0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    showStep(currentStep);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold.of(context)
          .showSnackBar(new SnackBar(content: new Text(message)));
    }

    checkFormData() {
      final FormState formState = _formKey.currentState;
      formState.save();

      if (currentStep == 0) {
        if (data.email.isNotEmpty &&
            data.email.contains('@') &&
            data.email.length > 4) {
          setState(() {
            currentStep = currentStep + 1;
            showStep(currentStep);
          });
        } else {
          showSnackBarMessage('Please provide valid Email Id');
        }
      } else if (currentStep == 1) {
        if (data.password.isNotEmpty && data.password.length > 4) {
          setState(() {
            currentStep = currentStep + 1;
            showStep(currentStep);
          });
        } else {
          showSnackBarMessage('Please provide valid password');
        }
      } else if (currentStep == 2) {
        if (data.activationGoal == 0 ||
            data.monthlyIncome == 0 ||
            data.monthlyExpense == 0) {
          showSnackBarMessage('Please select values from dropdown');
        } else {
          setState(() {
            currentStep = currentStep + 1;
            showStep(currentStep);
          });
        }
      } else if (currentStep == 3) {
        setState(() {
          currentStep = currentStep + 1;
          showStep(currentStep);
        });
      }
    }

    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 10),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildCircle(1),
                      buildLine(),
                      buildCircle(2),
                      buildLine(),
                      buildCircle(3),
                      buildLine(),
                      buildCircle(4),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: showStep(currentStep),
                )
                //showStep(currentStep),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: FlatButton(
                height: 60,
                color: Colors.blue,
                onPressed: () {
                  checkFormData();
                  setState(() {});
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCircle(stepNumber) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentStep = stepNumber - 1;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Text(
          stepNumber.toString(),
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }

  Widget buildLine() {
    return Expanded(
      child: Container(
        height: 3.0,
        color: Colors.black,
      ),
    );
  }

  showStep(currentStep) {
    if (currentStep == 0) {
      return Step1();
    } else if (currentStep == 1) {
      return Step2();
    } else if (currentStep == 2) {
      return Step3();
    } else if (currentStep == 3) {
      return Step4();
    }else if(currentStep == 4 ){
      return Container();
    }
  }
}
