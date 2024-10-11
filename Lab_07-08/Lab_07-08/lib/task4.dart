import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Task4 extends StatefulWidget {
  const Task4({Key? key}) : super(key: key);

  @override
  _Task4State createState() => _Task4State();
}

class _Task4State extends State<Task4> {
  String _content = '';
  String _selectedDirectory = '';
  TextEditingController _textEditingController = TextEditingController();

  //Directory externalStorageDir = await getExternalStorageDirectory();

  Future<File> _getFile(String directory) async {
    Directory appDirectory;
    if (Platform.isIOS) {
      switch (directory) {
        case 'TemporaryDirectory':
          appDirectory = await getTemporaryDirectory();
          break;
        case 'ApplicationDocumentsDirectory':
          appDirectory = await getApplicationDocumentsDirectory();
          break;
        case 'Application Support':
          appDirectory = await getApplicationSupportDirectory();
          break;
        case 'LibraryDirectory':
          appDirectory = await getLibraryDirectory();
          break;
        default:
          throw Exception('This directory not exists on current platform!');
      }
    } else if (Platform.isAndroid) {
      switch (directory) {
        case 'TemporaryDirectory':
          appDirectory = await getTemporaryDirectory();
          break;
        case 'ApplicationDocumentsDirectory':
          appDirectory = await getApplicationDocumentsDirectory();
          break;
        case 'ApplicationSupportDirectory':
          appDirectory = await getApplicationSupportDirectory();
          break;
        case 'ExternalStorageDirectory':
          appDirectory = await getApplicationSupportDirectory();
          break;
        case 'ExternalCacheDirectories':
          appDirectory = await getApplicationSupportDirectory();
          break;

        default:
          throw Exception('\nThis directory not exists on current platform!');
      }
    } else {
      throw Exception('Unsupported platform');
    }

    return File('${appDirectory.path}/example.txt');
  }

  Future<String> _readFile(String directory) async {
    try {
      final file = await _getFile(directory);
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return '$e';
    }
  }

  Future<void> _writeFile(String directory, String content) async {
    try {
      final file = await _getFile(directory);
      await file.writeAsString(content);
      //setState(() {
      // _content = content;
      //});
    } catch (e) {
      setState(() {
        _content = '$e';
      });
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 222, 220, 228),
          title: Text('Задание 4'),
          centerTitle: true,
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedDirectory = 'TemporaryDirectory';
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(350, 50)),
              child: Text(
                'Temporary',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedDirectory = 'ApplicationDocumentsDirectory';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(350, 50),
                ),
                child: Text(
                  'Documents',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedDirectory = 'ApplicationSupportDirectory';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(350, 50),
                ),
                child: Text(
                  'ApplicationSupportDirectory',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedDirectory = 'LibraryDirectory';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(350, 50),
              ),
              child: Text(
                'Library',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedDirectory = 'ExternalStorageDirectory';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(350, 50),
                ),
                child: Text(
                  'ExternalStorageDirectory',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedDirectory = 'ExternalCacheDirectories';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(350, 50),
                ),
                child: Text(
                  'ExternalCacheDirectories',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text('Директория: $_selectedDirectory',
              style: TextStyle(
                fontSize: 15, // Размер шрифта
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Вводимая информация',
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final content = await _readFile(_selectedDirectory);
                  setState(() {
                    _content = content;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Read File',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final text = _textEditingController.text;
                  if (text.isNotEmpty) {
                    await _writeFile(_selectedDirectory, text);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Write File', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text('Содержимое файла:'),
          SizedBox(height: 8),
          Text('$_content'),
          SizedBox(height: 16),
        ])));
  }
}
