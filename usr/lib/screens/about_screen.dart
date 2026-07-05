import 'package:flutter/material.dart';
import '../widgets/responsive_scaffold.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      currentRoute: '/about',
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            _buildContentSection(context),
            _buildMissionVisionSection(context),
            _buildActivitiesSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF0288D1),
      ),
      child: const Column(
        children: [
          Text(
            'Learn More About YDNEA',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 900),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Youth and Development Network in East Africa (YDNEA) is officially recognized as a community operating within Jay_nalTrust. It exists to unite young people across Tanzania and the East African Community through leadership, education, entrepreneurship, technology, investment, humanitarian work, innovation, and community development.',
            style: TextStyle(fontSize: 18, height: 1.6),
          ),
          SizedBox(height: 24),
          Text(
            'The President\'s vision is to connect young people from Tanzania with fellow youth across East African Community member states to collaborate, exchange ideas, support one another, create opportunities, solve social and economic challenges, and contribute to sustainable national and regional development while supporting Tanzania\'s National Development Vision 2050.',
            style: TextStyle(fontSize: 18, height: 1.6),
          ),
          SizedBox(height: 24),
          Text(
            'YDNEA is different from other organizations because it operates as an active youth community where members collaborate, innovate, learn together, and build opportunities together.',
            style: TextStyle(fontSize: 18, height: 1.6, fontWeight: FontWeight.w600, color: Color(0xFF0288D1)),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionVisionSection(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      child: Wrap(
        spacing: 32,
        runSpacing: 32,
        alignment: WrapAlignment.center,
        children: [
          _buildCard('Mission', 'Empower young people through leadership, education, innovation, entrepreneurship, technology, investment, and community development.', Icons.flag),
          _buildCard('Vision', 'To become East Africa\'s leading youth community inspiring innovation, sustainable development, transformational leadership, and regional cooperation.', Icons.visibility),
          _buildCard('Core Values', 'Leadership, Integrity, Innovation, Unity, Transparency, Accountability, Professionalism, Inclusiveness, Respect, Service.', Icons.diamond),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String content, IconData icon) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F9FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE1EBF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: const Color(0xFF0288D1)),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text(content, style: const TextStyle(fontSize: 16, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildActivitiesSection(BuildContext context) {
    final activities = [
      'Develops youth leadership.',
      'Provides education and life skills.',
      'Supports entrepreneurship.',
      'Promotes investment education and financial literacy.',
      'Creates employment opportunities through arts, media, technology and digital innovation.',
      'Supports vulnerable people and communities.',
      'Organizes humanitarian and community outreach programs.',
      'Collaborates with governments, NGOs, private institutions and development partners.',
      'Represent youth challenges before relevant authorities including government institutions.',
      'Provides grants, youth empowerment opportunities and financing initiatives where applicable.',
      'Develops innovative digital systems and programs enabling young people to earn income through social media and digital opportunities in collaboration with partners across Africa and Europe.',
      'Promotes peace, unity, cooperation and sustainable development.'
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Column(
        children: [
          const Text(
            'What We Do',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF0288D1)),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: activities.map((activity) => _ActivityCard(text: activity)).toList(),
          ),
        ],
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final String text;
  const _ActivityCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF0288D1), size: 24),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 15, height: 1.4))),
        ],
      ),
    );
  }
}
