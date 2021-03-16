import 'package:flutter/material.dart';
import 'package:mvvm_provider/models/usermodel.dart';
import 'package:mvvm_provider/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';

class HalamanUtama extends StatelessWidget {
  String text_tengah = "HASIL FETCH";
  HalamanUtama({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserViewModel>(
        // selector: (context, provider) => provider.dataUser,
        create: (context) => UserViewModel(),
        child: MaterialApp(
            home: Scaffold(
                appBar: AppBar(
                  title: Text("MVVM provider",
                      style: TextStyle(color: Colors.white)),
                  actions: <Widget>[
                    Consumer<UserViewModel>(
                        builder: (context, userViewModel, _) => IconButton(
                              icon: Icon(
                                Icons.refresh,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                userViewModel.setData();
                              },
                            ))
                  ],
                  backgroundColor: Colors.pink,
                ),
                body: Container(
                  margin: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Consumer<UserViewModel>(
                      builder: (context, userViewModel, _) => Column(children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'HASIL FETCH',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        for (var item in userViewModel.dataUser)
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              // side: BorderSide(color: Colors.black, width: 0),
                            ),
                            margin: const EdgeInsets.all(5),
                            child: ListTile(
                              leading: Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.pink,
                              ),
                              // onTap: () => {Text('halo')},
                              // trailing: Icon(
                              //   Icons.person,
                              //   color: Colors.pink,
                              //   size: 35,
                              // ),
                              title: Text(
                                item.username.toString(),
                              ),
                              subtitle: Text(item.email.toString()),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                            ),
                          ),
                      ]),
                    ),
                  ),
                ))));
  }
}

class EdgeInsetsGeometri {}
