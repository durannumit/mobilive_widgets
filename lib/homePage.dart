import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'form.dart';
import 'main.dart';
import 'person.dart';
import 'personListModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var personListModel = Provider.of<PersonListModel>(context);
    print(personListModel.personList.length.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("MobiLive"),
      ),
      body: Container(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              height: 5,
            );
          },
          itemCount: personListModel.personList.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(personListModel.personList[index].name),
                subtitle:
                    Text(personListModel.personList[index].age.toString()),
                trailing: IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () {
                    //personListModel.removePerson(index);
                    personListModel.personList.removeAt(index);
                    print(personListModel.personList.length.toString());
                  },
                ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
