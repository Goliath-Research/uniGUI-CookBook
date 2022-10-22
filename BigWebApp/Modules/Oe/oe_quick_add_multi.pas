unit oe_quick_add_multi;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  System.Generics.Collections,
  Data.DB,
  vcl.Wwdbdatetimepicker,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniMainMenu, IQUniGrid, uniGUIFrame, uniDateTimePicker,
  uniDBDateTimePicker;

type
  TQuickAddOrderCargo = record
    Orders_ID: Integer;
    Arcusto_ID: Integer;
    Ship_To_ID: Integer;
    UseAKA: Boolean;
    constructor Create( AOrders_ID: Integer );
  end;

  TFrmQuickOeAddMultipleItems = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    srchArinvt: TIQUniGridControl;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Splitter1: TUniSplitter;
    Label1: TUniLabel;
    wwDBDateTimePicker1: TUniDBDateTimePicker;
    QryArinvtID: TBCDField;
    QryArinvtQTY: TFMTBCDField;
    QryArinvtPROMISE_DATE: TDateTimeField;
    QryArinvtITEMNO: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtDESCRIP2: TStringField;
    QryArinvtUNIT: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    StatusBar1: TUniStatusBar;
    QryArinvtONHAND: TBCDField;
    QryArinvtNON_COMMITTED: TFMTBCDField;
    QryArinvtPK_HIDE: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure QryArinvtUpdateRecord(ASender: TDataSet; ARequest:
                                    TFDUpdateRequest;
                                    var AAction: TFDErrorAction;
                                    AOptions: TFDUpdateRowOptions);


    procedure QryArinvtAfterEdit(DataSet: TDataSet);
    procedure QryArinvtBeforePost(DataSet: TDataSet);
    procedure QryArinvtBeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    FParamsCargo: TQuickAddOrderCargo;
    FACargo: TQuickAddOrderCargo;
    procedure Validate;
    procedure UpdateStatus;
    procedure CheckAddAKAInfo;
    procedure SetACargo(const Value: TQuickAddOrderCargo);
    { Private declarations }
  public
    { Public declarations }
    property Cargo: TQuickAddOrderCargo  write SetACargo;
    class function DoShowModal(ACargo: TQuickAddOrderCargo ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  oe_rscstr;

{ TFrmQuickOeAddMultipleItems }
class function TFrmQuickOeAddMultipleItems.DoShowModal(ACargo: TQuickAddOrderCargo ): Boolean;
var
  LFrmQuickOeAddMultipleItems : TFrmQuickOeAddMultipleItems;
begin
  LFrmQuickOeAddMultipleItems := TFrmQuickOeAddMultipleItems.Create(UniGUIApplication.UniApplication);
  LFrmQuickOeAddMultipleItems.Cargo := ACargo;
  Result:= LFrmQuickOeAddMultipleItems.ShowModal = mrOK;
end;

procedure TFrmQuickOeAddMultipleItems.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmQuickOeAddMultipleItems.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmQuickOeAddMultipleItems.CheckAddAKAInfo;
var
  I: Integer;
  AField: TField;
begin
  QryArinvt.Close;

  with QryArinvt do
  begin
    InsertStringsBetweenKeyWords( SQL,
                                  ', k.id as aka_id, k.cust_itemno, k.cust_descrip, k.cust_descrip2, k.cust_rev ',
                                  'AKA_SELECT_START',
                                  'AKA_SELECT_END' );

    InsertStringsBetweenKeyWords( SQL,
                                  ', AKA k',
                                  'AKA_FROM_START',
                                  'AKA_FROM_END' );

    InsertStringsBetweenKeyWords( SQL,
                                  ' and a.id = k.arinvt_id           '+
                                  ' and k.arcusto_id = :arcusto_id   '+
                                  ' and ( k.ship_to_id is null       '+
                                  '       or                         '+
                                  '       k.ship_to_id = :ship_to_id)',
                                  'AKA_WHERE_START',
                                  'AKA_WHERE_END' );
  end;

  // add fields
  QryArinvt.ParamByName('arcusto_id').DataType:= ftInteger;
  QryArinvt.ParamByName('ship_to_id').DataType:= ftInteger;
  QryArinvt.FieldDefs.Update;
  for I:= 0 to QryArinvt.FieldDefs.Count - 1 do
    if not Assigned(QryArinvt.FindField( QryArinvt.FieldDefs[ I ].Name )) then
       AField:= QryArinvt.FieldDefs[ I ].CreateField( QryArinvt );

  // update origin
  QryArinvt.FieldByName('cust_itemno').Origin  := 'k.cust_itemno';
  QryArinvt.FieldByName('cust_descrip').Origin := 'k.cust_descrip';
  QryArinvt.FieldByName('cust_rev').Origin     := 'k.cust_rev';
  QryArinvt.FieldByName('cust_descrip2').Origin:= 'k.cust_descrip2';

  // oe_rscstr.cTXT0000166 = 'AKA Item #';
  QryArinvt.FieldByName('cust_itemno').DisplayLabel  := oe_rscstr.cTXT0000166;
  // oe_rscstr.cTXT0000165 = 'AKA Description';
  QryArinvt.FieldByName('cust_descrip').DisplayLabel := oe_rscstr.cTXT0000165;
  // oe_rscstr.cTXT0000164 = 'AKA Revision';
  QryArinvt.FieldByName('cust_rev').DisplayLabel     := oe_rscstr.cTXT0000164;
  // oe_rscstr.cTXT0000167 = 'AKA Extended Description';
  QryArinvt.FieldByName('cust_descrip2').DisplayLabel:= oe_rscstr.cTXT0000167;

{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain respective properties
  // add to grid
  with srchArinvt.wwDBGrid.Selected do
  begin
    if WWColumnIndexByName( srchArinvt.wwDBGrid, 'CUST_REV') = -1 then
      // oe_rscstr.cTXT0000164 = 'AKA Revision';
       Insert(2, 'CUST_REV'#9'10'#9 + oe_rscstr.cTXT0000164 + #9);

    if WWColumnIndexByName( srchArinvt.wwDBGrid, 'CUST_DESCRIP') = -1 then
       // oe_rscstr.cTXT0000165 = 'AKA Description';
       Insert(2, 'CUST_DESCRIP'#9'50'#9 + oe_rscstr.cTXT0000165 + #9);

    if WWColumnIndexByName( srchArinvt.wwDBGrid, 'CUST_ITEMNO') = -1 then
       // oe_rscstr.cTXT0000166 = 'AKA Item #';
       Insert(2, 'CUST_ITEMNO'#9'25'#9 + oe_rscstr.cTXT0000166 + #9);

    if WWColumnIndexByName( srchArinvt.wwDBGrid, 'CUST_DESCRIP2') = -1 then
       // oe_rscstr.cTXT0000167 = 'AKA Extended Description';
       Add('CUST_DESCRIP2'#9'50'#9 + oe_rscstr.cTXT0000167 + #9);

    srchArinvt.wwDBGrid.ApplySelected;
  end;  }
end;


procedure TFrmQuickOeAddMultipleItems.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmQuickOeAddMultipleItems.ApplyUpdate(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
  UpdateStatus;
end;

procedure TFrmQuickOeAddMultipleItems.btnOKClick(Sender: TObject);
begin
 QryArinvt.CheckBrowseMode;
 Validate;
 ModalResult:= mrOK;
end;

procedure TFrmQuickOeAddMultipleItems.Validate;
var
  ACount: Real;
begin
  ACount:= SelectValueAsFloat('select count(*) from gtt_quick_oe_multi_arinvt');
  IQAssert( ACount > 0, 'Nothing is selected - operation aborted');

  if not IQConfirmYN(Format('Selected items count: %.0f. '#13#13'Append selected items to the sales order?', [ ACount])) then
     ABORT;
end;

procedure TFrmQuickOeAddMultipleItems.QryArinvtAfterEdit(DataSet: TDataSet);
begin
  if QryArinvtPROMISE_DATE.asDateTime = 0 then
     QryArinvtPROMISE_DATE.asDateTime:= wwDBDateTimePicker1.DateTime;
end;

procedure TFrmQuickOeAddMultipleItems.QryArinvtBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    if Params.FindParam('arcusto_id') <> nil then
       ParamByName('arcusto_id').asInteger:= FParamsCargo.Arcusto_ID;
    if Params.FindParam('ship_to_id') <> nil then
       ParamByName('ship_to_id').asInteger:= FParamsCargo.Ship_To_ID;
  end;
end;

procedure TFrmQuickOeAddMultipleItems.QryArinvtBeforePost(DataSet: TDataSet);
begin
  if QryArinvtQTY.asFloat = 0 then
     QryArinvtPROMISE_DATE.Clear
  else
     IQAssert( QryArinvtPROMISE_DATE.asDateTime > 0, 'Promise Date must be entered - operation aborted.');
end;

procedure TFrmQuickOeAddMultipleItems.QryArinvtUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);


begin
  ExecuteCommandFmt(
            'declare                                                              '+
            '  v_arinvt_id    number::= %f;                                       '+
            '  v_qty          number::= %f;                                       '+
            '  v_promise_date date::= to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''); '+
            'begin                                                                '+
            '  if v_qty = 0 then                                                  '+
            '     delete from gtt_quick_oe_multi_arinvt where id = v_arinvt_id;   '+
            '     return;                                                         '+
            '  end if;                                                            '+
            '                                                                     '+
            '  update gtt_quick_oe_multi_arinvt                                   '+
            '     set qty = v_qty,                                                '+
            '         promise_date = v_promise_date                               '+
            '   where id = v_arinvt_id;                                           '+
            '                                                                     '+
            '  if sql%%notfound then                                              '+
            '     insert into gtt_quick_oe_multi_arinvt                           '+
            '          ( id, qty, promise_date )                                  '+
            '     values                                                          '+
            '          ( v_arinvt_id, v_qty, v_promise_date );                    '+
            '  end if;                                                            '+
            'end;                                                                 ',
            [ ASender.FieldByName('id').asFloat,
              ASender.FieldByName('qty').asFloat,
              FormatDateTime('mm/dd/yyyy hh:nn:ss', ASender.FieldByName('promise_date').asDateTime)]);
  AAction := eaApplied;
end;


procedure TFrmQuickOeAddMultipleItems.SetACargo(
  const Value: TQuickAddOrderCargo);
begin
  FACargo := Value;
end;

procedure TFrmQuickOeAddMultipleItems.UniFormCreate(Sender: TObject);
begin

  ExecuteCommand('truncate table gtt_quick_oe_multi_arinvt');
  wwDBDateTimePicker1.Datetime:= SelectValueAsFloat('select sysdate from dual');
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain respective properties b
  srchArinvt.AddRefreshButton;
  srchArinvt.DBNavWidth:= 120;
  srchArinvt.wwDBGrid.KeyOptions:= [];
  srchArinvt.wwDBGrid.PaintOptions.AlternatingRowColor:= $00FFF8F0;  }

  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self ]);

  if FParamsCargo.UseAKA then
     CheckAddAKAInfo;

  QryArinvt.Open;
end;

procedure TFrmQuickOeAddMultipleItems.UpdateStatus;
var
  ACount: Real;
begin
  ACount:= SelectValueAsFloat('select count(*) from gtt_quick_oe_multi_arinvt');
  StatusBar1.Panels[0].Text:= Format('Selected:  %.0f', [ ACount ]);
end;

{ TAddQuickOeCargo }

constructor TQuickAddOrderCargo.Create( AOrders_ID: Integer );
begin
  Orders_ID := AOrders_ID;
  Arcusto_ID:= SelectValueByID('arcusto_id', 'orders', Orders_ID);
  Ship_To_ID:= SelectValueByID('ship_to_id', 'orders', Orders_ID);
  UseAKA    := False;
end;

end.
