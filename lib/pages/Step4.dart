import 'dart:io';

import 'package:finans/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Step4 extends StatefulWidget {
  @override
  _Step4State createState() => _Step4State();
}

class _Step4State extends State<Step4> with SingleTickerProviderStateMixin {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  bool selectDate = false;
  bool selectTime = false;
  String _hour, _minute, _time;
  String formattedTime;

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 15.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: _animation.value,
                ),
              ],
            ),
            child: Icon(
              Icons.calendar_today,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 50),
          Text(
            'Schedule Video Call',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Choose the date and time that you preferred, we will send a link via email to make a video call on the scheduled data and time.',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 60),
          GestureDetector(
            onTap: () {
              Platform.isIOS
                  ? buildCupertinoDatePicker(context)
                  : buildMaterialDatePicker(context);
            },
            child: Container(
              padding:
                  EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          !selectDate
                              ? 'Select Date'
                              : selectedDate.toString().substring(0, 10),
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 135,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.grey,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Platform.isIOS
                  ? buildCupertinoDatePicker(context)
                  : buildMaterialTimePicker(context);
            },
            child: Container(
              padding:
                  EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          !selectTime ? 'Choose Time' : formattedTime,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 135,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.grey,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// This builds material date picker in Android
  buildMaterialDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(
        () {
          selectDate = true;
          selectedDate = picked;
        },
      );
  }

  /// This builds cupertion date picker in iOS
  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (picked) {
              if (picked != null && picked != selectedDate)
                setState(() {
                  selectedDate = picked;
                });
            },
            initialDateTime: selectedDate,
            minimumYear: 2000,
            maximumYear: 2025,
          ),
        );
      },
    );
  }

  buildMaterialTimePicker(BuildContext context) async {
    final TimeOfDay timePicked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (timePicked != null)
      setState(
        () {
          selectTime = true;
          selectedTime = timePicked;
          _hour = selectedTime.hour.toString();
          _minute = selectedTime.minute.toString();
          _time = _hour + ' : ' + _minute;
          formattedTime = _time;
        },
      );
  }

  buildCupertinoTimePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          color: Colors.white,
          child: CupertinoTimerPicker(
            initialTimerDuration: Duration.zero,
            mode: CupertinoTimerPickerMode.hm,
            onTimerDurationChanged: (picked) {
              selectTime = true;
              _hour = picked.inHours.toString();
              _minute = picked.inMinutes.toString();
              _time = _hour + ' : ' + _minute;
              formattedTime = _time;
            },
          ),
        );
      },
    );
  }
}
