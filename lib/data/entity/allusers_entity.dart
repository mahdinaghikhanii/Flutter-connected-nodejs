class AllUsersEntity {
  final int id;
  final String username;
  final String email;
  final String password;

  AllUsersEntity(this.id, this.username, this.email, this.password);

  AllUsersEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        email = json['email'],
        password = json['password'];
}
