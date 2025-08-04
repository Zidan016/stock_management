class Mactivity {
  final int id;
  final int stockId;
  final int stock;
  final DateTime? date;

  const Mactivity({
    required this.id,
    required this.stockId,
    required this.stock,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stockId': stockId,
      'stock': stock,
      'date': date?.toIso8601String(), 
    };
  }

  static Mactivity fromMap(Map<String, dynamic> map) {
    return Mactivity(
      id: map['id'] as int,
      stockId: map['stockId'] as int,
      stock: map['stock'] as int,
      date: map['date'] != null ? DateTime.parse(map['date'] as String) : null,
    );
  }
}
