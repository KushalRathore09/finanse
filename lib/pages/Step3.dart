import 'package:finans/main.dart';
import 'package:flutter/material.dart';

//
// Step1(data) {
//   return Step(
//     title: Text(''),
//     // subtitle: const Text('Subtitle'),
//     isActive: true,
//     state: StepState.indexed,
//     content: Container(
//       margin: EdgeInsets.all(10),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Welcome to',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: 'GIN',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 TextSpan(
//                   text: ' Finans',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Welcome to The Bank of the Future.\nManage and track your accounts on the go.',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           SizedBox(height: 20),
//           Container(
//             padding: EdgeInsets.all(5),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Container(
//               margin: EdgeInsets.all(5),
//               padding: EdgeInsets.only(left: 10, right: 10),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade200,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 autocorrect: false,
//                 validator: (value) {
//                   if (value.isEmpty || !value.contains('@')) {
//                     return 'Please enter valid email';
//                   }
//                 },
//                 onSaved: (String value) {
//                   data.email = value;
//                 },
//                 maxLines: 1,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: InputBorder.none,
//                   icon: Icon(
//                     Icons.email,
//                     color: Colors.grey,
//                   ),
//                   labelStyle:
//                       TextStyle(decorationStyle: TextDecorationStyle.solid),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
class Step3 extends StatefulWidget {
  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  int _activationGoalsValue = 0;
  int _monthlyIncomeValue = 0;
  int _monthlyExpenseValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Please fill in the the information below and your goal for digital saving.',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Goal for Activation',
                  style: TextStyle(color: Colors.grey),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    itemHeight: 50.0,
                    value: _activationGoalsValue,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        child: Text("Choose Option"),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text("Goal 1"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Goal 2"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("Goal 3"),
                        value: 3,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _activationGoalsValue = value;
                        data.activationGoal = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Monthly Income',
                  style: TextStyle(color: Colors.grey),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    itemHeight: 50.0,
                    value: _monthlyIncomeValue,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        child: Text("Choose Option"),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text("Income 1"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Income 2"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("Income 3"),
                        value: 3,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _monthlyIncomeValue = value;
                        data.monthlyIncome = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Monthly Expense',
                  style: TextStyle(color: Colors.grey),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    itemHeight: 50.0,
                    value: _monthlyExpenseValue,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        child: Text("Choose Option"),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text("Expense 1"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Expense 2"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("Expense 3"),
                        value: 3,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _monthlyExpenseValue = value;
                        data.monthlyExpense = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
