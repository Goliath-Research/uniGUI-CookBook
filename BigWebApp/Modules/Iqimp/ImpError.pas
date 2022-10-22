unit ImpError;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Buttons,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  MainImp,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
  Mask,
  Vcl.wwMemo,
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
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.wwdbgrid, uniMainMenu, IQUniGrid,
  uniGUIFrame, Vcl.Controls;

type
  TFrmErrors = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    Exit1: TUniMenuItem;
    About1: TUniMenuItem;
    IQSearchHeader: TIQUniGridControl;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    sbtnInfo: TUniSpeedButton;
    sbtnWarning: TUniSpeedButton;
    sbtnError: TUniSpeedButton;
    DBNavigator1: TUniDBNavigator;
    IQSearchError: TIQUniGridControl;
    SrcInputRec: TDataSource;
    QryInputRec: TFDQuery;
    QryInputRecID: TBCDField;
    QryInputRecINPUT_FILE_ID: TBCDField;
    QryInputRecARCUSTO_ID: TBCDField;
    QryInputRecPONO: TStringField;
    QryInputRecORD_DATE: TDateTimeField;
    QryInputRecSHIP_ATTN: TStringField;
    QryInputRecSHIP_ADDR1: TStringField;
    QryInputRecSHIP_CITY: TStringField;
    QryInputRecSHIP_STATE: TStringField;
    QryInputRecSHIP_COUNTRY: TStringField;
    QryInputRecSHIP_ZIP: TStringField;
    QryInputRecSHIP_TO_ID: TBCDField;
    QryInputRecITEMNO: TStringField;
    QryInputRecDESCRIP: TStringField;
    QryInputRecARINVT_ID: TBCDField;
    QryInputRecPROMISE_DATE: TDateTimeField;
    QryInputRecREQUEST_DATE: TDateTimeField;
    QryInputRecQTY: TBCDField;
    QryInputRecCUSER1: TStringField;
    QryInputRecCUSER2: TStringField;
    QryInputRecCUSER3: TStringField;
    QryInputRecCUSER4: TStringField;
    QryInputRecCUSER5: TStringField;
    SrcError: TDataSource;
    QryError: TFDQuery;
    QryErrorID: TBCDField;
    QryErrorINPUT_FILE_REC_ID: TBCDField;
    QryErrorTYPE: TStringField;
    QryErrorTEXT: TStringField;
    IQAbout1: TIQWebAbout;
    wwMemoDialog1: TwwMemoDialog;
    wwwErrorDlg: TUniEdit;
    { TODO -omugdha -cWEBIQ : Dependancy on TGridDrawState
    procedure IQSearchErrorCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);}
    procedure sbtnErrorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryInputRecAfterScroll(DataSet: TDataSet);
    procedure wwwErrorDlgCustomDlg(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  protected
    procedure SrcInputDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FDataChange: TDataChangeEvent;
    procedure SetDetailFilter;
    procedure AddToFilter(var AFilter: string; const AExpr: string);
  public
    { Public declarations }
  end;

procedure ShowError();

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{$R *.DFM}

procedure ShowError();
var
  LFrmErrors: TFrmErrors;
begin
  LFrmErrors := TFrmErrors.Create(uniGUIApplication.UniApplication);
end;

procedure TFrmErrors.SrcInputDataChange(Sender: TObject; Field: TField);
begin
  QryInputRecAfterScroll(nil);
end;

procedure TFrmErrors.UniFormCreate(Sender: TObject);
var
  I: Integer;
  LFrmImp : TFrmImp;
begin
  wwwErrorDlg.Parent := IQSearchError.dbgrid;
  wwwErrorDlg.visible := false;
  { TODO -omugdha -cWEBIQ : dbgrid doesnot contain MemoAttributes
  IQSearchError.dbgrid.MemoAttributes := [mSizeable, mWordWrap, mGridShow];  }

  LFrmImp := TFrmImp.Create(uniGUIApplication.UniApplication);
  QryError.DataSource := LFrmImp.SrcInput;
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [self]);
  SetDetailFilter;
  FDataChange := LFrmImp.SrcInput.OnDataChange;
  LFrmImp.SrcInput.OnDataChange := SrcInputDataChange;
end;
{ TODO -omugdha -cWEBIQ : Dependancy on TGridDrawState
procedure TFrmErrors.IQSearchErrorCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Field.FieldName = 'TYPE' then
  begin
    if QryErrorTYPE.asString = 'I' then
    begin
      ABrush.Color := clAqua;
      AFont.Color := clBlack;
    end
    else if QryErrorTYPE.asString = 'W' then
    begin
      ABrush.Color := clYellow;
      AFont.Color := clBlack;
    end
    else if QryErrorTYPE.asString = 'E' then
    begin
      ABrush.Color := clRed;
      AFont.Color := clBlack;
    end
    else
      ABrush.Color := clWhite;
  end;

  if Highlight then
  begin
    ABrush.Color := clBlue;
    AFont.Color := clWhite;
  end;
end;
 }
procedure TFrmErrors.sbtnErrorClick(Sender: TObject);
begin
  SetDetailFilter;
end;

procedure TFrmErrors.SetDetailFilter;
var
  S: string;
begin
  S := '';
  if sbtnError.Down then
    AddToFilter(S, 'TYPE = ''E''');
  if sbtnWarning.Down then
    AddToFilter(S, 'TYPE = ''W''');
  if sbtnInfo.Down then
    AddToFilter(S, '( TYPE = ''I'' or ( TYPE <> ''W'' and TYPE <> ''E'' ))');

  if S > '' then
    QryError.Filter := S
  else
    QryError.Filter := 'TYPE = ''~'' ';
  { if no button pushed make all recs disappear }
end;

procedure TFrmErrors.AddToFilter(var AFilter: string; const AExpr: string);
begin
  if AFilter = '' then
    AFilter := Format('(%s)', [AExpr])
  else
    AFilter := AFilter + Format(' or (%s)', [AExpr]);
end;

procedure TFrmErrors.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
  TFrmImp(Owner).SrcInput.OnDataChange := FDataChange;
end;

procedure TFrmErrors.Exit1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmErrors.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmErrors.QryInputRecAfterScroll(DataSet: TDataSet);
begin
  QryError.close;
  if QryInputRecID.asFloat = 0 then
    exit;
  QryError.ParamByName('AID').Value := QryInputRecID.asFloat;
  QryError.Open;
end;

procedure TFrmErrors.wwwErrorDlgCustomDlg(Sender: TObject);
begin
  wwMemoDialog1.Execute;
end;

end.
