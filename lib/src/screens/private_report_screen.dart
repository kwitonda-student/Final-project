import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class PrivateReportScreen extends StatefulWidget {
  @override
  _PrivateReportScreenState createState() => _PrivateReportScreenState();
}

class _PrivateReportScreenState extends State<PrivateReportScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _info = TextEditingController();
  final FirebaseService _service = FirebaseService();
  bool _loading = false;

  Future<void> _submit() async {
    if (!_form.currentState!.validate()) return;
    setState(() => _loading = true);
    await _service.submitPrivateReport({
      'name': _name.text.trim(),
      'email': _email.text.trim(),
      'info': _info.text.trim(),
      'date': DateTime.now().toIso8601String(),
    });
    setState(() => _loading = false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Private report submitted')));
    _name.clear(); _email.clear(); _info.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Private Abuse Reporting', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Form(
          key: _form,
          child: Column(children: [
            TextFormField(controller: _name, decoration: InputDecoration(labelText: 'Name'), validator: (v) => v!.isEmpty ? 'Enter name' : null),
            TextFormField(controller: _email, decoration: InputDecoration(labelText: 'Email'), validator: (v) => v!.contains('@') ? null : 'Enter valid email'),
            TextFormField(controller: _info, decoration: InputDecoration(labelText: 'Information'), maxLines: 4, validator: (v) => v!.isEmpty ? 'Enter info' : null),
            SizedBox(height: 12),
            ElevatedButton(onPressed: _loading ? null : _submit, child: _loading ? CircularProgressIndicator(color: Colors.white) : Text('Submit')),
          ]),
        ),
      ],
    ));
  }
}
