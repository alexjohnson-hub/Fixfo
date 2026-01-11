import 'package:flutter/material.dart';
import 'service_providers_screen.dart';

class AllServicesScreen extends StatefulWidget {
  const AllServicesScreen({super.key});

  @override
  State<AllServicesScreen> createState() => _AllServicesScreenState();
}

class _AllServicesScreenState extends State<AllServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF1A1D26),
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'All Services',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1D26),
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            _buildSearchBar(),
            const SizedBox(height: 24),
            // Recommended for You
            _buildRecommendedSection(),
            const SizedBox(height: 28),
            // Home Maintenance
            _buildCategorySection(
              'Home Maintenance',
              [
                {'icon': Icons.plumbing, 'label': 'Plumbing'},
                {'icon': Icons.electrical_services, 'label': 'Electrical'},
                {'icon': Icons.ac_unit, 'label': 'AC Repair'},
                {'icon': Icons.handyman, 'label': 'Appliance'},
              ],
            ),
            const SizedBox(height: 28),
            // Cleaning & Repair
            _buildCategorySection(
              'Cleaning & Repair',
              [
                {'icon': Icons.cleaning_services, 'label': 'Home Cleaning'},
                {'icon': Icons.format_paint, 'label': 'Painting'},
                {'icon': Icons.carpenter, 'label': 'Carpentry'},
                {'icon': Icons.roofing, 'label': 'Roofing'},
              ],
            ),
            const SizedBox(height: 28),
            // Outdoor & Specialty
            _buildCategorySection(
              'Outdoor & Specialty',
              [
                {'icon': Icons.yard, 'label': 'Gardening'},
                {'icon': Icons.pest_control, 'label': 'Pest Control'},
                {'icon': Icons.smart_toy, 'label': 'Smart Home'},
                {'icon': Icons.security, 'label': 'Security'},
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE8ECF4)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.grey[400],
              size: 22,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Search for a service...',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedSection() {
    final recommendedServices = [
      {'icon': Icons.cleaning_services, 'label': 'Deep Cleaning'},
      {'icon': Icons.plumbing, 'label': 'Kitchen\nPlumbing'},
      {'icon': Icons.yard, 'label': 'Garden\nMaintenance'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recommended for You',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1D26),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recommendedServices.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return _buildRecommendedCard(
                  recommendedServices[index]['icon'] as IconData,
                  recommendedServices[index]['label'] as String,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedCard(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        _navigateToProviders(label.replaceAll('\n', ' '), icon);
      },
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE8ECF4)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Pick Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF3366FF),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'TOP PICK',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            // Icon
            Icon(
              icon,
              color: const Color(0xFF3366FF),
              size: 32,
            ),
            const SizedBox(height: 8),
            // Label
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1D26),
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToProviders(String categoryName, IconData categoryIcon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceProvidersScreen(
          categoryName: categoryName,
          categoryIcon: categoryIcon,
        ),
      ),
    );
  }

  Widget _buildCategorySection(String title, List<Map<String, dynamic>> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1D26),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3366FF),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Category Items - Horizontal scroll
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemBuilder: (context, index) {
                return _buildCategoryItem(
                  items[index]['icon'] as IconData,
                  items[index]['label'] as String,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        _navigateToProviders(label, icon);
      },
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE8ECF4)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: const Color(0xFF3366FF),
                size: 28,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1D26),
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_rounded, 'Home', true),
              _buildNavItem(Icons.calendar_today_rounded, 'Bookings', false),
              _buildNavItem(Icons.headset_mic_rounded, 'Help', false),
              _buildNavItem(Icons.person_rounded, 'Profile', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFF3366FF).withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF3366FF) : Colors.grey[400],
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? const Color(0xFF3366FF) : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
