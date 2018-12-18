import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: 'Menu Dropdown',
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {

  Color warna = Colors.red;

  void _aksiPilihan(Menu menu){
    setState(() {
      warna=menu.warna;      
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Menu Dropdown"),
        actions: <Widget>[
          new PopupMenuButton<Menu>(
            onSelected: _aksiPilihan,
            itemBuilder: (BuildContext context){
              return listMenu.map((Menu x){
                return new PopupMenuItem<Menu>(
                  child: new Text(x.teks),
                  value: x,
                );
              }).toList();
            },
          )
        ],
      ),
      body: new Container(
        decoration: BoxDecoration(
          color: warna
        ),
      ),
    );
  }
}

class Menu{
  const Menu({this.teks, this.warna});
  final String teks;
  final Color warna;
}

List<Menu> listMenu = const <Menu>[
  const Menu (teks:"Merah", warna: Colors.red ),
  const Menu (teks:"Biru", warna: Colors.blue ),
  const Menu (teks:"Hijau", warna: Colors.green ),
];