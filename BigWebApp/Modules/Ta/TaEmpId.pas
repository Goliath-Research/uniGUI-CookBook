unit TaEmpId;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmGetEmpId = class(TUniForm)
    edEmpNo: TUniEdit;
    Label1: TUniLabel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnCancel: TUniButton;
    btnOk: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FEmpField :String;
    FValidationErrorMsg  :String;
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
  public
    { Public declarations }
    FId:Real;
  end;

function TaGetEmpId():Real;

implementation

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  ta_rscstr,
  IQMS.Common.Controls;

{$R *.DFM}

function TaGetEmpId():Real;
var
  LFrmGetEmpId : TFrmGetEmpId;
begin
   LFrmGetEmpId := TFrmGetEmpId.Create(UniGUIApplication.UniApplication);
   LFrmGetEmpId.ShowModal;
    if LFrmGetEmpId.ModalResult = mrOk then
      Result := LFrmGetEmpId.FId
    else
      Result := 0;
end;

procedure TFrmGetEmpId.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);

  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add('select NVL(use_emp_badgeno, ''N'') as use_emp_badgeno, ' +
                    'NVL(use_clock_io_masking, ''N'') as use_clock_io_masking ' +
               'from iqsys where rownum < 2');
    Open;
    if FieldByName('use_emp_badgeno').asString = 'Y' then
    begin
      self.Caption    := ta_rscstr.cTXT0000026; // 'Employee Badge';
      Label1.Caption  := ta_rscstr.cTXT0000027; // 'Enter Employee Badge #';

      FEmpField := 'BADGENO';
      FValidationErrorMsg  := ta_rscstr.cTXT0000006; // 'Invalid badge number.';
    end
    else
    begin
      self.Caption    := ta_rscstr.cTXT0000028; // 'Employee Number';
      Label1.Caption  := ta_rscstr.cTXT0000029; // 'Enter Employee Number';

      FEmpField := 'EMPNO';
      FValidationErrorMsg  := ta_rscstr.cTXT0000007; // 'Invalid employee number.';
    end;
    if FieldByName('use_clock_io_masking').asString = 'Y' then
      edEmpNo.PasswordChar := #42;
  finally
    Free;
  end;
end;

procedure TFrmGetEmpId.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmGetEmpId.FormShow(Sender: TObject);
begin
  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
end;

procedure TFrmGetEmpId.btnOkClick(Sender: TObject);
begin
  FID := SelectValueFmtAsFloat('select id from pr_emp where %s = LTrim(RTrim(''%s''))',
                   [FEmpField, Trim(edEmpNo.Text)]);
  if FID = 0 then
  begin
    edEmpNo.Text := '';
    raise Exception.Create(FValidationErrorMsg);
  end;
  ModalResult := mrOk;
end;

procedure TFrmGetEmpId.IQAfterShowMessage(var Msg: TMessage);
begin
  Application.ProcessMessages;
  Application.BringToFront;
  ForceForegroundWindowB(Application.Handle);
  Self.BringToFront;
end;

end.
