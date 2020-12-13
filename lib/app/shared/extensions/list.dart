extension toString on List {
  String separateByComma() {
    return this.length == 1
        ? this[0]
        : this.fold<String>('', (previousValue, element) {
            return previousValue.isEmpty ? element : '$previousValue, $element';
          });
  }
}
