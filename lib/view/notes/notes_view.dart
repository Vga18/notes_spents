import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes_spents/model/note.dart';
import 'package:notes_spents/view/notes/widgtes/logout_alert_dialog.dart';
import 'package:notes_spents/view_mode/auth/auth_view_model.dart';
import 'package:notes_spents/view_mode/note/note_view_model.dart';

import '../../injection_container.dart';

class NotesView extends StatefulWidget {
  final String userId;
  const NotesView({super.key, required this.userId});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  //Aqui iniciamos nuestro View Model NoteViewModel
  late ActivesViewModel viewActive;
  final AuthViewModel _authViewModel = locator<AuthViewModel>();

  //Aqui iniciamos nuestro View Model AuthViewModel


  @override
  void initState() {
    super.initState();
    // Inyección pasando el parámetro dinámico 'userId'
    viewActive = locator<ActivesViewModel>(param1: widget.userId);
    //Cargamos loadNotes
    viewActive.loadActives();
  }

  void _showNoteDialog({ActivesModel? active, String currentTitle = '', double currentamount = 0.0}) {
    final titleCtrl = TextEditingController(text: currentTitle);
    // 1. Usamos TextEditingController y convertimos el double inicial a texto (si es 0, lo dejamos vacío)
    final amountCtrl = TextEditingController(
      text: currentamount > 0 ? currentamount.toString() : '',
    );

    if(active != null) {
      titleCtrl.text = active.title;
      amountCtrl.text = active.amount.toString();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(active == null ? 'Añadir Activo' : 'Editar Activo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: amountCtrl, // 2. Asignamos el controlador correcto
              keyboardType: const TextInputType.numberWithOptions(decimal: true), // 3. Aquí va el tipo de teclado
              decoration: const InputDecoration(labelText: 'Cantidad'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              // 4. Obtenemos el texto y lo convertimos a double (si es inválido o vacío, ponemos 0.0)
              final String title = titleCtrl.text.trim();
              final double amount = double.tryParse(amountCtrl.text.trim().replaceAll(',', '.')) ?? 0.0;

              if (active == null) {
                // 5. Enviamos las variables ya limpias y sin paréntesis en .text
                viewActive.addactive(title, amount);
              } else {
                viewActive.editactive(active.copywith(title: title, amount: amount));
              }
              Navigator.pop(context);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Notas', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.logout_rounded, color: Colors.redAccent),
              tooltip: 'Cerrar Sesión',
              onPressed: () {
                //Ejecutamos el dialog enviando el authViewModel
                LogoutAlertDialog.showLogoutDialog(context,_authViewModel);
              } ,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNoteDialog(),
        child: const Icon(Icons.add),
      ),
      body: Observer(
        builder: (_) {
          //Verificamos si las notas estan cargando
          if(viewActive.isLoading) return Center(child: CircularProgressIndicator());
          //Verificamos si hay notas
          if(viewActive.active.isEmpty) return const Center(child: Text('No hay activos para mostrar'));

          return ListView.builder(
            itemCount: viewActive.active.length,
            itemBuilder: (_, index) {
              final active = viewActive.active[index];
              return ListTile(
                title: Text(active.title),
                subtitle: Text(active.amount.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => {
                        //Mostramos el dialog para editar
                        _showNoteDialog(active: active)
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => {
                        //Ejecutamos removeNote
                        viewActive.removeactive(active.id!)
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}