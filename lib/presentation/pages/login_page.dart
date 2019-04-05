import 'package:flutter/material.dart';
import 'package:logindemo/business_logic/blocs/login/login_bloc.dart';
import 'package:logindemo/business_logic/blocs/login/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logindemo/business_logic/blocs/login/login_state.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String username="9123456785";
  String password="Mudhaliyar@123";
  LoginBloc _loginBloc=LoginBloc();

  _login() {
    setState(() {
      this._loginBloc.dispatch(LoginButtonPressedEvent(
          username: this.username, password: this.password));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocBuilder(
          bloc: _loginBloc,
          builder: (context, state) {
            if (state is LoginStateDefault) {
              return Center(
                  child: Container(
                padding: const EdgeInsets.all(0.0),
                width: 300.0,
                height: 300.0,
                child: Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (_value) => {username = _value},
                      decoration: InputDecoration(
                        hintText: "Username",
                      ),
                    ),
                    TextField(
                      onChanged: (_value) => {password = _value},
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                      ),
                    ),
                    RaisedButton(
                      onPressed: _login,
                      child: Text('Login'),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ));
            }   
            if (state is LoginStateLoaded) {
              return Text("Load");
            }
            if (state is LoginStateError) {
               return Text("Error");
            }
             if (state is LoginStateLoading) {
                return Text("Loading");
            }
          }),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
