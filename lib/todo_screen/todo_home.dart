
import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/model/todo_model.dart';
import 'package:state_management_with_provider/provider/todo_provider.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final TextEditingController _textTEController = TextEditingController();

  Future<void> _showDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add todo List"),
            content: TextField(
              controller: _textTEController,
              decoration: InputDecoration(hintText: 'write to do item'),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    if (_textTEController.text.isEmpty) {
                      return;
                    }
                    context.read<ToDoProvider>().addToDoList(TODOModel(
                        title: _textTEController.text, isCompleted: false));

                    _textTEController.clear();

                    Navigator.pop(context);
                  },
                  child: Text('Submit')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDoProvider>(context); //Instance create

    return Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFF622CA7),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Center(
                child: Text(
                  "TO DO List",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
            SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 5,
                child: ListView.builder(
                    itemCount: provider.allTODOList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: MSHCheckbox(
                            size: 30,
                            colorConfig:
                                MSHColorConfig.fromCheckedUncheckedDisabled(
                                    checkedColor: Colors.blue),
                            style: MSHCheckboxStyle.stroke,
                            value: provider.allTODOList[index].isCompleted,
                            onChanged: (selected) {
                              provider.todoStatusChange(
                                  provider.allTODOList[index]);
                            }),
                        title: Text(
                          provider.allTODOList[index].title,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              decoration:
                                  provider.allTODOList[index].isCompleted ==
                                          true
                                      ? TextDecoration.lineThrough
                                      : null),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              provider
                                  .removeToDoList(provider.allTODOList[index]);
                            },
                            icon: Icon(Icons.delete)),
                      );
                    }))
          ],
        )),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: Color(0xFF622CA7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                _showDialog();
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}
