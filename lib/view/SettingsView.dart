import 'package:flutter/material.dart';
import 'package:influlanceinsta/style/TextStyles.dart';
class SettingsView extends StatefulWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Card(
                elevation: 2,
                child: ListTile(
                  title: Text("Kullanıcı Adı Değiştir",style: secondaryTextStyle(),),
                  trailing: IconButton(
                    color: Colors.black,
                    onPressed: (){
                      Navigator.pushNamed(context, "/changeusername");
                    },
                    icon: Icon(Icons.arrow_forward,color: Colors.black,),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Card(
                elevation: 2,
                child: ListTile(
                  title: Text("Parola Değiştir",style: secondaryTextStyle(),),
                  trailing: IconButton(
                    color: Colors.black,
                    onPressed: (){
                      Navigator.pushNamed(context, "/changepassword");
                    },
                    icon: Icon(Icons.arrow_forward,color: Colors.black,),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  title: Text("Sözleşmeler",style: secondaryTextStyle(),),
                  trailing: IconButton(
                    color: Colors.black,
                    onPressed: (){
                      Navigator.pushNamed(context, "/homedetail");
                    },
                    icon: Icon(Icons.arrow_forward,color: Colors.black,),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  title: Text("Çıkış Yap",style: secondaryTextStyle(),),
                  trailing: IconButton(
                    color: Colors.black,
                    onPressed: (){
                      Navigator.pushNamedAndRemoveUntil(context,
                          "/login", (route) => false);
                    },
                    icon: Icon(Icons.arrow_forward,color: Colors.black,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
