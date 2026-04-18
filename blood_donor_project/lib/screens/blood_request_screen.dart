import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/shared_widgets.dart';

class BloodRequestScreen extends StatefulWidget {
  const BloodRequestScreen({super.key});

  @override
  State<BloodRequestScreen> createState() => _BloodRequestScreenState();
}

class _BloodRequestScreenState extends State<BloodRequestScreen> {
  List<Map<String, dynamic>> _requests = List.from(bloodRequestsList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppTopBar(title: 'Blood Requests', onBack: () => Navigator.pop(context)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PostRequestScreen()),
                  ).then((newReq) {
                    if (newReq != null) setState(() => _requests.insert(0, newReq));
                  }),
                  icon: const Icon(Icons.add_rounded, color: Colors.white),
                  label: const Text('Post A Request',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'My Requests',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.textDark),
                ),
                const SizedBox(height: 14),
                ..._requests.map((r) => _buildRequestCard(r)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestCard(Map<String, dynamic> r) {
    final urgencyColor = r['urgency'] == 'critical'
        ? const Color(0xFFC0203A)
        : r['urgency'] == 'urgent'
            ? const Color(0xFF856404)
            : const Color(0xFF1B5E20);

    final urgencyBg = r['urgency'] == 'critical'
        ? const Color(0xFFFFE5E5)
        : r['urgency'] == 'urgent'
            ? const Color(0xFFFFF3CD)
            : const Color(0xFFE8F5E9);

    final statusColor = r['status'] == 'fulfilled' ? const Color(0xFF1B5E20) : AppColors.primary;
    final statusBg = r['status'] == 'fulfilled' ? const Color(0xFFE8F5E9) : AppColors.primaryLight;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      r['patient'] as String,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.textDark),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 12, color: AppColors.textLight),
                        const SizedBox(width: 2),
                        Text(r['location'] as String,
                            style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
                      ],
                    ),
                  ],
                ),
              ),
              BloodBadge(type: r['blood'] as String),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.water_drop_rounded, size: 14, color: AppColors.textGrey),
              const SizedBox(width: 4),
              Text('${r['units']} units',
                  style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
              const SizedBox(width: 12),
              const Icon(Icons.calendar_today_rounded, size: 14, color: AppColors.textGrey),
              const SizedBox(width: 4),
              Text(r['date'] as String,
                  style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
              const Spacer(),
              _chip((r['urgency'] as String).toUpperCase(), urgencyColor, urgencyBg),
              const SizedBox(width: 6),
              _chip((r['status'] as String).toUpperCase(), statusColor, statusBg),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, Color textColor, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: textColor)),
    );
  }
}

// ── Post Request Screen ───────────────────────────────────────────────────────
class PostRequestScreen extends StatefulWidget {
  const PostRequestScreen({super.key});

  @override
  State<PostRequestScreen> createState() => _PostRequestScreenState();
}

class _PostRequestScreenState extends State<PostRequestScreen> {
  final _patientCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _locationCtrl = TextEditingController();
  String _selectedBlood = 'B+';
  double _units = 2;
  String _gender = '';
  DateTime? _date;
  bool _submitted = false;

  @override
  void dispose() {
    _patientCtrl.dispose();
    _phoneCtrl.dispose();
    _locationCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_submitted) return;
    setState(() => _submitted = true);
  }

  @override
  Widget build(BuildContext context) {
    if (_submitted) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppTopBar(title: 'Post A Request', onBack: () => Navigator.pop(context)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
                  child: const Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 44),
                ),
                const SizedBox(height: 20),
                const Text('Request Sent!',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.textDark)),
                const SizedBox(height: 10),
                const Text(
                  'Your blood request has been posted. Donors will contact you soon.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textGrey, height: 1.6, fontSize: 14),
                ),
                const SizedBox(height: 28),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, {
                    'patient': _patientCtrl.text.isEmpty ? 'New Patient' : _patientCtrl.text,
                    'blood': _selectedBlood,
                    'units': _units.round(),
                    'location': _locationCtrl.text.isEmpty ? 'Unknown' : _locationCtrl.text,
                    'date': DateTime.now().toString().split(' ')[0],
                    'status': 'pending',
                    'urgency': 'urgent',
                  }),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text('Back to Requests',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppTopBar(title: 'Post A Request', onBack: () => Navigator.pop(context)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _label('Select Patient Name'),
            _textField(_patientCtrl, 'Patient Name', Icons.person_outline_rounded),
            const SizedBox(height: 16),
            _label('Select Blood Group'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: bloodTypes.map((bt) {
                final selected = _selectedBlood == bt;
                return GestureDetector(
                  onTap: () => setState(() => _selectedBlood = bt),
                  child: Container(
                    width: 72,
                    height: 44,
                    decoration: BoxDecoration(
                      color: selected ? AppColors.primaryLight : AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selected ? AppColors.primary : const Color(0xFFE0E0E0),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        bt,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: selected ? AppColors.primary : AppColors.textGrey,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            _label('Select Blood Unit: ${_units.round()} Unit${_units.round() > 1 ? 's' : ''}'),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: AppColors.primary,
                inactiveTrackColor: AppColors.primaryLight,
                thumbColor: AppColors.primary,
                overlayColor: AppColors.primary.withOpacity(0.1),
              ),
              child: Slider(
                value: _units,
                min: 1,
                max: 10,
                divisions: 9,
                onChanged: (v) => setState(() => _units = v),
              ),
            ),
            const SizedBox(height: 8),
            _label('Mobile Number'),
            _textField(_phoneCtrl, 'Mobile Number', Icons.phone_outlined, type: TextInputType.phone),
            const SizedBox(height: 16),
            _label('Select A Location'),
            _textField(_locationCtrl, 'Enter location', Icons.location_on_outlined),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label('Gender'),
                      Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE0E0E0), width: 1.5),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _gender.isEmpty ? null : _gender,
                            hint: const Text('Gender',
                                style: TextStyle(color: AppColors.textLight, fontSize: 14)),
                            isExpanded: true,
                            items: ['Male', 'Female', 'Other']
                                .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                                .toList(),
                            onChanged: (v) => setState(() => _gender = v ?? ''),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label('Date'),
                      GestureDetector(
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(const Duration(days: 365)),
                            builder: (context, child) => Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(primary: AppColors.primary),
                              ),
                              child: child!,
                            ),
                          );
                          if (picked != null) setState(() => _date = picked);
                        },
                        child: Container(
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFE0E0E0), width: 1.5),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _date == null
                                      ? 'DD/MM/YY'
                                      : '${_date!.day}/${_date!.month}/${_date!.year}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: _date == null ? AppColors.textLight : AppColors.textDark,
                                  ),
                                ),
                              ),
                              const Icon(Icons.calendar_today_rounded, size: 16, color: AppColors.textLight),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text('Send Request',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textDark)),
      );

  Widget _textField(
    TextEditingController ctrl,
    String hint,
    IconData icon, {
    TextInputType type = TextInputType.text,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1.5),
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          Icon(icon, size: 18, color: AppColors.textLight),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: ctrl,
              keyboardType: type,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                hintStyle: const TextStyle(color: AppColors.textLight, fontSize: 14),
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}