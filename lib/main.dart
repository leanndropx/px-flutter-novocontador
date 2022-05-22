import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
      print(count);
    });
  }

  void increment() {
    setState(() {
      count++;
      print(count);
    });
  }

  bool get isempty => count == 0;

  bool get isfull => count >= 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/fundo.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isfull ? 'Lotou ' : 'Pode entrar',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: isfull ? Colors.red : Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '$count',
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 100),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isempty ? null : decrement,
                  style: TextButton.styleFrom(
                      backgroundColor: isempty
                          ? Colors.grey
                          : Colors.deepOrange.withAlpha(220),
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  child: Text(
                    'Saiu',
                    style: TextStyle(
                        fontSize: 16,
                        color: isempty
                            ? Colors.black45
                            : Colors.white.withAlpha(220)),
                  ),
                ),
                const SizedBox(width: 32),
                TextButton(
                  onPressed: isfull ? null : increment,
                  style: TextButton.styleFrom(
                      backgroundColor: isfull
                          ? Colors.grey
                          : Colors.deepPurple.withAlpha(220),
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  child: Text(
                    'Entrou',
                    style: TextStyle(
                        fontSize: 16,
                        color: isfull ? Colors.black45 : Colors.white.withAlpha(220)
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
