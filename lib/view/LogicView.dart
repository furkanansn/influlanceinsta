import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:influlanceinsta/util/LogicUtil.dart';
class LogicView extends StatefulWidget {
  const LogicView({Key key}) : super(key: key);

  @override
  _LogicViewState createState() => _LogicViewState();
}

class _LogicViewState extends State<LogicView> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),(){
      new LogicUtil().checkUser(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
