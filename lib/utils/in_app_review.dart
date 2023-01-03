import 'package:in_app_review/in_app_review.dart';

class InAppReviewUtils {
  static final InAppReview _inAppReview = InAppReview.instance;

  static requestReview() async {
    if (await _inAppReview.isAvailable()) {
      _inAppReview.requestReview();
    }
  }
}
