// import 'package:finans/model/UserData.dart';
// import 'package:finans/pages/Step1.dart';
// import 'package:finans/pages/Step2.dart';
// import 'package:finans/pages/Step3.dart';
// import 'package:finans/pages/Step4.dart';
// import 'package:flutter/material.dart';
//
// int currStep = 0;
// UserData data = new UserData();
//
// // bool lowercase = false;
// // bool uppercase = false;
// // final RegExp lowercaseRegExp = RegExp('[a-z]');
// // final RegExp uppercaseRegExp = RegExp('[A-Z]');
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.lightBlue,
//       ),
//       home: Scaffold(
//         backgroundColor: Colors.blue.shade900, //Colors.grey.shade200,
//         // appBar: AppBar(
//         //   leading: IconButton(
//         //     icon: Icon(
//         //       Icons.arrow_back,
//         //       color: Colors.white,
//         //     ),
//         //     onPressed: () {
//         //       setState(() {
//         //         if (currStep > 0) {
//         //           currStep = currStep - 1;
//         //         } else {
//         //           currStep = 0;
//         //         }
//         //       });
//         //     },
//         //   ),
//         //   title: Text(
//         //     'Create Account',
//         //     style: TextStyle(color: Colors.white),
//         //   ),
//         // ),
//         body: SafeArea(
//           child: StepperBody(),
//         ),
//       ),
//     );
//   }
// }
//
// class StepperBody extends StatefulWidget {
//   @override
//   _StepperBodyState createState() => _StepperBodyState();
// }
//
// class _StepperBodyState extends State<StepperBody> {
//   static var _focusNode = new FocusNode();
//   GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     _focusNode.addListener(() {
//       setState(() {});
//       print('Has focus: $_focusNode.hasFocus');
//     });
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }
//
//   List<Step> steps = [
//     Step1(data),
//     Step2(data),
//     Step3(data),
//     Step4(data),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     void showSnackBarMessage(String message,
//         [MaterialColor color = Colors.red]) {
//       Scaffold.of(context)
//           .showSnackBar(new SnackBar(content: new Text(message)));
//     }
//
//     _submitDetails(currentStep) {
//       final FormState formState = _formKey.currentState;
//       formState.save();
//       print('CURRENT--->${data.email}');
//       print('CURRENT--->${data.password}');
//       if (currentStep == 0 &&
//           data.email.isNotEmpty &&
//           data.email.contains('@') &&
//           data.email.length > 4) {
//         setState(() {
//           currStep = currStep + 1;
//         });
//       } else if (currentStep == 1 &&
//           data.password.isNotEmpty &&
//           data.password.length > 3) {
//         setState(() {
//           if (lowercaseRegExp.hasMatch(data.password)) {
//             lowercase = true;
//             print('LOWERCASE-----$lowercase');
//           }
//           if (uppercaseRegExp.hasMatch(data.password)) {
//             print('Uppercase-----$uppercase');
//             uppercase = true;
//           }
//           // else {
//           //   currStep = currStep + 1;
//           // }
//         });
//       } else if (currentStep == 2) {
//         setState(() {
//           currStep = currStep + 1;
//         });
//       } else {
//         if (!formState.validate()) {
//           showSnackBarMessage('Please enter correct data');
//         } else {
//           formState.save();
//           print("Email: ${data.email}");
//           print("Password: ${data.password}");
//           print("Goal: ${data.activationGoal}");
//           print("MonthlyIncome: ${data.monthlyIncome}");
//           print("MonthlyExpense: ${data.monthlyExpense}");
//
//           showDialog(
//             context: context,
//             child: new AlertDialog(
//               title: new Text("Details"),
//               //content: new Text("Hello World"),
//               content: new SingleChildScrollView(
//                 child: new ListBody(
//                   children: <Widget>[
//                     Text("Email : " + data.email),
//                     Text("Password : " + data.password),
//                     Text("Goal : " + data.activationGoal),
//                     Text("Income : " + data.monthlyIncome),
//                     Text("Expense : " + data.monthlyExpense),
//                   ],
//                 ),
//               ),
//               actions: <Widget>[
//                 new FlatButton(
//                   child: new Text('OK'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//           );
//         }
//       }
//     }
//
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       child: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             Expanded(
//               child: Stepper(
//                 steps: steps,
//                 type: StepperType.horizontal,
//                 currentStep: currStep,
//                 controlsBuilder: (BuildContext context,
//                     {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
//                   return Row(
//                     children: <Widget>[
//                       Container(
//                         child: null,
//                       ),
//                       Container(
//                         child: null,
//                       ),
//                     ],
//                   );
//                 },
//                 onStepContinue: () {
//                   setState(() {
//                     if (currStep < steps.length - 1) {
//                       currStep = currStep + 1;
//                     } else {
//                       currStep = 0;
//                     }
//                   });
//                 },
//                 onStepCancel: () {
//                   setState(() {
//                     if (currStep > 0) {
//                       currStep = currStep - 1;
//                     } else {
//                       currStep = 0;
//                     }
//                   });
//                 },
//                 onStepTapped: (step) {
//                   setState(() {
//                     currStep = step;
//                   });
//                 },
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
//               child: FlatButton(
//                 height: 60,
//                 child: Text(
//                   'Next',
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//                 onPressed: () {
//                   _submitDetails(currStep);
//                 },
//                 color: Colors.blue,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:finans/model/UserData.dart';
import 'package:finans/pages/HomePage.dart';
import 'package:flutter/material.dart';

UserData data = new UserData();

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue.shade700,
        body: SafeArea(
          child: HomePage(),
        ),
      ),
    );
  }
}
