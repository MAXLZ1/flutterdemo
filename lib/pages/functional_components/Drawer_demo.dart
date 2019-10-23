import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      elevation: 16.0,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('name:xxxx'),
                accountEmail: Text('email:22222@163.com'),
                currentAccountPicture: CircleAvatar(backgroundImage: AssetImage('assets/images/account_picture.jpeg'),),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(backgroundImage: AssetImage('assets/images/account_picture.jpeg')),
                  CircleAvatar(backgroundImage: AssetImage('assets/images/account_picture.jpeg')),
                  CircleAvatar(backgroundImage: AssetImage('assets/images/account_picture.jpeg'))
                ],
                arrowColor: Colors.red,
                onDetailsPressed: () {
                  print(1);
                },
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'http://pic36.nipic.com/20131203/3822951_102145644000_2.jpg'
                      ),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('附近的人'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('设置'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.power_settings_new),
                  ),
                  Text('退出')
                ],
              ),
              onTap: () => Navigator.pop(context),
            )
          )
        ],
      )
    );
  }
}