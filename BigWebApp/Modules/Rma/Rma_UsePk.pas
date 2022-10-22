unit Rma_UsePk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
//  Vcl.Buttons,
  IQMS.WebVcl.Search,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  TFrmRmaUseMatPk = class(TUniForm)
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    srchArinvt: TIQUniGridControl;
    sbtnUseRepairItemList: TUniSpeedButton;
    Query1ID: TBCDField;
    Query1ITEMNO: TStringField;
    Query1DESCRIP: TStringField;
    Query1DESCRIP2: TStringField;
    Query1CLASS: TStringField;
    Query1REV: TStringField;
    Query1EPLANT_ID: TBCDField;
    Panel3: TUniPanel;
    bbtnAssign: TUniBitBtn;
    btnCancel: TUniButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure bbtnAssignClick(Sender: TObject);
    procedure sbtnUseRepairItemListClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FProd_Code_ID: Real;
    procedure DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure Validate;
    procedure AssignList( AList: TStringList );
    procedure SetProd_Code_ID(Value : Real);
    function GetProd_Code_ID: Real;
  public
    { Public declarations }
    property Prod_Code_ID: Real read GetProd_Code_ID write SetProd_Code_ID;
    class function Execute(AProd_Code_ID: Real; AList: TStringList ): Boolean;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls,
  rma_rscstr;


class function TFrmRmaUseMatPk.Execute(AProd_Code_ID: Real; AList: TStringList ): Boolean;
var
  frm: TFrmRmaUseMatPk;
begin
  frm:= TFrmRmaUseMatPk.Create(uniGUIApplication.UniApplication);
  frm.Prod_Code_ID := AProd_Code_ID;
  Result:= (frm.ShowModal = mrOK);
  if not Result then
     EXIT;
  frm.AssignList( AList );
end;

procedure TFrmRmaUseMatPk.UniFormCreate(Sender: TObject);
var
  AType:Integer;
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);

//{ TODO -oLema : Incompatible types: 'TDBNavigator' and 'TUniDBNavigator' }
//  IQMS.Common.Controls.ResizeNavBar(DBNavigator1);

  AType := 0;

  if IQRegIntegerScalarRead( self, 'SBTNUSEREPAIRITEMLIST_DOWN', AType ) then
  begin
    if AType = 0 then
      sbtnUseRepairItemList.Down := False
    else
      sbtnUseRepairItemList.Down := True;
  end
  else
  begin
    sbtnUseRepairItemList.Down := False;
    IQRegIntegerScalarWrite( self, 'SBTNUSEREPAIRITEMLIST_DOWN', 0);
  end;
  Reopen(Query1);

end;

procedure TFrmRmaUseMatPk.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.OnShowHint:= NIL;
  IQRegFormWrite( self, [ self ]);
end;


procedure TFrmRmaUseMatPk.FormActivate(Sender: TObject);
begin
  Application.OnShowHint:= DoOnShowHint;
end;

procedure TFrmRmaUseMatPk.DoOnShowHint(var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
  with HintInfo do
  begin
    if HintControl = sbtnUseRepairItemList then
    begin
      if sbtnUseRepairItemList.Down then
         // 'Repair Item Lookup List is on.'#13'Click to turn off.'
         HintStr:= rma_rscstr.cTXT0000066
      else
         // 'Repair Item Lookup List is off'#13'Click to turn on.'
         HintStr:= rma_rscstr.cTXT0000067;
    end
  end;
end;

procedure TFrmRmaUseMatPk.Query1BeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('prod_code_id').Value := IIf( sbtnUseRepairItemList.Down, FProd_Code_ID, -1 );
end;

procedure TFrmRmaUseMatPk.Validate;
begin
  IQAssert( srchArinvt.DBGrid.SelectedRows.Count > 0,
   rma_rscstr.cTXT0000068 {'Please select an item.'});
end;

procedure TFrmRmaUseMatPk.bbtnAssignClick(Sender: TObject);
begin
  Validate;
  ModalResult:= mrOK;
end;

procedure TFrmRmaUseMatPk.AssignList( AList: TStringList );
var
  I: Integer;
  AQty:Real;
begin
  with Query1 do
  try
    DisableControls;
  for I:= 0 to srchArinvt.DBGrid.SelectedRows.Count - 1 do
    begin
    GotoBookmark( srchArinvt.DBGrid.SelectedRows.Items[ I ] );
    if FProd_Code_ID = 0 then
      AQty := 1
    else
    begin
      AQty := SelectValueFmtAsFloat('select qty from REPAIR_ITEM_LIST where arinvt_id = %f and prod_code_id = %f', [Query1ID.asFloat, FProd_Code_ID]);
      if AQty = 0 then
        AQty := 1;
    end;
      AList.Add( Format('%s [%s]', [Query1ID.asString, FloatToStr(AQty)]));
  end;
  finally
    EnableControls;
  end;
end;

procedure TFrmRmaUseMatPk.sbtnUseRepairItemListClick(Sender: TObject);
begin
  if sbtnUseRepairItemList.Down then
    IQRegIntegerScalarWrite( self, 'SBTNUSEREPAIRITEMLIST_DOWN', 1)
  else
    IQRegIntegerScalarWrite( self, 'SBTNUSEREPAIRITEMLIST_DOWN', 0);

  Reopen(Query1);
end;

procedure TFrmRmaUseMatPk.SetProd_Code_ID(Value: Real);
begin
  FProd_Code_ID := Value;
end;


function TFrmRmaUseMatPk.GetProd_Code_ID: Real;
begin
  result := FProd_Code_ID;
end;

end.
