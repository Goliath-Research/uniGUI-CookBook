unit PrEin;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  Mask,
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
  uniPageControl, uniMainMenu;

type
  TFrmEin = class(TUniForm)
    Panel1: TUniPanel;
    Nav: TUniDBNavigator;
    SrcEin: TDataSource;
    TblEin: TFDTable;
    TblEinID: TBCDField;
    TblEinDESCRIP: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Content1: TUniMenuItem;
    TblEinCOMPANY: TStringField;
    TblEinADDR1: TStringField;
    TblEinADDR2: TStringField;
    TblEinADDR3: TStringField;
    TblEinCITY: TStringField;
    TblEinSTATE: TStringField;
    TblEinZIP: TStringField;
    PC: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    grid: TUniDBGrid;
    SBGridView: TUniSpeedButton;
    DBDescrip: TUniDBEdit;
    DBCompany: TUniDBEdit;
    DBAddr1: TUniDBEdit;
    DBAddr2: TUniDBEdit;
    DBAddr3: TUniDBEdit;
    DBCity: TUniDBEdit;
    DBState: TUniDBEdit;
    DBZip: TUniDBEdit;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblEinBeforePost(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Content1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBGridViewClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoEin(AOwner:TComponent);

//var
//  FrmEin: TFrmEin;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;
{$R *.DFM}

procedure DoEin(AOwner:TComponent);
var
  frm: TFrmEin;
begin
  frm := TFrmEin.Create(uniGUIApplication.UniApplication);
  frm.Show;
end;

procedure TFrmEin.UniFormCreate(Sender: TObject);
begin
  PC.ActivePage := TabGrid;
  IQRegFormRead( self, [self, grid]);
  IQSetTablesActive( true, self );
end;

procedure TFrmEin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, grid]);
end;

procedure TFrmEin.TblEinBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;


procedure TFrmEin.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmEin.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEin.Content1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmEin.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmEin.SBGridViewClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    PC.ActivePage := TabForm;
  end
  else
  begin
    PC.ActivePage := TabGrid;
  end;
end;

end.
