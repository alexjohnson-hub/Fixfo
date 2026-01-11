import 'package:flutter/material.dart';

class ServiceProvidersScreen extends StatefulWidget {
  final String categoryName;
  final IconData categoryIcon;

  const ServiceProvidersScreen({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
  });

  @override
  State<ServiceProvidersScreen> createState() => _ServiceProvidersScreenState();
}

class _ServiceProvidersScreenState extends State<ServiceProvidersScreen> {
  // Sample providers data - expanded list
  final List<Map<String, dynamic>> _providers = [
    {
      'name': 'Elite Plumbing Solutions',
      'type': 'team',
      'subtitle': 'Full-Service Agency',
      'rating': 4.9,
      'reviews': 342,
      'experience': '5+ Professionals',
      'badge': 'Verified Agency',
      'badgeColor': 0xFF3366FF,
      'price': 49,
      'isOnline': true,
    },
    {
      'name': 'James Anderson',
      'type': 'individual',
      'subtitle': 'Master Plumber',
      'rating': 4.9,
      'reviews': 128,
      'experience': '8 yrs exp',
      'badge': 'Verified',
      'badgeColor': 0xFF3366FF,
      'price': 45,
      'isOnline': true,
    },
    {
      'name': 'Sarah Martinez',
      'type': 'individual',
      'subtitle': 'Pipe Repair Specialist',
      'rating': 4.8,
      'reviews': 94,
      'experience': '5 yrs exp',
      'badge': 'Quick Reply',
      'badgeColor': 0xFFFF9800,
      'price': 39,
      'isOnline': true,
    },
    {
      'name': 'Michael Chen',
      'type': 'individual',
      'subtitle': 'Installation Pro',
      'rating': 4.7,
      'reviews': 215,
      'experience': '12 yrs exp',
      'badge': 'Top Rated',
      'badgeColor': 0xFF4CAF50,
      'price': 55,
      'isOnline': false,
    },
    {
      'name': 'Pro Fix Team',
      'type': 'team',
      'subtitle': 'Emergency Services',
      'rating': 4.8,
      'reviews': 187,
      'experience': '8+ Professionals',
      'badge': 'Verified Agency',
      'badgeColor': 0xFF3366FF,
      'price': 59,
      'isOnline': true,
    },
    {
      'name': 'David Wilson',
      'type': 'individual',
      'subtitle': 'Drain Specialist',
      'rating': 4.6,
      'reviews': 76,
      'experience': '6 yrs exp',
      'badge': 'Verified',
      'badgeColor': 0xFF3366FF,
      'price': 42,
      'isOnline': true,
    },
    {
      'name': 'HomeServe Experts',
      'type': 'team',
      'subtitle': 'Complete Home Solutions',
      'rating': 4.9,
      'reviews': 423,
      'experience': '12+ Professionals',
      'badge': 'Top Rated',
      'badgeColor': 0xFF4CAF50,
      'price': 65,
      'isOnline': true,
    },
    {
      'name': 'Robert Taylor',
      'type': 'individual',
      'subtitle': 'Leak Detection Expert',
      'rating': 4.7,
      'reviews': 156,
      'experience': '10 yrs exp',
      'badge': 'Quick Reply',
      'badgeColor': 0xFFFF9800,
      'price': 48,
      'isOnline': false,
    },
    {
      'name': 'Emily Brown',
      'type': 'individual',
      'subtitle': 'Bathroom Specialist',
      'rating': 4.8,
      'reviews': 89,
      'experience': '4 yrs exp',
      'badge': 'Verified',
      'badgeColor': 0xFF3366FF,
      'price': 38,
      'isOnline': true,
    },
    {
      'name': 'Quick Response Plumbing',
      'type': 'team',
      'subtitle': '24/7 Emergency Service',
      'rating': 4.6,
      'reviews': 298,
      'experience': '6+ Professionals',
      'badge': 'Quick Reply',
      'badgeColor': 0xFFFF9800,
      'price': 55,
      'isOnline': true,
    },
    {
      'name': 'Alex Thompson',
      'type': 'individual',
      'subtitle': 'Water Heater Expert',
      'rating': 4.5,
      'reviews': 67,
      'experience': '7 yrs exp',
      'badge': 'Verified',
      'badgeColor': 0xFF3366FF,
      'price': 44,
      'isOnline': false,
    },
    {
      'name': 'Jennifer Lee',
      'type': 'individual',
      'subtitle': 'Kitchen Plumbing Pro',
      'rating': 4.9,
      'reviews': 134,
      'experience': '9 yrs exp',
      'badge': 'Top Rated',
      'badgeColor': 0xFF4CAF50,
      'price': 52,
      'isOnline': true,
    },
  ];

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
        title: Text(
          '${widget.categoryName} Providers',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1D26),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color(0xFF1A1D26),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Provider Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              '${_providers.length} Professionals & Teams available',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Providers List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _providers.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _buildProviderCard(_providers[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildProviderCard(Map<String, dynamic> provider) {
    final isTeam = provider['type'] == 'team';

    return Container(
      padding: const EdgeInsets.all(16),
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
        children: [
          // Top Row - Avatar/Icon, Name, Rating
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar or Team Icon
              Stack(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: isTeam
                            ? [
                                const Color(0xFF3366FF).withOpacity(0.2),
                                const Color(0xFF3366FF).withOpacity(0.1),
                              ]
                            : [
                                const Color(0xFFFF9966),
                                const Color(0xFFFF7744),
                              ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: isTeam
                        ? const Icon(
                            Icons.groups_rounded,
                            color: Color(0xFF3366FF),
                            size: 28,
                          )
                        : Center(
                            child: Text(
                              provider['name'].toString().substring(0, 1),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ),
                  // Online indicator
                  if (provider['isOnline'] == true)
                    Positioned(
                      bottom: 2,
                      left: 2,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CAF50),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 14),
              // Name, Subtitle, Experience
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1D26),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      provider['subtitle'],
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Experience & Badge
                    Row(
                      children: [
                        Icon(
                          isTeam ? Icons.people_outline : Icons.work_outline,
                          size: 14,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          provider['experience'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.verified,
                          size: 14,
                          color: Color(provider['badgeColor']),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          provider['badge'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(provider['badgeColor']),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Rating
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xFFFFC107),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    provider['rating'].toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1D26),
                    ),
                  ),
                  Text(
                    ' (${provider['reviews']})',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Bottom Row - Price & Book Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Price
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'STARTING FROM',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[500],
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$${provider['price']}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1D26),
                          ),
                        ),
                        TextSpan(
                          text: '/hr',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Book Now Button
              GestureDetector(
                onTap: () {
                  // Navigate to booking screen
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3366FF),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF3366FF).withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Book Now',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
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
