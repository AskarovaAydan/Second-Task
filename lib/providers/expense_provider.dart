import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/expense.dart';

class ExpenseProvider with ChangeNotifier {
  final Box<Expense> _expenseBox = Hive.box<Expense>('expenses_box');

  List<Expense> _expenses = [];
  String _selectedCategory = 'All';
  String _sortBy = 'date';

  List<Expense> get expenses => _getFilteredAndSortedExpenses();
  String get selectedCategory => _selectedCategory;
  String get sortBy => _sortBy;

  ExpenseProvider() {
    fetchExpenses();
  }

  void fetchExpenses() {
    _expenses = _expenseBox.values.toList();
    notifyListeners();
  }

  Future<void> addExpense(Expense expense) async {
    await _expenseBox.put(expense.id, expense);
    fetchExpenses();
  }

  Future<void> updateExpense(Expense expense) async {
    await expense.save();
    fetchExpenses();
  }

  Future<void> deleteExpense(String id) async {
    await _expenseBox.delete(id);
    fetchExpenses();
  }

  void setCategoryFilter(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSortBy(String sortBy) {
    _sortBy = sortBy;
    notifyListeners();
  }

  List<Expense> _getFilteredAndSortedExpenses() {
    List<Expense> filtered = _expenses;

    if (_selectedCategory != 'All') {
      filtered = filtered
          .where((e) => e.category == _selectedCategory)
          .toList();
    }

    if (_sortBy == 'date') {
      filtered.sort((a, b) => b.date.compareTo(a.date));
    } else if (_sortBy == 'amount') {
      filtered.sort((a, b) => b.amount.compareTo(a.amount));
    }

    return filtered;
  }
}
