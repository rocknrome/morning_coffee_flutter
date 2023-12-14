import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0x11180E05),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: const Color(0xFF8A4A18),
            automaticallyImplyLeading: false,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'MORNING COFFEE',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).info,
                      fontSize: 28.0,
                    ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
              titlePadding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1610632380989-680fe40816c6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNnx8Y29mZmVlfGVufDB8fHx8MTcwMjMyMDI0N3ww&ixlib=rb-4.0.3&q=80&w=1080',
                        width: 406.0,
                        height: 187.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 9.0, 0.0, 0.0),
                          child: StreamBuilder<List<OfficeMainNamesRecord>>(
                            stream: queryOfficeMainNamesRecord(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<OfficeMainNamesRecord>
                                  dropDownOfficeMainNamesRecordList =
                                  snapshot.data!;
                              return FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController1 ??=
                                    FormFieldController<String>(null),
                                options: dropDownOfficeMainNamesRecordList
                                    .map((e) => e.personName)
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue1 = val),
                                width: 384.0,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Your name',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              );
                            },
                          ),
                        ),
                      ),
                      if (_model.dropDownValue1 != null &&
                          _model.dropDownValue1 != '')
                        Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 9.0, 0.0, 0.0),
                            child: StreamBuilder<List<CoffeeCollectionRecord>>(
                              stream: queryCoffeeCollectionRecord(
                                queryBuilder: (coffeeCollectionRecord) =>
                                    coffeeCollectionRecord.where(
                                  'coffee_choices',
                                  isEqualTo: _model.dropDownValue2,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CoffeeCollectionRecord>
                                    dropDownCoffeeCollectionRecordList =
                                    snapshot.data!;
                                return FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownValueController2 ??=
                                          FormFieldController<String>(null),
                                  options: dropDownCoffeeCollectionRecordList
                                      .map((e) => e.coffeeChoices)
                                      .toList(),
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue2 = val),
                                  width: 384.0,
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Today\'s choice',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1.00, 0.00),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 5.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        if (_model.dropDownValue1 == null) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Oops..'),
                                content: const Text('Person\'s name required'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: const Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }
                        if (_model.dropDownValue2 == null) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Oops..'),
                                content: const Text('Please select your coffee'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: const Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }

                        await OrdersRecord.collection
                            .doc()
                            .set(createOrdersRecordData(
                              personName: _model.dropDownValue1,
                              coffeeChoice: _model.dropDownValue2,
                              orderDate: getCurrentTimestamp,
                              completed: false,
                            ));
                        setState(() {
                          _model.dropDownValueController2?.reset();
                          _model.dropDownValueController1?.reset();
                        });
                      },
                      text: 'Order',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFF8A4A18),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 5.0,
                  indent: 5.0,
                  endIndent: 5.0,
                  color: Color(0xFF8A4A18),
                ),
                StreamBuilder<List<OrdersRecord>>(
                  stream: queryOrdersRecord(
                    queryBuilder: (ordersRecord) => ordersRecord.where(
                      'completed',
                      isEqualTo: false,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<OrdersRecord> listViewOrdersRecordList =
                        snapshot.data!;
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewOrdersRecordList.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewOrdersRecord =
                            listViewOrdersRecordList[listViewIndex];
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color(0x11180E05),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listViewOrdersRecord.personName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
                                    ),
                              ),
                              Text(
                                listViewOrdersRecord.coffeeChoice,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await listViewOrdersRecord.reference
                                          .update(createOrdersRecordData(
                                        completed: true,
                                      ));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Order completed',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    },
                                    text: 'Complete',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Confirm Deletion'),
                                                    content: const Text(
                                                        'Are you sure you want to delete this order?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: const Text('Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: const Text('Confirm'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        await listViewOrdersRecord.reference
                                            .delete();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Order deleted',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }
                                    },
                                    text: 'Delete',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 16.0)),
                              ),
                            ].divide(const SizedBox(height: 8.0)),
                          ),
                        );
                      },
                    );
                  },
                ),
                const Divider(
                  thickness: 5.0,
                  indent: 5.0,
                  endIndent: 5.0,
                  color: Color(0xFF8A4A18),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.00, 0.00),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/footer_banner.jpg',
                      width: 405.0,
                      height: 135.0,
                      fit: BoxFit.fitWidth,
                      alignment: const Alignment(0.00, 1.00),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                  child: Container(
                    width: 386.0,
                    height: 31.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF8A4A18),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.00, -1.00),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: Text(
                          'Created by R\'N\'R @2023',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 14.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
