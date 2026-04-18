import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/shared_widgets.dart';
import 'blood_request_screen.dart';

class FindDonorScreen extends StatefulWidget {
  const FindDonorScreen({super.key});

  @override
  State<FindDonorScreen> createState() => _FindDonorScreenState();
}

class _FindDonorScreenState extends State<FindDonorScreen> {
  String _selectedBlood = 'All';
  String _selectedTab = 'All';

  List<Map<String, dynamic>> get _filtered {
    return donorsList.where((d) {
      final bloodMatch = _selectedBlood == 'All' || d['blood'] == _selectedBlood;
      return bloodMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppTopBar(
        title: 'Find Donors',
        onBack: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          _buildFilters(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _filtered.length,
              itemBuilder: (context, i) => _buildDonorCard(_filtered[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(3),
            child: Row(
              children: ['All', 'Available', 'Nearby'].map((tab) {
                final selected = _selectedTab == tab;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTab = tab),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: selected
                            ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)]
                            : null,
                      ),
                      child: Text(
                        tab,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                          color: selected ? AppColors.primary : AppColors.textGrey,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 36,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: ['All', ...bloodTypes].map((bt) {
                final selected = _selectedBlood == bt;
                return GestureDetector(
                  onTap: () => setState(() => _selectedBlood = bt),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: selected ? AppColors.primaryLight : AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: selected ? AppColors.primary : const Color(0xFFE0E0E0),
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      bt,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                        color: selected ? AppColors.primary : AppColors.textGrey,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonorCard(Map<String, dynamic> donor) {
    final isAvailable = (donor['available'] as bool?) ?? true;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row — avatar, name, blood badge
          Row(
            children: [
              AvatarWidget(
                name: donor['name'] as String,
                size: 50,
                color: donor['color'] as Color?,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      donor['name'] as String,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Availability status
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: isAvailable
                                ? const Color(0xFF4CAF50)
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          isAvailable ? 'Available' : 'Unavailable',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: isAvailable
                                ? const Color(0xFF4CAF50)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BloodBadge(type: donor['blood'] as String),
            ],
          ),
          const SizedBox(height: 10),

          // Description
          Text(
            donor['desc'] as String,
            style: const TextStyle(
              fontSize: 12.5,
              color: AppColors.textGrey,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 10),

          // Location row
          Row(
            children: [
              const Icon(Icons.location_on, color: AppColors.textLight, size: 14),
              const SizedBox(width: 4),
              Text(
                donor['location'] as String,
                style: const TextStyle(fontSize: 12, color: AppColors.textLight),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Action buttons — Request & Call
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 38,
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PostRequestScreen(),
                      ),
                    ),
                    icon: const Icon(Icons.water_drop, size: 15, color: AppColors.primary),
                    label: const Text(
                      'Request',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.primary, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 38,
                  child: ElevatedButton.icon(
                    onPressed: () => _showCallDialog(context, donor['name'] as String),
                    icon: const Icon(Icons.call, size: 15, color: Colors.white),
                    label: const Text(
                      'Call',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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

  void _showCallDialog(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Call Donor', style: TextStyle(fontWeight: FontWeight.w700)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.call, color: AppColors.primary, size: 32),
            ),
            const SizedBox(height: 12),
            Text(
              'Connect with $name via phone call?',
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textGrey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.grey.shade500)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Call Now', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}