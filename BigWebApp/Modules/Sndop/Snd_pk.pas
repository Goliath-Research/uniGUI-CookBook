unit Snd_PK;

interface

uses
  Winapi.Windows,
  Snd_Base,
  Mask,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel, IQMS.WebVcl.Jump, Vcl.Menus, uniMainMenu,
  IQMS.WebVcl.SecurityRegister, Vcl.Dialogs, IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About, uniButton, uniBitBtn, uniSpeedButton,
  IQMS.WebVcl.DocumentsExternal, IQMS.WebVcl.Documents, uniDBNavigator,
  uniBasicGrid, uniDBGrid, IQUniGrid, Vcl.Forms, uniGUIFrame, uniCheckBox,
  uniDBCheckBox, uniEdit, uniDBEdit, uniLabel, uniPageControl, System.Classes,
  Vcl.Controls, uniSplitter, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.HPick,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSndPK = class(TSndBase)
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SndPK: TSndPK;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  sndop_rscstr;

procedure TSndPK.FormCreate(Sender: TObject);
begin
  OpClass:= 'PK';
  inherited;
  TblOpMat.FieldByName('PTSPER_DISP').DisplayLabel := sndop_rscstr.cTXT0000028; // 'Items/PK'
  PageControlDetails.ActivePage:= TabSheetMaterials;
  // ensure navigation bar Vcl.Buttons are 25x25 (after security)
  (*
  IQMS.Common.Controls.ResizeNavBar(NavMain);
  IQMS.Common.Controls.ResizeNavBar(navMaterials);
  IQMS.Common.Controls.ResizeNavBar(navMatQPB);
  *)
end;

end.

