unit AssyTrack_SelectRejectMode;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  assy_share,
  Vcl.Buttons,
  Mask,
  Data.DB,
  IQMS.WebVcl.Hpick,
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
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmAssyTrackSelectRejectMode = class(TUniForm)
    rbtnComponents: TUniRadioButton;
    rbtnMfgParts: TUniRadioButton;
    edMfgParts: TUniEdit;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Bevel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Label1: TUniLabel;
    lblRejectCode: TUniLabel;
    wwDBComboDlgDefaultRejectCode: TUniEdit;
    sbtnClearRejectCode: TUniSpeedButton;
    PkRejectCodeSndopAll: TIQWebHPick;
    PkRejectCodeSndopSpecific: TIQWebHPick;
    PkRejectCodeSndopAllREJECT_CODE: TStringField;
    PkRejectCodeSndopAllATTRIBUTE: TStringField;
    PkRejectCodeSndopAllEPLANT_ID: TBCDField;
    PkRejectCodeSndopAllID: TBCDField;
    PkRejectCodeSndopSpecificREJECT_CODE: TStringField;
    PkRejectCodeSndopSpecificATTRIBUTE: TStringField;
    PkRejectCodeSndopSpecificEPLANT_ID: TBCDField;
    PkRejectCodeSndopSpecificID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure EnableControls(Sender: TObject);
    procedure sbtnClearRejectCodeClick(Sender: TObject);
    procedure wwDBComboDlgDefaultRejectCodeCustomDlg(Sender: TObject);
    procedure PkRejectCodeSndopSpecificBeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    FDefault_Reject_Code_ID: Real;
    FSndop_ID: Real;
    FPtoper_ID: Real;
    FAParams: TRejectModeParams;
    procedure Validate;
    procedure SetDefault_Reject_Code_ID(const Value: Real);
    procedure SetAParams(const Value: TRejectModeParams);
    { Private declarations }
  public
    { Public declarations }
    FParams: TRejectModeParams;
    property Default_Reject_Code_ID: Real read FDefault_Reject_Code_ID write SetDefault_Reject_Code_ID;

    class function DoShowModal(var AParams: TRejectModeParams ): Boolean;
    property AParams: TRejectModeParams read FAParams write SetAParams;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls;
  { TODO -ohphadke : Dependency
  AssyTrack_NonConform; }

{ TFrmAssyTrackSelectRejectMode }


class function TFrmAssyTrackSelectRejectMode.DoShowModal(var AParams: TRejectModeParams ): Boolean;
Var
LFrmAssyTrackSelectRejectMode : TFrmAssyTrackSelectRejectMode;
begin
  LFrmAssyTrackSelectRejectMode := TFrmAssyTrackSelectRejectMode.Create(UniGUIApplication.UniApplication);
  with LFrmAssyTrackSelectRejectMode do
  begin
  FParams:= AParams;
  rbtnComponents.Checked:= AParams.RejectMode = rmComponents;
  rbtnMfgParts.Checked  := AParams.RejectMode = rmMfgParts;
  edMfgParts.Text       := FloatToStr( AParams.MfgRejectedParts );
  Default_Reject_Code_ID:= AParams.Reject_Code_ID;
  FSndop_ID             := AParams.Sndop_ID;
  FPtoper_ID            := AParams.Ptoper_ID;
    Result:= ShowModal = mrOK;
    if Result then
       AParams.Assign( FParams );
  end;
end;

procedure TFrmAssyTrackSelectRejectMode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmAssyTrackSelectRejectMode.btnOKClick(Sender: TObject);
var
  ARejectingToNonConform: Boolean;

  procedure _CheckResetMfgRejectsMasterLabelList;
  begin
    if rbtnComponents.Checked
       or
       ARejectingToNonConform and ( RejectCodeNonConformLocations_ID( Default_Reject_Code_ID ) <>  FParams.Non_Conform_Locations_ID ) then
    begin
      FParams.Master_Label_List.Clear;
    end;
  end;

begin
  Validate;

  if rbtnComponents.Checked then
     FParams.RejectMode:= rmComponents
  else
     begin
       FParams.RejectMode:= rmMfgParts;
       FParams.MfgRejectedParts:= StrToFloat(edMfgParts.Text);
       FParams.Reject_Code_ID  := Default_Reject_Code_ID;
     end;

  ARejectingToNonConform:= rbtnMfgParts.Checked and IsRejectCodeAssignedNonConformLocation( Default_Reject_Code_ID );
  if ARejectingToNonConform then
  begin
    FParams.Non_Conform_Locations_ID:= RejectCodeNonConformLocations_ID( Default_Reject_Code_ID );

    _CheckResetMfgRejectsMasterLabelList;

    //if not TFrmAssyTrackNonConform.DoShowModal( self, FParams ) then      // AssyTrack_NonConform.pas
       //ABORT;
  end;

  ModalResult:= mrOK;
end;

procedure TFrmAssyTrackSelectRejectMode.Validate;
begin
  if rbtnMfgParts.Checked then
     IQAssert( StrToFloat(edMfgParts.Text) > 0, 'Rejected mfg parts must be greater than zero');
end;


procedure TFrmAssyTrackSelectRejectMode.EnableControls(Sender: TObject);
begin
  IQMS.Common.Controls.IQEnableControl( [ edMfgParts, wwDBComboDlgDefaultRejectCode, sbtnClearRejectCode ], rbtnMfgParts.Checked );
end;

procedure TFrmAssyTrackSelectRejectMode.SetAParams(
  const Value: TRejectModeParams);
begin
  FAParams := Value;
end;

procedure TFrmAssyTrackSelectRejectMode.SetDefault_Reject_Code_ID(const Value: Real);
begin
  FDefault_Reject_Code_ID:= Value;
  wwDBComboDlgDefaultRejectCode.Text:= SelectValueByID('reject_code', 'reject_code', FDefault_Reject_Code_ID);
end;

procedure TFrmAssyTrackSelectRejectMode.UniFormCreate(Sender: TObject);
begin

  IQRegFormRead(self, [ self ]);

  EnableControls( nil );
end;

procedure TFrmAssyTrackSelectRejectMode.sbtnClearRejectCodeClick(Sender: TObject);
begin
  Default_Reject_Code_ID:= 0;
end;

procedure TFrmAssyTrackSelectRejectMode.wwDBComboDlgDefaultRejectCodeCustomDlg(Sender: TObject);
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

procedure TFrmAssyTrackSelectRejectMode.PkRejectCodeSndopSpecificBeforeOpen(DataSet: TDataSet);
begin
  //with DataSet as TFDQuery do
  //  ParamByName('sndop_id').Value := FSndop_ID;
  AssignQueryParamValue(DataSet, 'sndop_id', FSndop_ID);
end;

end.
