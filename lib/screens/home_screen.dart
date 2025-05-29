import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Catalonia Gourmet'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: UserForm(),
        ),
      ),
    );
  }
}

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneFocusNode = FocusNode();

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    final upper = RegExp(r'[A-Z]');
    final lower = RegExp(r'[a-z]');
    final digit = RegExp(r'\d');
    final special = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (!upper.hasMatch(value)) return 'Password must contain an uppercase letter';
    if (!lower.hasMatch(value)) return 'Password must contain a lowercase letter';
    if (!digit.hasMatch(value)) return 'Password must contain a number';
    if (!special.hasMatch(value)) return 'Password must contain a special character';
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) return null; // optional
    final phoneRegex = RegExp(r'^\d{9}$');
    if (!phoneRegex.hasMatch(value)) return 'Phone must be exactly 9 digits';
    return null;
  }

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Language'),
              value: vm.language,
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'es', child: Text('Spanish')),
                DropdownMenuItem(value: 'ca', child: Text('Catalan')),
                DropdownMenuItem(value: 'ca', child: Text('French')),
              ],
              onChanged: (val) => vm.language = val!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (val) => _validateRequired(val, 'Name'),
              onChanged: (val) => vm.name = val,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
              onChanged: (val) => vm.email = val,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: _validatePassword,
              onChanged: (val) => vm.password = val,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'City'),
              validator: (val) => _validateRequired(val, 'City'),
              onChanged: (val) => vm.city = val,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Country'),
              validator: (val) => _validateRequired(val, 'Country'),
              onChanged: (val) => vm.country = val,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Phone (optional)'),
              keyboardType: TextInputType.phone,
              validator: _validatePhone,
              focusNode: _phoneFocusNode,
              onChanged: (val) => vm.phone = val,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final valid = _formKey.currentState!.validate();
                if (valid) {
                  vm.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data saved successfully!')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
