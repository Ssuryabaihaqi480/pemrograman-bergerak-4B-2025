// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';

// class TambahWisata extends StatefulWidget {
//   @override
//   _TambahWisataState createState() => _TambahWisataState();
// }

// class _TambahWisataState extends State<TambahWisata> {
//   final _formKey = GlobalKey<FormState>();
//   String? selectedJenisWisata;
//   File? selectedImage;
//   Uint8List? selectedImageBytes;

//   // mengambil teks dari TextFormField.
//   final TextEditingController namaController = TextEditingController();
//   final TextEditingController lokasiController = TextEditingController();
//   final TextEditingController hargaController = TextEditingController();
//   final TextEditingController deskripsiController = TextEditingController();

//   final List<String> jenisWisataList = [
//     'Pantai',
//     'Pegunungan',
//     'Kota',
//     'Taman',
//     'Sejarah',
//   ];

//   void resetForm() {
//     _formKey.currentState?.reset();
//     namaController.clear();
//     lokasiController.clear();
//     hargaController.clear();
//     deskripsiController.clear();
//     setState(() {
//       selectedJenisWisata = null;
//       selectedImage = null;
//       selectedImageBytes = null;
//     });
//   }

//   //image_picker: Untuk memilih gambar dari galeri.
//   Future<void> pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//     );
//     if (pickedFile != null) {
//       if (kIsWeb) {
//         final bytes = await pickedFile.readAsBytes();
//         setState(() {
//           selectedImageBytes = bytes;
//         });
//       } else {
//         setState(() {
//           selectedImage = File(pickedFile.path);
//         });
//       }
//     }
//   }

//   //Membuka galeri dan menyimpan hasil gambar ke dalam variabel selectedImage//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFE0E0E0),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: const BackButton(color: Colors.black),
//         centerTitle: true,
//         title: Text(
//           'Tambah Wisata',
//           style: GoogleFonts.poppins(color: Colors.black),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: pickImage,
//                 child: Container(
//                   height: 150,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Colors.deepPurple, width: 1),
//                   ),
//                   child:
//                       (kIsWeb && selectedImageBytes != null)
//                           ? ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: Image.memory(
//                               selectedImageBytes!,
//                               fit: BoxFit.cover,
//                               width: double.infinity,
//                             ),
//                           )
//                           : (!kIsWeb && selectedImage != null)
//                           ? ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: Image.file(
//                               selectedImage!,
//                               fit: BoxFit.cover,
//                               width: double.infinity,
//                             ),
//                           )
//                           : Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Icon(
//                                   Icons.add_photo_alternate_outlined,
//                                   size: 50,
//                                   color: Colors.grey,
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   "Klik untuk memilih gambar",
//                                   style: GoogleFonts.poppins(
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               //Alternatif untuk membuka galeri selain dari klik kotak gambar.
//               ElevatedButton(
//                 onPressed: pickImage,
//                 child: Text("Upload Image", style: GoogleFonts.poppins()),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 49, 29, 204),
//                   foregroundColor: Colors.white,
//                   minimumSize: const Size(double.infinity, 40),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               buildLabel("Nama Wisata :"),
//               buildInputField(namaController, "Masukkan Nama Wisata Disini"),

//               buildLabel("Lokasi Wisata :"),
//               buildInputField(
//                 lokasiController,
//                 "Masukkan Lokasi Wisata Disini",
//               ),

//               buildLabel("Jenis Wisata :"),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: DropdownButtonFormField<String>(
//                   decoration: const InputDecoration(border: InputBorder.none),
//                   hint: Text(
//                     "Pilih Jenis Wisata",
//                     style: GoogleFonts.poppins(),
//                   ),
//                   value: selectedJenisWisata,
//                   onChanged: (newValue) {
//                     setState(() {
//                       selectedJenisWisata = newValue;
//                     });
//                   },
//                   items:
//                       jenisWisataList.map((String jenis) {
//                         return DropdownMenuItem<String>(
//                           value: jenis,
//                           child: Text(jenis, style: GoogleFonts.poppins()),
//                         );
//                       }).toList(),
//                 ),
//               ),
//               const SizedBox(height: 10),

//               // buildLabel("Harga Tiket :"),
//               // buildInputField(
//               //   hargaController,
//               //   "Masukkan Harga Tiket Disini",
//               //   keyboardType: TextInputType.number,
//               // ),
//               buildLabel("Harga Tiket :"),
//               buildInputField(
//                 hargaController,
//                 "Masukkan Harga Tiket Disini",
//                 keyboardType: TextInputType.number,
//               ),

//               buildLabel("Deskripsi :"),
//               buildInputField(
//                 deskripsiController,
//                 "Masukkan Deskripsi Disini",
//                 maxLines: 3,
//               ),

//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     final wisataData = {
//                       'nama': namaController.text,
//                       'lokasi': lokasiController.text,
//                       'harga': hargaController.text,
//                       'deskripsi': deskripsiController.text,
//                       'jenis': selectedJenisWisata ?? '',
//                       'gambar':
//                           kIsWeb
//                               ? selectedImageBytes
//                               : selectedImage?.readAsBytesSync(),
//                     };

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Data berhasil disimpan!")),
//                     );

//                     Navigator.pop(
//                       context,
//                       wisataData,
//                     ); //Menggunakan pop() untuk kembali ke layar sebelumnya
//                   }
//                 },
//                 child: Text("Simpan", style: GoogleFonts.poppins()),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurple,
//                   foregroundColor: Colors.white,
//                   minimumSize: const Size(double.infinity, 40),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextButton(
//                 onPressed: resetForm,
//                 child: Text(
//                   "Reset",
//                   style: GoogleFonts.poppins(color: Colors.deepPurple),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildLabel(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 12, bottom: 4),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Text(
//           text,
//           style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }

//   Widget buildInputField(
//     TextEditingController controller,
//     String hintText, {
//     TextInputType keyboardType = TextInputType.text,
//     int maxLines = 1,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: GoogleFonts.poppins(),
//         contentPadding: const EdgeInsets.symmetric(
//           vertical: 10,
//           horizontal: 12,
//         ),
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none,
//         ),
//       ),
//       validator:
//           (value) =>
//               value == null || value.isEmpty
//                   ? 'Field ini tidak boleh kosong'
//                   : null,
//     );
//   }
// }

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class TambahWisata extends StatefulWidget {
  @override
  _TambahWisataState createState() => _TambahWisataState();
}

class _TambahWisataState extends State<TambahWisata> {
  final _formKey = GlobalKey<FormState>();
  String? selectedJenisWisata;
  File? selectedImage;
  Uint8List? selectedImageBytes;

  // mengambil teks dari TextFormField.
  final TextEditingController namaController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  final List<String> jenisWisataList = [
    'Pantai',
    'Pegunungan',
    'Kota',
    'Taman',
    'Sejarah',
  ];

  void resetForm() {
    _formKey.currentState?.reset();
    namaController.clear();
    lokasiController.clear();
    hargaController.clear();
    deskripsiController.clear();
    setState(() {
      selectedJenisWisata = null;
      selectedImage = null;
      selectedImageBytes = null;
    });
  }

  //image_picker: Untuk memilih gambar dari galeri.
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (kIsWeb) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          selectedImageBytes = bytes;
        });
      } else {
        setState(() {
          selectedImage = File(pickedFile.path);
        });
      }
    }
  }

  //Membuka galeri dan menyimpan hasil gambar ke dalam variabel selectedImage//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Tambah Wisata',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: pickImage,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.deepPurple, width: 1),
                  ),
                  child:
                      (kIsWeb && selectedImageBytes != null)
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.memory(
                              selectedImageBytes!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                          : (!kIsWeb && selectedImage != null)
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                          : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add_photo_alternate_outlined,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Klik untuk memilih gambar",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: pickImage,
                child: Text("Upload Image", style: GoogleFonts.poppins()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 49, 29, 204),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 40),
                ),
              ),
              const SizedBox(height: 20),

              // buildLabel("Nama Wisata :"),
              // buildInputField(
              //   namaController,
              //   "Masukkan Nama Wisata Disini",
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Field ini tidak boleh kosong';
              //     }
              //     if (value.contains('-')) {
              //       return 'Nama Wisata tidak boleh mengandung tanda "-"';
              //     }
              //     return null;
              //   },
              // ),
              buildLabel("Nama Wisata :"),
              buildInputField(
                namaController,
                "Masukkan Nama Wisata Disini",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama Wisata wajib diisi";
                  } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    return "Nama Wisata hanya boleh berisi huruf";
                  }
                  return null;
                },
              ),

              buildLabel("Lokasi Wisata :"),
              buildInputField(
                lokasiController,
                "Masukkan Lokasi Wisata Disini",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama Wisata wajib diisi";
                  } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    return "Nama Wisata hanya boleh berisi huruf";
                  }
                  return null;
                },
              ),

              buildLabel("Jenis Wisata :"),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(border: InputBorder.none),
                  hint: Text(
                    "Pilih Jenis Wisata",
                    style: GoogleFonts.poppins(),
                  ),
                  value: selectedJenisWisata,
                  onChanged: (newValue) {
                    setState(() {
                      selectedJenisWisata = newValue;
                    });
                  },
                  items:
                      jenisWisataList.map((String jenis) {
                        return DropdownMenuItem<String>(
                          value: jenis,
                          child: Text(jenis, style: GoogleFonts.poppins()),
                        );
                      }).toList(),
                ),
              ),
              const SizedBox(height: 10),

              buildLabel("Harga Tiket :"),
              buildInputField(
                hargaController,
                "Masukkan Harga Tiket Disini",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field ini tidak boleh kosong';
                  }
                  final isValid = RegExp(r'^\d+$').hasMatch(value);
                  if (!isValid) {
                    return 'Harga hanya boleh angka saja';
                  }
                  return null;
                },
              ),

              buildLabel("Deskripsi :"),
              buildInputField(
                deskripsiController,
                "Masukkan Deskripsi Disini",
                maxLines: 3,
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final wisataData = {
                      'nama': namaController.text,
                      'lokasi': lokasiController.text,
                      'harga': hargaController.text,
                      'deskripsi': deskripsiController.text,
                      'jenis': selectedJenisWisata ?? '',
                      'gambar':
                          kIsWeb
                              ? selectedImageBytes
                              : selectedImage?.readAsBytesSync(),
                    };

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Data berhasil disimpan!")),
                    );

                    Navigator.pop(context, wisataData);
                  }
                },
                child: Text("Simpan", style: GoogleFonts.poppins()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 40),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: resetForm,
                child: Text(
                  "Reset",
                  style: GoogleFonts.poppins(color: Colors.deepPurple),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildInputField(
    TextEditingController controller,
    String hintText, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      validator:
          validator ??
          (value) =>
              value == null || value.isEmpty
                  ? 'Field ini tidak boleh kosong'
                  : null,
    );
  }
}
