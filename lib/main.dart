import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(SuhuConverterApp());
}

class SuhuConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature Conversion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SuhuConverter(),
    );
  }
}

class SuhuConverter extends StatefulWidget {
  @override
  _SuhuConverterState createState() => _SuhuConverterState();
}

class _SuhuConverterState extends State<SuhuConverter> {
  double inputSuhu = 0.0;
  String selectedUnit = 'Celcius';
  List<String> units = ['Celcius', 'Fahrenheit', 'Reamur', 'Kelvin'];

  List<String> results = [];

  void _convertTemperature() {
    setState(() {
      results.clear();
      for (String unit in units) {
        if (unit != selectedUnit) {
          double convertedValue = _convertSuhu(selectedUnit, unit, inputSuhu);
          results.add('$unit'.padRight(10) + ' : ${convertedValue.toStringAsFixed(2)}');
        }
      }
    });
  }

  double _convertSuhu(String from, String to, double value) {
    if (value == 0) return 0;
    if (from == 'Celcius') {
      if (to == 'Fahrenheit') {
        return (value * 9 / 5) + 32;
      } else if (to == 'Reamur') {
        return value * 4 / 5;
      } else if (to == 'Kelvin') {
        return value + 273.15;
      }
    } else if (from == 'Fahrenheit') {
      if (to == 'Celcius') {
        return (value - 32) * 5 / 9;
      } else if (to == 'Reamur') {
        return (value - 32) * 4 / 9;
      } else if (to == 'Kelvin') {
        return (value - 32) * 5 / 9 + 273.15;
      }
    } else if (from == 'Reamur') {
      if (to == 'Celcius') {
        return value * 5 / 4;
      } else if (to == 'Fahrenheit') {
        return value * 9 / 4 + 32;
      } else if (to == 'Kelvin') {
        return value * 5 / 4 + 273.15;
      }
    } else if (from == 'Kelvin') {
      if (to == 'Celcius') {
        return value - 273.15;
      } else if (to == 'Fahrenheit') {
        return (value - 273.15) * 9 / 5 + 32;
      } else if (to == 'Reamur') {
        return (value - 273.15) * 4 / 5;
      }
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Temperature Converter')),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 0), // Padding atas ditambahkan di sini
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Input Temperature 🫷🤘🫸',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                    onChanged: (String value) {
                      setState(() {
                        inputSuhu = double.tryParse(value) ?? 0.0;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Temperature (example: 1)',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: DropdownButton<String>(
                    value: selectedUnit,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedUnit = newValue!;
                      });
                    },
                    items: units.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _convertTemperature();
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Divider(height: 20, color: Colors.grey),
            Text(
              'Conversion Results',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            results[index],
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(SuhuConverterApp());
// }

// class SuhuConverterApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Temperature Conversison',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: SuhuConverter(),
//     );
//   }
// }

// class SuhuConverter extends StatefulWidget {
//   @override
//   _SuhuConverterState createState() => _SuhuConverterState();
// }

// class _SuhuConverterState extends State<SuhuConverter> {
//   double inputSuhu = 0.0;
//   String selectedUnit = 'Celcius';
//   List<String> units = ['Celcius', 'Fahrenheit', 'Reamur', 'Kelvin'];

//   double convertSuhu(String from, String to, double value) {
//      if (value == 0) return 0;
//     if (from == 'Celcius') {
//       if (to == 'Fahrenheit') {
//         return (value * 9 / 5) + 32;
//       } else if (to == 'Reamur') {
//         return value * 4 / 5;
//       } else if (to == 'Kelvin') {
//         return value + 273.15;
//       }
//     } else if (from == 'Fahrenheit') {
//       if (to == 'Celcius') {
//         return (value - 32) * 5 / 9;
//       } else if (to == 'Reamur') {
//         return (value - 32) * 4 / 9;
//       } else if (to == 'Kelvin') {
//         return (value - 32) * 5 / 9 + 273.15;
//       }
//     } else if (from == 'Reamur') {
//       if (to == 'Celcius') {
//         return value * 5 / 4;
//       } else if (to == 'Fahrenheit') {
//         return value * 9 / 4 + 32;
//       } else if (to == 'Kelvin') {
//         return value * 5 / 4 + 273.15;
//       }
//     } else if (from == 'Kelvin') {
//       if (to == 'Celcius') {
//         return value - 273.15;
//       } else if (to == 'Fahrenheit') {
//         return (value - 273.15) * 9 / 5 + 32;
//       } else if (to == 'Reamur') {
//         return (value - 273.15) * 4 / 5;
//       }
//     }
//     return value;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Convertion')),
//       ),
//       body: SingleChildScrollView(
//          padding: EdgeInsets.only(top: 150.0),
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Input Temperature 🫷🤘🫸',
//                 style: TextStyle(fontSize: 24),
//               ),
//               SizedBox(height: 30),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: TextField(
//                       keyboardType: TextInputType.numberWithOptions(decimal: true),
//                       inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
//                       onChanged: (String value) {
//                         setState(() {
//                           inputSuhu = double.tryParse(value) ?? 0.0;
//                         });
//                       },
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Temperature(example : 1)',
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 20),
//                   Expanded(
//                     flex: 1,
//                     child: DropdownButton<String>(
//                       value: selectedUnit,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedUnit = newValue!;
//                         });
//                       },
//                       items: units.map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {});
//                 },
//                 child: Text('Conversion'),
//               ),
//               SizedBox(height: 20),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: units
//                     .map(
//                       (unit) => unit != selectedUnit
//                           ? Text(
//                               '$unit: ${convertSuhu(selectedUnit, unit, inputSuhu).toStringAsFixed(2)}',
//                               style: TextStyle(fontSize: 20),
//                             )
//                           : SizedBox.shrink(),
//                     )
//                     .toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }