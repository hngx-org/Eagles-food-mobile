import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


Widget searchEmployeeBox(
  List<String> employees,
  Function(String?)? onChanged,
  String selectedEmployee,
  FocusNode focusNode,
) {
  return TypeAheadField<String>(
    textFieldConfiguration: TextFieldConfiguration(
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: 'Search for an employee',
        hintStyle: const TextStyle(
            color: Color(0xFF929292),
            fontFamily: 'poppins',
            fontWeight: FontWeight.w400),
        suffixIcon: Icon(
          Icons.search,
          color: focusNode.hasFocus ? const Color(0xFF929292) : null,
        ),
        filled: true,
        fillColor: const Color(0xFFEBEBEB),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEBEBEB), width: 1)),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEBEBEB), width: 1)),
      ),
    ),
    suggestionsCallback: (pattern) async {
      return employees.where((employee) =>
          employee.toLowerCase().startsWith(pattern.toLowerCase()));
    },
    itemBuilder: (context, String employee) {
      return ListTile(
        title: Text(
          employee,
          style: const TextStyle(
              color: Color(0xFF1F1F2C),
              fontSize: 15,
              fontFamily: 'poppins',
              fontWeight: FontWeight.w400),
        ),
      );
    },
    onSuggestionSelected: (String suggestion) {
      onChanged?.call(suggestion);
    },
    noItemsFoundBuilder: (context) {
      return const SizedBox.shrink();
    },
    loadingBuilder: (context) {
      return const LinearProgressIndicator();
    },
    transitionBuilder: (context, suggestionsBox, controller) {
      return suggestionsBox;
    },
    suggestionsBoxDecoration: SuggestionsBoxDecoration(
      color: const Color(0xFFEBEBEB),
      borderRadius: BorderRadius.circular(10),
    ),
    animationDuration: Duration.zero,
    debounceDuration: const Duration(milliseconds: 300),
    hideOnLoading: true,
    hideOnError: true,
    hideOnEmpty: true,
    keepSuggestionsOnSuggestionSelected: false,
  );
}
