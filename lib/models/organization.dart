class Organization {

  int id;
  String name;

  Organization({
    required this.id,
    required this.name
  });

  factory Organization.fromJson(Map<String, dynamic> data)=>
      Organization(
          id: data['id'],
          name: data['name']
      );

  Map<String, dynamic> toJson()=> {
    'id': id,
    'name': name
  };

}