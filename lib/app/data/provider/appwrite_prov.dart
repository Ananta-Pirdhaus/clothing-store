import 'package:appwrite/appwrite.dart';

class AppWriteProvider{

  Client client = Client();
  AppWriteProvider()
  {
    client.setEndpoint("https://cloud.appwrite.io/v1")
    .setProject("65662d04e29864c2475d")
    .setSelfSigned(status: true);
  }
  
}