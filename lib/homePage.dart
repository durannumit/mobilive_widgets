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
  List<Person> persons = new List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var personListModel = Provider.of<PersonListModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("MobiLive"),
      ),
      body: StreamBuilder(
        stream: personListModel.fetchPerson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            persons = snapshot.data.documents
                .map<Person>((doc) => Person.fromMap(doc.data, doc.documentID))
                .toList();

            return Container(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 5,
                  );
                },
                itemCount: persons.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(persons[index].name),
                      subtitle:
                      Text(persons[index].age.toString()),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_outline),
                        onPressed: () =>
                          //personListModel.removePerson(index);
                          personListModel.deletePerson(persons[index].id)

                      ));
                },
              ),
            );
          }

          else {
          return Text('fetching');
          }
        }
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
