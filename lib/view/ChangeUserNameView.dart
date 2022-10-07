import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:influlanceinsta/widget/AppBars.dart';
import 'package:influlanceinsta/widget/SizedSpace.dart';
class ChangeUsernameView extends StatefulWidget {
  const ChangeUsernameView({Key key}) : super(key: key);

  @override
  _ChangeUsernameViewState createState() => _ChangeUsernameViewState();
}

class _ChangeUsernameViewState extends State<ChangeUsernameView> {
  String username;
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: blankAppBarWithBackButton(
        title: "Kullanıcı Adı Değiştir"
      ),
      body: Form(
        key: key,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  sizedSpace(),
                  TextFormField(
                      onSaved: (value) => username = value.trim(),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: "Kullanıcı Adı",
                        labelText: "Kullanıcı Adı",
                        labelStyle: TextStyle(color: Colors.black87),
                      ),
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Lütfen kullanıcı adı giriniz";
                        }
                      }),
                  sizedSpace(),
                  CupertinoButton.filled(
                    child: Text("Kaydet"),
                    onPressed: (){
                      if(key.currentState.validate()){
                        key.currentState.save();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
