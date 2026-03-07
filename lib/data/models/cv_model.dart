class CVModel {
  CVModel({
    this.id,
    required this.fullName,
    required this.jobTitle,
    required this.email,
    required this.phone,
    required this.summary,
    required this.education,
    required this.experience,
    required this.skills,
    required this.templateId,
    required this.updatedAt,
  });

  final int? id;
  final String fullName;
  final String jobTitle;
  final String email;
  final String phone;
  final String summary;
  final String education;
  final String experience;
  final String skills;
  final int templateId;
  final DateTime updatedAt;

  CVModel copyWith({
    int? id,
    String? fullName,
    String? jobTitle,
    String? email,
    String? phone,
    String? summary,
    String? education,
    String? experience,
    String? skills,
    int? templateId,
    DateTime? updatedAt,
  }) {
    return CVModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      jobTitle: jobTitle ?? this.jobTitle,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      summary: summary ?? this.summary,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      skills: skills ?? this.skills,
      templateId: templateId ?? this.templateId,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'full_name': fullName,
      'job_title': jobTitle,
      'email': email,
      'phone': phone,
      'summary': summary,
      'education': education,
      'experience': experience,
      'skills': skills,
      'template_id': templateId,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory CVModel.fromMap(Map<String, dynamic> map) {
    return CVModel(
      id: map['id'] as int,
      fullName: map['full_name'] as String,
      jobTitle: map['job_title'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      summary: map['summary'] as String,
      education: map['education'] as String,
      experience: map['experience'] as String,
      skills: map['skills'] as String,
      templateId: map['template_id'] as int,
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }

  static CVModel empty() {
    return CVModel(
      fullName: '',
      jobTitle: '',
      email: '',
      phone: '',
      summary: '',
      education: '',
      experience: '',
      skills: '',
      templateId: 1,
      updatedAt: DateTime.now(),
    );
  }
}
