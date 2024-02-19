import 'package:flutter/material.dart';

void main() {
  runApp(SuhuConverterApp());
}

class SuhuConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suhu Converter',
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

  double convertSuhu(String from, String to, double value) {
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
        title: Text('Converter Suhu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Masukkan Suhu 🫷🤘🫸',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        inputSuhu = double.tryParse(value) ?? 0.0;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Suhu (contoh : 1)',
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 1,
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
                setState(() {});
              },
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: units
                  .map(
                    (unit) => unit != selectedUnit
                        ? Text(
                            '$unit: ${convertSuhu(selectedUnit, unit, inputSuhu).toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 20),
                          )
                        : SizedBox.shrink(),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// void main() {
//   runApp(SuhuConverterApp());
// }

// class SuhuConverterApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Suhu Converter',
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
//         title: Text('Suhu Converter'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Masukkan Suhu',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   width: 200,
//                   child: TextField(
//                     keyboardType: TextInputType.number,
//                     onChanged: (value) {
//                       setState(() {
//                         inputSuhu = double.tryParse(value) ?? 0.0;
//                       });
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Suhu',
//                     ),
//                   ),
//                 ),
//                 DropdownButton<String>(
//                   value: selectedUnit,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       selectedUnit = newValue!;
//                     });
//                   },
//                   items: <String>['Celcius', 'Fahrenheit', 'Reamur', 'Kelvin']
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 )
//               ],
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {});
//               },
//               child: Text('Konversi'),
//             ),
//             SizedBox(height: 20),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: units.map((unit) {
//                 if (unit != selectedUnit) {
//                   return Text(
//                     '$unit: ${convertSuhu(selectedUnit, unit, inputSuhu).toStringAsFixed(2)}',
//                     style: TextStyle(fontSize: 20),
//                   );
//                 } else {
//                   return SizedBox.shrink();
//                 }
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
