// 📁 lib/models/transaction.dart
// ========================================

import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final DateTime date;
  final double montant;
  final String description;
  final TypeTransaction type;
  final String? categorie;
  final IconData icon;
  final Color iconColor;

  Transaction({
    required this.id,
    required this.date,
    required this.montant,
    required this.description,
    required this.type,
    this.categorie,
    required this.icon,
    required this.iconColor,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      date: DateTime.parse(json['date']),
      montant: json['montant'].toDouble(),
      description: json['description'],
      type:
          json['type'] == 'REVENU'
              ? TypeTransaction.REVENU
              : TypeTransaction.DEPENSE,
      categorie: json['categorie'],
      icon: Icons.shopping_bag,
      iconColor: Colors.green,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'montant': montant,
      'description': description,
      'type': type == TypeTransaction.REVENU ? 'REVENU' : 'DEPENSE',
      'categorie': categorie,
    };
  }
}

enum TypeTransaction { REVENU, DEPENSE }
