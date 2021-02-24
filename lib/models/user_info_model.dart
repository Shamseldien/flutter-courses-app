class UserInfo{

  static Map userInfo={};
  UserInfo({data}){
    userInfo = data;
  }


  static String getUserName()=>userInfo['result']['full_name'];
  static String getUserImage()=>userInfo['result']['image'];
  static String getUserEmail()=>userInfo['result']['email'];
}