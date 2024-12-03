import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  Icon _coeur = Icon(Icons.favorite);
  //Icon home = Icon(Icons.home);
  bool _likeBool = false;
  var _selectedIndex = 0;   
  var _affichage = '0: Accueil';

  void _likeThis(){
    setState(() {
      if (_likeBool){
        _coeur = Icon(Icons.favorite_border, color: Colors.white,);
        bool _likeBool = false;
      }
      else {
        _coeur = Icon(Icons.favorite, color: Colors.white,);
        bool _likeBool = true;
      }
    });
  }

  void _itemClique(int index){
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex ==0){
        _affichage = "0 : Accueil";
      }
      else if (_selectedIndex == 1){
        _affichage = "1 : Mon compte";
      }
      else{
        _affichage = "2 : Paramètres";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            widget.title),
          actions: <Widget>[
            IconButton(onPressed: _likeThis, icon: _coeur)
        ],
        backgroundColor: Colors.red,
        ),


        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(_affichage),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('Images/yamal.jpg',
                    width:350,
                    height: 350,
                  ),
                    Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScNhigsjmKe5QtMZpLM-gitSr-KsMNngdG5c4Bqh3U5PDKzcy7LVhxXXy_u-lBu2IBA0E&usqp=CAU',
                    width:350,
                    height: 350,
                  ),
                ],
              )
            ],
          ),
        ),
        
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(decoration: BoxDecoration(
                color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Accueil'),
                onTap: () {
                  _itemClique(0);
                } ,
              ),
              ListTile(
                title: const Text('Mon compte'),
                onTap: () {
                  _itemClique(1);
                } ,
              ),
              ListTile(
                title: const Text('Paramètres'),
                onTap: () {
                  _itemClique(2);
                } ,
              ),
            ],
          )
        ),


        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: const Icon(Icons.add),
          ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: BottomNavigationBar (
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil'
            ),
              BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Mon compte'
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Paramètres'
              ),
          ],
          onTap: _itemClique,
          currentIndex: _selectedIndex,
        )
        
    );
  }
}