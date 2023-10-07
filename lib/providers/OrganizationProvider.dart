import 'package:flutter/cupertino.dart';
import 'package:hng_task3/models/org_request.dart';
import 'package:hng_task3/models/organization.dart';

class OrganizationProvider with ChangeNotifier{

  List<Organization> _organizations = [];
  bool _isLoading = false;
  List<OrgRequest> _org_request = [];

  List<Organization> get organizations  => _organizations;
  bool get isLoading => _isLoading;
  List<OrgRequest> get org_request => _org_request;

}