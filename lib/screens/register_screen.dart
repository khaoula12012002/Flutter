import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _birthYearCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _birthYearCtrl.dispose();
    _addressCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Inscription réussie !')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // ----- IMAGE -----
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/marvel.jpg',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.image, size: 100),
                ),
              ),
              const SizedBox(height: 24),

              // ----- FORM FIELDS -----
              _buildField(_usernameCtrl, 'Username', Icons.person,
                  validator: (v) => v!.isEmpty ? 'Champ obligatoire' : null),
              const SizedBox(height: 16),
              _buildField(
                _emailCtrl,
                'Email',
                Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v!.isEmpty) return 'Champ obligatoire';
                  if (!v.contains('@')) return 'Email invalide';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildField(
                _passwordCtrl,
                'Mot de passe',
                Icons.lock,
                obscureText: true,
                validator: (v) =>
                v!.length < 6 ? 'Minimum 6 caractères' : null,
              ),
              const SizedBox(height: 16),
              _buildField(
                _birthYearCtrl,
                'Année de naissance',
                Icons.calendar_today,
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v!.isEmpty) return 'Champ obligatoire';
                  final year = int.tryParse(v);
                  if (year == null ||
                      year < 1900 ||
                      year > DateTime.now().year) {
                    return 'Année invalide';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildField(
                _addressCtrl,
                'Adresse de facturation',
                Icons.location_on,
                maxLines: 3,
                validator: (v) => v!.isEmpty ? 'Champ obligatoire' : null,
              ),
              const SizedBox(height: 32),

              // ----- BUTTONS -----
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 14),
                    ),
                    child: const Text('S\'inscrire'),
                  ),
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 14),
                    ),
                    child: const Text('Annuler'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(
      TextEditingController controller,
      String label,
      IconData icon, {
        TextInputType keyboardType = TextInputType.text,
        bool obscureText = false,
        int maxLines = 1,
        required String? Function(String?) validator,
      }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      validator: validator,
    );
  }
}