unit wc_frame_template;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.wwDataInspector,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  Vcl.Wwdatsrc,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame, Vcl.Controls, Vcl.Grids;

type
  TFrmWorkCenterFrameTemplate = class(TUniForm)
    pnlTop01: TUniPanel;
    Panel2: TUniPanel;
    NavMain: TUniDBNavigator;
    SrcFrame: TDataSource;
    QryFrame: TFDQuery;
    QryFrameID: TBCDField;
    QryFrameFRAME_NO: TStringField;
    QryFrameDESCRIP: TStringField;
    QryFramePMEQMT_ID: TBCDField;
    QryFramePmEqno: TStringField;
    wwDataInspector1: TwwDataInspector;
    Splitter1: TUniSplitter;
    UpdateSQLFrame: TFDUpdateSQL;
    sbtnSearch: TUniSpeedButton;
    PkFrame: TIQWebHPick;
    PkFrameID: TBCDField;
    PkFrameFRAME_NO: TStringField;
    PkFrameDESCRIP: TStringField;
    PkFrameEQNO: TStringField;
    Panel1: TUniPanel;
    Panel3: TUniPanel;
    wwDBGridFrameSets: TIQUniGridControl;
    SrcFrameSet: TDataSource;
    QryFrameSet: TFDQuery;
    QryFrameSetID: TBCDField;
    QryFrameSetFRAME_ID: TBCDField;
    QryFrameSetCNTR_TYPE: TStringField;
    UpdateSQLFrameSet: TFDUpdateSQL;
    wwDBComboDlgPmEqmt: TUniEdit;
    QryFrameSetSEQ: TBCDField;
    wwDBLookupComboCntrType: TUniDBLookupComboBox;
    QrtCntrType: TFDQuery;
    QrtCntrTypeCNTR_TYPE: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryFrameBeforePost(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure QryFrameCalcFields(DataSet: TDataSet);
    procedure sbtnSearchClick(Sender: TObject);
    procedure QryFrameSetBeforePost(DataSet: TDataSet);
    procedure QryFrameSetNewRecord(DataSet: TDataSet);
    procedure PostParentBeforeEdit(DataSet: TDataSet);
    procedure wwDBComboDlgPmEqmtCustomDlg(Sender: TObject);
    procedure QryFrameNewRecord(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  PM_Info;

{ TFrmWorkCenterFrameTemplate }

class procedure TFrmWorkCenterFrameTemplate.DoShow;
begin
  self.Create(uniGUIApplication.UniApplication).Show;
end;

procedure TFrmWorkCenterFrameTemplate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormwrite(self, [self, pnlTop01]);
end;

procedure TFrmWorkCenterFrameTemplate.QryFrameBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'FRAME');
  QryFrameFRAME_NO.asString := UpperCase(QryFrameFRAME_NO.asString);
end;

procedure TFrmWorkCenterFrameTemplate.ApplyUpdates(DataSet: TDataSet);
begin
  // IQApplyUpdateToTable(DataSet);
end;

procedure TFrmWorkCenterFrameTemplate.QryFrameCalcFields(
  DataSet: TDataSet);
begin
  if QryFramePMEQMT_ID.AsLargeInt > 0 then
    QryFramePmEqno.asString := SelectValueByID('eqno', 'pmeqmt',
      QryFramePMEQMT_ID.AsLargeInt);
end;

procedure TFrmWorkCenterFrameTemplate.QryFrameNewRecord(DataSet: TDataSet);
begin
  QryFrameID.AsLargeInt := GetNextID('FRAME');
end;

procedure TFrmWorkCenterFrameTemplate.sbtnSearchClick(Sender: TObject);
begin
  with PkFrame do
    if Execute then
      QryFrame.Locate('id', System.Variants.VarAsType(GetValue('id'),
        varInt64), [])
end;

procedure TFrmWorkCenterFrameTemplate.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(True, self);
  IQRegFormRead(self, [self, pnlTop01]);
end;

procedure TFrmWorkCenterFrameTemplate.QryFrameSetBeforePost(
  DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'FRAME_SET');
end;

procedure TFrmWorkCenterFrameTemplate.QryFrameSetNewRecord(
  DataSet: TDataSet);
begin
  QryFrameSetID.asFloat:= 0;
  QryFrameSetFRAME_ID.asFloat := QryFrameID.asFloat;
  QryFrameSetSEQ.asFloat := 1 + SelectValueFmtAsInteger(
    'select max(seq) from frame_set where frame_id = %d',
    [QryFrameID.AsLargeInt]);
end;

procedure TFrmWorkCenterFrameTemplate.PostParentBeforeEdit(
  DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit(DataSet)
end;

procedure TFrmWorkCenterFrameTemplate.wwDBComboDlgPmEqmtCustomDlg
  (Sender: TObject);
var
  AID: Real;
begin
  AID := QryFramePMEQMT_ID.AsLargeInt;
  if DoPMInfo(AID) then { PM_Info.pas }
  begin
    QryFrame.Edit;
    QryFramePMEQMT_ID.AsLargeInt := Trunc(AID);
  end;
end;

end.
