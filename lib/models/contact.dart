class Contact {
  final String id;
  final String name;
  final String avatarUrl;
  final String? description;
  final String? phone;
  final String? email;

  Contact({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.description,
    this.phone,
    this.email,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      avatarUrl: json['avatarUrl'],
      description: json['description'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
      'description': description,
      'phone': phone,
      'email': email,
    };
  }
}
