import 'package:flutter/material.dart';

void main() {
  runApp(toDoList());
}

class toDoList extends StatelessWidget {
 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home:  ToDo(),
    );
  }
}

class ToDo extends StatefulWidget {
 

  @override
 MyView createState() => MyView();
}

class MyView extends State<ToDo> {
 TextEditingController _controller = TextEditingController();

 List<String> _todos = [];

 void _AddToList() {
  setState(() {
    if (_controller.text.isNotEmpty) {
      _todos.add(_controller.text);
      _controller.clear();
    }

  });
 }

 void DeleteItem(int index) {
  setState(() {
    _todos.removeAt(index);
  });
 }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        backgroundColor: const Color.fromARGB(255, 5, 61, 7) ,
      ),
      body: Column(
       children: <Widget> [
        Padding( 
          padding: const EdgeInsets.all(16.0),
          child:TextField(
                controller: _controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Enter a task",
                  border: OutlineInputBorder()
                ),
              )
          ),
          Expanded(child: ListView.builder(
            itemCount: _todos.length ,
            itemBuilder: (context, index) {
              return ListTile(title: Text(_todos[index],),
              onLongPress: () => DeleteItem(index),
              
              );

            }
          )
          )
       ],
        
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _AddToList,
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,

      
      ),
    );
  }
}
