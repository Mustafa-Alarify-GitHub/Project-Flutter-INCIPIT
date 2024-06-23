class Contact {
 late int id;
 late String name;

  Contact({required this.id, required this.name});

  Contact.fromMap(dynamic obj) {
    this.id = obj['id'];
    this.name = obj['name'];

  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id':id,
      'name': name

    };

    return map;
  }
}
