import 'package:flutter/material.dart';

import '../../models/userModel.dart';
import '../../providers/usersProviders.dart';
import '../Users/showAllUser.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // final formkey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  bool hidepassword = true, hidepassword1 = true;

  //// valiable form
  // final tel = TextEditingController();
  // final password = TextEditingController();
  // final conpassword = TextEditingController();
  // final email = TextEditingController();
  // final sex = TextEditingController();
  // final fullname = TextEditingController();
  // final lastname = TextEditingController();
  // final birthday = TextEditingController();
  // final address = TextEditingController();
  // final weight = TextEditingController();
  // final height = TextEditingController();
  // final blood_type = TextEditingController();

  String tel = '';
  String password = '';
  String conpassword = '';
  String email = '';
  String sex = '';
  String fullname = '';
  String lastname = '';
  String birthday = '';
  String address = '';
  String blood_type = '';

  String test = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Text("สร้างบัญชีผู้ใช้ใหม่",
                      style: TextStyle(fontSize: 30)),
                  const SizedBox(
                    height: 55,
                  ),

                  ///....
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกเบอร์โทรศัพท์';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        tel = value!;
                      });
                    },
                    // controller: tel,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.add_call),
                        hintText: "กรอกเบอร์โทรศัพท์",
                        labelText: "เบอร์โทรศัพท์",
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
                            hidepassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            // color: hidepassword ? MyStyle.secondColor : Colors.white70,
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
                    height: 35,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกรหัสผ่านยืนยัน';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        conpassword = value!;
                      });
                    },
                    // controller: conpassword,
                    obscureText: hidepassword1,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "กรอกรหัสผ่านยืนยัน",
                        labelText: "รหัสผ่านยืนยัน",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              hidepassword1 = !hidepassword1;
                            });
                          },
                          child: Icon(
                            hidepassword1
                                ? Icons.visibility_off
                                : Icons.visibility,
                            // color: hidepassword ? MyStyle.secondColor : Colors.white70,
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
                    height: 35,
                  ),
                  const Text("กรอกข้อมูลเพิ่มเติม",
                      style: TextStyle(fontSize: 25)),
                  const SizedBox(
                    height: 55,
                  ),

                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกชื่อ';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        sex = value!;
                      });
                    },
                    // controller: sex,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_box),
                        hintText: "เพศ",
                        labelText: "เพศ",
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
                        return 'กรุณากรอกชื่อ';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        fullname = value!;
                      });
                    },
                    // controller: fullname,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_box),
                        hintText: "กรอกชื่อ",
                        labelText: "ชื่อจริง",
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
                        return 'กรุณากรอกนามสุกล';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        lastname = value!;
                      });
                    },
                    // controller: lastname,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_box),
                        hintText: "กรอกนามสกุล",
                        labelText: "นามสกุลจริง",
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
                    // controller: txt_emlil,

                    validator: (value) {
                      String pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = new RegExp(pattern);
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกอีเมล';
                      } else if (!regex.hasMatch(value)) {
                        return 'รูปแบบอีเมลไม่กูกต้อง';
                      }
                      print('------------${regex.hasMatch(value)}');
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        email = value!;
                      });
                    },
                    // controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: "กรอกอีเมล",
                        labelText: "อีเมล",
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
                        return 'กรุณากรอกที่อยู่ปัจจุบัน';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        address = value!;
                      });
                    },
                    // controller: address,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.add_location_alt),
                        hintText: "กรอกที่อยู่ปัจจุบัน",
                        labelText: "ที่อยู่ปัจจุบัน",
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
                        return 'กรุณากรอก วัน/เดือน/ปีเกิด';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        birthday = value!;
                      });
                    },
                    // controller: birthday,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.admin_panel_settings_sharp),
                        hintText: "กรอกวัน/เดือน/ปีเกิด",
                        labelText: "วัน/เดือน/ปีเกิด",
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
                        return 'กรุณากรอกหมู่เลือด';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        blood_type = value!;
                      });
                    },
                    // controller: blood_type,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.adjust_outlined),
                        hintText: "กรอกโรคหมู่เลือด",
                        labelText: "หมู่เลือด",
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
                  //// test ------------------------------------
                  const SizedBox(
                    height: 35,
                  ),
                  // MaterialButton
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 55,
                    onPressed: () async {
                      // var usersdata = await UsersProvider().addUserd(
                      //     fullname.text,
                      //     lastname.text,
                      //     sex.text,
                      //     birthday.text,
                      //     email.text,
                      //     tel.text,
                      //     address.text,
                      //     blood_type.text,
                      //     password.text);

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return const showAllUser();
                      //     },
                      //   ),
                      // );

                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        String c = '';

                        try {
                          var usersdata = await UsersProvider().addUserd(
                              fullname,
                              lastname,
                              sex,
                              birthday,
                              email,
                              tel,
                              address,
                              blood_type,
                              password);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/mainMenu', (Route<dynamic> route) => false);
                        } catch (e) {
                          c = e.toString();
                        }
                        var message = '';
                        print(password.length);
                        print(tel.length);
                        if (tel.length <= 9) {
                          message = "กรุณากรอกเบอร์โทรศัพท์ให้ถูกต้อง";
                        } else if (password.length <= 5) {
                          message =
                              'รหัสต้องไม่ตํ่ากว่า 6 ตัว กรุณากรอกข้อมูลใหม่';
                        } else if (password != conpassword) {
                          message = 'รหัสไม่ตรงกัน กรุณากรอกข้อมูลใหม่';
                        } else if (c != null) {
                          message =
                              'ไม่สร้างบัณชีผู้ใช้ใหม่ได้ กรุณาลองใหม่อีกครั้ง';
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                            message,
                            style: TextStyle(fontSize: 20),
                          )),
                        );
                      }
                    },
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      "สร้างบัญชี",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
