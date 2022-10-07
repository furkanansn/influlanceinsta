import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:influlanceinsta/model/GeneralModel.dart';
import 'package:influlanceinsta/network/AuthApi.dart';
import 'package:influlanceinsta/widget/AppBars.dart';
import 'package:influlanceinsta/widget/SizedSpace.dart';
class RegisterView extends StatefulWidget {
  const RegisterView({Key key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String email,password,name,surname;
  bool loading = false;
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: blankAppBarWithBackButton(),
      body: Form(
        key: key,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/logo.png",
                    height: 200,),
                  sizedSpace(),
                  TextFormField(
                      onSaved: (value) => email = value.trim(),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: "İş E-posta Adresi",
                        labelText: "İş E-posta Adresi",
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
                  TextFormField(
                      onSaved: (value) => name = value.trim(),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: "Ad",
                        labelText: "Ad",
                        labelStyle: TextStyle(color: Colors.black87),
                      ),
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Lütfen ad giriniz";
                        }
                      }),
                  sizedSpace(),
                  TextFormField(
                      onSaved: (value) => surname = value.trim(),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: "Soyad",
                        labelText: "Soyad",
                        labelStyle: TextStyle(color: Colors.black87),
                      ),
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Lütfen soyad giriniz";
                        }
                      }),
                  sizedSpace(),
                  loading ?
                      CupertinoActivityIndicator()
                  :
                  CupertinoButton.filled(
                    child: Text("Kayıt Ol"),
                    onPressed: () async{
                      if(key.currentState.validate()){
                        key.currentState.save();
                      }
                      setState(() {
                        loading = true;
                      });
                      GeneralModel generalmodel = await new AuthApi().register(
                        email: email,
                        password: password,
                        name: name,
                        surname: surname
                      );
                      if(generalmodel.success){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                            "E-posta adresi kullanılmaktadır")));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                            "Kayıt başarıyla tamamlandı")));
                        Navigator.pushNamedAndRemoveUntil(context, "/bottom", (route) => false);
                      }
                      setState(() {
                        loading = false;
                      });
                    },
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
