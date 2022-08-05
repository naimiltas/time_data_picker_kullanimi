import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

    var tfTarih = TextEditingController();
    var tfSaat = TextEditingController();

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
           TextField(
            controller: tfSaat,
            decoration: InputDecoration(
              hintText: "Saat giriniz",
            ),
            onTap: (){
              showTimePicker(
                context: context,
                initialTime:TimeOfDay.fromDateTime(DateTime.now()),
              ) .then((alinanSaat) {
                 setState(() {
                   tfSaat.text = "${alinanSaat!.hour}:${alinanSaat.minute}";
                 });
              });
            },
           ),
           TextField(
            controller: tfTarih,
            decoration: InputDecoration(
              hintText: "Tarih giriniz",
            ),
            onTap: (){
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime(2050),
              ) .then((alinanTarih) {
                 setState(() {
                   tfSaat.text = "${alinanTarih!.day}/${alinanTarih.month}/${alinanTarih.year}";
                 });
              });
            },
           ),
          ],
        ),
      ),
    );
  }
}
