import 'package:flutter/material.dart';

import 'my_button.dart';

class Dialogs extends StatelessWidget {
  String name;
  final TaskwriteController;
  VoidCallback onSave;
  VoidCallback onCancel;

  Dialogs({Key? key,required this.name, required this.TaskwriteController, required this.onSave,
    required this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[50],
      content: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            TextFormField(
              controller: TaskwriteController,
              maxLength: 100,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter new task ",
                  hintStyle: TextStyle(color: Colors.blueGrey)
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                MyButton(text: "Cancel", onPressed: onCancel),
                const SizedBox(width: 8,),
                MyButton(text: name, onPressed: onSave),





              ],
            )

          ],
        ),
      ),
    );
  }
}
