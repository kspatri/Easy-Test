import 'package:easy_test/Models/transaction.dart';
import 'package:easy_test/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';


class TransactionDetailScreen extends StatelessWidget {
  final Transaction transaction;


  const TransactionDetailScreen({Key? key, required this.transaction})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final NumberFormat fcfaFormat = NumberFormat.currency(
      locale: 'fr_FR',
      symbol: 'FCFA',
      decimalDigits: 0, // le FCFA n'utilise pas de centimes
    );

    final isRevenu = transaction.type == TypeTransaction.REVENU;
    final montantColor = isRevenu ? AppColors.income : AppColors.expense;
    final montantPrefix = isRevenu ? '+' : '-';

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(AppDimensions.paddingLarge),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    iconSize: AppDimensions.iconMedium,
                  ),
                  Spacer(),
                  Text(
                    AppStrings.transactionDetail,
                    style: AppTextStyles.heading3.copyWith(color: Colors.white),
                  ),
                  Spacer(),
                  SizedBox(width: 48),
                ],
              ),
            ),
            // SizedBox(height: AppDimensions.paddingXLarge),
            // Icône principale
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: FaIcon(
                  transaction.icon,
                  color: transaction.iconColor,
                  size: 50,
                ),
              ),
            ),
            SizedBox(height: AppDimensions.paddingXLarge),
            // Montant
            Text(
              '$montantPrefix${fcfaFormat.format(transaction.montant)}',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: AppDimensions.paddingSmall),
            Text(
              transaction.description,
              style: AppTextStyles.heading3.copyWith(color: Colors.white70),
            ),
            SizedBox(height: AppDimensions.paddingXLarge +5),
            // Détails dans une carte blanche
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(AppDimensions.paddingXLarge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Informations', style: AppTextStyles.heading2),
                      SizedBox(height: AppDimensions.paddingXLarge),
                      _buildDetailRow(
                        'Type',
                        isRevenu ? AppStrings.income : AppStrings.expense,
                        Icons.swap_horiz,
                      ),
                      SizedBox(height: AppDimensions.paddingLarge),
                      _buildDetailRow(
                        'Catégorie',
                        transaction.categorie ?? 'Non définie',
                        Icons.category,
                      ),
                      SizedBox(height: AppDimensions.paddingLarge),
                      _buildDetailRow(
                        'ID Transaction',
                        transaction.id,
                        Icons.receipt_long,
                      ),
                      Spacer(),
                      // Bouton d'action
                      SizedBox(
                        width: double.infinity,
                        height: AppDimensions.buttonHeight,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Partage en cours...'),
                                backgroundColor: AppColors.success,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          icon: Icon(Icons.share, color: Colors.white),
                          label: Text('Partager', style: AppTextStyles.button),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusMedium,
                              ),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: AppDimensions.iconMedium,
          ),
        ),
        SizedBox(width: AppDimensions.paddingMedium),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.bodySmall),
              SizedBox(height: 4),
              Text(
                value,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
