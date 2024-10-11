import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lab3/entity.dart';
import 'package:lab3/iterator.dart';
import 'package:lab3/user.dart';

import 'iterable.dart';

void main() {
  runApp(const MyApp());
  initEmployee();
  comparableExample();
  iterableExample();
  iteratorExample();
  serializationExample();
  asyncExample();
  futureExample();

  var subscription = getSingleStreamData().listen((data) => print(data));
  subscription.onDone(() => print('Done!'));

  var broadcastStreamController = StreamController.broadcast();
  broadcastStreamController.stream.listen((event) {
    print('first subscription: $event');
  });
  broadcastStreamController.stream.listen((event) {
    print('second subscription: ${event + event}');
  });
  broadcastStreamController.sink.add(1);
  broadcastStreamController.sink.add(100);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

void initEmployee() {
  Employee Denis = Employee("Denis", "Innowise Group", 19);
  Denis.showName();
  Denis.placeOfWork();
}

void comparableExample() {
  print("\n");
  Employee Denis = Employee("Denis", "Innowise Group", 19);
  Employee Roman = Employee("Roman", "Innowise Group", 20);
  print(Denis.compareTo(Roman));
  print(Roman.compareTo(Denis));
}

void iterableExample() {
  print("\n");
  Employee Denis = Employee("Denis", "Innowise Group", 19);
  Employee Roman = Employee("Roman", "Innowise Group", 20);
  Employee Pasha = Employee("Pasha", "Bitcoin Corp.", 19);

  var employees = [Denis, Roman, Pasha];

  var officeWorker = OfficeWorker(employees);
  var firstTwoEmployees = officeWorker.take(3);
  print(officeWorker.iterator);
  for (var employee in firstTwoEmployees) {
    print(employee.name);
  }
}

void iteratorExample() {
  print("\n");
  Employee Denis = Employee("Denis", "Innowise Group", 19);
  Employee Roman = Employee("Roman", "Innowise Group", 20);
  Employee Pasha = Employee("Pasha", "Bitcoin Corp.", 19);

  var employees = [Denis, Roman, Pasha];

  var schoolWorker = SchoolWorker(employees);

  while (schoolWorker.moveNext()) {
    print(schoolWorker.current.name);
  }
}

void serializationExample() {
  print("\n");
  User Denis = User("Denis", 19);
  var json = Denis.toJSON();
  print(json);
  var userFromJson = Denis.fromJSON(json);
  print(userFromJson.name + " " + userFromJson.age.toString());
}

Future<void> doWork() async {
  print("Start doWork");
  String message = await getAsyncMessage();
  print("Got message: $message");
  print("End doWork");
}

Future<String> getAsyncMessage() {
  // имитация долгой работы с помощью задержки в 3 секунды
  return Future.delayed(Duration(seconds: 3), () => "Hello Dart");
}

void asyncExample() {
  print("\n");
  doWork();
  print("Call after doWork function");
}

Future getMessage() {
  // для эмуляции длительной операции делаем задержку в 3 секунды
  return Future.delayed(
      Duration(seconds: 3), () => print("You got the message from me"));
}

void futureExample() {
  print("\n");
  getMessage();
  print("I call this print after getMessage func");
}

Stream<int> getSingleStreamData() {
  final controller = StreamController<int>();
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.close();
  return controller.stream;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
