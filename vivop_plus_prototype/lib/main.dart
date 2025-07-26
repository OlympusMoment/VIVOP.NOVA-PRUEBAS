import 'package:flutter/material.dart';

void main() {
  runApp(VivopApp());
}

class VivopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivop Plus',
      theme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    String user = usernameController.text;
    String pass = passwordController.text;
    if (user == 'admin' && pass == 'adminpeladoreligious') {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => AdminPage()));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => ClientHomePage(username: user)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Vivop+", style: TextStyle(fontSize: 32)),
              SizedBox(height: 20),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Usuario'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(context),
                child: Text('Entrar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Panel de Admin")),
      body: Center(child: Text("Aquí se gestionan videos y usuarios")),
    );
  }
}

class ClientHomePage extends StatelessWidget {
  final String username;

  ClientHomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bienvenido $username")),
      body: Center(child: Text("Reproductor de videos próximamente")),
    );
  }
}
