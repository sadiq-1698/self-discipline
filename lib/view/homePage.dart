import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:self_discipline/view/addNewItemPage.dart';
import 'package:self_discipline/view/bottomSheet.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _floatingActionButton(),
        appBar: _appBar(),
        body: _buildBody());
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      tooltip: "Add a task",
      onPressed: onPressFloatingActionButton,
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        "Self Discipline",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  Container _buildBody() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0, bottom: 3.0),
      child: ListView(
        children: <Widget>[
          _bodyContents(),
        ],
      ),
    );
  }

  Column _bodyContents() {
    return Column(
      children: <Widget>[
        _cardContainer("50 Pushups", true, 30, 21),
        _cardContainer("Learn React for an hour", true, 40, 11),
        _cardContainer("Drink a bottle of water", false, 34, 12),
        _cardContainer("Fart hard", false, 10, 2),
        _cardContainer("Sleep before 11:30", true, 30, 27),
        _cardContainer("Lift weights 30 times", false, 15, 13),
        _cardContainer("Fart hard", false, 20, 16),
        _cardContainer("Sleep before 11:30", true, 5, 2),
        _cardContainer("Lift weights 30 times", false, 7, 0),
        _cardContainer("Fart hard", false, 20, 12),
        _cardContainer("Sleep before 11:30", true, 25, 7),
        _cardContainer("Lift weights 30 times", false, 45, 2),
      ],
    );
  }

  Container _cardContainer(
      String task, bool isComplete, int totalDays, int completedDays) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 80.0,
      margin: EdgeInsets.only(top: 2.0),
      child: InkWell(
        onTap: (){
          showConfirmBottomSheet(completedDays, totalDays, isComplete);
        },
        child: Card(
          color: Colors.white70,
          elevation: 7.0,
          child: _cardContent(
              task, Icons.check, isComplete, totalDays, completedDays),
        ),
      ),
    );
  }

  Container _cardContent(String task, IconData iconData, bool isComplete,
      int totalDays, int completedDays) {
    return Container(
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _taskText(task),
                _taskStatus(Icons.check, isComplete),
              ],
            ),
          ),
          Container(
              child: _progressIndicator(totalDays, completedDays, isComplete)),
        ],
      ),
    );
  }

  Container _taskText(String task) {
    return Container(
      alignment: Alignment(-1.0, 0),
      height: 80.0,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.only(left: 12.0),
      child: Text(
        task,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17.0,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Container _taskStatus(IconData iconData, bool isComplete) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.1,
      height: 80.0,
      margin: EdgeInsets.only(right: 12.0),
      child: Icon(
        iconData,
        color: !isComplete ? Colors.grey : Colors.green,
        size: 40.0,
      ),
    );
  }

  onPressFloatingActionButton() {
    Navigator.of(context).push(PageTransition(
        type: PageTransitionType.slideInLeft,
        duration: Duration(milliseconds: 300),
        child: AddNewItemPage()));
  }

  Widget _progressIndicator(
      int totalDays, int completedDays, bool isCompleteCurrentDay) {
    return StepProgressIndicator(
      totalSteps: totalDays,
      currentStep: completedDays,
      size: 6,
      padding: 0,
      selectedColor: isCompleteCurrentDay ? Colors.green : Colors.yellow,
      unselectedColor: Colors.grey,
    );
  }

  showConfirmBottomSheet(int completedDays, int totalDays, bool isComplete) async {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return ShowBottomSheet(
              completedDays: completedDays,
              totalDays: totalDays,
              isComplete: isComplete,
            );
          });
  }
}
