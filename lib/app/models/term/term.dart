class Term {
  final String title;
  final List<String> body;
  Term._({
    required this.title,
    required this.body,
  });

  static final _preabmle = Term._(
    title: '1. Preamble',
    body: [
      "Spotlight-Platform Limited (hereinafter referred to as the Operator) operates the website wchklaus.github.io/face_smoother/face_smoother/ a progressive web app application for face smothering. This platform used to demonstrate the usage the flutter web and dynamic js library injection. The ai behind of face smothering are using the OpenCV to achieve. These Terms of Use apply to all users of the platform wchklaus.github.io/face_smoother/face_smoother/(hereinafter: the User)."
    ],
  );

  static final _rights = Term._(
    title: '2. Rights',
    body: [
      "2.1. The User may use the platform which is accessible under wchklaus.github.io/face_smoother/face_smoother/ exclusively for non-commercial purposes. This means that all results from the platform (hereinafter: the Platform) may only be used privately. Use for (direct or indirect) commercial purposes is excluded.",
      "2.2. The Operator has the right to restrict the use of the Platform without giving reasons or to block Users."
    ],
  );

  static final _rightsWithObligations = Term._(
    title: '3. Rights and Obligations of User',
    body: [
      "3.1. The User undertakes to refrain from any actions that endanger the functionality or operation of the software. In particular, the User is prohibited from carrying out any actions that scan or test weak points of the software, bypass security systems or access systems of the software or integrate malware into the software.",
      "3.2. The User guarantees that he has all the necessary rights (such as copyright, ancillary copyright, industrial property rights, trademark rights) for processing the uploaded photos."
    ],
  );

  static final _warrantyAndLiability = Term._(
    title: '4. Warranty and liability',
    body: [
      "4.1. Any warranty for the results of the software and its availability is excluded.",
      "4.2. The Operator is not liable for the speed of the Software, its Availability, data loss or the correctness of the results.",
    ],
  );

  static final _condifentiallyAndDataProtection = Term._(
    title: '5. Confidentiality and data protection',
    body: [
      "5.1. All data protection information is available to the User at wchklaus.github.io/face_smoother/face_smoother/privacy",
    ],
  );

  static final List<Term> values = [
    _preabmle,
    _rights,
    _rightsWithObligations,
    _warrantyAndLiability,
    _condifentiallyAndDataProtection,
  ];
}
