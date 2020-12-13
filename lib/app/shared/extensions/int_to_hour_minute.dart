extension formatRuntime on int {
  String toHourMinute() {
    var d = Duration(minutes: this);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}min';
  }
}
