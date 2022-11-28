import 'package:flutter/material.dart';

import '../login/updateUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profileScrenn extends StatefulWidget {
  const profileScrenn({super.key});

  @override
  State<profileScrenn> createState() => _profileScrennState();
}

class _profileScrennState extends State<profileScrenn> {
  String tel = '';
  String email = '';
  String sex = '';
  String? fullname = '';
  String lastname = '';
  String birthday = '';
  String address = '';
  String blood_type = '';

  void setDataUser() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        tel = _prefs.getString("tel")!;
        email = _prefs.getString("email")!;
        sex = _prefs.getString("sex")!;
        fullname = _prefs.getString("fullname")!;
        lastname = _prefs.getString("lastname")!;
        birthday = _prefs.getString("birthday")!;
        address = _prefs.getString("address")!;
        blood_type = _prefs.getString("bloodType")!;
      } catch (e) {
        print("No data user");
      }
    });
  }

  Future<Null> refresh() async {
    print("refresh data");
    setDataUser();
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();
    setDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color.fromARGB(255, 4, 97, 246),
            Color.fromARGB(255, 32, 112, 251),
            Color.fromARGB(255, 58, 161, 246),
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      child:
                          const Icon(Icons.account_circle_outlined, size: 80),
                      // backgroundImage: AssetImage('images'),
                    ),
                    Text(
                      fullname! + ' ' + lastname,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 5.0,
                      width: 300,
                      child: Divider(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(children: [
                      //sex
                      Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 10.0),
                        child: ListTile(
                          leading: const Icon(
                            Icons.account_box,
                            color: Colors.teal,
                          ),
                          title: Text(
                            sex,
                            style: TextStyle(
                                // fontFamily: 'SourceSansPro',
                                fontSize: 15,
                                color: Colors.teal.shade900),
                          ),
                        ),
                      ),
                      // birthday
                      Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 10.0),
                        child: ListTile(
                          leading: const Icon(
                            Icons.calendar_today,
                            color: Colors.teal,
                          ),
                          title: Text(
                            birthday,
                            style: TextStyle(
                                // fontFamily: 'SourceSansPro',
                                fontSize: 15,
                                color: Colors.teal.shade900),
                          ),
                        ),
                      ),

                      //tel
                      Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 10.0),
                        child: ListTile(
                          leading: const Icon(
                            Icons.phone,
                            color: Colors.teal,
                          ),
                          title: Text(
                            tel,
                            style: TextStyle(
                                // fontFamily: 'SourceSansPro',
                                fontSize: 15,
                                color: Colors.teal.shade900),
                          ),
                        ),
                      ),

                      // email
                      Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 10.0),
                        child: ListTile(
                          leading: const Icon(
                            Icons.attach_email,
                            color: Colors.teal,
                          ),
                          title: Text(
                            email,
                            style: TextStyle(
                                fontSize: 15, color: Colors.teal.shade900),
                          ),
                        ),
                      ),
                      // address
                      Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 10.0),
                        child: ListTile(
                          leading: const Icon(
                            Icons.add_location_rounded,
                            color: Colors.teal,
                          ),
                          title: Text(
                            address,
                            style: TextStyle(
                                // fontFamily: 'SourceSansPro',
                                fontSize: 15,
                                color: Colors.teal.shade900),
                          ),
                        ),
                      ),

                      //blood_type

                      Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 10.0),
                        child: ListTile(
                          leading: const Icon(
                            Icons.adjust_outlined,
                            color: Colors.black54,
                          ),
                          title: Text(
                            blood_type,
                            style: TextStyle(
                                // fontFamily: 'SourceSansPro',
                                fontSize: 15,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                      // textField('อีเมล', 'ใต้ฟ้าบนดิน'),

                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          // SharedPreferences pref = await _pref;
                          // final provider = Provider.of<LoginController>(
                          //     context,
                          //     listen: false);
                          // provider.logout().then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const UpdateUserScreen();
                              },
                            ),
                          );
                          // }
                          // );
                        },
                        child: Container(
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            'แก้ไขข้อมูล',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.blue),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          // height: 20,
                          padding: EdgeInsets.all(12.0),
                          // margin: EdgeInsets.all(20.0),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final SharedPreferences _prefs =
                              await SharedPreferences.getInstance();
                          _prefs.setString("id", '');
                          _prefs.setString("username", '');
                          _prefs.setString("fullname", '');
                          _prefs.setString("lastname", '');
                          _prefs.setString("sex", '');
                          _prefs.setString("birthday", '');
                          _prefs.setString("email", '');
                          _prefs.setString("address", '');
                          _prefs.setString("bloodType", '');
                          _prefs.setString("tel", '');
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/login', (Route<dynamic> route) => false);
                        },
                        child: Container(
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            'ออกจากระบบ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          decoration: BoxDecoration(
                              // color: Colors.black,
                              // border: Border.all(
                              // color: Color.fromARGB(255, 248, 0, 0)),
                              // borderRadius:
                              // BorderRadius.all(Radius.circular(20))
                              ),
                          // height: 20,
                          // padding: EdgeInsets.all(12.0),
                          // margin: EdgeInsets.all(20.0),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding textField(
      String label, TextEditingController controller, IconData icon,
      {bool? edit}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextField(
        readOnly: true,
        controller: controller,
        decoration: InputDecoration(
            // icon: FaIcon(icon),
            label: Text('$label'),
            hintStyle: TextStyle(color: Color(0xff28DF99))),
      ),
    );
  }
}
