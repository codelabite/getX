import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/TodoControllers.dart';
import 'package:todo/models/Todo.dart';

class TodoScreen extends StatelessWidget {
  final int index;

  TodoScreen({this.index});

  final TodoController controllerTodo = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    String text = '';
    if( !this.index.isNull){
      text = controllerTodo.todos[index].text;
    }
    TextEditingController textEditingController = TextEditingController(text: text);
    return Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(
                    child: TextField(
                      controller: textEditingController,
                      autofocus: true,
                      decoration: InputDecoration(

                        hintText: 'What do you want to do',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none
                      ),
                      style: TextStyle(
                        fontSize: 25
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 999,
                    )),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      color: Colors.red,
                        textColor: Colors.white,
                        child: Text((this.index.isNull) ? "Cancel" : "Editing",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        onPressed: (){
                          Get.back();
                    }),

                    SizedBox(width: 20,),

                    RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text((this.index.isNull) ? "Add" : "Editing",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        onPressed: (){

                         controllerTodo.todos.add(
                           Todo(text: textEditingController.text,
                           done: false)
                         );

                         Get.back();

                        }),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}
