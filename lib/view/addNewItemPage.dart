import 'package:flutter/material.dart';
import 'package:self_discipline/components/helpers/ensureVisibleWhenFocused.dart';

class AddNewItemPage extends StatelessWidget {
  FocusNode _focusNodeTaskName = FocusNode();
  FocusNode _focusNodeTaskDays = FocusNode();

  TextEditingController _controllerTaskName = new TextEditingController();
  TextEditingController _controllerTaskDays = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildBody(context),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        "Add a task",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  Container _buildBody(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: <Widget>[
              _textFieldTask(
                  _focusNodeTaskName, _controllerTaskName, "Add a task here"),
              SizedBox(height: 20.0),
              _textFieldDays(
                  _focusNodeTaskDays, _controllerTaskDays, "Number of days"),
              SizedBox(height: 20.0),
              _addTaskButton(),
            ],
          ),
        ));
  }

  Widget _textFieldTask(FocusNode _focusNode, TextEditingController _controller,
      String _labelText) {
    return EnsureVisibleWhenFocused(
      focusNode: _focusNode,
      child: TextFormField(
        controller: _controller,
        decoration: _textFieldInputDecoration(_labelText),
        onSaved: (String val) {},
      ),
    );
  }

  Widget _textFieldDays(FocusNode _focusNode, TextEditingController _controller,
      String _labelText) {
    return EnsureVisibleWhenFocused(
      focusNode: _focusNode,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _controller,
        decoration: _textFieldInputDecoration(_labelText),
        onSaved: (String val) {},
      ),
    );
  }

  Row _addTaskButton() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 4.0, right: 4.0),
            height: 50.0,
            child: RaisedButton(
              color: Colors.blue,
              onPressed: () {},
              child: Text(
                "Add Task",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration _textFieldInputDecoration(String _labelText) {
    return InputDecoration(
        labelText: _labelText,
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blue,
          width: 2.0,
        )));
  }
}
