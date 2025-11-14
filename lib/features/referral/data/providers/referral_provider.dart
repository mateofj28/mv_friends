import 'package:flutter/foundation.dart';
import '../../domain/models/referral.dart';

class ReferralProvider extends ChangeNotifier {
  final List<Referral> _referrals = [];

  List<Referral> get referrals => List.unmodifiable(_referrals);

  void addReferral(Referral referral) {
    _referrals.insert(0, referral); // Agregar al inicio
    notifyListeners();
  }

  Referral? getReferralById(String id) {
    try {
      return _referrals.firstWhere((r) => r.id == id);
    } catch (e) {
      return null;
    }
  }

  int get totalReferrals => _referrals.length;

  int get successfulReferrals =>
      _referrals.where((r) => r.status == 'Cerrado Ganado').length;
}
