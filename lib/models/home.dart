class Home {
  final String type;
  final Map<String, dynamic> data;

  Home({required this.type, required this.data});

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      type: json['type'],
      data: json,
    );
  }
}
