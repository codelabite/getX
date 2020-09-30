import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/TodoControllers.dart';
import 'package:todo/screens/TodoScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Todo App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
        ),
      ),
      body: Obx((){
          return ListView.separated(
            separatorBuilder: (_,__){
              return Divider();
            },
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(controller.todos[index].text,
                    style: (controller.todos[index].done) ?
                    TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough) :
                    TextStyle(
                      color: Colors.black
                    )


                  ),

                  onTap: (){
                    Get.to(TodoScreen());
                  },
                  leading: Checkbox(
                      value: controller.todos[index].done,
                      onChanged: (v){
                        var change = controller.todos[index];
                        change.done = v;
                        controller.todos[index] = change;
                      }),
                );
              },

              itemCount: controller.todos.length
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
          child: Icon(Icons.add, color: Colors.white,),
          onPressed: (){
              Get.to(TodoScreen());
      }),
    );
  }
}
