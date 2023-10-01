
class User {
  final String? id, orgId, bankNumber, bankCode,  lunchCreditBalance;
  final String? firstName, lastName, email, phone, profilePic , bankRegion, currency, currencyCode, bankName, orgName ;
  final bool? isAdmin;

  User({
    required this.id,
    required this.orgId,
    required this.bankNumber,
    required this.bankCode,
    required this.lunchCreditBalance,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.profilePic,
    required this.bankRegion,
    required this.currency,
    required this.currencyCode,
    required this.bankName,
    required this.isAdmin,
    required this.orgName
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
        id: data['Id'],
        email: data['Email'],
        firstName: data['FirstName'],
        lastName: data['LastName'],
        phone: data['Phone'],
        isAdmin: data['isAdmin'],
        orgId: data['OrgId'],
        bankNumber: data['BankNumber'],
        bankCode: data['BankCode'],
        bankName: data['BankName'],
        bankRegion: data['BankRegion'],
        currency: data['Currency'],
        currencyCode: data['CurrencyCode'],
        lunchCreditBalance: data['LunchCreditBalance'],
        profilePic: data['ProfilePic'],
        orgName: data['organization_name']
    );
  }

  Map<String, dynamic> toJson() => {
    'Id': id,
    'Email': email,
    'FirstName': firstName,
    'LastName': lastName,
    'Phone' : phone,
    'isAdmin': isAdmin,
    'OrgId': orgId,
    'BankNumber': bankNumber,
    'BankCode': bankCode,
    'BankName': bankName,
    'BankRegion': bankRegion,
    'Currency': currency,
    'CurrencyCode': currencyCode,
    'LunchCreditBalance': lunchCreditBalance,
    'ProfilePic': profilePic,
    'organization_name': orgName
  };
}