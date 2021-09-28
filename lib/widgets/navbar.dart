// ignore: file_names
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Home'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Know More'),
            onTap: () => {_goTonext(context)},
          ),
        ],
      ),
    );
  }
}

void _goTonext(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewScreen()));
  }


class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Know More')),
      body: Column(
        children: <Widget>[
          Padding(  
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/bmi.jpg')
          ),
        const Padding( 
          padding: EdgeInsets.all(8.0),
          child: Text("A BMI Chart for Reference")
        )
        ],
      ) 
    );
  }
}