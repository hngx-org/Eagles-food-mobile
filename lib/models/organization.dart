class Organization {


  int id;
  String name, currencyCode;
  double lunchPrice;

  Organization({
    required this.id,
    required this.name,
    required this.lunchPrice,
    required this.currencyCode
  });

  factory Organization.fromJson(Map<String, dynamic> data)=>
      Organization(
          id: data['id'],
          name: data['name'],
          lunchPrice: data['lunchPrice'],
          currencyCode: data['currencyCode']
      );

  Map<String, dynamic> toJson()=> {
    'id': id,
    'name': name,
    'lunchPrice': lunchPrice,
    'currencyCode': currencyCode
  };

}