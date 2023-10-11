
class User {
  String? id, orgId, bankNumber, bankCode,  lunchCreditBalance;
  String? firstName, lastName, email, phone, profilePic , bankRegion, currency, currencyCode, bankName, orgName, isAdmin ;

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


  // {firstName: Akams, lastName: Era, email: romanricakam@gmail.com, phone: 67357253, profilePic: /app/storage/romanricakam@gmail.com.png, userId: 25, role: User, refreshToken: null, resetToken: 8104, bankNumber: 100000020, bankCode: 257801, bankName: FLC, bankRegion: Jupiter, orgId: 2, currency: null, currencyCode: null, organization_Name: Eagles Food, isAdmin: false, lunchCreditBalance: 60, createdAt: 2023-10-03T04:02:51, updatedAt: 2023-10-03T04:02:51}

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
        id: data['Id'],
        email: data['Email'],
        firstName: data['FirstName'],
        lastName: data['LastName'],
        phone: data['Phone'],
        isAdmin: data['IsAdmin'],
        orgId: data['OrgId'],
        bankNumber: data['BankNumber'],
        bankCode: data['BankCode'],
        bankName: data['BankName'],
        bankRegion: data['BankRegion'],
        currency: data['Currency'],
        currencyCode: data['CurrencyCode'],
        lunchCreditBalance: data['LunchCreditBalance'],
        profilePic: data['ProfilePic'] ?? '',
        orgName: data['organization_name']
    );
  }

  Map<String, dynamic> toJson() => {
    'Id': id,
    'Email': email,
    'FirstName': firstName,
    'LastName': lastName,
    'Phone' : phone,
    'IsAdmin': isAdmin,
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