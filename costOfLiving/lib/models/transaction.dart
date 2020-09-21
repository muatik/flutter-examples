class Transaction {
  final String id;
  final String title;
  final int amount; 
  final DateTime date;
  
  Transaction(this.id, this.title, this.amount, this.date);

  String getFormattedAmount() => '\$${(amount/100).toStringAsFixed(2)}';
}