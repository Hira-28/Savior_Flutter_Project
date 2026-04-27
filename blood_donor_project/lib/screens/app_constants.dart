import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFE8304A);
  static const Color primaryLight = Color(0xFFFFECEE);
  static const Color primaryDark = Color(0xFFC0203A);
  static const Color background = Color(0xFFF8F8F8);
  static const Color white = Colors.white;
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF888888);
  static const Color textLight = Color(0xFFBBBBBB);
  static const Color mapBg = Color(0xFFE8EFF5);
  static const Color mapBlock = Color(0xFFD8E8C8);
}

const List<String> bloodTypes = [
  'A+',
  'A-',
  'B+',
  'B-',
  'O+',
  'O-',
  'AB+',
  'AB-',
];

final List<Map<String, dynamic>> donorsList = [
  {
    'id': 1,
    'name': 'Mehedi Hasan',
    'blood': 'B+',
    'location': 'Savar, Dhaka',
    'time': '5 Min Ago',
    'desc': 'Need urgent donor for cardiac surgery scheduled tomorrow morning.',
    'available': true,
    'age': 28,
    'phone': '+1 202-555-0101',
    'donations': 12,
    'color': Color(0xFFE8304A),
  },
  {
    'id': 2,
    'name': 'Enamul Haque',
    'blood': 'A-',
    'location': 'Mirpur, Dhaka',
    'time': '12 Min Ago',
    'desc': 'Patient undergoing chemotherapy requires regular transfusions.',
    'available': true,
    'age': 34,
    'phone': '+1 305-555-0182',
    'donations': 7,
    'color': Color(0xFF2196F3),
  },
  {
    'id': 3,
    'name': 'Somoy',
    'blood': 'O+',
    'location': 'Mirpur-2, Dhaka',
    'time': '30 Min Ago',
    'desc': 'Emergency transfusion needed post-accident at NYC General.',
    'available': false,
    'age': 41,
    'phone': '+1 212-555-0143',
    'donations': 23,
    'color': Color(0xFF4CAF50),
  },
  {
    'id': 4,
    'name': 'Wahid Tousif',
    'blood': 'AB+',
    'location': 'Uttara, Dhaka',
    'time': '1 Hr Ago',
    'desc':
        'Seeking compatible donor for planned surgical procedure next week.',
    'available': true,
    'age': 29,
    'phone': '+1 415-555-0167',
    'donations': 4,
    'color': Color(0xFF9C27B0),
  },
  {
    'id': 5,
    'name': 'Tanjir Anik',
    'blood': 'B-',
    'location': 'Dhanmondi, Dhaka',
    'time': '2 Hrs Ago',
    'desc': 'Rare blood type needed urgently. Hospital stocks depleted.',
    'available': true,
    'age': 36,
    'phone': '+1 713-555-0199',
    'donations': 15,
    'color': Color(0xFFFF9800),
  },
];

final List<Map<String, dynamic>> bloodBanksList = [
  {
    'id': 1,
    'name': 'Popular Blood Bank',
    'location': 'Dhaka, Bangladesh',
    'rating': 5.0,
    'hours': '8AM – 8PM',
    'phone': '+1 800-733-2767',
    'distance': '0.8 km',
    'reviews': 128,
    'emoji': '🏥',
    'desc':
        'Popular Blood Bank is a leading blood donation center in Dhaka, providing safe and reliable blood products to hospitals across Bangladesh. They have a strong commitment to community service and regularly organize blood drives.',
  },
  {
    'id': 2,
    'name': 'Islamic Blood Bank',
    'location': 'Dhaka, Bangladesh',
    'rating': 4.9,
    'hours': '7AM – 7PM',
    'phone': '+1 877-258-4825',
    'distance': '2.1 km',
    'reviews': 96,
    'emoji': '🏨',
    'desc':
        'Islamic Blood Bank is a trusted blood donation center in Dhaka, committed to providing high-quality blood products and services to hospitals and patients across Bangladesh.',
  },
  {
    'id': 3,
    'name': 'Lab Aid Blood Center',
    'location': 'Dhaka, Bangladesh',
    'rating': 3.5,
    'hours': '9AM – 6PM',
    'phone': '+1 800-933-2566',
    'distance': '3.4 km',
    'reviews': 256,
    'emoji': '🏗️',
    'desc':
        'Lab Aid Blood Center is a reliable blood donation center in Dhaka, providing safe and efficient blood collection and distribution services to hospitals across Bangladesh.',
  },
  {
    'id': 4,
    'name': 'Bardem Blood Center',
    'location': 'Dhaka, Bangladesh',
    'rating': 4.5,
    'hours': '8AM – 5PM',
    'phone': '+1 817-281-5433',
    'distance': '5.2 km',
    'reviews': 74,
    'emoji': '🏢',
    'desc':
        'Bardem Blood Center is a reputable blood donation center in Dhaka, providing safe and efficient blood collection and distribution services to hospitals across Bangladesh.',
  },
  {
    'id': 5,
    'name': 'Square Hospital Blood Bank',
    'location': 'Dhaka, Bangladesh',
    'rating': 5.0,
    'hours': '7AM – 9PM',
    'phone': '+1 800-847-6919',
    'distance': '6.7 km',
    'reviews': 189,
    'emoji': '🏪',
    'desc':
        'Square Hospital Blood Bank is a trusted blood donation center in Dhaka, committed to providing high-quality blood products and services to hospitals and patients across Bangladesh.',
  },
];

final List<Map<String, dynamic>> inboxList = [
  {
    'id': 1,
    'name': 'Mehedi Hasan',
    'msg': 'I can donate tomorrow morning, is that ok?',
    'time': '9:31',
    'unread': 2,
    'blood': 'O+',
    'color': Color(0xFFE8304A),
  },
  {
    'id': 2,
    'name': 'Enamul Haque',
    'msg': 'Thank you for your quick response!',
    'time': '9:28',
    'unread': 1,
    'blood': 'A+',
    'color': Color(0xFF2196F3),
  },
  {
    'id': 3,
    'name': 'Somoy',
    'msg': 'I am available this weekend for donation.',
    'time': '9:15',
    'unread': 0,
    'blood': 'B+',
    'color': Color(0xFF4CAF50),
  },
  {
    'id': 4,
    'name': 'Sadman Rafi',
    'msg': 'The hospital confirmed my appointment.',
    'time': '8:52',
    'unread': 0,
    'blood': 'A-',
    'color': Color(0xFFFF9800),
  },
  {
    'id': 5,
    'name': 'Wahid Tousif',
    'msg': 'Can we reschedule to next Tuesday?',
    'time': '8:30',
    'unread': 0,
    'blood': 'AB+',
    'color': Color(0xFF9C27B0),
  },
  {
    'id': 6,
    'name': 'Tanjir Anik',
    'msg': 'I need a donor urgently, please help!',
    'time': '7:45',
    'unread': 3,
    'blood': 'B+',
    'color': Color(0xFFE91E63),
  },
  {
    'id': 7,
    'name': 'Afjal Hossain',
    'msg': 'Thank you for saving my life!',
    'time': 'Yesterday',
    'unread': 0,
    'blood': 'O-',
    'color': Color(0xFF607D8B),
  },
  {
    'id': 8,
    'name': 'Hafizur Rahman',
    'msg': 'My blood type is O+ and I am ready.',
    'time': 'Yesterday',
    'unread': 0,
    'blood': 'O+',
    'color': Color(0xFF009688),
  },
];

final List<Map<String, dynamic>> notificationsList = [
  {
    'icon': '💧',
    'title': 'New Donor Match!',
    'desc': 'Mehedi Hasan (O+) is available near you.',
    'time': '5 min ago',
    'read': false,
    'type': 'match',
  },
  {
    'icon': '📋',
    'title': 'Blood Request',
    'desc': 'Urgent B+ needed at Square Hospital.',
    'time': '15 min ago',
    'read': false,
    'type': 'request',
  },
  {
    'icon': '⏰',
    'title': 'Donation Reminder',
    'desc': 'You haven\'t donated in 3 months. Stay a hero!',
    'time': '1 hr ago',
    'read': true,
    'type': 'reminder',
  },
  {
    'icon': '✅',
    'title': 'Donation Confirmed',
    'desc': 'Your last donation helped 3 people. Thank you!',
    'time': 'Yesterday',
    'read': true,
    'type': 'success',
  },
  {
    'icon': 'ℹ️',
    'title': 'Blood Bank Open',
    'desc': 'Square Hospital Blood Bank is open until 8PM today.',
    'time': 'Yesterday',
    'read': true,
    'type': 'info',
  },
  {
    'icon': '💧',
    'title': 'New Donor Match!',
    'desc': 'Afjal (A-) is 1.2 km away from you.',
    'time': '2 days ago',
    'read': true,
    'type': 'match',
  },
];

final List<Map<String, dynamic>> bloodRequestsList = [
  {
    'id': 1,
    'patient': 'Mehedi Hasan',
    'blood': 'A+',
    'units': 2,
    'location': 'Savar, Dhaka',
    'date': '2025-01-20',
    'status': 'pending',
    'urgency': 'urgent',
  },
  {
    'id': 2,
    'patient': 'Enamul Haque',
    'blood': 'O-',
    'units': 1,
    'location': 'Mirpur, Dhaka',
    'date': '2025-01-19',
    'status': 'fulfilled',
    'urgency': 'normal',
  },
  {
    'id': 3,
    'patient': 'Somoy',
    'blood': 'B+',
    'units': 3,
    'location': 'Mirpur-2, Dhaka',
    'date': '2025-01-18',
    'status': 'pending',
    'urgency': 'critical',
  },
];

final Map<int, List<Map<String, dynamic>>> chatMessages = {
  1: [
    {
      'from': 'them',
      'text': 'Hello! I saw your blood request. I am O+ and can help.',
      'time': '9:25',
    },
    {
      'from': 'me',
      'text': 'Thank you so much! When are you available?',
      'time': '9:26',
    },
    {
      'from': 'them',
      'text': 'I can donate tomorrow morning, is that ok?',
      'time': '9:27',
    },
    {
      'from': 'me',
      'text': 'Yes that works perfectly! The hospital is at 5th Ave.',
      'time': '9:28',
    },
    {
      'from': 'them',
      'text': 'Great, I will be there at 9AM sharp.',
      'time': '9:31',
    },
  ],
  6: [
    {
      'from': 'them',
      'text': 'I need a donor urgently, please help!',
      'time': '7:40',
    },
    {
      'from': 'me',
      'text': 'I saw your request. What blood type do you need?',
      'time': '7:42',
    },
    {'from': 'them', 'text': 'B+ blood type, very urgent!', 'time': '7:43'},
    {
      'from': 'me',
      'text': 'I am B+. Share the hospital details please.',
      'time': '7:45',
    },
  ],
};
