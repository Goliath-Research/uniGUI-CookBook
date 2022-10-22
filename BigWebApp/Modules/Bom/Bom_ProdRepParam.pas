unit Bom_ProdRepParam;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.JumpConstants,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniRadioButton,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TBOMProdRepParamsCargo = record
    IsReuse      : Boolean;
    IsReuse_Sprue: Boolean;
    IsRg_Dispo   : Boolean;
    LookupMfgtype: string;
  end;

  TFrmBOMProdRepParams = class(TUniForm)
    GroupBox1: TUniGroupBox;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    GroupBox2: TUniGroupBox;
    rbtnShotWeight: TUniRadioButton;
    rbtnPartWeight: TUniRadioButton;
    rbtnGoodParts: TUniRadioButton;
    chkBackflush: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LoadRadioButtonsFromCargo( ABOMProdRepParamsCargo: TBOMProdRepParamsCargo );
    procedure SaveRadioButtonsToCargo( var ABOMProdRepParamsCargo: TBOMProdRepParamsCargo );
    procedure IQAfterShowMessage(var Msg: TMessage); message iq_AfterShowMessage;
  public
    { Public declarations }
    class function DoShowModal( var ABOMProdRepParamsCargo: TBOMProdRepParamsCargo ): Boolean;
    class function BackflushAsText( AReuse, AReuse_Sprue: string; ALookupMfgType: string ): string;
    class function RegrindAsText( ARG_Dispo: string; ALookupMfgType: string ): string;
  end;

implementation

{$R *.DFM}

uses
  bom_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm;

class function TFrmBOMProdRepParams.DoShowModal( var ABOMProdRepParamsCargo: TBOMProdRepParamsCargo ): Boolean;
var
  LFrmBOMProdRepParams : TFrmBOMProdRepParams;
begin
  LFrmBOMProdRepParams := TFrmBOMProdRepParams.Create( uniGUIApplication.UniApplication );
  LFrmBOMProdRepParams.LoadRadioButtonsFromCargo( ABOMProdRepParamsCargo );
  Result:= LFrmBOMProdRepParams.ShowModal = mrOK;
  if Result then
     LFrmBOMProdRepParams.SaveRadioButtonsToCargo( ABOMProdRepParamsCargo );
end;

class function TFrmBOMProdRepParams.BackflushAsText( AReuse, AReuse_Sprue: string; ALookupMfgType: string ): string;
var
  S: string;
begin
  if not (AReuse = 'Y') and not (AReuse_Sprue = 'Y') then
     begin
       // Result:= 'Based on total cycles at shot weight'
       S:= 'shot';
       if (ALookupMfgType = 'STAMPING') or (ALookupMfgType = 'DIECAST') then
          S:= 'cycle';
       Result:= Format('Based on total cycles at %s weight', [ S ]);
     end
  else if not (AReuse = 'Y' ) and (AReuse_Sprue = 'Y') then
     Result:= 'Based on total cycles at part weight'
  else if (AReuse = 'Y') and not (AReuse_Sprue = 'Y') then
     Result:= 'Good parts only at part weight'
  else
     Result:= '';
end;

class function TFrmBOMProdRepParams.RegrindAsText( ARG_Dispo: string; ALookupMfgType: string ): string;
var
  S: string;
begin
  S:= 'regrind';

  if (ALookupMfgType = 'STAMPING') or (ALookupMfgType = 'DIECAST') then
     S:= 'waste material';

  if ARG_Dispo = 'Y' then
     Result:= Format('Backflush %s from inventory', [ S ])
  else
     Result:= Format('Do not backflush %s from inventory', [ S ]);
end;

procedure TFrmBOMProdRepParams.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmBOMProdRepParams.IQAfterShowMessage(var Msg: TMessage);
begin
  { TODO -oathite -cWebConvert : Incompatible types: 'TForm' and 'TFrmBOMProdRepParams'
  IQMS.Common.Controls.ResizeCheckBoxes(Self, GroupBox1);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, GroupBox2);}
end;

procedure TFrmBOMProdRepParams.LoadRadioButtonsFromCargo( ABOMProdRepParamsCargo: TBOMProdRepParamsCargo );
begin
  with ABOMProdRepParamsCargo do
  begin
    rbtnShotWeight.Checked:= FALSE;
    rbtnPartWeight.Checked:= FALSE;
    rbtnGoodParts.Checked := FALSE;

    if not IsReuse and not IsReuse_Sprue then
       rbtnShotWeight.Checked:= TRUE
    else if not IsReuse and IsReuse_Sprue then
       rbtnPartWeight.Checked:= TRUE
    else if IsReuse and not IsReuse_Sprue then
       rbtnGoodParts.Checked := TRUE
    else if IsReuse and IsReuse_Sprue then
       IQWarning('Invalid Production Report Parameters are passed');

    chkBackflush.Checked:= IsRg_Dispo;

    {rbtnShotWeight caption}
    if (LookupMfgType = 'STAMPING') or (LookupMfgType = 'DIECAST') then
       rbtnShotWeight.Caption:= bom_rscstr.cTXT0000023 {'Total Cycles at Cycle Weight'}
    else
       rbtnShotWeight.Caption:= bom_rscstr.cTXT0000024; {'Total Cycles at Shot Weight'}

    {chkBackflush caption}
    if (LookupMfgType = 'STAMPING') or (LookupMfgType = 'DIECAST') then
       chkBackflush.Caption:= bom_rscstr.cTXT0000022 {'Backflush waste material from inventory'}
    else
       chkBackflush.Caption:= bom_rscstr.cTXT0000021 {'Backflush regrind from inventory'}
  end;
end;

procedure TFrmBOMProdRepParams.SaveRadioButtonsToCargo( var ABOMProdRepParamsCargo: TBOMProdRepParamsCargo );
begin
  with ABOMProdRepParamsCargo do
  begin
    IsReuse      := FALSE;
    IsReuse_Sprue:= FALSE;

    if rbtnShotWeight.Checked then
       {nothing}
    else if rbtnPartWeight.Checked then
       IsReuse_Sprue:= TRUE
    else if rbtnGoodParts.Checked then
       IsReuse:= TRUE;

    IsRg_Dispo:= chkBackflush.Checked;
  end;
end;



procedure TFrmBOMProdRepParams.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
  { TODO -oathite -cWebConvert : Windows messege
  PostMessage(Handle, iq_AfterShowMessage, 0, 0);  // resize checkboxes}
end;

procedure TFrmBOMProdRepParams.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmBOM{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
