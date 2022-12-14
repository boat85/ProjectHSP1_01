import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
                  const Text("????????????????????????????????????????????????????????????",
                      style: TextStyle(fontSize: 30)),
                  Divider(),
                  const SizedBox(
                    height: 20,
                  ),

                  RadioListTile(
                    title: Text("?????????"),
                    value: "0",
                    groupValue: sex,
                    onChanged: (value) {
                      setState(() {
                        sex = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    title: Text("????????????"),
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
                        return '???????????????????????????????????????';
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
                        hintText: "????????????????????????",
                        labelText: "????????????????????????",
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
                        return '????????????????????????????????????????????????';
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
                        hintText: "?????????????????????????????????",
                        labelText: "?????????????????????????????????",
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
                        return '??????????????????????????????????????????????????????????????????';
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
                        hintText: "???????????????????????????????????????????????????",
                        labelText: "???????????????????????????????????????",
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
                        return '??????????????????????????????????????????';
                      } else if (!regex.hasMatch(value)) {
                        return '???????????????????????????????????????????????????????????????';
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
                        hintText: "???????????????????????????",
                        labelText: "???????????????",
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
                        return '????????????????????????????????????????????????????????????????????????';
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
                        hintText: "?????????????????????????????????????????????????????????",
                        labelText: "?????????????????????????????????????????????",
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
                        return '??????????????????????????? ?????????/???????????????/??????????????????';
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
                        hintText: "?????????????????????/???????????????/??????????????????",
                        labelText: "?????????/???????????????/??????????????????",
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
                    //     labelText: "?????????/???????????????/??????????????????"),
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

                  // TextFormField(
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return '??????????????????????????????????????????????????????';
                  //     }
                  //     return null;
                  //   },
                  //   onSaved: (value) {
                  //     setState(() {
                  //       blood_type = value!;
                  //     });
                  //   },
                  //   // controller: blood_type,
                  //   keyboardType: TextInputType.emailAddress,
                  //   decoration: InputDecoration(
                  //       prefixIcon: const Icon(Icons.adjust_outlined),
                  //       hintText: "????????????????????????????????????????????????",
                  //       labelText: "???????????????????????????",
                  //       floatingLabelBehavior: FloatingLabelBehavior.always,
                  //       contentPadding: const EdgeInsets.symmetric(
                  //         horizontal: 45,
                  //         vertical: 20,
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(28),
                  //           borderSide: const BorderSide(
                  //             color: Colors.black,
                  //           ),
                  //           gapPadding: 10),
                  //       focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(28),
                  //           borderSide: const BorderSide(
                  //             color: Colors.black,
                  //           ),
                  //           gapPadding: 10)),
                  // ),

                  SizedBox(
                    height: 20,
                  ),
                  const Text("????????????????????????????????????", style: TextStyle(fontSize: 25)),
                  Divider(),
                  const SizedBox(
                    height: 35,
                  ),

                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '???????????????????????????????????????????????????';
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
                        hintText: "????????????????????????????????????",
                        labelText: "????????????????????????",
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
                        return '?????????????????????????????????????????????????????????????????????';
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
                        hintText: "??????????????????????????????????????????????????????",
                        labelText: "??????????????????????????????????????????",
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

                  ///
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
                        final SharedPreferences _prefs =
                            await SharedPreferences.getInstance();

                        String c = '';
                        var message = '';

                        try {
                          Users userlogin = await UsersProvider().addUserd(
                              fullname,
                              lastname,
                              sex,
                              birthday,
                              email,
                              tel,
                              address,
                              blood_type,
                              password);

                          // Users userlogin = await UsersProvider()
                          //     .getDataUserLogin(tel, password);

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
                          }
                          // _prefs.setString("id", userlogin.id);
                          // _prefs.setString("fullname", fullname);
                          // _prefs.setString("lastname", lastname);
                          // _prefs.setString("sex", sex);
                          // _prefs.setString("birthday", birthday);
                          // _prefs.setString("email", email);
                          // _prefs.setString("address", address);
                          // _prefs.setString("bloodType", blood_type);
                          // _prefs.setString("tel", tel);
                        } catch (e) {
                          c = e.toString();
                        }

                        if (sex.isEmpty == true) {
                          message = "???????????????????????????????????????";
                        } else if (tel.length <= 9) {
                          message =
                              "???????????????????????????????????????????????????????????????????????????????????????????????? ?????????????????????????????? 10 ????????????";
                          try {
                            int.parse(tel) is int == false;
                            print("tel int yes");
                          } catch (e) {
                            message = "?????????????????????????????????????????????????????????????????????????????????????????????????????????";
                          }
                        } else if (password.length <= 5) {
                          message =
                              '????????????????????????????????????????????????????????? 6 ????????? ?????????????????????????????????????????????????????????';
                        } else if (password != conpassword) {
                          message = '??????????????????????????????????????? ?????????????????????????????????????????????????????????';
                        } else if (c != null) {
                          message =
                              '?????????????????????????????????????????????????????????????????????????????? ????????????????????????????????????????????????????????????????????? Server ???????????????????????????????????????????????????????????????????????????????????????';
                        } else {
                          message = '????????????????????????????????????????????????';
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
                      "??????????????????????????????",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: const Text(
                      "test ->",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/BMIRGTScreen', (Route<dynamic> route) => false);
                    },
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
