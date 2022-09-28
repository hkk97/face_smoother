class Privacy {
  final String title;
  Privacy._({
    required this.title,
  });

  static final List<Privacy> values = [
    Privacy._(title: '1. Doesn\'t collect your personal data'),
    Privacy._(title: '2. Doesn\'t collect your information from third parties'),
    Privacy._(title: '3. Doesn\'t collect your info of usage of our Services'),
    Privacy._(title: '4. Doesn\'t use Cookies Information'),
    Privacy._(
        title:
            '5. Doesn\'t have any back-door program and store your data send to server'),
  ];
}
