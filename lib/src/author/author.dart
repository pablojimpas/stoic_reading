/// A placeholder class that represents an entity or model.
class Author {
  const Author(this.id, this.name);

  final int id;

  final String name;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  static Author fromMap(Map<String, dynamic> map) {
    return Author(map['id'], map['name']);
  }
}
