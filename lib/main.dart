import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Self Discipline',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'JosefinSans',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _floatingActionButton(),
        appBar: AppBar(
          title: Text(
            "Self Discipline",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(4.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _cardContainer("50 Pushups", true),
                  _cardContainer("Learn React for an hour", true),
                  _cardContainer("Drink a bottle of water", false),
                  _cardContainer("Fart hard", false),
                  _cardContainer("Sleep before 11:30", true),
                  _cardContainer("Lift weights 30 times", false),
                  _cardContainer("Fart hard", false),
                  _cardContainer("Sleep before 11:30", true),
                  _cardContainer("Lift weights 30 times", false),
                  _cardContainer("Fart hard", false),
                  _cardContainer("Sleep before 11:30", true),
                  _cardContainer("Lift weights 30 times", false),
                ],
              ),
            ],
          ),
        ));
  }

  Container _cardContainer(String task, bool isComplete) {
    return Container(
      height: 80.0,
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: _cardContent(task, Icons.check, isComplete),
      ),
    );
  }

  Container _cardContent(String task, IconData iconData, bool isComplete) {
    return Container(
        color: isComplete ? Colors.lightGreen[200] : Colors.yellowAccent[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _taskText(task),
            _taskStatus(iconData, isComplete),
          ],
        ));
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
          fontFamily: 'JosefinSans',
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

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      tooltip: "Add a task",
      onPressed: () {},
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }
}
