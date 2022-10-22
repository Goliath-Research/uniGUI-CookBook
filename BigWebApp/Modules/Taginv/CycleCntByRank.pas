unit CycleCntByRank;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  IQMS.Common.UserMessages,
  Vcl.Wwdatsrc,
  Vcl.wwDataInspector,
  wwcheckbox,
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, Vcl.StdCtrls, Vcl.Grids, IQUniGrid, uniGUIFrame;

type
  TFrmAssignInvCycleCodeByRank = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    wwDBGrid1: TIQUniGridControl;
    sbtnRecalc: TUniSpeedButton;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtITEMNO: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtCycle_Code: TStringField;
    sbtnSearch: TUniSpeedButton;
    PkArinvt: TIQWebHPick;
    PkArinvtITEMNO: TStringField;
    PkArinvtDESCRIP: TStringField;
    PkArinvtDESCRIP2: TStringField;
    PkArinvtREV: TStringField;
    PkArinvtCLASS: TStringField;
    PkArinvtID: TBCDField;
    PkArinvtONHAND: TBCDField;
    PkArinvtEPLANT_ID: TBCDField;
    PkArinvtCUSTOMER_NAME: TStringField;
    PkArinvtPK_HIDE: TStringField;
    PkArinvtNON_MATERIAL: TStringField;
    wwDataInspectorCycleCount: TwwDataInspector;
    SrcCycleCount: TDataSource;
    QryCycleCount: TFDQuery;
    QryCycleCountDESCRIP: TStringField;
    QryCycleCountRANK_PERCENT: TBCDField;
    QryCycleCountCOUNT_PER_YEAR: TBCDField;
    wwExpandButtonCycleCount: TwwExpandButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryArinvtCYCLE_COUNT_RANK_LOCK: TStringField;
    QryArinvtDESCRIP2: TStringField;
    QryArinvtCodeDescription: TStringField;
    wwDBComboDlgCodeDescrip: TUniEdit;
    PkCycleCountCode: TIQWebHPick;
    PkCycleCountCodeID: TBCDField;
    PkCycleCountCodeSEQ: TFMTBCDField;
    PkCycleCountCodeCODE: TStringField;
    PkCycleCountCodeDESCRIP: TStringField;
    PkCycleCountCodeRANK_PERCENT: TBCDField;
    PkCycleCountCodeCOUNT_PER_YEAR: TBCDField;
    PkCycleCountCodeDAYS: TBCDField;
    QryArinvtCYCLE_COUNT_ID: TBCDField;
    QryArinvtID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnRecalcClick(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure QryCycleCountBeforeOpen(DataSet: TDataSet);
    procedure wwExpandButtonCycleCountAfterExpand(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryArinvtBeforeInsert(DataSet: TDataSet);
    procedure QryArinvtUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure QryArinvtBeforeOpen(DataSet: TDataSet);
    procedure wwDBComboDlgCodeDescripKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboDlgCodeDescripCustomDlg(Sender: TObject);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FKind: string;
    FColors    : Variant;
    FColorCount: Integer;
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    function MapRankToColor(ACycleCount_ID: Real): TColor;
    procedure PopulateColorArray;
    function GetKindDescrip: string;
    procedure SetKind(const Value: string);
  public
    { Public declarations }
    class procedure DoShowModal(AKind: string);
    property Kind: string read FKind write SetKind;
  end;


implementation

{$R *.dfm}

uses
  CycleCntByTransRank,
  IQMS.Common.DateRangeDlg,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg,
  taginv_rscstr;


{ TFrmAssignInvCycleCodeByRank }

class procedure TFrmAssignInvCycleCodeByRank.DoShowModal(AKind: string);
Var
LFrmAssignInvCycleCodeByRank : TFrmAssignInvCycleCodeByRank;
begin
  LFrmAssignInvCycleCodeByRank := TFrmAssignInvCycleCodeByRank.create(UniGUIApplication.UniApplication);
  with LFrmAssignInvCycleCodeByRank do
  begin
    FKind:= AKind;
    ShowModal;
  end;
end;



procedure TFrmAssignInvCycleCodeByRank.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1])
end;

procedure TFrmAssignInvCycleCodeByRank.IQAfterShowMessage(var Msg: TMessage);
begin
  // sbtnRecalc.Click;
end;

procedure TFrmAssignInvCycleCodeByRank.sbtnRecalcClick(Sender: TObject);

  // ---------------------------------------------------------------------------
  procedure _ExecuteSalesBased;
  var
    hMsg : TPanelMesg;
    AStartDateTime: TDateTime;
    AEndDateTime: TDateTime;
  begin
    AStartDateTime:= Date - 365;
    AEndDateTime:= Date;

   if not IQMS.Common.DateRangeDlg.DoDateRangeDialog(AStartDateTime, AEndDateTime ) then
      ABORT;

    hMsg:= hPleaseWait(taginv_rscstr.cTXT0000004 {'Processing.  Please wait...'});
    try
      ExecuteCommandFmt( 'begin                                                                              '+
                 ' cycle_count_misc.populate_inv_items( ''%s'',                                      '+
                 '                                      to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''),  '+
                 '                                      to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'')); '+
                 'end;                                                                               ',
                 [ FKind,
                   FormatDateTime('mm/dd/yyyy hh:nn:ss', AStartDateTime),
                   FormatDateTime('mm/dd/yyyy hh:nn:ss', AEndDateTime)]);
    finally
      hMsg.Free;
    end;
  end;

  // ---------------------------------------------------------------------------
  procedure _ExecuteTransBased;
  begin
    TFrmAssignInvCycleCodeByTransRank.DoShowModal();  // CycleCntByTransRank.pas
  end;

begin
  // 'Calculate and assign inventory items cycle count code based on rank percentage?'
  if not IQConfirmYN(taginv_rscstr.cTXT0000003) then
     EXIT;

  try
    if FKind = 'T' then
       _ExecuteTransBased
    else
       _ExecuteSalesBased;
  finally
    RefreshDataSetByID( QryArinvt );
  end;
end;

procedure TFrmAssignInvCycleCodeByRank.sbtnSearchClick(Sender: TObject);
begin
  with PkArinvt do
    if Execute then
       QryArinvt.Locate('id', GetValue('ID'), [])
end;

procedure TFrmAssignInvCycleCodeByRank.SetKind(const Value: string);
begin
  FKind := Value;
end;

procedure TFrmAssignInvCycleCodeByRank.UniFormCreate(Sender: TObject);
begin
  inherited;

  Caption:= Format('%s [%s Based]', [Caption, GetKindDescrip ]);

  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1]);
  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );

  PopulateColorArray;
end;

procedure TFrmAssignInvCycleCodeByRank.QryCycleCountBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('cycle_count_id').Value := QryArinvtCYCLE_COUNT_ID.asFloat
end;

procedure TFrmAssignInvCycleCodeByRank.wwExpandButtonCycleCountAfterExpand(Sender: TObject);
begin
  Reopen( QryCycleCount );
end;

procedure TFrmAssignInvCycleCodeByRank.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAssignInvCycleCodeByRank.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmAssignInvCycleCodeByRank.ApplyUpdate(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
  RefreshDataSetByID( DataSet );
end;

//procedure TFrmAssignInvCycleCodeByRank.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
//begin
//  if Button = nbRefresh then
//  begin
//    RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet));
//    ABORT;
//  end;
//end;

procedure TFrmAssignInvCycleCodeByRank.QryArinvtBeforeInsert(
  DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmAssignInvCycleCodeByRank.QryArinvtBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('kind').Value := FKind;
end;

procedure TFrmAssignInvCycleCodeByRank.QryArinvtUpdateRecord(
  ASender: TDataSet; ARequest: TFDUpdateRequest;
  var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  if ASender.FieldByName('cycle_count_id').asFloat = 0 then
     ExecuteCommandFmt('update arinvt set cycle_count_id = null, cycle_count_code = null where id = %f',
               [ ASender.FieldByName('id').asFloat ])
  else
     ExecuteCommandFmt('update arinvt set cycle_count_id = %f, cycle_count_code = ''%s'' where id = %f',
               [ ASender.FieldByName('cycle_count_id').asFloat,
                 SelectValueByID('code', 'cycle_count', ASender.FieldByName('cycle_count_id').asFloat),
                 ASender.FieldByName('id').asFloat ]);

  ExecuteCommandFmt('update arinvt set cycle_count_rank_lock = ''%s'' where id = %f',
            [ ASender.FieldByName('cycle_count_rank_lock').asString,
              ASender.FieldByName('id').asFloat ]);

  AAction := eaApplied;

end;

procedure TFrmAssignInvCycleCodeByRank.wwDBComboDlgCodeDescripCustomDlg(
  Sender: TObject);
begin
  with PkCycleCountCode do
    if Execute then
    begin
       QryArinvt.Edit;
       QryArinvtCYCLE_COUNT_ID.asFloat:= GetValue('id');
       QryArinvt.Post;
    end;
end;

procedure TFrmAssignInvCycleCodeByRank.wwDBComboDlgCodeDescripKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    QryArinvt.Edit;
    QryArinvtCYCLE_COUNT_ID.Clear;
    QryArinvt.Post;
    Key:= 0;
  end;
end;

procedure TFrmAssignInvCycleCodeByRank.wwDBGrid1CalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Highlight then EXIT;

  if (Field <> QryArinvtCycle_Code) and (QryArinvtCYCLE_COUNT_ID.asFloat > 0) then
     ABrush.Color:= MapRankToColor( QryArinvtCYCLE_COUNT_ID.asFloat );
end;

function TFrmAssignInvCycleCodeByRank.MapRankToColor( ACycleCount_ID: Real ): TColor;
var
  I: Integer;
begin
  for I:= 0 to FColorCount - 1 do
    if FColors[ I ][ 0 ] = ACycleCount_ID then
    begin
      Result:= FColors[ I ][ 1 ];
      EXIT;
    end;
  Result:= clWindow;
end;

procedure TFrmAssignInvCycleCodeByRank.PopulateColorArray;
const
  ABottomRGB = 150;
var
  I      : Integer;
  ADelta : Integer;
  R, G, B: Integer;
begin
  FColorCount := Trunc( SelectValueFmtAsFloat('select count(*) from cycle_count where kind = ''%s''', [ FKind ]));
  ADelta := Trunc((255-ABottomRGB) / FColorCount);
  FColors:= VarArrayCreate([0, FColorCount], varVariant);

  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(Format('select id, rank_percent from cycle_count where kind = ''%s'' order by seq', [ FKind ]));
    Open;
    I:= FColorCount - 1;
    while not Eof do
    begin
      R:= ABottomRGB + (I * ADelta) - 15;
      G:= ABottomRGB + (I * ADelta) + 10;
      B:= ABottomRGB + (I * ADelta) + 15;

      FColors[ I ]:= VarArrayOf([ FieldByName('id').asFloat,           {cycle_count_id}
                                  RGB( R, G, B) ]);                    {color for the grid}

      Dec(I);
      Next;
    end;
  finally
    Free;
  end;
end;

function TFrmAssignInvCycleCodeByRank.GetKindDescrip: string;
begin
  Result:= sIIf( FKind = 'T', 'Trans', 'Sales');
end;

end.
