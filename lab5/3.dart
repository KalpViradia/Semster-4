void main() {
  List cities = ['Delhi', 'Mumbai', 'Bangalore', 'Hyderabad', 'Ahmedabad'];
  replaceCity(cities);
  print('THe updated list is : $cities');
}

List replaceCity(List cities) {
  int n = cities.length;
  for(int i = 0; i < n; i++) {
    if(cities[i] == 'Ahmedabad') {
      cities[i] = 'Surat';
    }
  }
  return cities;
}