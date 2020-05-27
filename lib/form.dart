import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'main.dart';
import 'person.dart';
import 'personListModel.dart';

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final nameController = TextEditingController();
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration:
                    InputDecoration(hintText: 'Name', labelText: 'Name'),
                controller: nameController,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Age', labelText: 'Age'),
                controller: numberController,
              ),
              Container(
                width: 80,
                child: RaisedButton(
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Person person = Person(name:nameController.text,
                        age: int.parse(numberController.text));
                    //personList.add(person);
                    Provider.of<PersonListModel>(context, listen: false).addPerson(person);
                    Navigator.pop(context);
                  },
                  color: Colors.blue,
                ),
                margin: EdgeInsets.only(top: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
