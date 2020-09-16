import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'location_fact.dart';

@immutable
class Location {
  final int id;
  final String title;
  final String imagePath;
  final List<LocationFact> facts;

  Location(this.id, this.title, this.imagePath, this.facts);

  static List<Location> fetchAll() {
    return [
      Location(1, 'London', 'assets/images/london.jpeg', [
        LocationFact("Metropol", "London is the capital and largest city of England and the United Kingdom.[8][9] The city stands on the River Thames in the south-east of England, at the head of its 50-mile (80 km) estuary leading to the North Sea, London has been a major settlement for two millennia."),
        LocationFact("Global City", "London is considered to be one of the world's most important global cities[18][19][20] and has been called the world's most powerful,[21] most desirable,[22] most influential,[23] most visited,[24] most expensive,[25][26] sustainable,[27] most investment-friendly,[28] and most-popular-for-work[29] city. It exerts a considerable impact upon the arts, commerce, education, entertainment, fashion, finance, healthcare, media, professional services, research and development, tourism and transportation.")
      ]),
      Location(2, 'Istanbul', 'assets/images/istanbul.jpeg', [
        LocationFact("Populous", "Istanbul is the most populous city in Turkey and the country's economic, cultural and historic center. Istanbul is a transcontinental city in Eurasia, straddling the Bosporus strait (which separates Europe and Asia) between the Sea of Marmara and the Black Sea."),
        LocationFact("Tourist Destination", "Over 12 million foreign visitors came to Istanbul in 2015, five years after it was named a European Capital of Culture, making the city the world's fifth-most popular tourist destination.")
      ])
    ];
  }
}
