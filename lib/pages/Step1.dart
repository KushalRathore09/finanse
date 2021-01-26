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
class Step1 extends StatefulWidget {
  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.elliptical(360, 80),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'GIN',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' Finans',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Welcome to The Bank of the Future.\nManage and track your accounts on the go.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 35),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Please enter valid email';
                    }
                  },
                  onSaved: (String value) {
                    data.email = value;
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
