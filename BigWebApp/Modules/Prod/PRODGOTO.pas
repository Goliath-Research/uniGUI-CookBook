unit ProdGoTo;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TProdGotoDlg = class(TUniForm)
    Panel1: TUniPanel;
    btnGo: TUniButton;
    btnCancel: TUniButton;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Panel4: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    eMach: TUniEdit;
    eMfgNo: TUniEdit;
    procedure eMachChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  ProdGotoDlg: TProdGotoDlg;

procedure DoProdGoToDlg( DataSet : TFDRDBMSDataSet );

implementation

{$R *.DFM}

uses
  IQMS.Common.StringUtils,
  IQMS.Common.Dialogs,
  prod_rscstr;

function DoProdGoto( const Mach, MfgNo:string; DataSet: TFDRDBMSDataSet) : TModalResult;
type
  TGotoCompareType = ( gcNone, gcMach, gcMfgNo, gcMachMfgNo );
var
  Bk : TBookMark;
  GotoCompare : TGotoCompareType;
begin
  if (Mach <> '') and (MfgNo <> '') then
    GotoCompare:= gcMachMfgNo
  else if (Mach <> '') and (MfgNo = '') then
    GotoCompare:= gcMach
  else if (Mach = '') and (MfgNo <> '') then
    GotoCompare:= gcMfgNo
  else if (Mach = '') and (MfgNo = '') then
    GotoCompare:= gcNone;

  with DataSet do
  try
    Result:= mrOK;
    Bk:= GetBookMark;
    DisableControls;
    First;
    while not Eof do
    begin
      case GotoCompare of
        gcNone     : EXIT;
        gcMach     : if Trim( FieldByName('EQNO').asString ) = Mach then
                       EXIT;
        gcMfgNo    : if Trim( FieldByName('MFGNO').asString ) = MfgNo then
                       EXIT;
        gcMachMfgNo: if ( Trim( FieldByName('EQNO').asString ) = Mach ) and ( Trim( FieldByName('MFGNO').asString ) = MfgNo ) then
                       EXIT;
      end;
      Next;
    end;
    GotoBookMark( Bk );
    if IQConfirmYN(prod_rscstr.cTXT0000040 {'No data found. Try another search?'}) then
       Result:= mrRetry
    else
       Result:= mrCancel;
  finally
    FreeBookMark( Bk );
    EnableControls;
  end;
end;

procedure DoProdGoToDlg( DataSet : TFDRDBMSDataSet );
var
  SearchResult:TModalResult;
  ProdGotoDlg: TProdGotoDlg;
begin
  ProdGotoDlg := TProdGotoDlg.Create( uniGUIApplication.uniApplication );
  with ProdGotoDlg do
  begin
    try
      repeat
        if ShowModal = mrOK then
          SearchResult:= DoProdGoto( eMach.Text, eMfgNo.Text, DataSet )
        else
          BREAK;
      until (SearchResult = mrOK) or (SearchResult = mrCancel)
    finally
      Screen.Cursor:= crDefault;
    end;
  end;
end;

procedure TProdGotoDlg.eMachChange(Sender: TObject);
begin
  btnGo.Enabled:= not (eMach.Text = '') or not (eMfgNo.Text = '');
end;

procedure TProdGotoDlg.FormCreate(Sender: TObject);
begin
  eMachChange(Sender);
end;

procedure TProdGotoDlg.btnGoClick(Sender: TObject);
begin
  eMach.Text := Trim(eMach.Text );
  eMfgNo.Text:= Trim(eMfgNo.Text);
end;

end.

