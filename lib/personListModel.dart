import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'person.dart';

class PersonListModel with ChangeNotifier {
  List<Person> personList;

  Future deletePerson(String documentId) async {
    await Firestore.instance.collection("Person").document(documentId).delete();
  }

  Future addPerson(Person person) async {
    try {
      await Firestore.instance.collection("Person").add(person.toJson());
      return true;
    } catch (e) {
      return e.toString();
    }
  }

  Stream<QuerySnapshot> fetchPerson() {
    notifyListeners();
    return Firestore.instance.collection("Person").snapshots();
  }

/*  Future<List<Person>> fetchPerson() async {
    var result = await Firestore.instance.collection("Person").getDocuments();
    personList = result.documents
        .map((doc) => Person.fromMap(doc.data, doc.documentID))
        .toList();
    notifyListeners();
    return personList;
  }

  Future<Person> getProductById(String id) async {
    var doc = await Firestore.instance.document(id).get();
    notifyListeners();
    return Person.fromMap(doc.data, doc.documentID);
  }*/
}
