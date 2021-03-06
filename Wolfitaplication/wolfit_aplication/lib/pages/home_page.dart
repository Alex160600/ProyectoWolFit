import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wolfit_aplication/providers/main_provider.dart';
import 'package:wolfit_aplication/utils/main_menu.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
     int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
  }

  final List<String> _options = ["Plan", " Ejercicios ", "Información ", "Nutrición"];

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(_options[_selectedIndex]),
          leading: SizedBox.square(
          dimension: 60.0,
              child: Switch(
                  value: mainProvider.mode,
                  onChanged: (bool value) async {
                    mainProvider.mode = value;
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool("mode", value);
                  }
      ))),
          body: contentWidgets[_selectedIndex],

          bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
          _selectedIndex = index;
          setState(() {
            
          });
        },
        type: BottomNavigationBarType.fixed,
        items: menuOption
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
            .toList(),
        currentIndex: _selectedIndex,
      ),
    );
  }
}