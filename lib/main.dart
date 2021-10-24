import 'package:flutter/material.dart';
import 'package:mobilivewidgets/person.dart';
import 'form.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  Person person1 = new Person("Doğukan",age: 30);
  Person person2 = new Person("Levent",age: 28);

  @override
  void initState() {
    personList.add(person1);
    personList.add(person2);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          itemCount: personList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(personList[index].name),
              subtitle: Text(personList[index].age.toString()),
              trailing: IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: (){
                  setState(() {
                    personList.removeAt(index);
                  });
                },
              )
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FormPage())).then((value) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
