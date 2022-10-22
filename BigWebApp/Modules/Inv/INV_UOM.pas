unit Inv_UOM;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Bom_Uom,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  IQMS.WebVcl.SecurityRegister, uniGUIClasses, uniMultiItem, uniListBox,
  uniButton, Vcl.Forms, uniGUIBaseClasses, uniPanel,UniGUIApplication;

type
  TFrmInv_UomSelect = class(TFrmBom_UomSelect)
  private
    { Private declarations }
  protected
    procedure LoadListBox; override;
    procedure ApplyConvertTo( ID:Real; AFromUOM, AToUOM: string ); override;
    procedure SaveNewUOM( AState: TDataSetState ); override;
    //procedure BeforeSaveAs; override;
  public
    { Public declarations }
  end;

function GetInv_UOM:Boolean;
function GetInv_UOM2:Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
{ TODO -oGPatil -cWebConvert : Dependency
  UOM_Lst,  }
  uniComboBox,
  uniDBComboBox;

function GetInv_UOM:Boolean;
var
  LFrmBom_UomSelect : TFrmBom_UomSelect;
begin
  LFrmBom_UomSelect := TFrmBom_UomSelect.Create( UniGUIApplication.UniApplication );
    Result:= LFrmBom_UomSelect.ShowModal = mrOK;
end;

function GetInv_UOM2:Boolean;
var
  LFrmInv_UomSelect : TFrmInv_UomSelect;
begin
  LFrmInv_UomSelect := TFrmInv_UomSelect.Create( UniGUIApplication.UniApplication );
  LFrmInv_UomSelect.btnConvert.visible := false;
  LFrmInv_UomSelect.btnNew.visible := false;
  LFrmInv_UomSelect.btnCancel.Top := LFrmInv_UomSelect.btnConvert.Top;
    Result:= LFrmInv_UomSelect.ShowModal = mrOK;
end;

procedure TFrmInv_UomSelect.SaveNewUOM( AState: TDataSetState );
begin
  {BOM posts SaveAs immediatly to reflect changes in units of measure of part, sprue etc,
   but here we want to avoid it since ITEMNO may not be entered yet and posting would've raised an exception}
   if Owner is TUniDBComboBox then
   begin
     with (Owner as TUniDBComboBox).DataSource.DataSet do
       if AState = dsBrowse then
          Post
   end;
{ TODO -oGPatil -cWebConvert : Undeclared Identifier
   if Owner is TUniDBComboBox then
   begin
     if not assigned((Owner as TUniDBComboBox).DataSource.DataSet) then
       with TIQUniGridControl((Owner as TUniDBComboBox).parent).DataSource.DataSet do
         if AState = dsBrowse then
            Post
     else
       with (Owner as TwwDBComboBox).DataSource.DataSet do
         if AState = dsBrowse then
            Post
   end;  }

end;

procedure TFrmInv_UomSelect.ApplyConvertTo( ID:Real; AFromUOM, AToUOM: string );
var
  I: Integer;
  S: string;
  AState:TDataSetState;
begin
  if Owner is TUniDBComboBox then with (Owner as TUniDBComboBox), DataSource, DataSet do
  begin
    {Make sure it can be converted}
    SelectValueFmtAsFloat('select UOM.IQConvert( ''%s'', ''%s'', 1, %f) from dual', [ AFromUOM, AToUOM, ID ]);

    {FGMulti}
    ExecuteCommandFmt('declare                                                             '+
              '  v_arinvt_id number::= %f;                                         '+
              '  v_from_uom  varchar2(10)::= ''%s'';                               '+
              '  v_to_uom    varchar2(10)::= ''%s'';                               '+
              '  v_factor    number;                                               '+
              'begin                                                               '+
              '  v_factor:= UOM.IQConvert( v_from_uom, v_to_uom, 1, v_arinvt_id ); '+
              '  if v_factor = 1 then                                              '+
              '     return;                                                        '+
              '  end if;                                                           '+
              '                                                                    '+
              '  for v in (select id from fgmulti where arinvt_id = v_arinvt_id)   '+
              '  loop                                                              '+
              '    update fgmulti                                                  '+
              '      set onhand    = onhand * v_factor,                            '+
              '          rg_onhand = rg_onhand * v_factor                          '+
              '    where id = v.id;                                                '+
              '                                                                    '+
              '    update master_label                                             '+
              '       set qty = qty * v_factor                                     '+
              '     where fgmulti_id = v.id;                                       '+
              '  end loop;                                                         '+
              'end;                                                                ',
              [ ID,
                Trim(AFromUOM),
                Trim(AToUOM) ]);

    {Arinvt}
    AState:= State;
    Edit;
    FieldByName(DataField).asString:= ListBox1.Items[ ListBox1.ItemIndex ];
    if AState = dsBrowse then
       Post;

      for I:= 0 to  TFDTable(DataSet).Connection.DataSetCount - 1 do
         if TFDTable(DataSet).Connection.DataSets[i].ClassType = TFDTable then with TFDTable(DataSet).Connection.DataSets[i] as TFDTable do
//         if (DataSets[I].ClassType = TFDTable) then with DataSets[I] as TFDTable do
         begin
           S:= StrTran( UpperCase(TableName), 'IQMS.', '');
           if S = 'FGMULTI' then
              Refresh
           else if ( S = 'ARINVT') and ( State = dsBrowse ) then
              Refresh
         end;
  end;
end;

procedure TFrmInv_UomSelect.LoadListBox;
var
  AClass: TField;
begin
  AClass:= NIL;

{ TODO -oGPatil -cWebConvert : Access Violation Error
  if Assigned( FDataSet ) then
     AClass:= FDataSet.FindField('CLASS');  }

{ TODO -oGPatil -cWebConvert : Dependency UOM_Lst
  if Assigned( AClass ) and (AClass.AsString = 'PL') then
     inherited
  else
     PopulateUOMs( ListBox1.Items );  {UOM_Lst}
end;

end.
