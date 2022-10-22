unit OnHand;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
  Mask,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniCheckBox,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmOnHandByPlant = class(TUniForm)
    DBGrid1: TUniDBGrid;
    Panel1: TUniPanel;
    SrcOnHand: TDataSource;
    QryOnHand: TFDQuery;
    SrcArinvt: TDataSource;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label3: TUniLabel;
    Label5: TUniLabel;
    Label4: TUniLabel;
    PnlClient02: TUniPanel;
    dbcClass: TUniDBEdit;
    dbeItemNo: TUniDBEdit;
    dbeRev: TUniDBEdit;
    PnlTotalBy: TUniPanel;
    GroupBox1: TUniGroupBox;
    chkByEPlant: TUniCheckBox;
    chkByDivision: TUniCheckBox;
    chkByClassItem: TUniCheckBox;
    Splitter2: TUniSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryOnHandBeforeOpen(DataSet: TDataSet);
    procedure RunTotal(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AddColumn( AFiledName, ATitle: string; AWidth: Integer );
    procedure AssignQuery;
    procedure AssignColumns;
    procedure SetDataSet(const Value: TDataSet);
  public
    { Public declarations }
    property DataSet: TDataSet write SetDataSet;
  end;

procedure DoShowOnHandByPlant( ADataSet: TDataSet );

implementation

{$R *.DFM}

uses
  inv_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.SysShare;

procedure DoShowOnHandByPlant(ADataSet: TDataSet );
var
  LFrmOnHandByPlant : TFrmOnHandByPlant;
begin
  LFrmOnHandByPlant :=  TFrmOnHandByPlant.Create(UniGUIApplication.UniApplication);
  LFrmOnHandByPlant.DataSet := ADataSet;
  LFrmOnHandByPlant.ShowModal;
end;

procedure TFrmOnHandByPlant.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, DBGrid1, PnlTotalBy, PnlLeft01, chkbyEplant, chkbyDivision, chkByClassItem ]);
end;


procedure TFrmOnHandByPlant.FormShow(Sender: TObject);
begin
 RunTotal( NIL );
end;

procedure TFrmOnHandByPlant.QryOnHandBeforeOpen(DataSet: TDataSet);
begin
  if Assigned( SrcArinvt.DataSet ) then
     with DataSet as TFDQuery do
     begin
       ParamByName( 'v_class'     ).Value := SrcArinvt.DataSet.FieldByName('class').asString;
       ParamByName( 'v_itemno'    ).Value := SrcArinvt.DataSet.FieldByName('itemno').asString;
       ParamByName( 'v_rev'       ).Value := SrcArinvt.DataSet.FieldByName('rev').asString;
       if not chkByClassItem.Checked then
          ParamByName('v_arinvt_id').Value := SrcArinvt.DataSet.FieldByName('ID').asFloat;
     end;
end;

procedure TFrmOnHandByPlant.RunTotal(Sender: TObject);
begin
  if not Showing then
  Exit;
  AssignQuery;
  AssignColumns;
  ReOpen( QryOnHand );
end;

procedure TFrmOnHandByPlant.SetDataSet(const Value: TDataSet);
begin
  SrcArinvt.DataSet:= Value;
end;

procedure TFrmOnHandByPlant.UniFormCreate(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert :  Incompatible types: 'TForm' and 'TFrmOnHandByPlant'
  CenterForm(Self); // IQMS.Common.Controls.pas     }
  IQRegFormRead(self, [self, DBGrid1, PnlTotalBy, PnlLeft01, chkbyEplant, chkbyDivision, chkByClassItem]);

  with chkByDivision do Caption:= CheckReplaceDivisionCaption( Caption );      {Sys_Share}
 (* TODO -oGPatil -cWebConvert : Access Violation Error
  Caption:= Format(inv_rscstr.cTXT0000130 {'On Hand [Item ID = %.0f]'}, [ SrcArinvt.DataSet.FieldByName('ID').asFloat]); *)
end;

procedure TFrmOnHandByPlant.AssignQuery;
begin
  with QryOnHand do
  begin
    Close;
    SQL.Clear;

    {Select}
    SQL.Add('select');
    if chkByEPlant.Checked then
       SQL.Add('p.name as plant_name,');
    if chkByDivision.Checked then
       SQL.Add('d.name as division_name,');

    SQL.Add(' Sum( NVL(f.onhand,0)) on_hand,');
    SQL.Add(' Sum( NVL(f.rg_onhand,0)) rg_onhand');

    {From}
    SQL.Add('from arinvt a, ');
    SQL.Add('     fgmulti f ');

    if chkByEPlant.Checked then
       SQL.Add(', eplant p ');
    if chkByDivision.Checked then
       SQL.Add(', division d ');

    {Where}
    SQL.Add(' where f.arinvt_id = a.id  ');
    SQL.Add('   and rtrim(:v_class)  = rtrim(a.class) ');
    SQL.Add('   and rtrim(:v_itemno) = rtrim(a.itemno) ');
    SQL.Add('   and nvl(rtrim(:v_rev), ''*'') = nvl(rtrim(a.rev), ''*'') ');
    SQL.Add('   and (f.non_conform_id is NULL or f.non_conform_id is not null and f.non_conform_allocatable = ''Y'') ');

    if not chkByClassItem.Checked then
       SQL.Add(' and :v_arinvt_id = a.id');
    if chkByEPlant.Checked then
       SQL.Add(' and f.eplant_id = p.id(+)');
    if chkByDivision.Checked then
       SQL.Add(' and f.division_id = d.id(+)');

    {Group By}
    if (chkByEPlant.Checked) or (chkByDivision.Checked) then
       SQL.Add('group by');
    if chkByEPlant.Checked then
       SQL.Add(' f.eplant_id, p.name ');
    if (chkByEPlant.Checked) and (chkByDivision.Checked) then
       SQL.Add(', ');
    if chkByDivision.Checked then
       SQL.Add(' f.division_id, d.name ');
  end;
end;

procedure TFrmOnHandByPlant.AssignColumns;
begin
  with DBGrid1 do
  begin
    Columns.Clear;

    if chkByEPlant.Checked then
       AddColumn( 'PLANT_NAME', inv_rscstr.cTXT0000108 {'EPlant Name'}, 100 );

    if chkByDivision.Checked then
       AddColumn( 'DIVISION_NAME', CheckReplaceDivisionCaption('Division Name'), 100 );  {Sys_share}

    AddColumn( 'ON_HAND',   inv_rscstr.cTXT0000106 {'On Hand'}, 100 );

    if SrcArinvt.DataSet.FieldByName('class').asString = 'PL' then
       AddColumn( 'RG_ONHAND', inv_rscstr.cTXT0000107 {'Regrind On Hand'}, 100 );
  end;
end;

procedure TFrmOnHandByPlant.AddColumn( AFiledName, ATitle: string; AWidth: Integer );
begin
  with DBGrid1 do
    with Columns.Add do
    begin
       FieldName    := UpperCase(AFiledName);
       Title.Caption:= ATitle;
       Width        := AWidth;
    end;
end;

end.
