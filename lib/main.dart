import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todoapp_f/model/notes_model.dart';
import 'package:todoapp_f/myhomepage.dart';

void main() async{
//Hive Initialize
WidgetsFlutterBinding.ensureInitialized();
var directory = await getApplicationDocumentsDirectory();
 Hive.init(directory.path);

 //adapter register
 Hive.registerAdapter(NotesModelAdapter());
 //create "TaskNotes" file
await Hive.openBox<NotesModel>('TaskNotes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomepage(),
    );
  }
}
