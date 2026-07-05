import 'package:flutter/material.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget body;
  final String currentRoute;

  const ResponsiveScaffold({
    super.key,
    required this.body,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    
    return Scaffold(
      appBar: isDesktop
          ? AppBar(
              title: const Text('YDNEA', style: TextStyle(fontWeight: FontWeight.bold)),
              actions: _buildNavActions(context),
            )
          : AppBar(
              title: const Text('YDNEA', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
      drawer: isDesktop ? null : _buildDrawer(context),
      body: body,
    );
  }

  List<Widget> _buildNavActions(BuildContext context) {
    return [
      _NavItem(title: 'Home', route: '/', currentRoute: currentRoute),
      _NavItem(title: 'About Us', route: '/about', currentRoute: currentRoute),
      _NavItem(title: 'Leadership', route: '/leadership/register', currentRoute: currentRoute),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ElevatedButton(
          onPressed: null,
          child: Text('Donate'),
        ),
      ),
    ];
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF0288D1),
            ),
            child: Text(
              'YDNEA Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          _DrawerItem(title: 'Home', route: '/', currentRoute: currentRoute),
          _DrawerItem(title: 'About Us', route: '/about', currentRoute: currentRoute),
          _DrawerItem(title: 'Leadership', route: '/leadership/register', currentRoute: currentRoute),
          // Additional links would go here
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final String route;
  final String currentRoute;

  const _NavItem({
    required this.title,
    required this.route,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = route == currentRoute;
    return TextButton(
      onPressed: () {
        if (!isActive) {
          Navigator.pushNamed(context, route);
        }
      },
      style: TextButton.styleFrom(
        foregroundColor: isActive ? const Color(0xFF0288D1) : Colors.black87,
      ),
      child: Text(title, style: TextStyle(fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String title;
  final String route;
  final String currentRoute;

  const _DrawerItem({
    required this.title,
    required this.route,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = route == currentRoute;
    return ListTile(
      title: Text(title, style: TextStyle(color: isActive ? const Color(0xFF0288D1) : Colors.black87, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
      onTap: () {
        Navigator.pop(context); // Close drawer
        if (!isActive) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }
}
