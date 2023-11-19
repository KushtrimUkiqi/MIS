import 'package:flutter/material.dart';

class Subject {
  String name;

  Subject(this.name);
}


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Page(title: '191291'),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key, required this.title});


  final String title;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  List<Subject> subjects = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('191291'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addSubject(context);
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding:const EdgeInsets.only(top:10,left:7, right: 7),
        child: ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.indigo, // Set the background color
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: ListTile(
                textColor: Colors.white,
                title: Text(subjects[index].name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      color: Colors.white,
                      onPressed: () {
                        _editSubject(context, index);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.white,
                      onPressed: () {
                        _deleteSubject(index);
                      },
                    ),
                  ],
                ),
              )
            );
            },
    ),
      ));
  }


  void _addSubject(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String subjectName = '';

        return AlertDialog(
          title: const Text('Додај предмет'),
          content: TextField(
            onChanged: (value) {
              subjectName = value;
            },
            decoration: const InputDecoration(labelText: 'Име на предмет'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Откажи'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  subjects.add(Subject(subjectName));
                });
                Navigator.of(context).pop();
              },
              child: const Text('Додај'),
            ),
          ],
        );
      },
    );
  }

  void _editSubject(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newSubjectName = subjects[index].name;

        return AlertDialog(
          title: const Text('Промени предмет'),
          content: TextField(
            onChanged: (value) {
              newSubjectName = value;
            },
            decoration: const InputDecoration(labelText: 'Име на предмет'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Откажи"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  subjects[index].name = newSubjectName;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Зачувај промена'),
            ),
          ],
        );
      },
    );
  }

  void _deleteSubject(int index) {
    setState(() {
      subjects.removeAt(index);
    });
  }
}
