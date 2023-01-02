import 'package:local_auth/local_auth.dart';

class BioMetricService {
  final LocalAuthentication _localAuthentication;

  BioMetricService(this._localAuthentication);

  Future<bool> canCheckBiometric() async {
    // return _localAuthentication.isDeviceSupported();
    final bool canAuthenticateWithBiometrics =
        await _localAuthentication.canCheckBiometrics;
    final bool canAuthenticate = canAuthenticateWithBiometrics &&
        await _localAuthentication.isDeviceSupported();
    return canAuthenticate;
  }

  Future<bool> stopAuthentication() {
    return _localAuthentication.stopAuthentication();
  }

  Future<bool> authenticateWithBiometrics({
    bool useErrorDialogs = true,
    bool stickyAuth = false,
    String title = "",
    String localisedReason = "",
    bool biometricOnly = true,
  }) async {
    return await _localAuthentication.authenticate(
      localizedReason: localisedReason,
      options: AuthenticationOptions(
        stickyAuth: stickyAuth,
        useErrorDialogs: useErrorDialogs,
        biometricOnly: biometricOnly,
      ),
    );
  }
}
