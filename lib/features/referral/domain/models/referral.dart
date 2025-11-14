class Referral {
  final String id;
  final String name;
  final String cedula;
  final String email;
  final String phone;
  final String status;
  final String message;
  final DateTime createdAt;

  const Referral({
    required this.id,
    required this.name,
    required this.cedula,
    required this.email,
    required this.phone,
    required this.status,
    required this.message,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cedula': cedula,
      'email': email,
      'phone': phone,
      'status': status,
      'message': message,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Referral.fromJson(Map<String, dynamic> json) {
    return Referral(
      id: json['id'] as String,
      name: json['name'] as String,
      cedula: json['cedula'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      status: json['status'] as String,
      message: json['message'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}
