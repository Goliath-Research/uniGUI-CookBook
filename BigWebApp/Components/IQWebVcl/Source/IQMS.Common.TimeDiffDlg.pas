unit IQMS.Common.TimeDiffDlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniMemo,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TTimeDiff = class(TUniForm)
    Label3: TUniLabel;
    Edit1: TUniEdit;
    Bevel4: TUniPanel;
    btnSave: TUniButton;
    btnIgnore: TUniButton;
    Memo1: TUniMemo;
    Bevel1: TUniPanel;
    chkForceOffset: TUniCheckBox;
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure SaveDiffToReg( ATimeDiff: Real );
  public
    { Public declarations }
    //constructor Create( AOwner: TComponent; AMesg: string; ATimeDiff: Real );

    class procedure Execute( AMesg: string;  var ATimeDiff: Real );
    class function GetDiffFromReg( var ATimeDiff: Real ): Boolean;
    class function IsOffsetTimeForced: Boolean;
  end;

var
  TimeDiff: TTimeDiff;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Numbers;

{ TFrmTimeDiffDialog }

class function TTimeDiff.GetDiffFromReg( var ATimeDiff: Real ): Boolean;
begin
  ATimeDiff:= 0;
  //Result:= IQRegFloatScalarRead( NIL, 'TimeZoneDifference', ATimeDiff );
  ATimeDiff:= ATimeDiff / 24;
end;

class function TTimeDiff.IsOffsetTimeForced: Boolean;
var
  AScalarValue: string;
begin
  Result:= FALSE;
//  if IQRegStringScalarRead( NIL, 'ForceOffsetTime', AScalarValue ) then
//     Result:= AScalarValue = 'Y';
end;

class procedure TTimeDiff.Execute( AMesg: string; var ATimeDiff: Real );
var
  frm : TTimeDiff;
  AScalarValue: string;
begin

  frm := TTimeDiff.Create(uniGUIApplication.UniApplication);

  with frm do
  begin
    Memo1.Text:= AMesg;
    Edit1.Text:= FloatToStr( ATimeDiff );

    if IQRegStringScalarRead( NIL, 'ForceOffsetTime', AScalarValue ) then
       chkForceOffset.Checked:= AScalarValue = 'Y';

  end;

  if frm.ShowModal = mrOk then
     ATimeDiff := StrToFloat( frm.Edit1.Text ) / 24;

end;

procedure TTimeDiff.btnSaveClick(Sender: TObject);
begin
  {Validate and Save}
  SaveDiffToReg( IQRoundEx( StrToFloat( Edit1.Text ), 2));
  ModalResult:= mrOK;
end;

procedure TTimeDiff.SaveDiffToReg( ATimeDiff: Real );
var
  S: string;
begin
  IQRegFloatScalarWrite( NIL, 'TimeZoneDifference', ATimeDiff );

  if chkForceOffset.Checked then S:= 'Y' else S:= 'N';

  IQRegStringScalarWrite( NIL, 'ForceOffsetTime', S );
end;


end.

