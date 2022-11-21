import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class predictionScreen extends StatefulWidget {
  const predictionScreen({super.key});

  @override
  State<predictionScreen> createState() => _predictionScreenState();
}

class _predictionScreenState extends State<predictionScreen> {
  final _formKey = GlobalKey<FormState>();

  final tel = TextEditingController();

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
                  const Text("ประเมินปัญหาด้านสุขภาพ",
                      style: TextStyle(fontSize: 30)),
                  const SizedBox(
                    height: 55,
                  ),

                  ///....
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Feature 1';
                      }
                      return null;
                    },
                    controller: tel,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.add_call),
                        hintText: "Feature 1",
                        labelText: "Feature 1",
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
                        return 'Feature 3';
                      }
                      return null;
                    },
                    controller: tel,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.add_call),
                        hintText: "Feature 2",
                        labelText: "Feature 2",
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
                        return 'Feature 3';
                      }
                      return null;
                    },
                    controller: tel,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.add_call),
                        hintText: "Feature 3",
                        labelText: "Feature 3",
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
                      //       // return const showAllUser();
                      //     },
                      //   ),
                      // );

                      //   if (_formKey.currentState!.validate()) {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       const SnackBar(
                      //           content: Text(
                      //         'กำลังตรวจสอบ',
                      //         style: TextStyle(fontSize: 20),
                      //       )),
                      //     );
                      //   }
                    },
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      "ประเมิน",
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
