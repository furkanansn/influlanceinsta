import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:influlanceinsta/model/GeneralModel.dart';
import 'package:influlanceinsta/network/AuthApi.dart';
import 'package:influlanceinsta/widget/AppBars.dart';
import 'package:influlanceinsta/widget/SizedSpace.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String email, password;
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: blankAppBar(),
      body: Form(
        key: key,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 200,
                  ),
                  sizedSpace(),
                  TextFormField(
                      onSaved: (value) => email = value.trim(),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: "E-posta",
                        labelText: "E-posta",
                        labelStyle: TextStyle(color: Colors.black87),
                      ),
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Lütfen e-posta giriniz";
                        }
                      }),
                  sizedSpace(),
                  TextFormField(
                      onSaved: (value) => password = value.trim(),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: "Parola",
                        labelText: "Parola",
                        labelStyle: TextStyle(color: Colors.black87),
                      ),
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Lütfen parolanızı giriniz";
                        }
                      }),
                  sizedSpace(),
                  CupertinoButton.filled(
                    child: Text("Giriş Yap"),
                    onPressed: () async {
                      if (key.currentState.validate()) {
                        key.currentState.save();
                        GeneralModel generalmodel = await new AuthApi()
                            .login(password: password, email: email);
                        if (generalmodel.success) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(generalmodel.errorMessage)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Giriş Başarılı")));
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/bottom", (route) => false);
                        }
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/bottom", (route) => false);
                      }
                      //TODO: do login
                    },
                  ),
                  sizedSpace(),
                  sizedSpace(),
                  Row(
                    children: [
                      Text("Henüz hesabınız yok mu?"),
                      Spacer(),
                      CupertinoButton(
                          child: Text("Kayıt Ol"),
                          onPressed: () {
                            Navigator.pushNamed(context, "/register");

                            /*showCupertinoModalPopup(
                           context: context,
                           builder: (context) {
                               return CupertinoActionSheet(
                                 title: Column(
                                   children: [
                                     Text("asdas"),
                                     Text("asdas"),
                                     Text("asdas"),
                                     Text("asdas"),
                                     Text("asdas"),
                                     Text("asdas"),
                                     Text("asdas"),
                                     Text("asdas"),
                                     Text("asdas"),
                                   ],
                                 ),
                               );
                             },);*/
                          })
                    ],
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
