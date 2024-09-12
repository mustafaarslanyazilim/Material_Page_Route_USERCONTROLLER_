import 'package:flutter/material.dart';

////////////! Material Page Route  //////////// SAYFALAR ARASI GEÇİŞ  //////////

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //verileri parametre de tutmak için TEXTController tanımlanır
  TextEditingController txtController1 = TextEditingController();
  TextEditingController txtController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("LOGİN PAGE")),
      ),
      body: Container(
        child: Column(
          children: [
            //verileri almak için -->TextFromField
            TextFormField(
              controller: txtController1,
            ),
            TextFormField(
              controller: txtController2,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      username: txtController1.text,
                      password: txtController2.text,
                    ),
                  ),
                );
              },
              child: const Text("Profile Page"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  //*   farklı bir ekrandan veri alacağımız için bu kısımda değişkenler tanımlanacak //

  String? username, password;
  ProfileScreen({this.username, this.password}); //constructor

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("PROFİLE PAGE")),
      ),
      body: Container(
        child: Column(
          children: [
            //ilk class içinde olmadığı için widget. şeklinde parametreler çağırılır
            Text(widget.username!),
            Text(widget.password!),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Login Page")),
          ],
        ),
      ),
    );
  }
}
