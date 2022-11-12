import 'package:api_application/API/infobox_service.dart';
import 'package:api_application/API/validate_login.dart';
import 'package:api_application/API/view_infobox_details.dart';
import 'package:api_application/API_three/get_remarks_type.dart';
import 'package:api_application/API_two/get_mpin_api_details.dart';
import 'package:api_application/ProviderClass/add_details_floating_button.dart';
import 'package:api_application/ProviderClass/enter_details.dart';
import 'package:api_application/app_routes/app_routes.dart';
import 'package:api_application/ClassVillageAPI/village_details_from_api.dart';
import 'package:flutter/cupertino.dart';

import '../image_picker/img_picker.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.villageDetails: ((context) => const VillageDetails()),
      AppRoutes.validateLogIn: ((context) => const ValidateLoginAPI()),
      AppRoutes.infoBox: ((context) => const ServiceInfo()),
      AppRoutes.getMpin: ((context) => const getMpinDetails()),
      AppRoutes.getInfoBoxDetails: ((context) => DisplayData()),
      AppRoutes.getRemarkTypes: (context) => getRemarkTypes(),
      AppRoutes.imgPicker: (context) => ImagePickerClass(),
      AppRoutes.providerMain: (context) => providerMainClass(),
      AppRoutes.providerInput: (context) => ProviderInputClass()
    };
  }
}
