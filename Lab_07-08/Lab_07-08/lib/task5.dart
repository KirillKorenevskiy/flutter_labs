import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Salary extends HiveObject {
  @HiveField(0)
  String specialty;

  @HiveField(1)
  String salary;

  Salary({required this.specialty, required this.salary});
}

class SalaryAdapter extends TypeAdapter<Salary> {
  @override
  final int typeId = 0;

  @override
  Salary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Salary(
      specialty: fields[0] as String,
      salary: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Salary obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.specialty)
      ..writeByte(1)
      ..write(obj.salary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class Boxes {
  static Box<Salary> getData() => Hive.box<Salary>('salary');
}

class Task5 extends StatefulWidget {
  const Task5({Key? key}) : super(key: key);

  @override
  _Task5State createState() => _Task5State();
}

class _Task5State extends State<Task5> {
  final specialtyController = TextEditingController();
  final salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 222, 220, 228),
        title: Text('Задание 5'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<Salary>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<Salary>();
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ListView.builder(
              itemCount: box.length,
              reverse: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Специальность: ${data[index].specialty}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Зарплата: ${data[index].salary}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _editDialog(
                                      data[index],
                                      data[index].specialty.toString(),
                                      data[index].salary.toString());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  child:
                                      Icon(Icons.edit, color: Colors.blue[300]),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    delete(data[index]);
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Icon(Icons.delete,
                                        color: Colors.blue[300]),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 222, 220, 228),
        height: 65,
        child: Container(
          width: double.infinity, // Задаем ширину кнопки равной ширине экрана
          child: ElevatedButton(
            onPressed: () async {
              _showMyDialog(); // Ваш метод для показа диалога
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Фон кнопки
              foregroundColor: Colors.white, // Цвет текста
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Задаем радиус закругления
              ),
            ),
            child: Text('Добавить специальность'),
          ),
        ),
      ),
    );
  }

  void delete(Salary dairy) async {
    await dairy.delete();
  }

  Future<void> _editDialog(Salary dairy, String specialty, String salary) async {
    specialtyController.text = specialty;
    salaryController.text = salary;

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.blue,
            title: Text(
              'Изменить специальность',
              style: TextStyle(color: Colors.white),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: specialtyController,
                  decoration: const InputDecoration(
                    labelText: 'Специальность',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    fillColor: Colors.blue,
                    filled: true,
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: salaryController,
                  decoration: const InputDecoration(
                    labelText: 'Зарплата',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    fillColor: Colors.blue,
                    filled: true,
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Закрыть',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () async {
                    dairy.specialty = specialtyController.text.toString();
                    dairy.salary = salaryController.text.toString();

                    dairy.save();
                    specialtyController.clear();
                    salaryController.clear();

                    Navigator.pop(context);
                  },
                  child: Text(
                    'Изменить',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          );
        });
  }

  Future<void> _showMyDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.blue,
            title: Text(
              'Добавить специальность',
              style: TextStyle(color: Colors.white),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: specialtyController,
                  decoration: const InputDecoration(
                    labelText: 'Специальность',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    fillColor: Colors.blue,
                    filled: true,
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: salaryController,
                  decoration: const InputDecoration(
                    labelText: 'Зарплата',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    fillColor: Colors.blue,
                    filled: true,
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Закрыть',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    final data = Salary(
                        specialty: specialtyController.text,
                        salary: salaryController.text);

                    final box = Boxes.getData();
                    box.add(data);

                    // data.save() ;

                    specialtyController.clear();
                    salaryController.clear();

                    // box.

                    Navigator.pop(context);
                  },
                  child: Text(
                    'Добавить',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          );
        });
  }
}
