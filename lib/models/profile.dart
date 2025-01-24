class Profile {
  final String id;
  final String name;
  final String avatar;
  final String wxId;
  final String region;
  final String signature;

  Profile({
    required this.id,
    required this.name,
    required this.avatar,
    required this.wxId,
    this.region = '',
    this.signature = '',
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      wxId: json['wxId'] as String,
      region: json['region'] as String? ?? '',
      signature: json['signature'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'wxId': wxId,
      'region': region,
      'signature': signature,
    };
  }
}
