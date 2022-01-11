import 'package:flutter/cupertino.dart';

class CustomerList with ChangeNotifier {
  List<Customer> customers = [];
  CustomerList({this.customers});

  getCustomers() => customers;
  void addCustomer(Customer customer) {
    customers.add(customer);
    notifyListeners();
  }

  void removeCustomer(int index) {
    customers.removeAt(index);
    notifyListeners();
  }
}

class Customer {
  String name;
  int age;
  Customer({this.name, this.age});
}
