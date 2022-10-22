unit oc_boms;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.Jump,
  Vcl.Menus,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmOutsourceBOMs = class(TUniForm)
    pnlCarrier: TUniPanel;
    IQSearch1: TIQUniGridControl;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1MFGNO: TStringField;
    Query1ITEMNO: TStringField;
    Query1REV: TStringField;
    Query1DESCRIP: TStringField;
    Query1DESCRIP2: TStringField;
    Query1COMPANY: TStringField;
    Query1ID: TBCDField;
    Query1EPLANT_ID: TBCDField;
    Query1EFFECT_DATE: TDateTimeField;
    Query1DEACTIVE_DATE: TDateTimeField;
    Query1VENDORNO: TStringField;
    PopupMenu1: TUniPopupMenu;
    JumptoBOM1: TUniMenuItem;
    IQJumpBom: TIQWebJump;
    Query1ARINVT_ID: TBCDField;
    JumpToInventory1: TUniMenuItem;
    IQJumpInv: TIQWebJump;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JumptoBOM1Click(Sender: TObject);
    procedure JumpToInventory1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure TFrmOutsourceBOMs.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmOutsourceBOMs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action:= caFree;
end;

procedure TFrmOutsourceBOMs.JumptoBOM1Click(Sender: TObject);
begin
  IQJumpBom.Execute;
end;

procedure TFrmOutsourceBOMs.JumpToInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

end.
