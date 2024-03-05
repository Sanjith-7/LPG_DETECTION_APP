// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hacktrix/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final fcmtoken = await FirebaseMessaging.instance.getToken();
  print(fcmtoken);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

List<List<double>> listOfLists = [
  [
    0.0,
    20.0,
    50.0,
    70.0,
    120.0,
    140.0,
    200.0,
    180.0,
    120.0,
    60.0,
    23.0,
    4.0,
    0.0
  ],
];

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  final player = AudioPlayer();

  Future<void> playAudioFromUrl(String url) async {
    await player.play(UrlSource(url));
  }

  Future<void> getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Emergency"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Color.fromARGB(255, 243, 79, 46),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            // Wrap the Column with SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto', // Example of an eye-catching font
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Search for something',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto', // Example of an eye-catching font
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 70.0,
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 249, 249, 249),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 150,
                                  child: ListView(
                                    children: [
                                      ListTile(
                                        onTap: () async {
                                          await FlutterPhoneDirectCaller
                                              .callNumber('123456');
                                        },
                                        title: Text(
                                          "Call Ambulance",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        leading: Icon(Icons.local_hospital,
                                            color: Colors.redAccent),
                                        trailing: Icon(Icons.call,
                                            color: Colors.blueAccent),
                                      ),
                                      ListTile(
                                        onTap: () async {
                                          await FlutterPhoneDirectCaller
                                              .callNumber('6789');
                                        },
                                        title: Text("Call Firestation",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400)),
                                        leading: Icon(Icons.fire_truck,
                                            color: Colors.redAccent),
                                        trailing: Icon(Icons.call,
                                            color: Colors.blueAccent),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 254, 209, 205),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_hospital,
                                size: 50.0,
                                color: Color.fromARGB(255, 247, 47, 47),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Emergency\nNumber',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 246, 77, 77),
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Camera()),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFdbe9ff),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera,
                                size: 50.0,
                                color: Color.fromARGB(255, 89, 149, 247),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Camera',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 86, 128, 195),
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GraphLevel()),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 188, 242, 189),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.graphic_eq,
                                size: 50.0,
                                color: Color.fromARGB(255, 33, 178, 55),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Graph Level',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 60, 184, 32),
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => History()),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFecddff),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.history,
                                size: 50.0,
                                color: Color.fromARGB(255, 138, 61, 238),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'History',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 138, 75, 220),
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation item tap
        },
      ),
      floatingActionButton: GestureDetector(
        onLongPress: () {
          player.stop();
        },
        child: Container(
          width: 80.0,
          height: 80.0,
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 245, 21, 5),
            elevation: 0,
            onPressed: () async {
              playAudioFromUrl(
                  'https://firebasestorage.googleapis.com/v0/b/web-ai-3a88c.appspot.com/o/buzzer.mp3?alt=media&token=b01d9587-f55d-4280-b0b3-063e53b8d4e7');
              await Geolocator.checkPermission();
              await Geolocator.requestPermission();
              Position position = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high);
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('Message Sent'),
                        content: Text(
                            'Your location has been sent to ambulance and firestation\n' +
                                position.toString()),
                      ));
              String message = "Emergency - Please come to this location\n" +
                  position.toString();
              List<String> recipients = ["7569292568"];

              try {
                String _result = await sendSMS(
                    message: message, recipients: recipients, sendDirect: true);
                print("SMS Result: $_result");
              } catch (e) {
                print("Error sending SMS: $e");
              }
              print(listOfLists);
            },
            child: Text(
              'SOS',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Camera extends StatelessWidget {
  const Camera({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Camera"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Color.fromARGB(255, 59, 130, 244),
      ),
    );
  }
}

class GraphLevel extends StatefulWidget {
  const GraphLevel({Key? key}) : super(key: key);

  @override
  _GraphLevelState createState() => _GraphLevelState();
}

class _GraphLevelState extends State<GraphLevel> {
  List<double>? data; // Make data nullable

  @override
  void initState() {
    super.initState();
    loadGraphData();
  }

  Future<void> loadGraphData() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate data loading delay

    setState(() {
      data = generateRandomArray(13);
    });
  }

  List<double> generateRandomArray(int length) {
    final random = Random();
    final values =
        List.generate(length - 1, (index) => random.nextDouble() * 200);

    // Sort the entire list in increasing order
    values.sort();

    // Reverse the second half of the list to make it decreasing
    values.replaceRange(
        length ~/ 2, length - 1, values.sublist(length ~/ 2).reversed.toList());

    // Set the last element to zero
    values.add(80.0);
    values.add(43.0);
    values.add(26.0);
    values.add(11.0);
    values.add(4.0);
    values.add(0.0);
    listOfLists.add(values);
    return values;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Graph Level"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Color.fromARGB(255, 33, 178, 55),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 100, left: 30),
        padding: EdgeInsets.all(10),
        width: 300.0,
        height: 500.0,
        child: data != null
            ? Sparkline(
                data: data!,
                pointsMode: PointsMode.all,
                pointSize: 8.0,
                pointColor: Colors.amber,
                gridLineLabelPrecision: 3,
                enableGridLines: true,
                useCubicSmoothing: true,
                cubicSmoothingFactor: 0.2,
              )
            : Center(
                child:
                    CircularProgressIndicator(), // Show loader if data is null
              ),
      ),
    );
  }
}

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: ListView.builder(
        itemCount: listOfLists.length,
        itemBuilder: (context, index) {
          List<double> data = listOfLists[index];
          return ListTile(
            title: Text("Data ${index + 1}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GraphPage1(data: data),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class GraphPage1 extends StatelessWidget {
  const GraphPage1({Key? key, required this.data}) : super(key: key);

  final List<double> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Graph"),
      ),
      body: Center(
        child: Container(
            width: 300.0,
            height: 200.0,
            child: Sparkline(
              data: data,
              pointsMode: PointsMode.all,
              pointSize: 8.0,
              pointColor: Colors.amber,
              gridLineLabelPrecision: 3,
              enableGridLines: true,
              useCubicSmoothing: true,
              cubicSmoothingFactor: 0.2,
            )),
      ),
    );
  }
}
