class UserModel{
  String name;
  String email;
  int id;

  UserModel(this.name, this.email, this.id);
  factory UserModel.fromJson(Map<String,dynamic> data){
    return UserModel(data['name'], data['email'], data['id']);
  }
}