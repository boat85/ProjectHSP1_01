import 'package:flutter/material.dart';
import '../../models/userModel.dart';
import '../../providers/usersProviders.dart';

class showAllUser extends StatefulWidget {
  const showAllUser({super.key});

  @override
  State<showAllUser> createState() => _showAllUserState();
}

class _showAllUserState extends State<showAllUser> {
  List<Users> usersdata = [];

  // dio
  // void setUserData() async {
  //   usersdata = await UsersProvider().getDataUser();
  //   setState(() {});
  // }

  // http
  void setUserData() async {
    usersdata = (await UsersProvider().getDataUser()) as List<Users>;
    setState(() {});
  }

  //  void deleteUser(int id) async {
  //   usersdata = await UsersProvider().getDataUser();
  //   setState(() {});
  // }

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
      appBar: AppBar(title: Text('ผู้ใช้งานระบบ')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: usersdata.isEmpty
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: refresh,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: usersdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    Users data = usersdata[index];
                    return Card(
                      child: ListTile(
                        onTap: () {},
                        leading: Icon(Icons.account_box),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // UsersProvider().deleteUser(usersdata[index].id);
                          },
                        ),
                        title: Text(
                          "${data.fullname.toString()} ${data.lastname.toString()}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          children: [
                            Text(data.birthday.toString()),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
