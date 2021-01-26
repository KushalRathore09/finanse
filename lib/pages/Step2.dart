import 'package:finans/main.dart';
import 'package:flutter/material.dart';

bool lowercaseFlag = false;
bool uppercaseFlag = false;
bool numberFlag = false;
bool alphanumericFlag = false;
int pwdComplexityCount = 0;
String pwdComplexity = '';
final RegExp lowercaseRegExp = RegExp('[a-z]');
final RegExp uppercaseRegExp = RegExp('[A-Z]');
final RegExp numberRegExp = RegExp('[0-9]');
final RegExp alphanumericRegExp = RegExp('[!@#%^&*(),.?":{}|<>]');

class Step2 extends StatefulWidget {
  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
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
            'Create Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Password will be used to login to account',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 50),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              obscureText: true,
              autocorrect: false,
              validator: (value) {
                if (value.isEmpty || value.length < 4) {
                  return 'Password should be atleast 4 characters long.';
                }
              },
              onSaved: (String value) {
                data.password = value;
              },
              onChanged: (value) {
                setState(() {
                  if (lowercaseRegExp.hasMatch(value)) {
                    lowercaseFlag = true;
                    pwdComplexityCount = pwdComplexityCount + 1;
                  } else {
                    lowercaseFlag = false;
                    pwdComplexityCount = pwdComplexityCount - 1;
                  }
                  if (uppercaseRegExp.hasMatch(value)) {
                    uppercaseFlag = true;
                    pwdComplexityCount = pwdComplexityCount + 1;
                  } else {
                    uppercaseFlag = false;
                    pwdComplexityCount = pwdComplexityCount - 1;
                  }
                  if (numberRegExp.hasMatch(value)) {
                    numberFlag = true;
                    pwdComplexityCount = pwdComplexityCount + 1;
                  } else {
                    numberFlag = false;
                    pwdComplexityCount = pwdComplexityCount - 1;
                  }
                  if (alphanumericRegExp.hasMatch(value)) {
                    alphanumericFlag = true;
                    pwdComplexityCount = pwdComplexityCount + 1;
                  } else {
                    alphanumericFlag = false;
                    pwdComplexityCount = pwdComplexityCount - 1;
                  }

                  if (pwdComplexityCount == 0 && value.length > 0) {
                    pwdComplexity = 'Very Weak';
                  } else if (pwdComplexityCount == 1) {
                    pwdComplexity = 'Weak';
                  } else if (pwdComplexityCount == 2) {
                    pwdComplexity = 'Strong';
                  } else if (pwdComplexityCount >= 3) {
                    pwdComplexity = 'Very Strong';
                  } else {
                    pwdComplexity = '';
                    pwdComplexityCount = 0;
                  }
                });
              },
              maxLines: 1,
              decoration: InputDecoration(
                labelText: 'Create Password',
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.blue,
                ),
                labelStyle:
                    TextStyle(decorationStyle: TextDecorationStyle.solid),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Text(
                  'Complexity:',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  pwdComplexity,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.amber,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                lowercaseFlag
                    ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      )
                    : Column(
                        children: [
                          Text(
                            'a',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Lowercase',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                uppercaseFlag
                    ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      )
                    : Column(
                        children: [
                          Text(
                            'A',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Uppercase',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                numberFlag
                    ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      )
                    : Column(
                        children: [
                          Text(
                            '123',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Number',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                alphanumericFlag
                    ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      )
                    : Column(
                        children: [
                          Text(
                            '9+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Characters',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
