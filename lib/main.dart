import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator by Kristel Mae Lim',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 140, 215, 143)),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int firstNumber = 0,
      secondNumber = 0,
      sum = 0,
      difference = 0,
      product = 0,
      quotient = 0;

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller1.text = '0';
    _controller2.text = '0';
  }

  void clearInputs() {
    setState(() {
      _controller1.clear();
      _controller2.clear();
      sum = 0;
      difference = 0;
      product = 0;
      quotient = 0;
    });
  }

  Widget _resultRow(
      String label, int value, IconData icon, VoidCallback onPressed) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label: $value',
            style: const TextStyle(fontSize: 20),
          ),
          IconButton(
            icon: Icon(icon),
            iconSize: 28,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator by Kristel Mae Lim"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "First Number",
                    ),
                    keyboardType: TextInputType.number,
                    controller: _controller1,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Second Number",
                    ),
                    keyboardType: TextInputType.number,
                    controller: _controller2,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _resultRow('Sum', sum, Icons.add, () {
              setState(() {
                sum =
                    int.parse(_controller1.text) + int.parse(_controller2.text);
              });
            }),
            _resultRow('Difference', difference, Icons.remove, () {
              setState(() {
                difference =
                    int.parse(_controller1.text) - int.parse(_controller2.text);
              });
            }),
            _resultRow('Product', product, Icons.close, () {
              setState(() {
                product =
                    int.parse(_controller1.text) * int.parse(_controller2.text);
              });
            }),
            _resultRow('Quotient', quotient, Icons.horizontal_split, () {
              setState(() {
                if (int.parse(_controller2.text) != 0) {
                  quotient = int.parse(_controller1.text) ~/
                      int.parse(_controller2.text);
                } else {
                  quotient = 0;
                }
              });
            }),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: clearInputs,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Clear Inputs',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
