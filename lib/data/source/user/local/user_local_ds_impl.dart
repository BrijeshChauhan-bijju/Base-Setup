import 'package:base_setup/data/local_auth/bio_metric/bio_metric_service.dart';
import 'package:base_setup/data/local_exception/app_local_exception.dart';
import 'package:base_setup/data/source/user/user_data_sources.dart';

class UserLocalDSImpl extends UserLocalDS {
  final BioMetricService? bioMetricService;

  UserLocalDSImpl({
     this.bioMetricService,
  });

  @override
  Future<bool> checkBioMetricSupport() {
    try {
      return bioMetricService!.canCheckBiometric();
    } catch (exception) {
      throw AppLocalException(
        appLocalExceptionType: AppLocalExceptionType.NO_BIO_METRIC_SUPPORT,
      );
    }
  }

  @override
  Future<bool> authenticateBioMetric(String title, String localisedReason) {
    try {
      return bioMetricService!.authenticateWithBiometrics(
        title: title,
        localisedReason: localisedReason,
      );
    } catch (exception) {
      throw AppLocalException(
        appLocalExceptionType: AppLocalExceptionType.BIO_METRIC_FAIL,
      );
    }
  }
}
