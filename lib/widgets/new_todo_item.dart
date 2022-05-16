import 'package:flutter/material.dart';

class NewTodoItemwidget extends StatelessWidget {
  final String title;
  final String description;

  final ValueChanged<String> OnchangedTitle;
  final ValueChanged<String> OnchangedDescription;
  final VoidCallback saved;
  // TextEditingController _title = TextEditingController();
  // TextEditingController _description = TextEditingController();
  NewTodoItemwidget(
      {this.title = '',
      this.description = '',
      required this.OnchangedTitle,
      required this.OnchangedDescription,
      required this.saved});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            maxLines: 1,
            initialValue: title,
            onChanged: OnchangedTitle,
            validator: (title) {
              if (title!.isEmpty) {
                return 'title cannot be left empty';
              }
              return null;
            },
            decoration: InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Title'),
            // controller: _title,
          ),
          TextFormField(
            maxLines: 3,
            initialValue: description,
            onChanged: OnchangedDescription,
            // validator: ,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Description',
            ),
            // controller: _description,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: SizedBox(
              // height: 100,
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: saved,
                  child: Container(
                      width: 100,
                      height: 50,
                      child: Center(
                          child: Text(
                        'Add',
                        style: TextStyle(fontSize: 30),
                      )))),
            ),
          )
        ],
      ),
    );
  }
}
