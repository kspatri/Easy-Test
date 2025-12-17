// ========================================
// 📁 lib/screens/transactions_list_screen.dart
// ========================================

import 'package:easy_test/Models/transaction.dart';
import 'package:easy_test/Utils/constants.dart';
import 'package:easy_test/View/Screens/transaction_detail_screen.dart';
import 'package:easy_test/View/Widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class TransactionsListScreen extends StatefulWidget {
  @override
  _TransactionsListScreenState createState() => _TransactionsListScreenState();
}

class _TransactionsListScreenState extends State<TransactionsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Transaction> transactions = [];
  List<Transaction> filteredTransactions = [];
  bool isLoading = true;

   final NumberFormat fcfaFormat = NumberFormat.currency(
    locale: 'fr_FR',
    symbol: 'FCFA',
    decimalDigits: 0, // le FCFA n'utilise pas de centimes
  );


  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  void _loadTransactions() {
    // Simulation de chargement
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        // Données de démonstration
        transactions = [
          Transaction(
            id: '1',
            date: DateTime.now(),
            montant: 943.99,
            description: 'Starbucks Coffee',
            type: TypeTransaction.DEPENSE,
            categorie: 'Restaurant',
            icon: FontAwesomeIcons.mugHot,
            iconColor: Color(0xFF00704A),
          ),
          Transaction(
            id: '2',
            date: DateTime.now().subtract(Duration(days: 1)),
            montant: 60.32,
            description: 'Netflix Subscription',
            type: TypeTransaction.DEPENSE,
            categorie: 'Divertissement',
            icon: FontAwesomeIcons.tv,
            iconColor: Color(0xFFE50914),
          ),
          Transaction(
            id: '3',
            date: DateTime.now().subtract(Duration(days: 2)),
            montant: 9.99,
            description: 'Spotify® Premium',
            type: TypeTransaction.DEPENSE,
            categorie: 'Musique',
            icon: FontAwesomeIcons.spotify,
            iconColor: Color(0xFF1DB954),
          ),
          Transaction(
            id: '4',
            date: DateTime.now().subtract(Duration(days: 3)),
            montant: 9.99,
            description: 'Xbox Game Pass',
            type: TypeTransaction.DEPENSE,
            categorie: 'Gaming',
            icon: FontAwesomeIcons.xbox,
            iconColor: Color(0xFF107C10),
          ),
          Transaction(
            id: '5',
            date: DateTime.now().subtract(Duration(days: 4)),
            montant: 19.99,
            description: 'Pay H&M',
            type: TypeTransaction.DEPENSE,
            categorie: 'Shopping',
            icon: FontAwesomeIcons.shoppingBag,
            iconColor: Color(0xFFE50010),
          ),
          Transaction(
            id: '6',
            date: DateTime.now().subtract(Duration(days: 5)),
            montant: 810.90,
            description: 'Ovo Cashback',
            type: TypeTransaction.REVENU,
            categorie: 'Cashback',
            icon: FontAwesomeIcons.coins,
            iconColor: Color(0xFFF27121),
          ),
          Transaction(
            id: '7',
            date: DateTime.now().subtract(Duration(days: 6)),
            montant: 943.99,
            description: 'Starbucks Coffee',
            type: TypeTransaction.DEPENSE,
            categorie: 'Restaurant',
            icon: FontAwesomeIcons.mugHot,
            iconColor: Color(0xFF00704A),
          ),
        ];
        filteredTransactions = transactions;
        isLoading = false;
      });
    });
  }

  void _filterTransactions(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTransactions = transactions;
      } else {
        filteredTransactions =
            transactions
                .where(
                  (transaction) => transaction.description
                      .toLowerCase()
                      .contains(query.toLowerCase()),
                )
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child:
            isLoading
                ? Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Padding(
                      padding: EdgeInsets.all(AppDimensions.paddingLarge),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                          SizedBox(height: AppDimensions.paddingLarge),
                          Text('Hello patricia', style: AppTextStyles.heading1),
                          SizedBox(height: AppDimensions.paddingLarge),
                          Text(
                            AppStrings.transactionsTitle,
                            style: AppTextStyles.heading2,
                          ),
                          SizedBox(height: AppDimensions.paddingMedium),
                          // Search Bar
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusMedium,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _searchController,
                              onChanged: _filterTransactions,
                              decoration: InputDecoration(
                                hintText: 'Search transactions',
                                hintStyle: AppTextStyles.hint,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppColors.textHint,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.paddingMedium,
                                  vertical: AppDimensions.paddingMedium,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Liste des transactions
                    Expanded(
                      child:
                          filteredTransactions.isEmpty
                              ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.receipt_long_outlined,
                                      size: 64,
                                      color: AppColors.textHint,
                                    ),
                                    SizedBox(
                                      height: AppDimensions.paddingMedium,
                                    ),
                                    Text(
                                      AppStrings.noTransactions,
                                      style: AppTextStyles.bodyLarge.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              : ListView.builder(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.paddingLarge,
                                ),
                                itemCount: filteredTransactions.length,
                                itemBuilder: (context, index) {
                                  final transaction =
                                      filteredTransactions[index];
                                  return TransactionCard(
                                    transaction: transaction,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) =>
                                                  TransactionDetailScreen(
                                                    transaction: transaction,
                                                  ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                    ),
                  ],
                ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
