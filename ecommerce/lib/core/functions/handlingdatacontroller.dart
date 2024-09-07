// ده استيراد لكلاس StatusRequest اللي هيتم استخدامه في الميثود دي.
import 'package:ecommerce/core/class/statusrequest.dart';

handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
