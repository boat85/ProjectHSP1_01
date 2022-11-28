import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/login.dart';
import '../predict/prediction.dart';
import '../profile/profile.dart';

class mainMenu extends StatefulWidget {
  const mainMenu({super.key});

  @override
  State<mainMenu> createState() => _mainMenuState();
}

class _mainMenuState extends State<mainMenu> {
  String? fullname = '';

  Future getdatauser() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        fullname = (_prefs.getString("fullname")! +
            " " +
            _prefs.getString("lastname")!);
      } catch (e) {
        print("No data user");
      }
    });
  }

  @override
  void initState() {
    getdatauser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          // height: 220,
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Color.fromARGB(255, 4, 97, 246),
                Color.fromARGB(255, 32, 112, 251),
                Color.fromARGB(255, 58, 161, 246),
              ]),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      fullname!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: 800,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    padding: const EdgeInsets.all(30.0),
                    child: Column(children: [
                      SizedBox(
                        height: 50,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 65,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const predictionScreen();
                              },
                            ),
                          );
                        },
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          "ทำนายปัญหาสุขภาพ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 65,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const predictionScreen();
                              },
                            ),
                          );
                        },
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          "ข้อมูลส่วนตัว",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 65,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const profileScrenn();
                              },
                            ),
                          );
                        },
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          "โปรไฟล์",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
