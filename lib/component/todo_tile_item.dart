import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTileItem extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function (bool?)? taskOnChanged;
  VoidCallback updateTask;
  Function (BuildContext)? deleteFunction;

  ToDoTileItem({Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.taskOnChanged,
    required this.deleteFunction,
    required this.updateTask
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            //Delete Slider & icon
            SlidableAction(
                onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ]),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.blue,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //CheckBox
              Checkbox(
                value: taskCompleted,
                onChanged: taskOnChanged,
                activeColor: Colors.black,
              ),
              const SizedBox(width: 2,),
               //Text
               Expanded(child: Text(taskName,style: TextStyle(fontSize: 18 ,decoration: taskCompleted ? TextDecoration.lineThrough :TextDecoration.none),)),
              const SizedBox(width: 5,),
              //update icon
              InkWell(
                onTap: updateTask,
                child: const Icon(Icons.edit),
              ),


              //task name

            ],
          ),
        ),
      ),
    );
  }
}
