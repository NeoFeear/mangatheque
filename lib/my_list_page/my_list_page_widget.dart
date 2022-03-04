import '../backend/backend.dart';
import '../detail_page/detail_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MyListPageWidget extends StatefulWidget {
  const MyListPageWidget({Key key}) : super(key: key);

  // shared_preferences pour données sur le tel
  // local_storage pour données pour une utilisation

  @override
  _MyListPageWidgetState createState() => _MyListPageWidgetState();
}

class _MyListPageWidgetState extends State<MyListPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Mes mangas',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Poppins',
            color: Color(0xFFFAFAFA),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Divider(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: StreamBuilder<List<MangasRecord>>(
                    stream: queryMangasRecord(
                      queryBuilder: (mangasRecord) => mangasRecord
                          .where('inMyList', isEqualTo: true)
                          .orderBy('title'),
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
                      List<MangasRecord> gridViewMangasRecordList =
                          snapshot.data;
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 0,
                          childAspectRatio: 0.58,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: gridViewMangasRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewMangasRecord =
                              gridViewMangasRecordList[gridViewIndex];
                          return InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPageWidget(
                                    title: gridViewMangasRecord.title,
                                    cover: gridViewMangasRecord.cover,
                                    nbTomes: gridViewMangasRecord.nbTomes,
                                    inMyList: gridViewMangasRecord.inMyList,
                                    resume: gridViewMangasRecord.resume,
                                    nbTomesPossedes:
                                        gridViewMangasRecord.nbTomesPossedes,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      gridViewMangasRecord.cover,
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 0),
                                          child: AutoSizeText(
                                            gridViewMangasRecord.title,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.subtitle2
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
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
                                      children: [
                                        Text(
                                          gridViewMangasRecord.nbTomesPossedes
                                              .toString(),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF676767),
                                          ),
                                        ),
                                        Text(
                                          ' / ',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF676767),
                                          ),
                                        ),
                                        Text(
                                          gridViewMangasRecord.nbTomes
                                              .toString(),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF676767),
                                          ),
                                        ),
                                        Text(
                                          ' tomes',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF676767),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Divider(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
