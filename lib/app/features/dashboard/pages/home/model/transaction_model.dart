import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String title;
  final String description;
  final num amount;
  final int transactionType;
  final String timeStamp;
  final String id;
  const TransactionModel(
    this.id, {
    required this.title,
    required this.description,
    required this.amount,
    required this.timeStamp,
    required this.transactionType,
  });

  TransactionModel copyWith({
    String? title,
    String? description,
    num? amount,
    String? timeStamp,
    int? transactionType,
  }) {
    return TransactionModel(
      id,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      timeStamp: timeStamp ?? this.timeStamp,
      transactionType: transactionType ?? this.transactionType,
    );
  }

  String get getTitle => title; // Title Getter
  String get getDescription => description; // Description Getter
  num get getAmount => amount; // Amount Getter
  String get getTimeStamp => timeStamp; // TimeStamp Getter
  String get getId => id; // Id Getter

  @override
  List<Object?> get props => [
        title,
        description,
        amount,
        timeStamp,
        id,
      ];
}
