class UserModel {
  int? id;
  int? companyId;
  String? name;
  String? photo;
  String? email;
  int? idCmsPrivileges;
  String? cmsPrivilegesName;
  String? role;
  String? status;
  String? address;
  String? birthdate;
  late List<int> projectIds;
  String? clockIn;
  String? clockOut;

  UserModel({
    this.id,
    this.companyId,
    this.name,
    this.photo,
    this.email,
    this.idCmsPrivileges,
    this.cmsPrivilegesName,
    this.role,
    this.status,
    this.address,
    this.birthdate,
    this.projectIds = const [],
    this.clockIn,
    this.clockOut,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    photo = json['photo'];
    email = json['email'];
    idCmsPrivileges = json['id_cms_privileges'];
    cmsPrivilegesName = json['cms_privileges_name'];
    role = json['role'];
    status = json['status'];
    address = json['address'];
    birthdate = json['birthdate'];
    projectIds =
        json['project_ids'] != null ? json['project_ids'].cast<int>() : [];
    clockIn = json['clock_in'];
    clockOut = json['clock_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['name'] = name;
    data['photo'] = photo;
    data['email'] = email;
    data['id_cms_privileges'] = idCmsPrivileges;
    data['cms_privileges_name'] = cmsPrivilegesName;
    data['role'] = role;
    data['status'] = status;
    data['address'] = address;
    data['birthdate'] = birthdate;
    data['project_ids'] = projectIds;
    data['clock_in'] = clockIn;
    data['clock_out'] = clockOut;
    return data;
  }
}
