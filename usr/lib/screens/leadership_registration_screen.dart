import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';

class LeadershipRegistrationScreen extends StatelessWidget {
  const LeadershipRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      currentRoute: '/leadership/register',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Leadership Registration Portal',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0288D1),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Register to manage your official profile and access the Leader Dashboard.'),
                    const SizedBox(height: 32),
                    _buildForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        _buildTextField('Full Name'),
        const SizedBox(height: 16),
        _buildTextField('Leader ID'),
        const SizedBox(height: 16),
        _buildTextField('National ID'),
        const SizedBox(height: 16),
        _buildTextField('Official Email'),
        const SizedBox(height: 16),
        _buildTextField('Position'),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Register Profile'),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: const Color(0xFFF5F9FF),
      ),
    );
  }
}
