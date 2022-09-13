import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AutoCompleted extends StatefulWidget {

  const AutoCompleted({Key? key,
  // required AutocompleteOptionsBuilder<T> optionsBuilder,
  //   AutocompleteOptionToString<T> displayStringForOption =
  //       RawAutocomplete.defaultStringForOption,
  //   AutocompleteFieldViewBuilder fieldViewBuilder = _defaultFieldViewBuilder,
  //   AutocompleteOnSelected<T>? onSelected,
  //   AutocompleteOptionsBuilder<T>? optionsViewBuilder,
  }) : super(key: key);

  @override
  State<AutoCompleted> createState() => _AutoCompletedState();
}

class _AutoCompletedState extends State<AutoCompleted> {

  // final List<Country> countryOptions = <Country>[
  //   Country(name: 'Africa', size: 30370000),
  //   Country(name: 'Asia', size: 44579000),
  //   Country(name: 'Australia', size: 8600000),
  //   Country(name: 'Bulgaria', size: 110879),
  //   Country(name: 'Canada', size: 9984670),
  //   Country(name: 'Denmark', size: 42916),
  //   Country(name: 'Europe', size: 10180000),
  //   Country(name: 'India', size: 3287263),
  //   Country(name: 'North America', size: 24709000),
  //   Country(name: 'South America', size: 17840000),
  // ];

  bool isLoading = false;
  late List<String> autoCompleteData;
  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });
    final String stringData = await rootBundle.loadString("assets/data.json");
    final List<dynamic> json = jsonDecode(stringData);
    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteData = jsonStringData;
    });
  }


  @override
  void initState() {
    super.initState();
    fetchAutoCompleteData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Autocomplete(
                        optionsBuilder: (textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            return Iterable<String>.empty();
                          } else {
                            return autoCompleteData.where ((word) => word
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase())).toList();
                          }
                        },
                      ),
    );
  }
}
