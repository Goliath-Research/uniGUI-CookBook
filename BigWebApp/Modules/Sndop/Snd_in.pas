unit Snd_IN;

interface

uses
  Winapi.Windows,
  Snd_Base,
  Mask,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Jump, Vcl.Menus, uniMainMenu, Vcl.Dialogs, IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About, uniButton, uniBitBtn, uniSpeedButton, IQMS.WebVcl.HPick,
  Data.DB, IQMS.WebVcl.DocumentsExternal, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, IQMS.WebVcl.Documents, uniDBNavigator, uniBasicGrid,
  uniDBGrid, IQUniGrid, Vcl.Forms, uniGUIFrame, uniCheckBox, uniDBCheckBox,
  uniEdit, uniDBEdit, uniLabel, uniPageControl, System.Classes, Vcl.Controls,
  uniSplitter;

type
  TSndIN = class(TSndBase)
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    FDQuery1: TFDQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SndIN: TSndIN;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  sndop_rscstr;

procedure TSndIN.FormCreate(Sender: TObject);
begin
  OpClass:= 'IN';
  inherited;
  PageControlDetails.ActivePage:= TabSheetMaterials;
  // ensure navigation bar Vcl.Buttons are 25x25 (after security)
  (*
  IQMS.Common.Controls.ResizeNavBar(NavMain);
  IQMS.Common.Controls.ResizeNavBar(navMaterials);
  IQMS.Common.Controls.ResizeNavBar(navMatQPB);
  *)
end;

end.

