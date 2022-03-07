import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  //var berubah
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  TextEditingController etInputUser = TextEditingController();

  void _konversiSuhu() {
    setState(() {
      _inputUser = double.parse(etInputUser.text);
      _reamur = (4 / 5) * _inputUser;
      _kelvin = _inputUser + 273.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Converter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Masukkan Suhu Dalam Celcius',
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: etInputUser,
                keyboardType: TextInputType.number,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _konversiSuhu,
                  child: Text(
                    "Konversi Suhu",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 150),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: [
                            Text('Suhu dalam Kelvin'),
                            Text(
                              '$_kelvin',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('Suhu dalam Reamur'),
                            Text(
                              '$_reamur',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}