import 'package:get/get.dart';

import '../model/user_credential_model.dart';

class UserCredentialController extends GetxController {
  Rx<UserCredentialModel> userCredential = UserCredentialModel().obs;
}
