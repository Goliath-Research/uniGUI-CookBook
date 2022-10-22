unit CDVoid;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Data.DB,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, Vcl.ExtCtrls, Vcl.Forms;

type
  TFrmCDVoid = class(TUniForm)
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    SrcGlPeriods: TDataSource;
    TblGlPeriods: TFDTable;
    TblGlPeriodsID: TBCDField;
    TblGlPeriodsGLYEAR_ID: TBCDField;
    TblGlPeriodsPERIOD: TBCDField;
    TblGlPeriodsSTART_DATE: TDateTimeField;
    TblGlPeriodsEND_DATE: TDateTimeField;
    TblGlPeriodsSTATUS: TStringField;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label9: TUniLabel;
    Label3: TUniLabel;
    DBEditPeriod: TUniDBEdit;
    SBPeriod: TUniSpeedButton;
    edReason: TUniEdit;
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SBPeriodClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    GLPeriodHint:TNotifyEvent;
    procedure DisplayHint(Sender: TObject);
  public
    { Public declarations }
    FID:Real;
    FReason:String;
  end;

function GetCDVoidInfo(var AID:Real; var AReason:String):Boolean;

implementation

{$R *.DFM}

uses
  cd_rscstr,
  IQMS.Common.Period,
  IQMS.Common.AccountingShare,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

function GetCDVoidInfo(var AID:Real; var AReason:String):Boolean;
var
  form : TFrmCDVoid;
begin
  form := TFrmCDVoid.Create(uniGUIApplication.UniApplication);

  IQSetTablesActiveEx( TRUE, form, cd_rscstr.cTXT0000075 {'Accessing database.  Please wait.'} );
  form.TblGlPeriods.Locate('ID', AID, []);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(form.PnlClient02, 16);

  Result := form.ShowModal = mrOK;
  AID    := form.FID;
  AReason:= form.FReason;

end;

procedure TFrmCDVoid.BtnOkClick(Sender: TObject);
begin
  CheckForOpenPeriod('ap_status', TblGLPeriods.FieldByName('ID').asFloat);  {in IqAcctShr.pas}

  {'You are about to void a check.  This change is irreversible.'#13 +
   'Do you want to continue?'}
  if not IqConfirmYN(cd_rscstr.cTXT0000065) then Exit;

  FID := TblGLPeriods.FieldByName('ID').asFloat;
  FReason := edReason.Text;
  FReason := StrTran(FReason, #13, ' ');
  FReason := StrTran(FReason, #10, ' ');
  FReason := StrTran(FReason, '''', '''''');

  ModalResult := mrOk;
end;

procedure TFrmCDVoid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // Application.OnHint := GLPeriodHint;
  //IQRegFormWrite( self, [ self ]);
end;

procedure TFrmCDVoid.DisplayHint(Sender: TObject);
begin
//  with TblGLPeriods do
//  DBEditPeriod.Hint := Format(cd_rscstr.cTXT0000066 {'Start Date: %s'#13'End Date: %s'},
//                       [FormatDateTime('dd/mmm/yy', FieldByName('START_DATE').asDateTime),
//                        FormatDateTime('dd/mmm/yy', FieldByName('END_DATE').asDateTime)]);
end;


procedure TFrmCDVoid.FormCreate(Sender: TObject);
begin
 // IQRegFormRead( self, [ self ]);
end;

procedure TFrmCDVoid.SBPeriodClick(Sender: TObject);
var
  Id:Real;
begin
  Id := DoFindPeriod;
  if Id <> 0 then TblGLPeriods.FindKey([Id]);
end;

procedure TFrmCDVoid.FormActivate(Sender: TObject);
begin
 // IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmAP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
