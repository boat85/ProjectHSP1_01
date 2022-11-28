import 'package:projecthsp/models/BMIModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/CongenitalDModel.dart';
import '../../models/PressureModel.dart';
import '../../providers/BMIProviders.dart';
import 'package:flutter/material.dart';

import '../../providers/CongenitalDProviders.dart';
import '../../providers/PressureProviders.dart';
import '../../models/userModel.dart';
import '../../providers/usersProviders.dart';

class BMIRGTScreen extends StatefulWidget {
  const BMIRGTScreen({super.key});

  @override
  State<BMIRGTScreen> createState() => _BMIRGTScreenState();
}

class _BMIRGTScreenState extends State<BMIRGTScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text("")),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
                child: SingleChildScrollView(
                    child: Container(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const butomtest(),
                  )
                ],
              ),
            )))));
  }
}

class butomtest extends StatefulWidget {
  const butomtest({super.key});

  @override
  State<butomtest> createState() => _butomtestState();
}

class _butomtestState extends State<butomtest> {
  final _formKey = GlobalKey<FormState>();
  bool hidepassword = true;

  String width = '';
  String height = '';
  String pressure = '';

  bool v1 = false;
  bool v2 = false;
  bool v3 = false;
  bool v4 = false;

  String blood_type = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(children: [
        SizedBox(
          // height: size.height * 0.0000001,
          height: 15,
        ),
        Text(
          'ข้อมูลส่วนตัว',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        Divider(),
        SizedBox(
          height: 35,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'กรุณากรอกส่วนสูง';
            }
            return null;
          },
          onSaved: (value) {
            setState(() {
              height = value!;
            });
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.adjust_rounded),
              hintText: "กรอกค่าส่วนสูง",
              labelText: "ส่วนสูง",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 70,
                vertical: 10,
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
        SizedBox(
          height: 20,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'กรุณากรอกค่านํ้าหนัก';
            }
            return null;
          },
          onSaved: (value) {
            setState(() {
              width = value!;
            });
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.adjust_rounded),
              hintText: "กรอกค่านํ้าหนัก",
              labelText: "นํ้าหนัก",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 10,
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
        SizedBox(
          height: 20,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'กรุณากรอกค่าความดัน';
            }
            return null;
          },
          onSaved: (value) {
            setState(() {
              pressure = value!;
            });
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.adjust_rounded),
              hintText: "กรอกค่าความดัน",
              labelText: "ความดัน",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 10,
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
        SizedBox(
          height: 35,
        ),
        Text(
          'โรคประจำตัว',
          style: TextStyle(fontSize: 20.0),
        ),
        Divider(),
        CheckboxListTile(
          secondary: const Icon(
            Icons.add_box_rounded,
            color: Colors.blue,
          ),
          title: const Text('ความดัน'),
          value: this.v1,
          onChanged: (bool? value) {
            setState(() {
              v1 = value!;
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.trailing,
          secondary: const Icon(
            Icons.add_box_rounded,
            color: Colors.blue,
          ),
          title: const Text('เบาหวาน'),
          value: this.v2,
          onChanged: (bool? value) {
            setState(() {
              this.v2 = value!;
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.trailing,
          secondary: const Icon(
            Icons.add_box_rounded,
            color: Colors.blue,
          ),
          title: const Text('ไขมันในเลือดสูง'),
          value: this.v3,
          onChanged: (bool? value) {
            setState(() {
              this.v3 = value!;
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.trailing,
          secondary: const Icon(
            Icons.add_box_rounded,
            color: Colors.blue,
          ),
          title: const Text('โรคไต'),
          value: this.v4,
          onChanged: (bool? value) {
            setState(() {
              this.v4 = value!;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return 'กรุณากรอกความดัน';
          //   }
          //   return null;
          // },
          // onSaved: (value) {
          //   setState(() {
          //     pressure = value! as double;
          //   });
          // },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.add_box_rounded),
              hintText: "กรอกโรคอื่นๆ",
              labelText: "โรคอื่นๆ",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 10,
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
        SizedBox(
          height: 35,
        ),
        // DropDownTextField(
        //   // key: _formKey,
        //   // initialValue: "name4",
        //   // controller: _cnt,
        //   clearOption: true,
        //   enableSearch: true,
        //   clearIconProperty: IconProperty(color: Colors.blue),
        //   searchDecoration: const InputDecoration(hintText: "ค้นหาหมู่เลือด"),

        //   validator: (value) {
        //     if (value == null) {
        //       return "กรุณากรอกหมู่เลือด";
        //     } else {
        //       return null;
        //     }
        //   },
        //   onChanged: (val) {},

        //   dropDownItemCount: 4,

        //   dropDownList: const [
        //     DropDownValueModel(name: 'A', value: "A"),
        //     DropDownValueModel(
        //       name: 'B',
        //       value: "B",
        //     ),
        //     DropDownValueModel(name: 'AB', value: "AB"),
        //     DropDownValueModel(
        //       name: 'O',
        //       value: "O",
        //     ),
        //   ],
        // ),

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
              String? id = _prefs.getString("id");
              // String? nh = height[0] + '.' + height.substring(1, 3);
              double nh = (double.parse(height) / 100);
              dynamic c_bmi = double.parse(width) / (nh * nh);
              String c = '';
              // print(nh);
              // print(c_bmi);

              try {
                Bmi bmi =
                    await BMIProvider().addBMI(id, width, height, c_bmi, '');
                // _prefs.setString("tel", userlogin.tel);
              } catch (e) {
                print(e.toString());
              }

              try {
                CongenitalDProvider Con = (await CongenitalDProvider());
                if (v1 == true) {
                  // print('ความดัน');
                  Con.addCongenitalD(id, 'ความดัน', '');
                }
                if (v2 == true) {
                  Con.addCongenitalD(id, 'เบาหวาน', '');
                }
                if (v3 == true) {
                  Con.addCongenitalD(id, 'ไขมันในเลือดสูง', '');
                }
                if (v4 == true) {
                  Con.addCongenitalD(id, 'โรคไต', '');
                }
              } catch (e) {}

              try {
                Pressure ps =
                    await PressureProvider().addPressure(id, pressure, '');
              } catch (e) {
                print(e.toString());
              }

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
                    id!);

                if (userlogin.bloodType != Null) {
                  _prefs.setString("id", userlogin.bloodType);
                }
              } catch (e) {
                print(e.toString());
              }

              var message = '';
              print(blood_type);
              if (blood_type.isEmpty == true) {
                message = 'กรุณาเลือกหมู่เลือด';
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
          color: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Text(
            "ตกลง",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          child: const Text(
            "test ->",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/mainMenu', (Route<dynamic> route) => false);
          },
        ),
        const SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
