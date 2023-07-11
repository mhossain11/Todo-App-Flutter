import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp_f/component/dialog.dart';
import 'package:todoapp_f/component/todo_tile_item.dart';
import 'package:todoapp_f/getbox/getboxdata.dart';
import 'package:todoapp_f/model/notes_model.dart';

class MyHomepage extends StatefulWidget {

   const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  var taskWriteController =TextEditingController();
  //Create new Task

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        centerTitle: true,
      ),
      
      //floating button
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          createNewTask();
        },
        child: const Icon(Icons.add),
      ),

      body: ValueListenableBuilder<Box<NotesModel>>(
        valueListenable: GetBoxData.getData().listenable(),
        builder: (context,box,_){
          var data = box.values.toList().cast<NotesModel>();
          return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index){
                return  ToDoTileItem(
                  taskName: data[index].title.toString(),
                  taskCompleted: data[index].task,
                  taskOnChanged: (value){
                    setState(() {
                      data[index].task=!data[index].task;
                    });
                  },
                    deleteFunction: (context) => deleteTask(data[index]),
                   updateTask:() {
                     updateTask(data[index], data[index].title.toString());
                   }
                );
              }
          );
        },

      ),

    );
  }

  //add
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return Dialogs(
          TaskwriteController: taskWriteController,
          onSave: (){
            //validate null
           if(taskWriteController.text.isEmpty){
             return Navigator.pop(context);
           }else{
             var data = NotesModel(task:false,
                 title:taskWriteController.text.toString());
            //directory get
             final box= GetBoxData.getData();
             box.add(data);
             //HiveObject (for Id)
             data.save();
             taskWriteController.clear();
             Navigator.pop(context);
           }
          },
          onCancel: ()=> Navigator.pop(context), name: 'Save',
      );
    });
  }

  //delete
  deleteTask(NotesModel notesModel)async {
    await notesModel.delete();
  }
// Update
  updateTask(NotesModel notesModel, String title) {
    taskWriteController.text = title;
   showDialog(context: context, builder: (context){
      return Dialogs(
        TaskwriteController: taskWriteController,
        onSave: (){
          //validate null
          if(taskWriteController.text.isEmpty){
            Navigator.pop(context);

          }else{
            notesModel.title=taskWriteController.text.toString();
            notesModel.save();

            taskWriteController.clear();

            Navigator.pop(context);
          }
        },
        onCancel: ()=> Navigator.pop(context), name: 'Update',
      );
    });



  }
}



