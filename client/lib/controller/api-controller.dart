import 'package:get/get.dart';
import 'package:get/state_manager.dart';


class Apihandler extends GetxController{
  var res = '';
  var displayres = '';

  apiResult(){
    displayres = 'http://localhost:3000/api/search-user/$res';
  }
}