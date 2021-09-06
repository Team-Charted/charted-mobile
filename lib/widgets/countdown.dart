import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountDown extends StatefulWidget {
  final String endTime;

  CountDown(this.endTime);

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late DateTime _endTime;
  late Duration _time;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    this._endTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(widget.endTime));
    this._time = _endTime.difference(DateTime.now());
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        this._time = _endTime.difference(DateTime.now());
      });
    });
  }

  String getDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitHours = twoDigits(duration.inHours.remainder(24));
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inDays)} : $twoDigitHours : $twoDigitMinutes : $twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return DateTime.now().compareTo(_endTime) > 0
        ? Text(
            'Chart closed',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18,
            ),
          )
        : Text(
            getDuration(this._time),
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18,
            ),
          );
  }
}
