unit SearchLot;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.Buttons,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniDateTimePicker,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame,
  Vcl.Controls;

type
  TFrmSearchLot = class(TUniForm)
    Panel4: TUniPanel;
    BtnApply: TUniSpeedButton;
    lblActivityTo: TUniLabel;
    lblActivityFrom: TUniLabel;
    EditToDate: TUniDateTimePicker;
    EditFromDate: TUniDateTimePicker;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Label3: TUniLabel;
    EdLotno: TUniEdit;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    IQSearch1: TIQUniGridControl;
    QryTranslog: TFDQuery;
    SrcTranslog: TDataSource;
    QryTranslogID: TBCDField;
    QryTranslogARINVT_ID: TBCDField;
    QryTranslogCLASS: TStringField;
    QryTranslogITEMNO: TStringField;
    QryTranslogREV: TStringField;
    QryTranslogDESCRIP: TStringField;
    QryTranslogDESCRIP2: TStringField;
    QryTranslogLOTNO: TStringField;
    QryTranslogFG_LOTNO: TStringField;
    QryTranslogTRANS_DATE: TDateTimeField;
    QryTranslogAll: TFDQuery;
    QryTranslogAllID: TBCDField;
    QryTranslogAllARINVT_ID: TBCDField;
    QryTranslogAllCLASS: TStringField;
    QryTranslogAllITEMNO: TStringField;
    QryTranslogAllREV: TStringField;
    QryTranslogAllDESCRIP: TStringField;
    QryTranslogAllDESCRIP2: TStringField;
    QryTranslogAllLOTNO: TStringField;
    QryTranslogAllFG_LOTNO: TStringField;
    QryTranslogAllTRANS_DATE: TDateTimeField;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryTranslogBeforeOpen(DataSet: TDataSet);
    procedure BtnApplyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure IQSearch1DblClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FResult:boolean;
    FSql:String;
    FQry:TFDQuery;
  public
    { Public declarations }
  end;

function SearchForlot( AIncludeArchived: Boolean; var ArinvtId:real; var ALotNo:String):boolean;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{$R *.dfm}


function SearchForlot(AIncludeArchived: Boolean; var ArinvtId:real; var ALotNo:String):boolean;
var
  LFrmSearchLot : TFrmSearchLot;
begin
  LFrmSearchLot := TFrmSearchLot.Create(UniGUIApplication.UniApplication);

  LFrmSearchLot.FQry := LFrmSearchLot.QryTranslog;
  if AIncludeArchived then
    LFrmSearchLot.FQry := LFrmSearchLot.QryTranslogAll;

  LFrmSearchLot.SrcTranslog.Dataset := LFrmSearchLot.FQry;

  LFrmSearchLot.ShowModal;
  Result := LFrmSearchLot.FResult;
  if LFrmSearchLot.FResult then
  begin
    ArinvtId := LFrmSearchLot.FQry.FieldByName('ARINVT_ID').asFloat;
    ALotNo   := LFrmSearchLot.FQry.FieldByName('LOTNO').asString;
  end;
end;

procedure TFrmSearchLot.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmSearchLot.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
  EditFromDate.Datetime := Date - 180;
  EditToDate.Datetime := Date;

end;

procedure TFrmSearchLot.Exit1Click(Sender: TObject);
begin
  FResult := False;
  Close;
end;

procedure TFrmSearchLot.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;


procedure TFrmSearchLot.QryTranslogBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'AFrom', EditFromDate.Datetime);
  AssignQueryParamValue(DataSet, 'ATo', EditToDate.Datetime);
  AssignQueryParamValue(DataSet, 'ALotno', EdLotno.Text + '%');
end;

procedure TFrmSearchLot.BtnApplyClick(Sender: TObject);
begin
  if EdLotno.Text = '' then
    raise Exception.Create('Lot# must be filled in.');

  FQry.Close;
  FQry.Open;
end;



procedure TFrmSearchLot.BtnOkClick(Sender: TObject);
begin
  if not FQry.Active then
  begin
    FResult := False;
    Close;
  end
  else
  begin
    FResult := True;
    Close;
  end;
end;

procedure TFrmSearchLot.IQSearch1DblClick(Sender: TObject);
begin
  if FQry.Active then
    BtnOkClick(nil)
end;


end.
