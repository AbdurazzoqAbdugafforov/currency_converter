import 'package:currency_converter/currency_history_item.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'currency.dart';
import 'app_helpers.dart';
import 'http_service.dart';

class ConverterPage extends StatefulWidget {
  final Currency currency;
  final String locale;
  final DateTime selectedDate;

  const ConverterPage({
    super.key,
    required this.currency,
    required this.locale,
    required this.selectedDate,
  });

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  double _calculatedSum = 0;
  bool _isUzsMain = false;
  TextEditingController? _textEditingController;
  final List<Currency> _currencyHistories = [];

  Future<void> _getCurrencyHistories() async {
    final client = GetIt.I.get<HttpService>().client();

    for (int i = 1; i < 8; i++) {
      final response = await client.get(
        '/uz/arkhiv-kursov-valyut/json/all/${AppHelpers.getFormattedDate(widget.selectedDate.subtract(Duration(days: i)))}/',
      );
      List<Currency> currentCurrencies =
          CurrencyResponse.fromJson(response.data).data ?? [];
      setState(() {
        _currencyHistories.add(
            AppHelpers.getCurrentCurrency(currentCurrencies, widget.currency));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _calculatedSum = double.parse(widget.currency.rate ?? '');
    _textEditingController = TextEditingController();
    _textEditingController?.text = '1';
    _getCurrencyHistories();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: const Color(0xFF00D0CE),
        appBar: AppBar(
          backgroundColor: const Color(0xFF01CEDB),
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          title: Text(
            '${translate?.currencyConverter}',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 24),
                TextFormField(
                  controller: _textEditingController,
                  textAlign: TextAlign.end,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  cursorWidth: 1,
                  onChanged: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        _calculatedSum = 0;
                      } else {
                        if (_isUzsMain) {
                          _calculatedSum = double.parse(value) /
                              double.parse(widget.currency.rate ?? '');
                        } else {
                          _calculatedSum = double.parse(value) *
                              double.parse(widget.currency.rate ?? '');
                        }
                      }
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _isUzsMain
                    ? Text('${translate?.uzs}')
                    : Text(
                        AppHelpers.getCurrencyTitleByLocale(
                            widget.currency, widget.locale),
                      ),
                const SizedBox(height: 20),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isUzsMain = !_isUzsMain;
                      if (_isUzsMain) {
                        _calculatedSum =
                            double.parse(_textEditingController?.text ?? '') /
                                double.parse(widget.currency.rate ?? '');
                      } else {
                        _calculatedSum =
                            double.parse(_textEditingController?.text ?? '') *
                                double.parse(widget.currency.rate ?? '');
                      }
                    });
                  },
                  icon: const Icon(FlutterRemix.repeat_fill),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    alignment: Alignment.centerRight,
                    child: Text(
                      NumberFormat.currency(
                        symbol:
                            '${_isUzsMain ? '${widget.currency.ccy}' : 'UZS'} ',
                      ).format(_calculatedSum),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _isUzsMain
                    ? Text(
                        AppHelpers.getCurrencyTitleByLocale(
                            widget.currency, widget.locale),
                      )
                    : Text('${translate?.uzs}'),
                const SizedBox(
                  height: 40,
                ),
                ListView.builder(
                  itemCount: _currencyHistories.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CurrencyHistoryItem(
                      currency: _currencyHistories[index],
                      locale: widget.locale,
                    );
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
