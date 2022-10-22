unit inv_alternate_items;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.Jump,
  Vcl.Menus,
  System.Generics.Collections,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmInvAlternateItems = class(TUniForm)
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    wwQuery1ID: TBCDField;
    wwQuery1PARENT_ARINVT_ID: TBCDField;
    wwQuery1ARINVT_ID: TBCDField;
    wwQuery1ITEMNO: TStringField;
    wwQuery1REV: TStringField;
    wwQuery1CLASS: TStringField;
    wwQuery1DESCRIP: TStringField;
    wwQuery1DESCRIP2: TStringField;
    wwQuery1NonCommited: TFloatField;
    wwQuery1ONHAND: TBCDField;
    wwQuery1UNIT: TStringField;
    PopupMenu1: TUniPopupMenu;
    JumptoInventory1: TUniMenuItem;
    JumptoInventoryTransactionsLocations1: TUniMenuItem;
    wwDBGrid1: TIQUniGridControl;
    IQJumpInv: TIQWebJump;
    wwQuery1SEQ: TBCDField;
    wwQuery1ALTERNATE_ITEM_CODE_ID: TBCDField;
    wwQuery1AlternateItemCode: TStringField;
    wwQuery1NON_COMMITTED: TFMTBCDField;
    N1: TUniMenuItem;
    CopyAlternateItems1: TUniMenuItem;
    ReplaceAlternateItems1: TUniMenuItem;
    PkTrgArinvt: TIQWebHPick;
    PkTrgArinvtID: TBCDField;
    PkTrgArinvtITEMNO: TStringField;
    PkTrgArinvtDESCRIP: TStringField;
    PkTrgArinvtREV: TStringField;
    PkTrgArinvtCLASS: TStringField;
    PkTrgArinvtDESCRIP2: TStringField;
    PkTrgArinvtONHAND: TBCDField;
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQuery1CalcFields(DataSet: TDataSet);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure JumptoInventoryTransactionsLocations1Click(Sender: TObject);
    procedure CopyAlternateItems1Click(Sender: TObject);
    procedure ReplaceAlternateItems1Click(Sender: TObject);
    procedure PkTrgArinvtBeforeOpen(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure LoadSelectedRecords(AList: TList<Real>);
    procedure AssignToAnotherItem(ATrgArinvt_ID: Real; AList: TList<Real>;
      AMode: string);
    procedure setArinvt_ID(const Value: real);
    { Private declarations }
  protected
    FArinvt_ID: Real;
  public
    { Public declarations }
    class function DoShowModal(AArinvt_ID: Real): Boolean;
    property Arinvt_ID: real write setArinvt_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.JumpConstants,
  IQMS.Common.Dialogs;

{ TFrmInvAlternateItems }

class function TFrmInvAlternateItems.DoShowModal(AArinvt_ID: Real): Boolean;
var
   loFrmInvAlternateItems : TFrmInvAlternateItems;
begin
  loFrmInvAlternateItems:=TFrmInvAlternateItems.Create(uniGUIApplication.UniApplication);
  with loFrmInvAlternateItems do
  begin
    Arinvt_ID:= AArinvt_ID;
    Result:= ShowModal = mrOK;
  end;
end;

procedure TFrmInvAlternateItems.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;


procedure TFrmInvAlternateItems.JumptoInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TFrmInvAlternateItems.JumptoInventoryTransactionsLocations1Click(
  Sender: TObject);
begin
  JumpDirect( iq_JumpToInvTransLocs, wwQuery1ARINVT_ID.asInteger);
end;

procedure TFrmInvAlternateItems.wwQuery1BeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('arinvt_id').Value := FArinvt_ID;
end;
{
procedure TFrmInvAlternateItems.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;
}

procedure TFrmInvAlternateItems.wwQuery1CalcFields(DataSet: TDataSet);
begin
  // wwQuery1NonCommited.asFloat:= inv_share.GetNonComittedQty( wwQuery1ARINVT_ID.asFloat );
  wwQuery1NonCommited.asFloat:= wwQuery1NON_COMMITTED.asFloat;
  if wwQuery1ALTERNATE_ITEM_CODE_ID.asFloat <> 0 then
    wwQuery1AlternateItemCode.asString := SelectValueFmtAsString('select code from ALTERNATE_ITEM_CODE where id = %f', [wwQuery1ALTERNATE_ITEM_CODE_ID.AsFloat]);
end;

procedure TFrmInvAlternateItems.CopyAlternateItems1Click(Sender: TObject);
var
  AList: TList<Real>;
begin
  AList:= TList<Real>.Create;
  try
    LoadSelectedRecords( AList );
    if PkTrgArinvt.Execute then
       AssignToAnotherItem( PkTrgArinvt.GetValue('id'), AList, 'COPY' );
  finally
    AList.Free;
  end;
end;


procedure TFrmInvAlternateItems.LoadSelectedRecords( AList: TList<Real>);
var
  I: Integer;
begin
  with wwDBGrid1 do
  begin
    if DBGrid.SelectedRows.Count > 0 then
       for I:= 0 to DBGrid.SelectedRows.Count - 1 do
       begin
         DataSource.DataSet.GotoBookmark(DBGrid.SelectedRows.Items[ I ]);
         AList.Add( DataSource.DataSet.FieldByName('id').asFloat);
       end
    else
       AList.Add( DataSource.DataSet.FieldByName('id').asFloat);
    //UnselectAll;
  end;

end;


procedure TFrmInvAlternateItems.PkTrgArinvtBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'arinvt_id', FArinvt_ID);
//  TFDQuery(DataSet).ParamByName('arinvt_id').Value := FArinvt_ID;
end;

procedure TFrmInvAlternateItems.ReplaceAlternateItems1Click(Sender: TObject);
var
  AList: TList<Real>;
begin
  AList:= TList<Real>.Create;
  try
    LoadSelectedRecords( AList );
    if PkTrgArinvt.Execute then
       AssignToAnotherItem( PkTrgArinvt.GetValue('id'), AList, 'REPLACE' );
  finally
    AList.Free;
  end;
end;

procedure TFrmInvAlternateItems.setArinvt_ID(const Value: real);
begin
     FArinvt_ID := Value;
end;

procedure TFrmInvAlternateItems.UniFormCreate(Sender: TObject);
begin
    IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmInvAlternateItems.UniFormShow(Sender: TObject);
begin
   IQSetTablesActive(TRUE, self);
end;

procedure TFrmInvAlternateItems.AssignToAnotherItem( ATrgArinvt_ID: Real; AList: TList<Real>; AMode: string {REPLACE or COPY});
var
  AAlternateIDs: string;

  function _GetAlternateIDs: string;
  var
    x: Real;
  begin
    Result:= '';
    for x in AList do
      Result:= Result + FloatToStr(x) + ',';
    Result:= Copy(Result, 1, Length(Result) - 1);
  end;

begin
  if not IQConfirmYN(Format('About to assign alternate item(s) to %s [mode = %s] - continue?',
                            [ SelectValueByID('itemno', 'arinvt', ATrgArinvt_ID), AMode ])) then
     EXIT;

  AAlternateIDs:= _GetAlternateIDs();
  if AAlternateIDs = '' then
     EXIT;

  if AMode = 'REPLACE' then
     ExecuteCommandFmt('delete from arinvt_alternate                         '+
               ' where parent_arinvt_id = %f                         '+
               '   and nvl(alternate_item_code_id,0)                 '+
               '       in                                            '+
               '       (select distinct nvl(alternate_item_code_id,0)'+
               '          from arinvt_alternate                      '+
               '         where id in (%s))                           ',
               [ ATrgArinvt_ID,
                 AAlternateIDs ]);

  ExecuteCommandFmt('declare                                                 '+
            '  v_trg_arinvt_id number::= %f;                         '+
            '  v_count number;                                       '+
            'begin                                                   '+
            '  for v in (select arinvt_id,                           '+
            '                   alternate_item_code_id,              '+
            '                   seq                                  '+
            '              from arinvt_alternate                     '+
            '             where id in (%s))                          '+
            '  loop                                                  '+
            '    select count(*) into v_count                        '+
            '      from arinvt_alternate                             '+
            '     where parent_arinvt_id = v_trg_arinvt_id           '+
            '       and arinvt_id = v.arinvt_id                      '+
            '       and nvl(alternate_item_code_id,0) = nvl(v.alternate_item_code_id,0); '+
            '                                                        '+
            '    if v_count = 0 then                                 '+
            '       insert into arinvt_alternate                     '+
            '            ( parent_arinvt_id,                         '+
            '              arinvt_id,                                '+
            '              alternate_item_code_id,                   '+
            '              seq )                                     '+
            '       values                                           '+
            '            ( v_trg_arinvt_id,                          '+
            '              v.arinvt_id,                              '+
            '              v.alternate_item_code_id,                 '+
            '              v.seq );                                  '+
            '    end if;                                             '+
            '  end loop;                                             '+
            'end;                                                    ',
            [ ATrgArinvt_ID,
              AAlternateIDs ]);
end;


end.
