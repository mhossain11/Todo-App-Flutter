
import 'package:hive/hive.dart';
part 'notes_model.g.dart';
// Terminal-- flutter packages pub run build_runner build
@HiveType(typeId: 0)  //typeId: every model id
class NotesModel extends HiveObject{
  @HiveField(0)
  bool task;
  @HiveField(1)
  String title;



  NotesModel({required this.task,required this.title});
}