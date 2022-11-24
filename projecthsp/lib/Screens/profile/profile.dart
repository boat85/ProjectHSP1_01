import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/userModel.dart';
import '../../providers/usersProviders.dart';
// import 'package:url_launcher/url_launcher.dart';

class profileScrenn extends StatefulWidget {
  const profileScrenn({super.key});

  @override
  State<profileScrenn> createState() => _profileScrennState();
}

class _profileScrennState extends State<profileScrenn> {
  List<Users> usersdata = [];
  List<String> test = ["01"];

  //dio
  // void setUserData() async {
  //   usersdata = await UsersProvider().getDataUser();
  //   setState(() {});
  // }

//http
  void setUserData() async {
    usersdata = (await UsersProvider().getDataUser()) as List<Users>;
    setState(() {});
  }

  Future<Null> refresh() async {
    print("refresh data");
    setUserData();
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();
    setUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: test.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient:
                            LinearGradient(begin: Alignment.topCenter, colors: [
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
                            children: const [
                              CircleAvatar(
                                radius: 50.0,
                                child: const Icon(Icons.account_circle_outlined,
                                    size: 80),
                                // backgroundImage: AssetImage('images'),
                              ),
                              Text(
                                'ผู้ดูแล ระบบ',
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
                              padding: const EdgeInsets.all(20.0),
                              child: Column(children: [
                                //sex
                                Card(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.account_box,
                                      color: Colors.teal,
                                    ),
                                    title: Text(
                                      'ไม่มีเพศ',
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
                                      vertical: 10.0, horizontal: 15.0),
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.calendar_today,
                                      color: Colors.teal,
                                    ),
                                    title: Text(
                                      '14/05/2543',
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
                                      vertical: 10.0, horizontal: 15.0),
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.phone,
                                      color: Colors.teal,
                                    ),
                                    title: Text(
                                      '0999999999',
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
                                      vertical: 10.0, horizontal: 15.0),
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.attach_email,
                                      color: Colors.teal,
                                    ),
                                    title: Text(
                                      'Admin@gmail.com',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.teal.shade900),
                                    ),
                                  ),
                                ),
                                // address
                                Card(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.add_location_rounded,
                                      color: Colors.teal,
                                    ),
                                    title: Text(
                                      'ใต้ฟ้าบนดิน',
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
                                      vertical: 10, horizontal: 15.0),
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.adjust_outlined,
                                      color: Color.fromARGB(255, 0, 255, 0),
                                    ),
                                    title: Text(
                                      'B',
                                      style: TextStyle(
                                          // fontFamily: 'SourceSansPro',
                                          fontSize: 15,
                                          color: Colors.teal.shade900),
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
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil('/login',
                                            (Route<dynamic> route) => false);
                                    // }
                                    // );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    child: Center(
                                        child: Text(
                                      'ออกจากระบบ',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 18,
                                      ),
                                    )),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    // height: 20,
                                    padding: EdgeInsets.all(12.0),
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
              ));
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
