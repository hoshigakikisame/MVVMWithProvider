import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_provider/models/usermodel.dart';

class UserViewModel with ChangeNotifier {
  List<Welcome> data = new List();

  UserViewModel() {
    setData();
  }

  Future<List<Welcome>> setData() async {
    try {
      http.Response hasil = await http
          .get(Uri.encodeFull("https://jsonplaceholder.typicode.com/users"));
      if (hasil.statusCode == 200) {
        print("FETCH DATA SUCCESS");
        data = welcomeFromJson(hasil.body);
        notifyListeners();
        return data;
      } else {
        print("error status " + hasil.statusCode.toString());
        notifyListeners();
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }

  get dataUser {
    print('berhasil mengambil data dari provider');
    return data;
  }
}
