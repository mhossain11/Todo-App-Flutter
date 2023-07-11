
import 'package:hive/hive.dart';
import 'package:todoapp_f/model/notes_model.dart';

class GetBoxData{
  static Box<NotesModel> getData() {
   return Hive.box<NotesModel>('TaskNotes');
  }
}