unit CAR_ECO_Exist;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  System.Variants,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel, IQUniGrid, uniGUIFrame;

type
  TFrmCAR_ECO_Exist = class(TUniForm)
    pnlCAR: TUniPanel;
    IQSearch1: TIQUniGridControl;
    Splitter1: TUniSplitter;
    SrcCAR: TDataSource;
    QryCAR: TFDQuery;
    SrcECO: TDataSource;
    QryECO: TFDQuery;
    QryCARID: TBCDField;
    QryCARCARNO: TStringField;
    QryCARINITIATOR: TStringField;
    QryCARISSUE_DATE: TDateTimeField;
    QryCARCLOSE_DATE: TDateTimeField;
    QryCAREPLANT_ID: TBCDField;
    QryCARCAR_TYPE_NAME: TStringField;
    QryECOID: TBCDField;
    QryECOECONO: TStringField;
    QryECOORIGINATOR: TStringField;
    QryECOOPEN_DATE: TDateTimeField;
    QryECOECO_TYPE_NAME: TStringField;
    QryECOEPLANT_ID: TBCDField;
    PopupMenu1: TUniPopupMenu;
    PopupMenu2: TUniPopupMenu;
    JumpToCAR1: TUniMenuItem;
    JumpToECO1: TUniMenuItem;
    Panel1: TUniPanel;
    IQSearch2: TIQUniGridControl;
    Splitter2: TUniSplitter;
    IQSearch3: TIQUniGridControl;
    srcMRB: TDataSource;
    QryMRB: TFDQuery;
    QryMRBID: TBCDField;
    QryMRBWORKFLOWNO: TStringField;
    QryMRBINITIATOR: TStringField;
    QryMRBOPEN_DATE: TDateTimeField;
    QryMRBEPLANT_ID: TBCDField;
    PopupMenu3: TUniPopupMenu;
    JumpToMRB1: TUniMenuItem;
    Panel11: TUniPanel;
    Label4: TUniLabel;
    Panel2: TUniPanel;
    Label5: TUniLabel;
    Panel3: TUniPanel;
    Label6: TUniLabel;
    Splitter3: TUniSplitter;
    pnlDev: TUniPanel;
    Panel4: TUniPanel;
    Label1: TUniLabel;
    IQSearch4: TIQUniGridControl;
    SrcDev: TDataSource;
    QryDev: TFDQuery;
    QryDevID: TBCDField;
    QryDevWORKFLOWNO: TStringField;
    QryDevINITIATOR: TStringField;
    QryDevOPEN_DATE: TDateTimeField;
    QryDevEPLANT_ID: TBCDField;
    PopupMenu4: TUniPopupMenu;
    JumpToDeviation1: TUniMenuItem;
    Splitter4: TUniSplitter;
    pnlPPap: TUniPanel;
    IQSearchPPAP: TIQUniGridControl;
    Panel6: TUniPanel;
    Label2: TUniLabel;
    SrcPPap: TDataSource;
    QryPPap: TFDQuery;
    QryPPapID: TBCDField;
    QryPPapPPAPNO: TStringField;
    QryPPapORIGINATOR: TStringField;
    QryPPapPPAP_DATE: TDateTimeField;
    QryPPapPPAP_TYPE_NAME: TStringField;
    QryPPapEPLANT_ID: TBCDField;
    popmPPAP: TUniPopupMenu;
    JumpToPPAP1: TUniMenuItem;
    QryCARKIND: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryCARBeforeOpen(DataSet: TDataSet);
    procedure JumpToCAR1Click(Sender: TObject);
    procedure JumpToECO1Click(Sender: TObject);
    procedure JumpToMRB1Click(Sender: TObject);
    procedure JumpToDeviation1Click(Sender: TObject);
    procedure JumpToPPAP1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FID: Real;
    FCriteriaFieldName: string;
    procedure AssignCaption;
    procedure SetID(const Value: Real);
    procedure SetCriteriaFieldName(const Value: String);
  public
    { Public declarations }
    class function HasQualityException( AArinvt_ID: Real; ACriteria: string = 'ARINVT_ID'): Boolean;
    property ID : Real write SetID;
    property CriteriaFieldName : String write SetCriteriaFieldName;
  end;

procedure ShowCAR_ECO_Exist(AID: Real; ACriteriaFieldName: string = 'ARINVT_ID');

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.COMExe,
  IQMS.Common.Miscellaneous,
  IQMS.Common.QC_Const;

class function TFrmCAR_ECO_Exist.HasQualityException( AArinvt_ID: Real; ACriteria: string = 'ARINVT_ID'): Boolean;
//label
//  exit_point;
//var
//  ACount: Real;
begin
  //EIQ-6579 New View V_ORD_DETAIL_EX and Migrate class function TFrmCAR_ECO_Exist.HasQualityException to stored procedure AMb 03-27-15
  Result:= SelectValueFmtAsString('select qc_misc.InvHasQualityExceptionYN( %.0f, ''%s'' ) from dual', [ AArinvt_ID, ACriteria ]) = 'Y' ;
(*
  ACount:= 0;

  // car
  ACount:= SelectValueFmtAsFloat('select 1                                                  '+
                     '   from car, car_item item                                '+
                     '  where                                                   '+
                     '        car.id = item.car_id                              '+
                     '    and                                                   '+
                     '        (''%s'' = ''ARINVT_ID'' and %f = item.arinvt_id   '+
                     '         or                                               '+
                     '         ''%s'' = ''PMEQMT_ID'' and %f = item.pmeqmt_id)  '+
                     '    and car.close_date is NULL                            '+
                     '    and rownum < 2                                        '+
                     '    and misc.eplant_filter( car.eplant_id ) = 1           ',
                     [ ACriteria, AArinvt_ID, ACriteria, AArinvt_ID  ]);
  if ACount > 0 then
     goto exit_point;

  // eco
  ACount:= SelectValueFmtAsFloat('select 1                                                  '+
                     '  from eco                                                '+
                     ' where                                                    '+
                     '       (''%s'' = ''ARINVT_ID'' and exists (select 1 from eco_item item where item.eco_id = eco.id and item.arinvt_id = %f) '+
                     '        or                                                '+
                     '        ''%s'' = ''PMEQMT_ID'' and pmeqmt_id = %f )       '+
                     '   and close_date is NULL                                 '+
                     '   and rownum < 2                                         '+
                     '   and misc.eplant_filter( eplant_id ) = 1                ',
                     [ ACriteria, AArinvt_ID, ACriteria, AArinvt_ID  ]);
  if ACount > 0 then
     goto exit_point;

  // mrb
  ACount:= SelectValueFmtAsFloat('select 1                                                  '+
                     '   from wf_header h, wf_deviation_item i                  '+
                     '  where                                                   '+
                     '        (    ''%s'' = ''ARINVT_ID''                       '+
                     '         and i.arinvt_id = %f                             '+
                     '         and i.wf_header_id = h.id                        '+
                     '        )                                                 '+
                     '    and h.close_date is NULL                              '+
                     '    and h.kind = ''MRB''                                  '+
                     '    and rownum < 2                                        '+
                     '    and misc.eplant_filter( h.eplant_id ) = 1             ',
                     [ ACriteria, AArinvt_ID  ]);
  if ACount > 0 then
     goto exit_point;

  // dev
  ACount:= SelectValueFmtAsFloat('select 1                                                  '+
                     '   from wf_header h, wf_deviation_item i                  '+
                     '  where                                                   '+
                     '        (    ''%s'' = ''ARINVT_ID''                       '+
                     '         and i.arinvt_id = %f                             '+
                     '         and i.wf_header_id = h.id                        '+
                     '        )                                                 '+
                     '    and h.complete_date is NULL                           '+
                     '    and h.kind = ''DEV''                                  '+
                     '    and rownum < 2                                        '+
                     '    and misc.eplant_filter( h.eplant_id ) = 1             ',
                     [ ACriteria, AArinvt_ID  ]);
  if ACount > 0 then
     goto exit_point;

  // ppap
  ACount:= SelectValueFmtAsFloat('select 1                                                  '+
                     '  from ppap                                               '+
                     ' where                                                    '+
                     '       (''%s'' = ''ARINVT_ID'' and %f = arinvt_id)        '+
                     '   and approval_date is NULL                              '+
                     '   and rownum < 2                                         '+
                     '   and misc.eplant_filter( eplant_id ) = 1                ',
                     [ ACriteria, AArinvt_ID  ]);
  if ACount > 0 then
     goto exit_point;

  exit_point:
     Result:= ACount > 0;
*)
end;


procedure ShowCAR_ECO_Exist(AID: Real; ACriteriaFieldName: string = 'ARINVT_ID');
var
  LFrmCAR_ECO_Exist : TFrmCAR_ECO_Exist;
begin
  LFrmCAR_ECO_Exist := TFrmCAR_ECO_Exist.Create(UniGUIApplication.UniApplication);
  LFrmCAR_ECO_Exist.ID := AID;
  LFrmCAR_ECO_Exist.CriteriaFieldName := ACriteriaFieldName;
  LFrmCAR_ECO_Exist.Show;
end;

procedure TFrmCAR_ECO_Exist.AssignCaption;
var
  A: Variant;
begin
  if FCriteriaFieldName = 'ARINVT_ID' then
     begin
       A:= SelectValueArrayFmt( 'select rtrim(itemno), rtrim(descrip), rtrim(rev) from arinvt where id = %f', [ FID ]);
       if VarArrayDimCount( A ) = 0 then
          Caption:= Format('Open Quality Modules - Unknown Inventory Item. ID = %f', [ FID ])
       else
          Caption:= Format('Open Quality Modules - Item: %s, %s, Rev: %s', [ A[ 0 ], A[ 1 ], A[ 2 ] ]);
     end
  else if FCriteriaFieldName = 'PMEQMT_ID' then
     begin
       A:= SelectValueArrayFmt( 'select rtrim(eqno), rtrim(descrip) from pmeqmt where id = %f', [ FID ]);
       if VarArrayDimCount( A ) = 0 then
          Caption:= Format('Open Quality Modules - Unknown Equipment. ID = %f', [ FID ])
       else
          Caption:= Format('Open Quality Modules - Equip# : %s, %s', [ A[ 0 ], A[ 1 ] ]);
     end;
end;

procedure TFrmCAR_ECO_Exist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, pnlCAR ]);
end;

procedure TFrmCAR_ECO_Exist.QryCARBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    if Params.FindParam( 'arinvt_id' ) <> nil then
       ParamByName('arinvt_id').asFloat:= FID;
    if Params.FindParam( 'criteria' ) <> nil then
       ParamByName('criteria').asString:= FCriteriaFieldName;
  end;
end;

procedure TFrmCAR_ECO_Exist.SetCriteriaFieldName(const Value: String);
begin
  FCriteriaFieldName := Value;
end;

procedure TFrmCAR_ECO_Exist.SetID(const Value: Real);
begin
  FID := Value;
end;

procedure TFrmCAR_ECO_Exist.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, pnlCAR ]);

  {Caption}
  AssignCaption;
end;

procedure TFrmCAR_ECO_Exist.JumpToCAR1Click(Sender: TObject);
begin
  IQAssert( QryCARID.asInteger > 0, 'Jump information is not available'#13#13'[ ID = NULL ]' );
  if QryCARKIND.asString = 'CAR' then
     Com_Exec( 'IQQC', [ IQMS.Common.QC_Const.QC_CAR_MAINT, QryCARID.asInteger ])     { IQMS.Common.COMExe.pas }
  else if QryCARKIND.asString = 'CAPA' then
     Com_Exec( 'IQQC', [ IQMS.Common.QC_Const.QC_CAPA_MAINT, QryCARID.asInteger ])     { IQMS.Common.COMExe.pas }
end;

procedure TFrmCAR_ECO_Exist.JumpToECO1Click(Sender: TObject);
begin
  IQAssert( QryECOID.asInteger > 0, 'Jump information is not available'#13#13'[ ID = NULL ]' );
  Com_Exec( 'IQQC', [ IQMS.Common.QC_Const.QC_ECO_MAINT, QryECOID.asInteger ]);     { IQMS.Common.COMExe.pas }
end;

procedure TFrmCAR_ECO_Exist.JumpToMRB1Click(Sender: TObject);
begin
  IQAssert( QryMRBID.asInteger > 0, 'Jump information is not available'#13#13'[ ID = NULL ]' );
  Com_Exec( 'IQQC', [ IQMS.Common.QC_Const.QC_MRB_MAINT, QryMRBID.asInteger ]);     { IQMS.Common.COMExe.pas }
end;

procedure TFrmCAR_ECO_Exist.JumpToDeviation1Click(Sender: TObject);
begin
  IQAssert( QryDevID.asInteger > 0, 'Jump information is not available'#13#13'[ ID = NULL ]' );
  Com_Exec( 'IQQC', [ IQMS.Common.QC_Const.QC_DEVIATION_MAINT, QryDevID.asInteger ]);     { IQMS.Common.COMExe.pas }
end;

procedure TFrmCAR_ECO_Exist.JumpToPPAP1Click(Sender: TObject);
begin
  IQAssert( QryPPapID.asInteger > 0, 'Jump information is not available'#13#13'[ ID = NULL ]' );
  Com_Exec( 'IQQC', [ IQMS.Common.QC_Const.QC_PPAP_MAINT, QryPPapID.asInteger ]);     { IQMS.Common.COMExe.pas }
end;

end.
