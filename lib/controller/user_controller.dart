import 'package:get/get.dart';
import 'package:money_record/data/models/user.dart';

class UserController extends GetxController {
  final _data = User().obs;
  User get data => _data.value;

  setData(User user) => _data.value = user;
}
