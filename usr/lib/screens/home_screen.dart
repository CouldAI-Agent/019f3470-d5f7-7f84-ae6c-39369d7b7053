import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      currentRoute: '/',
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildFeaturesSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0288D1), Color(0xFF81D4FA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64.0 : 24.0,
        vertical: isDesktop ? 80.0 : 48.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '"Dare to Dream, Dare to Achieve."',
            style: TextStyle(
              fontSize: isDesktop ? 24 : 18,
              fontStyle: FontStyle.italic,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'Empowering Young People.\nConnecting East Africa.\nTransforming Communities.',
            style: TextStyle(
              fontSize: isDesktop ? 48 : 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'Youth and Development Network in East Africa (YDNEA) is a youth-driven community committed to empowering young people through leadership, education, entrepreneurship, innovation, technology, community development, humanitarian action, and sustainable partnerships across East Africa.',
              style: TextStyle(
                fontSize: isDesktop ? 18 : 16,
                color: Colors.white.withOpacity(0.9),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _HeroButton(label: 'Become a Member', onPressed: () {}),
              _HeroButton(
                label: 'Learn More',
                onPressed: () => Navigator.pushNamed(context, '/about'),
                isSecondary: true,
              ),
              _HeroButton(label: 'Volunteer', onPressed: () {}),
              _HeroButton(label: 'Donate', onPressed: () {}),
              _HeroButton(label: 'Contact Us', onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      child: Column(
        children: [
          const Text(
            'Our Key Programs',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF0288D1)),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              'Youth Leadership',
              'Entrepreneurship',
              'Education',
              'Technology',
              'Digital Skills',
              'Innovation',
            ].map((program) => _ProgramCard(title: program)).toList(),
          ),
        ],
      ),
    );
  }
}

class _HeroButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSecondary;

  const _HeroButton({
    required this.label,
    required this.onPressed,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSecondary ? Colors.white : const Color(0xFF0288D1),
        foregroundColor: isSecondary ? const Color(0xFF0288D1) : Colors.white,
        side: isSecondary ? null : const BorderSide(color: Colors.white, width: 2),
        elevation: isSecondary ? 2 : 0,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _ProgramCard extends StatelessWidget {
  final String title;
  const _ProgramCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.star_outline, size: 48, color: Color(0xFF81D4FA)),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
