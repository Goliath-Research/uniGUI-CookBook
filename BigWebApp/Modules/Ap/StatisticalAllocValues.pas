unit StatisticalAllocValues;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
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
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  TFrmStatAllocValues = class(TUniForm)
    PC: TUniPageControl;
    TabSegment: TUniTabSheet;
    TabAcct: TUniTabSheet;
    TabSubType: TUniTabSheet;
    Panel1: TUniPanel;
    Panel3: TUniPanel;
    BtnYes: TUniButton;
    BtnNo: TUniButton;
    IQSearch1: TIQUniGridControl;
    IQSearch2: TIQUniGridControl;
    IQSearch3: TIQUniGridControl;
    QrySeg: TFDQuery;
    QryAcct: TFDQuery;
    QrySub: TFDQuery;
    SrcSeg: TDataSource;
    SrcAcct: TDataSource;
    SrcSub: TDataSource;
    QrySegVALUE: TStringField;
    QryAcctVALUE: TStringField;
    QrySubVALUE: TStringField;
    procedure BtnNoClick(Sender: TObject);
    procedure BtnYesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FDtlId:Real;
    FSegment: string;
    FsegmentType: string;
  public
    { Public declarations }
  end;

procedure DoSelectSegmentValues(ADtlId:Real; ASegment, AsegmentType:String);

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  ap_rscstr;
{$R *.dfm}

procedure DoSelectSegmentValues(ADtlId:Real; ASegment, AsegmentType:String);
var
  frm: TFrmStatAllocValues;
begin
  frm := TFrmStatAllocValues.Create(uniGUIApplication.UniApplication);
  frm.FDtlId := ADtlId;
  frm.FSegment := ASegment;
  frm.FsegmentType := AsegmentType;
  frm.ShowModal;
end;

procedure TFrmStatAllocValues.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmStatAllocValues.UniFormShow(Sender: TObject);
begin

  if FSegmentType = 'SEGMENT' then
  begin
    PC.ActivePage := TabSegment;
    QrySeg.Sql.Text := StrTran(UpperCase(QrySeg.Sql.Text), 'ACCOUNT', FSegment);
    QrySeg.Open;
  end
  else if FSegmentType = 'GLACCOUNT' then
  begin
    PC.ActivePage := TabAcct;
    QryAcct.Open;
  end
  else
  begin
    PC.ActivePage := TabSubType;
    QrySub.Open;
  end;

end;

procedure TFrmStatAllocValues.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmStatAllocValues.BtnNoClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmStatAllocValues.BtnYesClick(Sender: TObject);
var
  AIqSearch:TIQUniGridControl;
  i:integer;
begin
  if PC.ActivePage = TabSegment then
    AIqSearch := IQSearch1
  else if PC.ActivePage = TabAcct then
    AIqSearch := IQSearch2
  else
    AIqSearch := IQSearch3;

  if AIqSearch.DbGrid.SelectedRows.Count = 0 then
    raise exception.create(ap_rscstr.cTXT0000102);

  with AIqSearch.DBGrid, AIqSearch.DBGrid.datasource.dataset do
  begin
    for i:= 0 to SelectedRows.Count-1 do
    begin
      GotoBookmark(SelectedRows.items[i]);
      if SelectValueFmtAsFloat('select count(id) from S_ACCOUNT_DTL_VALUES where S_ACCOUNT_DTL_ID = %f and SEGMENT_VALUE = ''%s''', [FDtlId, FieldByName('VALUE').asString]) = 0 then
        ExecuteCommandFmt('insert into S_ACCOUNT_DTL_VALUES (S_ACCOUNT_DTL_ID, SEGMENT_VALUE) values (%f, ''%s'')', [FDtlId, FieldByName('VALUE').asString]);
    end;
  end;
  close;
end;

end.
