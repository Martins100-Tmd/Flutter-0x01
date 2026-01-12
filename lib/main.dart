import 'package:flutter/material.dart';

void main() {
  runApp(TodoClass());
}

class TodoClass extends StatefulWidget {
  const TodoClass({super.key});

  @override
  TodoState createState() => TodoState();
}

class TodoState extends State<TodoClass> {
  List<String> todos = [];
  String text = "";
  final TextEditingController _controller = TextEditingController();
  final List<String> priorities = ['Low', 'Medium', 'High'];
  String selectedPriority = 'Low';

  void increment(String todo) {
    setState(() {
      todos.add(todo);
    });
  }

  void setText(String txt) {
    setState(() {
      text = txt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Todo App",
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white, size: 24),
          backgroundColor: Colors.black,
          title: const Text(
            "Simple Todo App",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),

        drawer: Drawer(
          backgroundColor: Colors.black,
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Todo App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                leading: Icon(Icons.home, color: Colors.white),
              ),
              ListTile(
                title: Text(
                  "Setting",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                leading: Icon(Icons.settings, color: Colors.white),
              ),
              ListTile(
                title: Text(
                  "Notification",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                leading: Icon(Icons.notification_add, color: Colors.white),
              ),
            ],
          ),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 20,
                  children: [
                    const Center(
                      child: Text(
                        "Add your todos",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: todos
                            .map(
                              (item) => Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  const Icon(
                                    Icons.cancel,
                                    size: 24,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    item,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  controller: _controller,
                  onChanged: (value) => setText(value),
                  onSubmitted: (b) => print("Hey"),
                  decoration: InputDecoration(
                    labelText: "Todo item",
                    hintText: "Add your todos here...",
                    prefixIcon: Icon(Icons.work),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: DropdownButtonFormField<String>(
                  initialValue: selectedPriority,
                  decoration: const InputDecoration(
                    labelText: 'Priority',
                    border: OutlineInputBorder(),
                  ),
                  items: priorities
                      .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedPriority = value!;
                    });
                  },
                ),
              ),

              TextButton(
                onPressed: () => {increment(text), _controller.clear()},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  maximumSize: Size(300, 50),
                  minimumSize: Size(300, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ),
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
