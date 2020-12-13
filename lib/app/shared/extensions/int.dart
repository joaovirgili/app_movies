extension formatRuntime on int {
  String toHourMinute() {
    var d = Duration(minutes: this);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}min';
  }

  String toSimpleCurrency() {
    return '\$ ' +
        this.toString().replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}
