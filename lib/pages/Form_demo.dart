import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: false,
      onChanged: (){
        print('change');
      },
      child: Padding(
        padding:const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.person_outline),
                labelText: '用户名'
              ),
              validator: (value) {
                return value.isEmpty ? '用户名不能为空' : null;
              },
              onSaved: (data){
                print('save:$data');
              },
              initialValue: 'user',
              autovalidate: false,
              enabled: true,
            ),
            TextFormField(
              decoration: InputDecoration(
                icon:Icon(Icons.lock_outline),
                labelText: '密码',
              ),
              obscureText: true,
              validator: (value){
                if (value.isEmpty) {
                  return '密码不能为空';
                }
                if (value.length <= 6) {
                  return '密码不能低于6位';
                }
                return null;
              },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {
                          _formKey.currentState.reset();
                        },
                        child: Text('清空'),
                      ),
                    )
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          // Process data.
                        }
                      },
                      child: Text('登录'),
                    ),
                  )
                ],
              )
            ),
          ],
        ),
      )
    );
  }
}