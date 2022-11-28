import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/userModel.dart';
import '../../providers/usersProviders.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({super.key});

  @override
  State<UpdateUserScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<UpdateUserScreen> {
  // final formkey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  bool hidepassword = true, hidepassword1 = true;

  final tctel = TextEditingController();
  final tcpassword = TextEditingController();
  final tcconpassword = TextEditingController();
  final tcemail = TextEditingController();
  final tcsex = TextEditingController();
  final tcfullname = TextEditingController();
  final tclastname = TextEditingController();
  final tcbirthday = TextEditingController();
  final tcaddress = TextEditingController();
  final tcweight = TextEditingController();
  final tcheight = TextEditingController();
  final tcblood_type = TextEditingController();
  TextEditingController dateinput = TextEditingController();

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
        print("No edit user");
      }
    });
  }

  // String test = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("แก้ไขข้อมุลผู้ใช้",
                      style: TextStyle(fontSize: 30)),
                  Divider(),
                  const SizedBox(
                    height: 20,
                  ),

                  RadioListTile(
                    title: Text("ชาย"),
                    value: "0",
                    groupValue: sex,
                    onChanged: (value) {
                      setState(() {
                        sex = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    title: Text("หญิง"),
                    value: "1",
                    groupValue: sex,
                    onChanged: (value) {
                      setState(() {
                        sex = value.toString();
                      });
                    },
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
                    controller: dateinput,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.calendar_today),
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

                    // decoration: InputDecoration(
                    //     icon: Icon(Icons.calendar_today),
                    //     labelText: "วัน/เดือน/ปีเกิด"),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        // print(pickedDate);
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        // print(formattedDate);

                        setState(() {
                          dateinput.text = formattedDate;
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),

                  const SizedBox(
                    height: 35,
                  ),

                  Text(
                    'หมู่เลือด',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Divider(),
                  RadioListTile(
                    title: Text("A"),
                    value: "A",
                    groupValue: blood_type,
                    onChanged: (value) {
                      setState(() {
                        blood_type = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    title: Text("B"),
                    value: "B",
                    groupValue: blood_type,
                    onChanged: (value) {
                      setState(() {
                        blood_type = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    title: Text("AB"),
                    value: "AB",
                    groupValue: blood_type,
                    onChanged: (value) {
                      setState(() {
                        blood_type = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    title: Text("O"),
                    value: "O",
                    groupValue: blood_type,
                    onChanged: (value) {
                      setState(() {
                        blood_type = value.toString();
                      });
                    },
                  ),

                  const SizedBox(
                    height: 35,
                  ),

                  // MaterialButton
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 55,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        final SharedPreferences _prefs =
                            await SharedPreferences.getInstance();

                        String c = '';
                        var message = '';

                        try {
                          String tel = _prefs.getString("tel")!;
                          String email = _prefs.getString("email")!;
                          String sex = _prefs.getString("sex")!;
                          String fullname = _prefs.getString("fullname")!;
                          String lastname = _prefs.getString("lastname")!;
                          String birthday = _prefs.getString("birthday")!;
                          String address = _prefs.getString("address")!;
                          String blood_type = _prefs.getString("bloodType")!;
                          String password = _prefs.getString("password")!;
                          String id = _prefs.getString("id")!;

                          Users userlogin = await UsersProvider().updateUserd(
                              fullname,
                              lastname,
                              sex,
                              birthday,
                              email,
                              tel,
                              address,
                              blood_type,
                              password,
                              id);

                          if (userlogin.id != Null) {
                            _prefs.setString("id", userlogin.id);
                            _prefs.setString("fullname", userlogin.fullname);
                            _prefs.setString("lastname", userlogin.lastname);
                            _prefs.setString("sex", userlogin.sex);
                            _prefs.setString("birthday", userlogin.birthday);
                            _prefs.setString("email", userlogin.email);
                            _prefs.setString("address", userlogin.address);
                            _prefs.setString("tel", userlogin.tel);
                            _prefs.setString("password", userlogin.password);
                            _prefs.setString("bloodType", userlogin.bloodType);
                          }
                        } catch (e) {
                          print(e.toString());
                        }

                        if (sex.isEmpty == true) {
                          message = "กรุณาเลือกเพศ";
                        } else if (tel.length <= 9) {
                          message =
                              "กรุณากรอกเบอร์โทรศัพท์ให้ถูกต้อง กรอกให้ครบ 10 หลัก";
                          try {
                            int.parse(tel) is int == false;
                            print("tel int yes");
                          } catch (e) {
                            message = "กรุณากรอกเบอร์โทรศัพท์ให้เป็นตัวเลข";
                          }
                        } else if (password.length <= 5) {
                          message =
                              'รหัสต้องไม่ตํ่ากว่า 6 ตัว กรุณากรอกข้อมูลใหม่';
                        } else if (password != conpassword) {
                          message = 'รหัสไม่ตรงกัน กรุณากรอกข้อมูลใหม่';
                        } else if (c != null) {
                          message =
                              'ไม่สร้างบัณชีผู้ใช้ใหม่ได้ เนื่องจากมีปัญหาทางด้าน Server กรุณาลองใหม่อีกครั้งในภายหลัก';
                        } else {
                          message = 'สร้างบัญชีสำเร็จ';
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                              message,
                              style: TextStyle(fontSize: 20),
                            )),
                          );
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/BMIRGTScreen', (Route<dynamic> route) => false);
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
                      "แก้ไข",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // InkWell(
                  //   child: const Text(
                  //     "test ->",
                  //     style: TextStyle(
                  //         color: Colors.red,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 15),
                  //   ),
                  //   onTap: () {
                  //     Navigator.of(context).pushNamedAndRemoveUntil(
                  //         '/BMIRGTScreen', (Route<dynamic> route) => false);
                  //   },
                  // ),
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
