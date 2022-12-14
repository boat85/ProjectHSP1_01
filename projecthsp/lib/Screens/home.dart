import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Users/showAllUser.dart';
import 'login/register.dart';
import 'login/login.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String? id;

  Future checStatus() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        id = _prefs.getString("id")!;
        print(":" + id!);
        if (id != '') {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/mainMenu', (Route<dynamic> route) => false);
        } else {
          print("NO id");
        }
      } catch (e) {
        print("No id");
      }
    });
  }

  @override
  void initState() {
    checStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        // decoration: const BoxDecoration(
        //     gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        //   Color.fromARGB(255, 4, 97, 246),
        //   Color.fromARGB(255, 32, 112, 251),
        //   Color.fromARGB(255, 58, 161, 246),
        // ])),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                children: const <Widget>[
                  Text(
                    "HSP",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 130,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "แอปพลิเคชันทำนายสถานะ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "ด้านทางสุขภาพ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "(Health Status Prediction)",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  // Divider(),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(children: [
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 55,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ),
                        );
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text(
                        "เข้าสู่ระบบ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    InkWell(
                      child: const Text(
                        "สร้างบัญชีผู้ใช้ใหม่",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const RegisterScreen();
                            },
                          ),
                        );
                      },
                    ),
                    // MaterialButton(
                    //   minWidth: double.infinity,
                    //   height: 55,
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) {
                    //           return const RegisterScreen();
                    //         },
                    //       ),
                    //     );
                    //   },
                    //   color: Colors.green,
                    //   shape: RoundedRectangleBorder(
                    //       side: const BorderSide(color: Colors.white),
                    //       borderRadius: BorderRadius.circular(50)),
                    //   child: const Text(
                    //     "ลงทะเบียน",
                    //     style: TextStyle(
                    //         fontSize: 20,
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),

                    // MaterialButton(
                    //   minWidth: double.infinity,
                    //   height: 55,
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) {
                    //           return const showAllUser();
                    //         },
                    //       ),
                    //     );
                    //   },
                    //   color: Colors.blue,
                    //   shape: RoundedRectangleBorder(
                    //       side: const BorderSide(color: Colors.white),
                    //       borderRadius: BorderRadius.circular(50)),
                    //   child: const Text(
                    //     "ทดสอบข้อมูลผู้ใช้",
                    //     style: TextStyle(
                    //         fontSize: 20,
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),

                    // const Text("Version HSP 1.0.0.5",
                    //     style: TextStyle(fontSize: 10, color: Colors.white))
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
