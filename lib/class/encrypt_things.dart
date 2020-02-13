import 'package:death_delay/secret/secret.dart';
import 'package:encrypt/encrypt.dart';

class EncryptThings {

  void test(){
    final plainText = '{"i":"aaaaaaaaaa","n":"Lutz Knoll","a":"18062001","s":["Chinidin"],"m":["Penicillin"],"l":["epilepsie","diabetes"]}';



//    print(encrypted.base64); //2Bp6HB1QllaG0Mpv0sbOUQqZVrLmoU4/uz/fwwx1uaD2jmHoYE+oUxbbd+9mDyZy3dPKwuh535pHu9nq4Ez7Tq9J5AYrre2Wau0NSfLnXXiib/FnDcKJGJaCIORxdN76tqXItBhWLonwPcptwIRHTxRfiKWIpwABPsREd3h+/9I=
  }

  String decrypt(String substring) {
    final key = Key.fromUtf8(Secret.key);
    final encrypter = Encrypter(AES(key));
    final iv = IV.fromLength(16);
    return encrypter.decrypt64(substring, iv: iv);
  }
}