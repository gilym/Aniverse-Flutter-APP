import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flag/flag.dart';


class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  String _fromCurrency = 'USD';
  String _toCurrency = 'IDR';
  double _amount = 0.0;
  late TextEditingController _toController = TextEditingController(text: '');
  late TextEditingController _fromController = TextEditingController(text: '');
  double Konversi(String from, String to, double value) {
    double result=0.0;
    if (from == 'USD') {
      if (to == 'EUR') {
        // Konversi dari USD ke EUR
        result = value * 0.85;
      } else if (to == 'IDR') {
        // Konversi dari USD ke IDR
        result = value * 14345.0;
      } else if (to == 'JPY') {
        // Konversi dari USD ke JPY
        result = value * 109.95;
      }
      else{
        result=value;
      }

    } else if (from == 'EUR') {
      if (to == 'USD') {
        // Konversi dari EUR ke USD
        result = value * 1.18;
      } else if (to == 'IDR') {
        // Konversi dari EUR ke IDR
        result = value * 16057.61;
      } else if (to == 'JPY') {
        // Konversi dari EUR ke JPY
        result = value * 123.17;
      }
      else{
        result=value;
      }
    } else if (from == 'IDR') {
      if (to == 'USD') {
        // Konversi dari IDR ke USD
        result = value * 0.000070;
      } else if (to == 'EUR') {
        // Konversi dari IDR ke EUR
        result = value * 0.000062;
      } else if (to == 'JPY') {
        // Konversi dari IDR ke JPY
        result = value * 0.076;
      }
      else{
        result=value;
      }
    } else if (from == 'JPY') {
      if (to == 'USD') {
        // Konversi dari JPY ke USD
        result = value * 0.0091;
      } else if (to == 'EUR') {
        // Konversi dari JPY ke EUR
        result = value * 0.0081;
      } else if (to == 'IDR') {
        // Konversi dari JPY ke IDR
        result = value * 13.15;
      }
      else{
        result=value;
      }
    }

    // Tambahkan kondisi lainnya untuk konversi dari mata uang lainnya

    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191825),
      appBar: AppBar(
          title: Text('Currency Converter'),
        backgroundColor: Color(0xFF191825),
        elevation: 0
      ),
      body:Column(
        children: [
          SizedBox(height: 200,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 280,
                child:TextFormField(
                  controller: _fromController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefix: _fromCurrency=="USD" ? Text("USD ")  :
                    _fromCurrency=="IDR" ? Text("IDR ")  :
                    _fromCurrency=="JPY" ? Text("JPY ")  :
                    _fromCurrency=="EUR" ? Text("EUR ")  :Text(" "),
                    labelText: 'From',
                    labelStyle: TextStyle(fontFamily: "Poppins"),
                    hintStyle: TextStyle(color: Colors.white, fontFamily: "Poppins"),

                    focusColor: Colors.white,
                    hintText: '',

                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  onChanged: (String value) {
                    setState(() {
                      _amount = double.tryParse(value) ?? 0.0;

                    });
                    print(_amount);

                    double convertedAmount = Konversi(_fromCurrency, _toCurrency, _amount);
                    String formattedAmount = NumberFormat('#,###.###').format(convertedAmount);
                    String tes = NumberFormat('#,###.###').format(_amount);

                  _toController.text=formattedAmount;

                  },
                ),
              ),
              SizedBox(width: 10,),
              DropdownButton<String>(
                value: _fromCurrency,
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: 'USD',
                    child:Row(
                      children: [
                        Text(
                          'USD',
                          style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                        ),
                        SizedBox(width: 10,),
                        Flag.fromCode(
                          FlagsCode.US,
                          height: 20,
                          width: 30,
                          fit: BoxFit.fill,
                        ),
                      ],
                    )
                  ),
                  DropdownMenuItem(
                    value: 'EUR',
                    child:Row(
                      children: [
                        Text(
                          'EUR',
                          style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                        ),
                        SizedBox(width: 10,),
                        Flag.fromCode(
                          FlagsCode.DE,
                          height: 20,
                          width: 30,
                          fit: BoxFit.fill,
                        ),
                      ],
                    )
                  ),
                  DropdownMenuItem(
                    value: 'IDR',
                    child: Row(
                      children: [
                        Text(
                          'IDR',
                          style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                        ),
                        SizedBox(width: 10,),
                        Flag.fromCode(
                          FlagsCode.ID,
                          height: 20,
                          width: 30,
                          fit: BoxFit.fill,
                        ),
                      ],
                    )
                  ), DropdownMenuItem(
                    value: 'JPY',
                    child: Row(
                      children: [
                        Text(
                          'JPY',
                          style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                        ),
                        SizedBox(width: 10,),
                        Flag.fromCode(
                          FlagsCode.JP,
                          height: 20,
                          width: 30,
                          fit: BoxFit.fill,
                        ),
                      ],
                    )
                  ),
                ],
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      _fromCurrency = value;
                    });
                    double convertedAmount = Konversi(_fromCurrency, _toCurrency, _amount);

                    String formattedAmount = NumberFormat('#,###.###').format(convertedAmount);
                    _toController.text=formattedAmount;
                  }
                },
                style: TextStyle(color: Colors.white), // Ubah warna teks dropdown menjadi putih
                dropdownColor: Colors.grey[800], // Ubah warna latar belakang dropdown
                underline: Container(), // Hilangkan garis bawah
              ),
            ],
          ),
          SizedBox(height: 30,),
          Center(
            child: InkWell(
              onTap: (){
                setState(() {
print(_fromController.toString());
                  TextEditingController tempcontroler = _fromController;
                  String tempCurrency= _fromCurrency;

                  _fromCurrency=_toCurrency;
                  _fromController=_toController;
                  _toCurrency =tempCurrency;
                  _toController=tempcontroler;
                });
              },
              child:
              Icon(Icons.swap_vert,
                size: 60,
                color: Colors.white,),
            )

          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 280,
                child: TextField(
enabled: false,
                  keyboardType: TextInputType.number,
                  controller: _toController,
                  decoration: InputDecoration(
                    prefix: _toCurrency=="USD" ? Text("USD ")  :
                    _toCurrency=="IDR" ? Text("IDR ")  :
                    _toCurrency=="JPY" ? Text("JPY ")  :
                    _toCurrency=="EUR" ? Text("EUR ")  :Text(" "),

                    labelText: 'To',
                    hintText: 'Enter amount',
                    labelStyle: TextStyle(fontFamily: "Poppins"),
                    hintStyle: TextStyle(color: Colors.white,
                        fontFamily: "Poppins"),/// Ubah warna teks hint menjadi putih
                    // Ubah warna teks input yang sudah diisi menjadi putih
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1), // Atur warna latar belakang dengan transparansi
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none, // Hilangkan garis tepi
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // Ubah warna teks input menjadi putih
                  onChanged: (String value) {
                    setState(() {
                      _amount = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
              ),
              SizedBox(width: 10,),
              DropdownButton<String>(
                value: _toCurrency,
                items:<DropdownMenuItem<String>>[
                  DropdownMenuItem(
                      value: 'USD',
                      child:Row(
                        children: [
                          Text(
                            'USD',
                            style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                          ),
                          SizedBox(width: 10,),
                          Flag.fromCode(
                            FlagsCode.US,
                            height: 20,
                            width: 30,
                            fit: BoxFit.fill,
                          ),
                        ],
                      )
                  ),
                  DropdownMenuItem(
                      value: 'EUR',
                      child:Row(
                        children: [
                          Text(
                            'EUR',
                            style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                          ),
                          SizedBox(width: 10,),
                          Flag.fromCode(
                            FlagsCode.DE,
                            height: 20,
                            width: 30,
                            fit: BoxFit.fill,
                          ),
                        ],
                      )
                  ),
                  DropdownMenuItem(
                      value: 'IDR',
                      child: Row(
                        children: [
                          Text(
                            'IDR',
                            style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                          ),
                          SizedBox(width: 10,),
                          Flag.fromCode(
                            FlagsCode.ID,
                            height: 20,
                            width: 30,
                            fit: BoxFit.fill,
                          ),
                        ],
                      )
                  ), DropdownMenuItem(
                      value: 'JPY',
                      child: Row(
                        children: [
                          Text(
                            'JPY',
                            style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                          ),
                          SizedBox(width: 10,),
                          Flag.fromCode(
                            FlagsCode.JP,
                            height: 20,
                            width: 30,
                            fit: BoxFit.fill,
                          ),
                        ],
                      )
                  ),
                ],
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      _toCurrency = value;
                    });
                    double convertedAmount = Konversi(_fromCurrency, _toCurrency, _amount);

                    String formattedAmount = NumberFormat('#,###.###').format(convertedAmount);

                    _toController.text=formattedAmount;
                  }
                },
                style: TextStyle(color: Colors.white), // Ubah warna teks dropdown menjadi putih
                dropdownColor: Colors.grey[800], // Ubah warna latar belakang dropdown
                underline: Container(), // Hilangkan garis bawah
              ),

            ],
          ),

        ],
      )
    );
  }
}
