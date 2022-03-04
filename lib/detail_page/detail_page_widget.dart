import '../backend/backend.dart';
import '../edit_page/edit_page_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DetailPageWidget extends StatefulWidget {
  const DetailPageWidget({
    Key key,
    this.title,
    this.cover,
    this.nbTomes,
    this.inMyList,
    this.resume,
    this.nbTomesPossedes,
  }) : super(key: key);

  final String title;
  final String cover;
  final int nbTomes;
  final bool inMyList;
  final String resume;
  final int nbTomesPossedes;

  @override
  _DetailPageWidgetState createState() => _DetailPageWidgetState();
}

class _DetailPageWidgetState extends State<DetailPageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int countControllerValue;

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MangasRecord>>(
      stream: queryMangasRecord(
        queryBuilder: (mangasRecord) =>
            mangasRecord.where('title', isEqualTo: widget.title),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitFadingCube(
                color: FlutterFlowTheme.primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<MangasRecord> detailPageMangasRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final detailPageMangasRecord = detailPageMangasRecordList.isNotEmpty
            ? detailPageMangasRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFFEEEEEE),
                size: 24,
              ),
              onPressed: () async {
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBarPage(initialPage: 'HomePage'),
                  ),
                  (r) => false,
                );
              },
            ),
            title: Text(
              widget.title,
              style: FlutterFlowTheme.title1.override(
                fontFamily: 'Poppins',
                color: Color(0xFFFAFAFA),
              ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: FaIcon(
                  FontAwesomeIcons.trashAlt,
                  color: Color(0xFFE6E6E6),
                  size: 30,
                ),
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Êtes vous sûr ?'),
                        content: Text('Toute suppression est définitive'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Annuler'),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.pop(alertDialogContext);
                              await detailPageMangasRecord.reference.delete();
                              ;
                            },
                            child: Text('Supprimer'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: Colors.black,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPageWidget(
                    title: widget.title,
                    nbTomes: widget.nbTomes,
                    resume: widget.resume,
                    nbTomesPossedes: widget.nbTomesPossedes,
                  ),
                ),
              );
            },
            backgroundColor: Color(0xFFAA50D4),
            elevation: 8,
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 24,
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional(0, 0),
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 350,
                                  decoration: BoxDecoration(),
                                  child: ClipRect(
                                    child: ImageFiltered(
                                      imageFilter: ImageFilter.blur(
                                        sigmaX: 10,
                                        sigmaY: 10,
                                      ),
                                      child: Image.network(
                                        detailPageMangasRecord.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  child: Image.network(
                                    widget.cover,
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    height: MediaQuery.of(context).size.height *
                                        0.35,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.73,
                                height: 50,
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        widget.title,
                                        style: FlutterFlowTheme.title1.override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.tertiaryColor,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if ((detailPageMangasRecord.inMyList) == false)
                                InkWell(
                                  onTap: () async {
                                    final mangasUpdateData =
                                        createMangasRecordData(
                                      inMyList: true,
                                    );
                                    await detailPageMangasRecord.reference
                                        .update(mangasUpdateData);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.13,
                                    height: MediaQuery.of(context).size.width *
                                        0.13,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.primaryColor,
                                        width: 3,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: FlutterFlowTheme.primaryColor,
                                      size: 24,
                                    ),
                                  ),
                                ).animated([
                                  animationsMap[
                                      'containerOnActionTriggerAnimation']
                                ]),
                              if ((detailPageMangasRecord.inMyList) == true)
                                InkWell(
                                  onTap: () async {
                                    final mangasUpdateData =
                                        createMangasRecordData(
                                      inMyList: false,
                                    );
                                    await detailPageMangasRecord.reference
                                        .update(mangasUpdateData);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.13,
                                    height: MediaQuery.of(context).size.width *
                                        0.13,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.primaryColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.primaryColor,
                                        width: 3,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: FlutterFlowTheme.tertiaryColor,
                                      size: 24,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if ((detailPageMangasRecord.inMyList) == true)
                                Text(
                                  detailPageMangasRecord.nbTomesPossedes
                                      .toString(),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF8E8E8E),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              if ((detailPageMangasRecord.inMyList) == true)
                                Text(
                                  ' / ',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF8E8E8E),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              Text(
                                widget.nbTomes.toString(),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF8E8E8E),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                ' tomes',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF8E8E8E),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if ((widget.inMyList) == true)
                                Text(
                                  ' possédé(s)',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF8E8E8E),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if ((detailPageMangasRecord.inMyList) == true)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Divider(
                                height: 40,
                                thickness: 2,
                                indent: 50,
                                endIndent: 50,
                                color: Color(0xFFCACACA),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Possédés  :',
                                      style: FlutterFlowTheme.title3.override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFEEEEEE),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.37,
                                        decoration: BoxDecoration(),
                                        child: Container(
                                          height: 65,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color: Color(0xFF9E9E9E),
                                              width: 1,
                                            ),
                                          ),
                                          child: FlutterFlowCountController(
                                            decrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.minus,
                                              color: enabled
                                                  ? Color(0xDD000000)
                                                  : Color(0xFFEEEEEE),
                                              size: 20,
                                            ),
                                            incrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.plus,
                                              color: enabled
                                                  ? Colors.blue
                                                  : Color(0xFFEEEEEE),
                                              size: 20,
                                            ),
                                            countBuilder: (count) => Text(
                                              count.toString(),
                                              style: GoogleFonts.getFont(
                                                'Roboto',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                            count: countControllerValue ??=
                                                detailPageMangasRecord
                                                    .nbTomesPossedes,
                                            updateCount: (count) => setState(
                                                () => countControllerValue =
                                                    count),
                                            stepSize: 1,
                                            minimum: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  final mangasUpdateData =
                                      createMangasRecordData(
                                    nbTomesPossedes: countControllerValue,
                                  );
                                  await detailPageMangasRecord.reference
                                      .update(mangasUpdateData);
                                },
                                text: 'VALIDER',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                              ),
                              Divider(
                                height: 40,
                                thickness: 2,
                                indent: 50,
                                endIndent: 50,
                                color: Color(0xFFCACACA),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                child: Text(
                                  'Complété à :',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              CircularPercentIndicator(
                                percent: functions.rapport(
                                    detailPageMangasRecord.nbTomesPossedes.toDouble(),
                                    widget.nbTomes.toDouble()),
                                radius: 70,
                                lineWidth: 24,
                                animation: true,
                                progressColor: FlutterFlowTheme.primaryColor,
                                backgroundColor: Color(0xFFF1F4F8),
                                center: Text(
                                  functions.pourcentage(detailPageMangasRecord.nbTomesPossedes.toDouble(),
                                      widget.nbTomes.toDouble()),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              height: 40,
                              thickness: 2,
                              indent: 50,
                              endIndent: 50,
                              color: Color(0xFFCACACA),
                            ),
                            Text(
                              'Résumé :',
                              style: FlutterFlowTheme.subtitle1.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Text(
                                widget.resume,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFD1D1D1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
