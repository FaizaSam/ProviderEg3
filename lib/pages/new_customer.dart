import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../providers/customers.dart';

class NewCustomer extends StatefulWidget {
  final customerList; // stores object of listener passed from calling class
  const NewCustomer({Key key, this.customerList}) : super(key: key);

  @override
  _NewCustomerState createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  String _name;
  String _age;

  final _nameController = TextEditingController(text: '');
  final _ageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Customer"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Form(
              key: _formStateKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: TextFormField(
                      onSaved: (value) {
                        _name = value;
                      },
                      controller: _nameController,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: 2,
                          style: BorderStyle.solid,
                        )),
                        labelText: "Customer Name",
                        icon: const Icon(Icons.account_box, color: Colors.green),
                        fillColor: Colors.white,
                        labelStyle: const TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: TextFormField(
                      onSaved: (value) {
                        _age = value;
                      },
                      keyboardType: TextInputType.phone,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: _ageController,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                                style: BorderStyle.solid)),
                        labelText: "Age",
                        icon: const Icon(
                          Icons.phone_android,
                          color: Colors.green,
                        ),
                        fillColor: Colors.white,
                        labelStyle: const TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  child: const Text(
                    ('SAVE'),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _formStateKey.currentState.save();
                    // widget : is used to access property of parent stateful class
                    widget.customerList.addCustomer(
                        Customer(name: _name, age: int.parse(_age)));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
