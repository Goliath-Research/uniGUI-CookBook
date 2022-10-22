unit TADeflts;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uniComboBox,
  uniDBComboBox, Vcl.Controls;

type
  TFrmTADefaults = class(TUniForm)
    QryPaytypeReg: TFDQuery;
    QryPaytypeOT: TFDQuery;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    QryPaytypeRegID: TBCDField;
    QryPaytypeRegDESCRIPTION: TStringField;
    QryPaytypeOTID: TBCDField;
    QryPaytypeOTDESCRIPTION: TStringField;
    QryPaytypeNPB: TFDQuery;
    StringField2: TStringField;
    FloatField2: TBCDField;
    QryPaytypeOT2: TFDQuery;
    StringField1: TStringField;
    FloatField1: TBCDField;
    QryPaytypeOT3: TFDQuery;
    StringField3: TStringField;
    FloatField3: TBCDField;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label5: TUniLabel;
    dbReg: TUniDBLookupComboBox;
    dbOt: TUniDBLookupComboBox;
    dbOt2: TUniDBLookupComboBox;
    dbOt3: TUniDBLookupComboBox;
    SrcQryPaytypeReg: TDataSource;
    SrcQryPaytypeOT: TDataSource;
    SrcQryPaytypeOT2: TDataSource;
    SrcQryPaytypeOT3: TDataSource;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoTADefaults;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Controls,
  ta_rscstr;

procedure DoTADefaults;
var
  LFrmTADefaults : TFrmTADefaults;
begin
  LFrmTADefaults := TFrmTADefaults.Create(UniGUIApplication.UniApplication);
  LFrmTADefaults.ShowModal;
end;

procedure TFrmTADefaults.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, PnlLeft01]);
end;

procedure TFrmTADefaults.UniFormCreate(Sender: TObject);
begin
  QryPaytypeReg.Open;
  QryPaytypeOT.Open;
  QryPaytypeOT2.Open;
  QryPaytypeOT3.Open;
  QryPaytypeNPB.Open;
  IQRegFormRead( self, [self, PnlLeft01]);
{ TODO -oGPatil -cWebConvert : TUniDBLookupComboBox does not contain a member named lookupvalue
  dbReg.LookUpValue := FloatToStr(SelectValueAsFloat('Select REG_HOURS_PAYTYPE_ID from iqsys where rownum < 2'));
  dbOT.LookUpValue  := FloatToStr(SelectValueAsFloat('Select OT_HOURS_PAYTYPE_ID from iqsys where rownum < 2'));
  dbOT2.LookUpValue  := FloatToStr(SelectValueAsFloat('Select OT2_HOURS_PAYTYPE_ID from iqsys where rownum < 2'));
  dbOT3.LookUpValue  := FloatToStr(SelectValueAsFloat('Select OT3_HOURS_PAYTYPE_ID from iqsys where rownum < 2'));   }
//  dbNPb.LookUpValue := FloatToStr(SelectValueAsFloat('Select NPB_HOURS_PAYTYPE_ID from iqsys where rownum < 2'));
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
end;

procedure TFrmTADefaults.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTADefaults.btnOkClick(Sender: TObject);
begin
  if (dbReg.Text = '') or (dbOT.Text = '')  then
     // 'Please assign a value for Regular or Overtime.'
     raise exception.create(ta_rscstr.cTXT0000025);
{ TODO -oGPatil -cWebConvert : TUniDBLookupComboBox does not contain a member named lookupvalue
  ExecuteCommandFmt('update iqsys set REG_HOURS_PAYTYPE_ID = %s', [dbReg.LookUpValue]);
  ExecuteCommandFmt('update iqsys set OT_HOURS_PAYTYPE_ID = %s', [dbOT.LookUpValue]);
//  if dbNPb.Text <> '' then
//    ExecuteCommandFmt('update iqsys set NPB_HOURS_PAYTYPE_ID = %s', [dbNPb.LookUpValue])
//  else
//    ExecuteCommand('update iqsys set NPB_HOURS_PAYTYPE_ID = ''''');

  if dbOT2.Text <> '' then
    ExecuteCommandFmt('update iqsys set OT2_HOURS_PAYTYPE_ID = %s', [dbOT2.LookUpValue])
  else
    ExecuteCommand('update iqsys set OT2_HOURS_PAYTYPE_ID = ''''');

  if dbOT3.Text <> '' then
    ExecuteCommandFmt('update iqsys set OT3_HOURS_PAYTYPE_ID = %s', [dbOT3.LookUpValue])
  else
    ExecuteCommand('update iqsys set OT3_HOURS_PAYTYPE_ID = ''''');
  Close;   }
end;

end.
