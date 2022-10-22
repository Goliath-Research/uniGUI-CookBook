unit Add_Edit;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TAddEdit = class(TUniForm)
    DataSource1: TDataSource;
    Panel2: TUniPanel;
    QryArinvt_Class: TFDQuery;
    QryArinvt_ClassCLASS: TStringField;
    QryArinvt_ClassDESCRIP: TStringField;
    SrcArinvt_Class: TDataSource;
    PnlLeft: TUniPanel;
    PnlClient: TUniPanel;
    PnlButtons: TUniPanel;
    BitBtnOK: TUniBitBtn;
    BitBtn3: TUniBitBtn;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    lblDescrip2: TUniLabel;
    Label5: TUniLabel;
    lblSPG: TUniLabel;
    LookupClass: TUniDBLookupComboBox;
    EditITEMNO: TUniDBEdit;
    EditREV: TUniDBEdit;
    EditDESCRIP: TUniDBEdit;
    dbeDescrip2: TUniDBEdit;
    dbcUNIT: TUniDBComboBox;
    dbeSPG: TUniDBEdit;
    chkRFQRequired: TUniCheckBox;
    Splitter1: TUniSplitter;
    lblGauge: TUniLabel;
    dbeGauge: TUniDBEdit;
    TblQinvt: TFDTable;
    dbchkPkHide: TUniDBCheckBox;
    procedure BitBtnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
  protected
    procedure SetRFQRequiredEnabled;

    function GetQuote_ID_Of_Attached_Item: Real;
    function GetQinvt_ID_Of_Attached_Item: Real;


  private
    FTable: TFDTable;
    FQInvt_ID: Real;
    procedure StartUp(AViewedClass: string; ATable: TFDTable);
    procedure SetPK_HideEnabled;
    procedure SetQInvt_ID(const Value: Real);
    procedure SetTable(const Value: TFDTable);
    { private declarations }
  protected
    procedure PopulateUOMs; virtual;
  public
    { public declarations }
    ViewedClass:string;
    FIs_By_Product: string;
    {place holder functions}
    class procedure Create_RFQ_PlaceHolder_For_Attached_Item( AQOpmat_ID: Real; AQtyBreak: Real = 0 );
    class function GetParent_Quote_ID_Of_Attached_Item( AQOpmat_ID: Real ): Real;
    class function GetNextRFQName( ARFQBaseName: string ): string;
    class function DoShowModal(AQinvt_ID: Real;const AViewedClass: string = ''; ATable:TFDTable=nil): Boolean;

    property QInvt_ID: Real  write SetQInvt_ID;
    property Table:TFDTable write SetTable;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  quote_rscstr;


class function TAddEdit.DoShowModal(AQinvt_ID: Real;const AViewedClass: string = '';ATable:TFDTable=nil): Boolean;
var
  LAddEdit : TAddEdit;
begin
  IQAssert( AQinvt_ID > 0,
   quote_rscstr.cTXT000000061 {'The requested item is unknown.  Cannot continue.'});
  LAddEdit := TAddEdit.Create(UniGUIApplication.UniApplication);
  LAddEdit.Qinvt_ID := AQinvt_ID;

  if (ATable <> nil) and (AViewedClass <> '') then
     LAddEdit.Table := ATable;
     LAddEdit.ViewedClass := AViewedClass;

  Result:= LAddEdit.ShowModal = mrOK;
end;

procedure TAddEdit.StartUp( AViewedClass: string; ATable:TFDTable );
var
  AUnitFieldName: string;
begin
  QryArinvt_Class.Open;
  ViewedClass:= AViewedClass;
  if ATable.FindField('SPG') <> NIL then
     dbeSPG.DataField:= 'SPG';
  if ATable.FindField('GAUGE') <> NIL then
     dbeGauge.DataField:= 'GAUGE';

  if ATable.FindField('UNIT') <> nil then
     AUnitFieldName:= 'UNIT'
  else if ATable.FindField('UOM') <> nil then
     AUnitFieldName:= 'UOM'
  else
     raise Exception.CreateFmt('Dataset %s has no reference to unit or uom fieldname', [ ATable.Name ]);

  dbcUNIT.DataField:= AUnitFieldName;

  // before hooking up dataset make sure certain fields exist
  if not Assigned( ATable.FindField('pk_hide')) then
     dbchkPkHide.DataField:= '';

  DataSource1.DataSet:= ATable;

  PopulateUOMs;

  with dbcUNIT do
    ItemIndex:= Items.IndexOf( ATable.FieldByName( AUnitFieldName ).asString );

  SetRFQRequiredEnabled;
  SetPK_HideEnabled;

{ TODO -oGPatil -cWebConvert : TForm and TAddEdit not present in UniGui
  IQMS.Common.Controls.CenterForm(Self); // IQMS.Common.Controls.pas; default position }
  IQRegFormRead(Self,[Self, PnlLeft]);
end;


procedure TAddEdit.UniFormShow(Sender: TObject);
begin
  TblQinvt.TableName:= 'QINVT';
  TblQinvt.Open;
  if not TblQinvt.Locate('ID', FQInvt_ID, []) then
     // 'Cannot find Quote Inventory item [ID = %.0f]'
     IQWarning(Format(quote_rscstr.cTXT000000062, [ FQInvt_ID ]));
    if FTable<>nil then
       StartUp(ViewedClass, FTable )
    else
      StartUp( TblQinvt.FieldByName('class').asString, TblQinvt );


end;

procedure TAddEdit.PopulateUOMs;
begin
  dbcUNIT.Clear;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    // SQL.Add('select distinct uom from arinvt_uom order by uom');
    SQL.Add('SELECT uom FROM arinvt_uom ORDER BY seq, uom');
    Open;
    while not Eof do
    begin
      dbcUNIT.Items.Add( Fields[ 0 ].asString );
      Next;
    end;
  finally
    Free;
  end;
end;


procedure TAddEdit.BitBtnOKClick(Sender: TObject);
begin
  with DataSource1.DataSet do
  try
    if State in [dsInsert, dsEdit ] then
    begin
       if (FIs_By_Product <> '') and (FindField('is_by_product') <> nil) then
          FieldByName('is_by_product').asString:= FIs_By_Product;
       Post;
    end;
    Refresh;
  except
    if State in [dsInsert, dsEdit ] then
       Cancel;
    raise;
  end;

  if chkRFQRequired.Checked then
     Create_RFQ_PlaceHolder_For_Attached_Item( TFDTable(DataSource1.DataSet).FieldByName('id').asFloat {qopmat.id} );

  ModalResult:= mrOK;
end;


procedure TAddEdit.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmQUOTE{HTM} );  {IQMS.Common.HelpHook.pas}
  if ViewedClass <> '' then with LookupClass do
  begin
     //LookupValue:= ViewedClass;
     //PerformSearch;
     TabStop   := FALSE;
     ReadOnly  := TRUE;
     Color     := clBtnFace;
     Font.Color:= clWhite;
     ActiveControl:= editITEMNO;
  end;
end;

procedure TAddEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult <> mrOk then
     DataSource1.DataSet.Cancel;
end;

procedure TAddEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    IQRegFormWrite(Self,[Self, PnlLeft]);
end;

procedure TAddEdit.FormDestroy(Sender: TObject);
begin
  Screen.Cursor:= crDefault;
end;

procedure TAddEdit.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if Assigned(DataSource1) and Assigned(DataSource1.DataSet) then
    with DataSource1.DataSet do
    begin
      lblSPG.Visible  := FieldByName('class').asString = 'PL';
      dbeSPG.Visible  := FieldByName('class').asString = 'PL';
      lblGauge.Visible:= FieldByName('class').asString = 'PL';
      dbeGauge.Visible:= FieldByName('class').asString = 'PL';
    end;
end;

procedure TAddEdit.SetRFQRequiredEnabled;
begin
  chkRFQRequired.Enabled:= FALSE;

  if not (DataSource1.DataSet is TFDTable) then
     EXIT;

  if (CompareText( StrAfterDot(TFDTable(DataSource1.DataSet).TableName), 'QOPMAT') <> 0) then
     EXIT;

  {allow check box if RFQ is not assigned yet}
  chkRFQRequired.Enabled:= GetQuote_ID_Of_Attached_Item = 0;
end;

procedure TAddEdit.SetTable(const Value: TFDTable);
begin
  FTable := Value;
end;

procedure TAddEdit.SetPK_HideEnabled;
begin
  dbchkPkHide.Enabled:= FALSE;

  if not (DataSource1.DataSet is TFDTable) then
     EXIT;

  dbchkPkHide.Enabled:= (CompareText( StrAfterDot(TFDTable(DataSource1.DataSet).TableName), 'QINVT') = 0) and (DataSource1.DataSet.State = dsEdit);
end;


procedure TAddEdit.SetQInvt_ID(const Value: Real);
begin
  FQInvt_ID := Value;
end;

function TAddEdit.GetQuote_ID_Of_Attached_Item: Real;
var
  AQinvt_ID: Real;
begin
  Result:= -1;

  AQinvt_ID:= GetQinvt_ID_Of_Attached_Item;
  if AQinvt_ID = 0 then
     EXIT;

  {get quote.id for this item (if one exists) }
  Result:= SelectValueByID('quote_id', 'qinvt', AQinvt_ID);
end;

function TAddEdit.GetQinvt_ID_Of_Attached_Item: Real;
begin
  Result:= TFDTable(DataSource1.DataSet).FieldByName('qinvt_id').asFloat;
end;

class function TAddEdit.GetParent_Quote_ID_Of_Attached_Item( AQOpmat_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select q.quote_id                '+
                     '  from qopmat m,                 '+
                     '       qptoper p,                '+
                     '       qinvt q                   '+
                     ' where m.id = %f                 '+
                     '   and m.qsndop_id = p.qsndop_id '+
                     '   and p.qinvt_id = q.id         ',
                     [ AQopmat_ID ]);
end;

class function TAddEdit.GetNextRFQName( ARFQBaseName: string ): string;
var
  I: Integer;
  J: Integer;
  S: string;
begin
  I:= 0;
  S:= ARFQBaseName;
  J:= RPos( '-', S );
  if J > 0 then
  try
    ARFQBaseName:= Copy( S, 1, J-1 );
    I:= StrToInt( Copy( S, J+1, Length( S )));
  except
    I:= 0;
  end;

  repeat
    Inc(I);

    {come up with ABC-1, ABC-2 etc until you find unique RFQ#}
    S:= '-' + IntToStr(I);
    Result:= PadR( Trim( Copy( Trim(ARFQBaseName), 1, 20 - Length( S ))) + S, 20);

    {check if exists}
    if SelectValueFmtAsFloat('select 1 from quote where RFQ = ''%s''', [ Result ]) = 0 then
       BREAK;

    {safety cap}
    if I >= 500 then
       // 'Failed to find unique RFQ # as a place holder for attached item.'#13'Base RFQ# = %s'
       raise Exception.CreateFmt(quote_rscstr.cTXT000000046, [ ARFQBaseName ]);
  until FALSE;
end;

class procedure TAddEdit.Create_RFQ_PlaceHolder_For_Attached_Item( AQOpmat_ID: Real; AQtyBreak: Real = 0 );
var
  ANewQuote_ID   : Real;
  ANewRFQ        : string;
  AParentQuote_ID: Real;
begin
  {get quote id of the RFQ this material is attached to}
  AParentQuote_ID:= GetParent_Quote_ID_Of_Attached_Item( AQOpmat_ID );

  // 'Cannot determine which quotation is using the specified Operation [QOPMAT.ID: %f]';
  IQAssert( AParentQuote_ID > 0, Format(quote_rscstr.cTXT000000047,[ AQOpmat_ID ]));

  ANewQuote_ID:= GetNextID('QUOTE');
  ANewRFQ     := GetNextRFQName( SelectValueByID('RFQ', 'quote', AParentQuote_ID ));

  {QUOTE}
  ExecuteCommandFmt('insert into quote             '+
            '     ( id,                    '+
            '       rfq,                   '+
            '       project,               '+
            '       quote_decimal,         '+
            '       arcusto_id,            '+
            '       currency_id,           '+
            '       sets_disp,             '+
            '       quote_date,            '+
            '       quote_rev,             '+
            '       hrate_markup_fixed,    '+
            '       mrate_markup_fixed,    '+
            '       comis_spec,            '+
            '       optimized,             '+
            '       uom,                   '+
            '       margin_type,           '+
            '       labor_rate,            '+
            '       chk_avail_rg_prcnt,    '+
            '       markup_is_points,      '+
            '       markup_not_compound,   '+
            '       comis_use_division,    '+
            '       expiry_date,           '+
            '       eff_factor )           '+
            'select                        '+
            '       %f,                    '+
            '       ''%s'',                '+
            '       q.project,             '+
            '       q.quote_decimal,       '+
            '       q.arcusto_id,          '+
            '       q.currency_id,         '+
            '       1,                     '+  { set_disp           }
            '       sysdate,               '+  { quote_date         }
            '       1,                     '+  { quote_rev          }
            '       ''N'',                 '+  { hrate_markup_fixed }
            '       ''N'',                 '+  { mrate_markup_fixed }
            '       1,                     '+  { comis_spec         }
            '       ''N'',                 '+  { optimized          }
            '       ''GR'',                '+  { uom                }
            '       x.margin_type,         '+
            '       x.labor_rate,          '+
            '       x.chk_avail_rg_prcnt,  '+
            '       x.markup_is_points,    '+
            '       x.markup_not_compound, '+
            '       x.comis_use_division,  '+
            '       x.expiry_date,         '+
            '       x.eff_factor           '+
            '  from quote q,               '+
            '       (select                '+
            '               xmargin as margin_type, '+
            '               xmlabor as labor_rate,  '+
            '               NVL(chk_avail_rg_prcnt, ''N'') as chk_avail_rg_prcnt, '+
            '               markup_is_points,       '+
            '               markup_not_compound,    '+
            '               NVL(comis_use_division, ''N'') as comis_use_division, '+
            '               decode( NVL(expired_days,0), 0, 90, expired_days ) + sysdate as expiry_date, '+
            '               decode( NVL(eff_factor,0), 0, 100, eff_factor ) as eff_factor '+
            '           from qparams where rownum < 2 ) x '+
            ' where q.id = %f',
            [ ANewQuote_ID,
              ANewRFQ,
              AParentQuote_ID ]);

   {QINVT}
   ExecuteCommandFmt( 'update qinvt set quote_id = %f where id = %f',
              [ ANewQuote_ID,
                SelectValueFmtAsFloat('select qinvt_id from qopmat where id = %f', [ AQOpmat_ID ]) ]);

   {QSET_PRICE}
   if AQtyBreak = 0 then
      ExecuteCommandFmt( 'insert into qset_price (quote_id, quan, scrap) select %f, quan, scrap from qdef_qtys',
                 [ ANewQuote_ID ])
   else
      ExecuteCommandFmt( 'insert into qset_price (quote_id, quan) values ( %f, %f )',
                 [ ANewQuote_ID, AQtyBreak ]);
end;



end.
