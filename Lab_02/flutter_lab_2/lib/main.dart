import 'package:flutter/material.dart';
import 'package:flutter_lab_2/workers.dart';

void main() {
  runApp(const MyApp());

  initWorkers();
  initCollections();
  initError();
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

void initWorkers() {
  OfficeWorker Tom = OfficeWorker("Tom", 100);
  Tom.printName();
  Tom.printSalary();

  CircusWorker Bob = CircusWorker("Bob", 1000);
  Bob.printName();
  Bob.printSalary();

  DriverWorker Vlad = DriverWorker.NamedConstructor("Vlad", "Renault");
  Vlad.ScreamWord("BANANAAAAA");
  Vlad.DriverName((value) => print(value));
  Vlad.FillTank();
  Vlad.FillTank(100);
}

void initCollections() {
  OfficeWorker Tom = OfficeWorker("Tom", 100);
  OfficeWorker Jerry = OfficeWorker("Jerry", 200);
  OfficeWorker Spike = OfficeWorker("Spike", 300);

  List<OfficeWorker> listOfficeWorkers = [Tom, Spike, Jerry];
  listOfficeWorkers.add(Jerry);
  print(listOfficeWorkers);

  Set<OfficeWorker> setOfficeWorkers = {Jerry, Spike, Tom};
  setOfficeWorkers.add(Jerry);
  print(setOfficeWorkers);

  Map<int, OfficeWorker> mapOfficeWorkers = {100: Tom, 200: Jerry, 300: Spike};
  mapOfficeWorkers.forEach((key, value) {
    print(mapOfficeWorkers[key]!.name);
  });
  print("---------------------");
  for (int i = 100; i <= 300; i += 100) {
    if (i == 200) {
      continue;
    }
    if (i == 300) {
      break;
    }
    print(mapOfficeWorkers[i]?.name);
  }
}

void initError() {
  try {
    for (int i = 1; i < 10; i++) {
      if (i == 5) {
        throw ErrorDescription("I am error");
      }
    }
  } catch (error) {
    print(error);
  }
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
              'You have pushed the button this many times: ',
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
