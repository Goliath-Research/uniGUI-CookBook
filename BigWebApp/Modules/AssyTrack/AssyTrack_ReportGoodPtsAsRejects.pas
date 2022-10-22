unit AssyTrack_ReportGoodPtsAsRejects;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
//  Mask,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmAssyTrackReportGoodPartsAsRejects = class(TUniForm)
    Label1: TUniLabel;
    lblRejectCode: TUniLabel;
    sbtnClearRejectCode: TUniSpeedButton;
    edMfgParts: TUniEdit;
    Panel1: TUniPanel;
    Bevel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    wwDBComboDlgDefaultRejectCode: TUniEdit;
    PkRejectCodeSndopAll: TIQWebHPick;
    PkRejectCodeSndopAllREJECT_CODE: TStringField;
    PkRejectCodeSndopAllATTRIBUTE: TStringField;
    PkRejectCodeSndopAllEPLANT_ID: TBCDField;
    PkRejectCodeSndopAllID: TBCDField;
    PkRejectCodeSndopSpecific: TIQWebHPick;
    PkRejectCodeSndopSpecificREJECT_CODE: TStringField;
    PkRejectCodeSndopSpecificATTRIBUTE: TStringField;
    PkRejectCodeSndopSpecificEPLANT_ID: TBCDField;
    PkRejectCodeSndopSpecificID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure wwDBComboDlgDefaultRejectCodeCustomDlg(Sender: TObject);
    procedure PkRejectCodeSndopSpecificBeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    FDefault_Reject_Code_ID: Real;
    FSndop_ID: Real;
    FPtoper_ID: Real;
    procedure Validate;
    procedure SetDefault_Reject_Code_ID(const Value: Real);
    procedure SetSndop_ID(const Value: Real);
    procedure SetPtoper_ID(const Value: Real);
  public
    { Public declarations }
    property Default_Reject_Code_ID: Real read FDefault_Reject_Code_ID write SetDefault_Reject_Code_ID;
    property Sndop_ID: Real read FSndop_ID write SetSndop_ID;
    property Ptoper_ID: Real read FPtoper_ID write SetPtoper_ID;
    class function DoShowModal( ASndop_ID, APtoper_ID: Real; var AQty, AReject_Code_ID: Real ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous;

{ TFrmAssyTrackGoodPartsToRejects }
class function TFrmAssyTrackReportGoodPartsAsRejects.DoShowModal( ASndop_ID, APtoper_ID: Real; var AQty, AReject_Code_ID: Real): Boolean;
var
  frm: TFrmAssyTrackReportGoodPartsAsRejects;
begin
  frm := TFrmAssyTrackReportGoodPartsAsRejects.Create(uniGUIApplication.UniApplication);

  with frm do
  begin
    edMfgParts.Text        := FloatToStr(AQty);
    FDefault_Reject_Code_ID:= AReject_Code_ID;
    FSndop_ID              := ASndop_ID;
    FPtoper_ID             := APtoper_ID;

    Result:= (ShowModal = mrOK);
    if Result then
    begin
      AQty := StrToFloat(edMfgParts.Text);
      AReject_Code_ID:= Default_Reject_Code_ID;
    end;

  end;

end;

procedure TFrmAssyTrackReportGoodPartsAsRejects.SetDefault_Reject_Code_ID(const Value: Real);
begin
  FDefault_Reject_Code_ID := Value;
  wwDBComboDlgDefaultRejectCode.Text:= SelectValueByID('reject_code', 'reject_code', FDefault_Reject_Code_ID);
end;

procedure TFrmAssyTrackReportGoodPartsAsRejects.SetPtoper_ID(const Value: Real);
begin
  FPtoper_ID := Value;
end;

procedure TFrmAssyTrackReportGoodPartsAsRejects.SetSndop_ID(const Value: Real);
begin
  FSndop_ID := Value;
end;

procedure TFrmAssyTrackReportGoodPartsAsRejects.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
end;

procedure TFrmAssyTrackReportGoodPartsAsRejects.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmAssyTrackReportGoodPartsAsRejects.btnOKClick(Sender: TObject);
begin
  Validate;
  ModalResult:= mrOK;
end;

procedure TFrmAssyTrackReportGoodPartsAsRejects.Validate;
begin
  IQAssert( StrToFloat(edMfgParts.Text) > 0, 'Voided mfg parts must be greater than zero');
end;

procedure TFrmAssyTrackReportGoodPartsAsRejects.wwDBComboDlgDefaultRejectCodeCustomDlg(Sender: TObject);
var
  APk: TIQWebHPick;
begin
  if SelectValueFmtAsFloat('select count(*) from sndop_reject_code where sndop_id = %f', [ FSndop_ID ]) > 0 then
     APk:= PkRejectCodeSndopSpecific
  else
     APk:= PkRejectCodeSndopAll;

  with APk do
    if Execute then
       Default_Reject_Code_ID:= GetValue('id');
end;

procedure TFrmAssyTrackReportGoodPartsAsRejects.PkRejectCodeSndopSpecificBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName('sndop_id').Value := FSndop_ID;
  AssignQueryParamValue(DataSet, 'sndop_id', FSndop_ID);
end;

end.
