import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ShowBottomSheet extends StatefulWidget {
  final int totalDays;
  final int completedDays;
  final bool isComplete;
  ShowBottomSheet({this.totalDays, this.completedDays, this.isComplete});

  @override
  _ShowBottomSheetState createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration(),
      height: MediaQuery.of(context).size.height * 0.4,
      child: _bottomSheetBody(),
    );
  }

  Column _bottomSheetBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _bottomSheetContent(),
    );
  }

  List<Widget> _bottomSheetContent() {
    return [
      _progressIndicator(widget.totalDays, widget.completedDays),
      SizedBox(height: 8.0),
      Text(
        'Streak: ${widget.completedDays} ' + '/' + ' ${widget.totalDays}',
        style: _streakTextStyle(),
      ),
      SizedBox(height: 8.0),
      Text(
        widget.isComplete ? "Status: Complete" : "Status: Pending",
        style: _statusTextStyle(widget.isComplete),
      )
    ];
  }

  Widget _progressIndicator(int totalDays, int completedDays) {
    String percentage =
        calculatePercentage(completedDays, totalDays).toString().split(".")[0];
    return _circularStepProgressIndicator(totalDays, completedDays, percentage);
  }

  CircularStepProgressIndicator _circularStepProgressIndicator(
      int totalDays, int completedDays, String percentage) {
    return CircularStepProgressIndicator(
      child: Center(
        child: _percentageText(percentage),
      ),
      totalSteps: totalDays,
      currentStep: completedDays,
      stepSize: 8,
      selectedColor: Colors.purple,
      unselectedColor: Colors.grey[200],
      padding: 0,
      width: 150,
      height: 150,
      selectedStepSize: 8,
      roundedCap: (_, __) => true,
    );
  }

  Text _percentageText(String percentage) {
    return Text(
      percentage + "%",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  TextStyle _streakTextStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  }

  TextStyle _statusTextStyle(bool isComplete) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: isComplete ? Colors.teal : Colors.redAccent);
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        boxShadow: [_boxShadow()],
        color: Colors.white,
        borderRadius: _borderRadius());
  }

  BoxShadow _boxShadow() {
    return BoxShadow(
        color: Colors.black12,
        offset: Offset(1, 1),
        blurRadius: 5.0,
        spreadRadius: 10.0);
  }

  BorderRadius _borderRadius() {
    return BorderRadius.only(
        topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0));
  }

  calculatePercentage(int completedDays, int totalDays) {
    return (widget.completedDays / widget.totalDays * 100);
  }
}
