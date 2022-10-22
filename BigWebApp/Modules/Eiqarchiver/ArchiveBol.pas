unit ArchiveBol;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Menus,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmArchBol = class(TUniForm)
    PnlCarrier: TUniPanel;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    IQSearch1: TIQUniGridControl;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1ID: TBCDField;
    Query1BOL_DATE: TDateTimeField;
    Query1BOLNO: TStringField;
    Query1FREIGHT_DESCRIP: TStringField;
    Query1SHIP_TO_ATTN: TStringField;
    PopupMenu1: TUniPopupMenu;
    JumptoBOL1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    Query1FOB: TStringField;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JumptoBOL1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FDate: TDateTime;
    function ArchiveBols:boolean;
  public
    { Public declarations }
  end;

  procedure DoShowModal(ADate:TDatetime);


implementation
uses
  IQMS.Common.DataLib,
  { TODO -oLema : Dependent on WC-7523 Packslip - Bol }
//  BOL,
  IQMS.Common.RegFrm,
  EIQArchiver_rscstr,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Dialogs;
{$R *.dfm}

procedure DoShowModal(ADate: TDatetime);
var
  frm: TFrmArchBol;
begin
  frm := TFrmArchBol.Create(uniGUIApplication.UniApplication);
  frm.FDate := ADate;
  frm.ShowModal;
end;

procedure TFrmArchBol.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmArchBol.UniFormShow(Sender: TObject);
begin
  Query1.Close;
//  Query1.ParamByName('ADate').asDateTime := ADate;
  AssignQueryParamValue(Query1, 'ADate', FDate);
  Query1.Open;
end;

procedure TFrmArchBol.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmArchBol.btnOkClick(Sender: TObject);
begin
  if ArchiveBols then
    Close;
end;

function TFrmArchBol.ArchiveBols:boolean;
var
  I, J : Integer;
begin
  Result := false;
  J := IQSearch1.DBGrid.SelectedRows.Count;
  IQAssert(  IQSearch1.DBGrid.SelectedRows.Count > 0, EIQArchiver_rscstr.cTXT0000004);
  if not IQConfirmYN(Format(EIQArchiver_rscstr.cTXT0000005, [ IQSearch1.DBGrid.SelectedRows.Count ])) then
     EXIT;


  with IQSearch1 do
  try
    Datasource.DataSet.DisableControls;
    for I:= 0 to DBGrid.SelectedRows.Count - 1 do
    begin
      Datasource.DataSet.GotoBookmark( DBGrid.SelectedRows.Items[ I ]);
      ExecuteCommandFmt('update bol set archived = ''Y'', archived_by = misc.getusername where id = %f', [Query1ID.asFloat]);
    end;
  finally
    //DBGrid.UnSelectAll;
    Datasource.DataSet.EnableControls;
  end;
  Query1.Close;
  Query1.Open;
  IQInformation(Format(EIQArchiver_rscstr.cTXT0000006, [ J ]));
  Result := true;
end;


procedure TFrmArchBol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmArchBol.JumptoBOL1Click(Sender: TObject);
begin
  { TODO -oLema : Dependent on WC-7523 Packslip - Bol }
//  DoJumpToBOL( self, Query1ID.asFloat); {BOL.pas}
end;


end.
