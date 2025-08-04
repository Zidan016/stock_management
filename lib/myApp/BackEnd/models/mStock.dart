class Mstock {
  final int id;
  final String name;
  final int stok;

  const Mstock({
    required this.id,
    required this.name,
    required this.stok
  });

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'name': name,
      'stok': stok
    };
  }

  static Mstock fromMap(Map<String, dynamic> map){
    return Mstock(
      id: map['id'] as int,
      name: map['name'] as String,
      stok: map['stok'] as int
    );
  }
}