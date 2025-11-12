class ReferralDetail {
  final String userName;
  final String phone;
  final String email;
  final String referralDate;
  final String status;
  final int currentStep;

  const ReferralDetail({
    required this.userName,
    required this.phone,
    required this.email,
    required this.referralDate,
    required this.status,
    required this.currentStep,
  });
}
