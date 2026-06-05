class ContactMessage {
  final String name;
  final String email;
  final String subject;
  final String message;

  ContactMessage({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

  factory ContactMessage.fromJson(Map<String, dynamic> json) {
    return ContactMessage(
      name: json['name'],
      email: json['email'],
      subject: json['subject'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'subject': subject,
      'message': message,
    };
  }
}
