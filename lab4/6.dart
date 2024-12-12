void main() {
  List<String> names1 = ["Mary", "John", "Emma"];
  List<int> heights1 = [180, 165, 170];
  List<String> names2 = ["Alice", "Bob", "Bob"];
  List<int> heights2 = [155, 185, 150];

  print(sortNamesByHeights(names1, heights1));
  print(sortNamesByHeights(names2, heights2));
}

List sortNamesByHeights(List<String> names, List<int> heights) {
  List<Map<String, dynamic>> nameHeightPairs = [];
  for (int i = 0; i < names.length; i++) {
    nameHeightPairs.add({'name': names[i], 'height': heights[i]});
  }

  nameHeightPairs.sort((a, b) => b['height'].compareTo(a['height']));

  List sortedNames = nameHeightPairs.map((pair) => pair['name']).toList();

  return sortedNames;
}