unit inv_non_empty_fgmulti;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  pngimage,
  IQMS.WebVcl.CaptionPanel,
  IQMS.WebVcl.About,
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
  uniMainMenu,
  Vcl.ExtCtrls,
  IQUniGrid,
  uniGUIFrame;

type
  TFrmInvNonEmpty = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1ID: TBCDField;
    Query1ITEMNO: TStringField;
    Query1DESCRIP: TStringField;
    Query1FGMULTI_ID: TBCDField;
    Query1ONHAND: TBCDField;
    Query1LOTNO: TStringField;
    Query1CLASS: TStringField;
    Query1REV: TStringField;
    Query1DESCRIP2: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel1: TIQWebCaptionPanel;
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FLocation_ID: Real;
    procedure SetLocation_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal(aALocation_ID: Real=0);
    property Location_ID: Real write SetLocation_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  inv_rscstr;

procedure TFrmInvNonEmpty.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

class procedure TFrmInvNonEmpty.DoShowModal(aALocation_ID: Real=0);
var
   LoFrmInvNonEmpty : TFrmInvNonEmpty;
begin
    LoFrmInvNonEmpty := TFrmInvNonEmpty.Create(uniGUIApplication.UniApplication);
    LoFrmInvNonEmpty.Location_ID := aALocation_ID;
    LoFrmInvNonEmpty.ShowModal;
end;

procedure TFrmInvNonEmpty.Exit1Click(Sender: TObject);
begin
  Close
end;

procedure TFrmInvNonEmpty.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmInvNonEmpty.Query1BeforeOpen(DataSet: TDataSet);
begin
    AssignQueryParamValue(Dataset,'loc_id',FLocation_ID);
end;

procedure TFrmInvNonEmpty.SetLocation_ID(const Value: Real);
begin
  FLocation_ID := Value;
end;

procedure TFrmInvNonEmpty.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);

 { TODO -oGpatil -cWebConvert : Component TIQWebCaptionPanel is not available in UNIGui}
  //CaptionPanel1.Text:= Format( inv_rscstr.cTXT0000181 {'Unable to change location ''%s'' status.'}, [ SelectValueByID('rtrim(loc_desc)', 'locations', Location_ID )]);

end;

procedure TFrmInvNonEmpty.UniFormShow(Sender: TObject);
begin
   IQSetTablesActive( TRUE, self );
end;

end.
