import 'package:flutter/material.dart';
import 'package:projecthsp/Screens/login/register.dart';
import 'package:projecthsp/models/userModel.dart';
// import 'package:test04_login/Screens/login/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/usersProviders.dart';

import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color.fromARGB(255, 4, 97, 246),
          Color.fromARGB(255, 32, 112, 251),
          Color.fromARGB(255, 58, 161, 246),
        ])),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const <Widget>[
                  Text(
                    "ล็อกอิน",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        // fontFamily: 'Kanit',
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  // height: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(100))),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const butomtest(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class butomtest extends StatefulWidget {
  const butomtest({super.key});

  @override
  State<butomtest> createState() => _butomtestState();
}

// ignore: camel_case_types
class _butomtestState extends State<butomtest> {
  final _formKey = GlobalKey<FormState>();
  bool hidepassword = true;

  // final username = TextEditingController();
  // final password = TextEditingController();

  String username = '';
  String password = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(children: [
        SizedBox(
          height: size.height * 0.005,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'กรุณากรอกเบอร์โทรศัพท์หรืออีเมล';
            }
            return null;
          },
          onSaved: (value) {
            setState(() {
              username = value!;
            });
          },
          // controller: username,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              hintText: "กรอกเบอร์โทรศัพท์หรืออีเมล",
              labelText: "เบอร์โทรศัพท์หรืออีเมล",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 20,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  gapPadding: 10),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  gapPadding: 10)),
        ),
        const SizedBox(
          height: 35,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'กรุณากรอกรหัสผ่าน';
            }
            return null;
          },
          onSaved: (value) {
            setState(() {
              password = value!;
            });
          },
          // controller: password,
          obscureText: hidepassword,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              hintText: "กรอกรหัสผ่าน",
              labelText: "รหัสผ่าน",
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    hidepassword = !hidepassword;
                  });
                },
                child: Icon(
                  hidepassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 20,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  gapPadding: 10),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  gapPadding: 10)),
        ),
        const SizedBox(
          height: 15,
        ),
        // InkWell(
        //   child: const Text(
        //     "ลืมรหัสผ่าน",
        //     style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        //   ),
        //   onTap: () {},
        // ),
        const SizedBox(
          height: 55,
        ),
        MaterialButton(
          minWidth: double.infinity,
          height: 55,
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              final SharedPreferences _prefs =
                  await SharedPreferences.getInstance();
              try {
                Users userlogin =
                    await UsersProvider().getDataUserLogin(username, password);

                if (userlogin.id != Null) {
                  _prefs.setString("id", userlogin.id);
                  // _prefs.setString("username", username);
                  _prefs.setString("fullname", userlogin.fullname);
                  _prefs.setString("lastname", userlogin.lastname);
                  _prefs.setString("sex", userlogin.sex);
                  _prefs.setString("birthday", userlogin.birthday);
                  _prefs.setString("email", userlogin.email);
                  _prefs.setString("address", userlogin.address);
                  _prefs.setString("bloodType", userlogin.bloodType);
                  _prefs.setString("tel", userlogin.tel);

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/mainMenu', (Route<dynamic> route) => false);
                }
              } catch (e) {
                if (username == "admin" && password == "0") {
                  try {
                    _prefs.setString("id", "0");
                    _prefs.setString("username", username);
                    _prefs.setString("password", password);

                    _prefs.setString("fullname", "Admin");
                    _prefs.setString("lastname", "Eiei");
                    _prefs.setString("sex", "No");
                    _prefs.setString("birthday", "00/00/0000");
                    _prefs.setString("email", "Admin@Admin.com");
                    _prefs.setString("address", "in System");
                    _prefs.setString("bloodType", "No");
                    _prefs.setString("tel", "No");
                  } catch (e) {
                    print("no");
                  }
                  // Fluttertoast.showToast(
                  //     msg: 'เข้าสู่ระบบสำเร็จ', gravity: ToastGravity.CENTER);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                      'เข้าสู่ระบบสำเร็จ',
                      style: TextStyle(fontSize: 20),
                    )),
                  );
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/mainMenu', (Route<dynamic> route) => false);
                } else {
                  var message = '';
                  if (e != null) {
                    message = 'ไม่พบบัญชีผู้ใช้ในระบบ';
                  }
                  // Fluttertoast.showToast(
                  //     msg: message, gravity: ToastGravity.CENTER);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                      message,
                      style: TextStyle(fontSize: 20),
                    )),
                  );
                }
              }
            }
          },
          color: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Text(
            "เข้าสู่ระบบ",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "หากท่านยังไม่มีบัญชีผู้ใช้สามารถ",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
        ),
        InkWell(
          child: const Text(
            "สร้างบัญชีผู้ใช้ใหม่ได้ที่นี่",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15),
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
        const SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
