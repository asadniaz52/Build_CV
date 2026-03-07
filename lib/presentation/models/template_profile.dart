import 'package:flutter/material.dart';

class TemplateProfile {
  const TemplateProfile({
    required this.id,
    required this.name,
    required this.primary,
    required this.secondary,
    required this.background,
  });

  final int id;
  final String name;
  final Color primary;
  final Color secondary;
  final Color background;
}

const templateProfiles = <TemplateProfile>[
  TemplateProfile(
    id: 1,
    name: 'Classic Blue',
    primary: Color(0xFF1358A3),
    secondary: Color(0xFF6A6A6A),
    background: Color(0xFFF6F8FC),
  ),
  TemplateProfile(
    id: 2,
    name: 'Modern Navy',
    primary: Color(0xFF1D3557),
    secondary: Color(0xFF596780),
    background: Color(0xFFF7F9FC),
  ),
  TemplateProfile(
    id: 3,
    name: 'Elegant Purple',
    primary: Color(0xFF5E548E),
    secondary: Color(0xFF6D6875),
    background: Color(0xFFFBF9FD),
  ),
  TemplateProfile(
    id: 4,
    name: 'Emerald Pro',
    primary: Color(0xFF0E8A6A),
    secondary: Color(0xFF4D6D63),
    background: Color(0xFFF5FCF9),
  ),
  TemplateProfile(
    id: 5,
    name: 'Slate Clean',
    primary: Color(0xFF2F4858),
    secondary: Color(0xFF61707C),
    background: Color(0xFFF5F7F9),
  ),
  TemplateProfile(
    id: 6,
    name: 'Coral Bold',
    primary: Color(0xFFD95D39),
    secondary: Color(0xFF7D665E),
    background: Color(0xFFFFF8F6),
  ),
  TemplateProfile(
    id: 7,
    name: 'Midnight',
    primary: Color(0xFF264653),
    secondary: Color(0xFF4A6572),
    background: Color(0xFFF7FAFB),
  ),
  TemplateProfile(
    id: 8,
    name: 'Rose Minimal',
    primary: Color(0xFFB56576),
    secondary: Color(0xFF7E6975),
    background: Color(0xFFFFF7FA),
  ),
  TemplateProfile(
    id: 9,
    name: 'Crimson Edge',
    primary: Color(0xFF9E2A2B),
    secondary: Color(0xFF6D3A3A),
    background: Color(0xFFFCF6F6),
  ),
  TemplateProfile(
    id: 10,
    name: 'Golden Elite',
    primary: Color(0xFF8A6D1F),
    secondary: Color(0xFF70624E),
    background: Color(0xFFFFFBF1),
  ),
];
