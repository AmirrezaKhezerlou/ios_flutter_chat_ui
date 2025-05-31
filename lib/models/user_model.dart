class UserProfileModel{
  final int userId;
  final String imgPath;
  final String name;
  final String userName;
  final bool havStory;

  UserProfileModel({required this.havStory, required this.imgPath, required this.name, required this.userName, required this.userId});

}