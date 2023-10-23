import 'package:bls/utils/user/user_types.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Role role = Role.student;
  void setRole(Role role) {
    this.role = role;
    update();
  }
}
