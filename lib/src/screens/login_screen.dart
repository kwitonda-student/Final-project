import 'package:flutter/material.dart';
import 'package:muzuli_app/src/services/firebase_service.dart';
import 'home_screen.dart';
import 'package:muzuli_app/src/models/user_profile.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _nameCtl = TextEditingController();
  final _emailCtl = TextEditingController();
  final _locCtl = TextEditingController();
  final _passCtl = TextEditingController(text: 'Password123'); // simple default to satisfy auth
  bool _loading = false;

  final FirebaseService _service = FirebaseService();

  Future<void> _submit() async {
    if (!_form.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      final user = await _service.signInOrRegister(_emailCtl.text.trim(), _passCtl.text);
      if (user != null) {
        final profile = UserProfile(
          uid: user.uid,
          name: _nameCtl.text.trim(),
          email: _emailCtl.text.trim(),
          location: _locCtl.text.trim(),
        );
        await _service.saveUserProfile(profile);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen(profile: profile)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Auth failed')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bg = DecorationImage(
      image: NetworkImage('https://images.pexels.com/photos/34725871/pexels-photo-34725871.jpeg'),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.35), BlendMode.darken),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: bg),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _form,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Welcome to Muzuli app', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      SizedBox(height: 12),
                      TextFormField(controller: _nameCtl, decoration: InputDecoration(labelText: 'Name'), validator: (v) => v!.isEmpty ? 'Enter name' : null),
                      TextFormField(controller: _locCtl, decoration: InputDecoration(labelText: 'Location'), validator: (v) => v!.isEmpty ? 'Enter location' : null),
                      TextFormField(controller: _emailCtl, decoration: InputDecoration(labelText: 'Email'), validator: (v) => v!.contains('@') ? null : 'Enter valid email'),
                      SizedBox(height: 12),
                      ElevatedButton(onPressed: _loading ? null : _submit, child: _loading ? CircularProgressIndicator(color: Colors.white) : Text('Continue')),
                      SizedBox(height: 8),
                      Text('By continuing you will be logged in / registered', style: TextStyle(fontSize: 12, color: Colors.black54)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
