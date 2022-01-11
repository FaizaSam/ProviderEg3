import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_eg/pages/new_customer.dart';
import 'package:provider_eg/providers/customers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<CustomerList>(
        builder: (_) => CustomerList(customers: [
          Customer(name: "Faiza ", age: 30),
        ]),
        child: const MyHomePage(
          title: 'Provider State Management',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final customerList = Provider.of<CustomerList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: customerList.getCustomers().length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${customerList.getCustomers()[index].name}'),
              subtitle: Text('${customerList.getCustomers()[index].age}'),
              trailing: SizedBox(
                width: 50,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        customerList.removeCustomer(index);
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewCustomer(
                      customerList: customerList,
                    )),
          );
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
