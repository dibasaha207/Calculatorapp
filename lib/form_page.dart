import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController firstnumcontroller = TextEditingController();

  TextEditingController secondnumcontroller = TextEditingController();
  int sum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Input")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$sum",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: firstnumcontroller,
                decoration: InputDecoration(
                    labelText: "Enter a number",
                    hintText: "eg. 7",
                    border: OutlineInputBorder()),
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  RegExp regex = RegExp(r'\d$');
                  if (!regex.hasMatch(value!)) {
                    return "Only numbers are allowed";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: secondnumcontroller,
                decoration: InputDecoration(
                    labelText: "Enter another number",
                    hintText: "eg. 8",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    int num1 = int.parse(firstnumcontroller.text);
                    int num2 = int.parse(secondnumcontroller.text);
                    setState(() {
                      sum = num1 + num2;
                    });
                  },
                  child: Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
}
