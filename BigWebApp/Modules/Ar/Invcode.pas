unit InvCode;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  DBCtrls,
  Data.DB,
  Vcl.DBGrids,
  IQMS.WebVcl.About,
  Mask,
  Vcl.Buttons,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl,
  uniMainMenu;

type
  TFrmInvCode = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Panel1: TUniPanel;
    Nav: TUniDBNavigator;
    Src: TDataSource;
    Table: TFDTable;
    IQAbout1: TIQWebAbout;
    About1: TUniMenuItem;
    SBSearch: TUniSpeedButton;
    SBToggle: TUniSpeedButton;
    PC: TUniPageControl;
    tabGrid: TUniTabSheet;
    tabForm: TUniTabSheet;
    grid: TUniDBGrid;
    TableINV_PREFIX: TStringField;
    TableDESCRIP: TStringField;
    dbCode: TUniDBEdit;
    dbDescrip: TUniDBEdit;
    Label1: TUniLabel;
    Label2: TUniLabel;
    PkCode: TIQWebHPick;
    PkCodeINV_PREFIX: TStringField;
    PkCodeDESCRIP: TStringField;
    N1: TUniMenuItem;
    Search1: TUniMenuItem;
    Toggle1: TUniMenuItem;
    Contents1: TUniMenuItem;
    TableID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure SBToggleClick(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure TableBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FTable:TFDTable;
    FQry:TFDQuery;
  public
    { Public declarations }
  end;

procedure  DoInvoiceCode( ATable:TFDTable; AQry:TFDQuery );

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook,
  ar_rscstr;

procedure  DoInvoiceCode( ATable:TFDTable; AQry:TFDQuery );
var
   FrmInvCode: TFrmInvCode;
begin
   FrmInvCode := TFrmInvCode.Create(uniGUIApplication.UniApplication);
   with FrmInvCode do
   begin
      FTable := Table;
      FQry := AQry;
      if ATable <> nil then
      begin
        Src.DataSet := ATable;
        FTable := ATable;
      end;
      //'Accessing Invoice Codes.  Please wait.';
      IQSetTablesActiveEx( True, FrmInvCode, ar_rscstr.cTXT0000088 );
      //IQRegFormRead( self, [ self, Grid ]);
      Grid.DataSource:= NIL;
      PC.ActivePage := TabForm;
   end;
   FrmInvCode.ShowModal;
end;


procedure TFrmInvCode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  FTable.Refresh;
  FTable.Close;
  FTable.Open;
  FQry.Close;
  FQry.Open;
//  IQRegFormWrite( self, [ self, Grid ]);
  Action := caFree;
end;

procedure TFrmInvCode.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvCode.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmInvCode.SBToggleClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    Grid.DataSource:= NIL;
    PC.ActivePage := TabForm;
  end
  else
  begin
    Grid.DataSource  := Src;
    PC.ActivePage := TabGrid;
  end;
end;

procedure TFrmInvCode.SBSearchClick(Sender: TObject);
begin
  with PkCode do
    if Execute then
      FTable.Locate('INV_PREFIX', GetValue('INV_PREFIX'), [loCaseInsensitive]);
end;

procedure TFrmInvCode.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1014337 );
end;

procedure TFrmInvCode.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmAR{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInvCode.NavBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    FTable.Close;
    FTable.Open;
    Abort;
  end;
end;

procedure TFrmInvCode.TableBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

end.
