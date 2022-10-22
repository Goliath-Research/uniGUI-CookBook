unit PSBolWeight;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
  Mask,
  Vcl.wwDataInspector,
  wwcheckbox,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, Vcl.Grids, Vcl.StdCtrls, IQUniGrid, uniGUIFrame;

type
  TFrmBOLWeight = class(TUniForm)
    SrcShipment_Bol_Item: TDataSource;
    TblShipment_Bol_Item: TFDTable;
    TblShipment_Bol_ItemID: TBCDField;
    TblShipment_Bol_ItemSHIPMENT_BOL_ID: TBCDField;
    TblShipment_Bol_ItemARINVT_ID: TBCDField;
    TblShipment_Bol_ItemQTY: TFMTBCDField;
    TblShipment_Bol_ItemNET_WEIGHT: TFMTBCDField;
    TblShipment_Bol_ItemTARE_WEIGHT: TFMTBCDField;
    wwDBGridBolItem: TIQUniGridControl;
    TblShipment_Bol_ItemItemNo: TStringField;
    TblShipment_Bol_ItemDescrip: TStringField;
    wwDBComboDlgItemNo: TUniEdit;
    PkArinvt: TIQWebHPick;
    PkArinvtID: TBCDField;
    PkArinvtITEMNO: TStringField;
    PkArinvtDESCRIP: TStringField;
    PkArinvtDESCRIP2: TStringField;
    PkArinvtCLASS: TStringField;
    PkArinvtREV: TStringField;
    PkArinvtPK_WEIGHT: TFMTBCDField;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtDESCRIP2: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtIS_PALLET: TStringField;
    TblShipment_Bol_ItemClass: TStringField;
    wwExpandButtonDescrip: TwwExpandButton;
    wwDataInspectorExpandItem: TwwDataInspector;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBComboDlgItemNoCustomDlg(Sender: TObject);
    procedure TblShipment_Bol_ItemAfterPost(DataSet: TDataSet);
    procedure wwExpandButtonDescripAfterExpand(Sender: TObject);
    procedure TblShipment_Bol_ItemBeforePost(DataSet: TDataSet);
    procedure TblShipment_Bol_ItemNewRecord(DataSet: TDataSet);
    procedure TblShipment_Bol_ItemAfterOpen(DataSet: TDataSet);
    procedure SrcShipment_Bol_ItemDataChange(Sender: TObject;
      Field: TField);
    procedure wwDBGridBolItemCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure TblShipment_Bol_ItemCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FShipment_Bol_ID: Real;
    FWasChanged: Boolean;
    procedure SetShipment_Bol_ID(const Value: Real);
  public
    { Public declarations }
    property Shipment_Bol_ID: Real write SetShipment_Bol_ID;
    class function DoShowModal(AShipment_Bol_ID: Real): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

class function TFrmBOLWeight.DoShowModal(AShipment_Bol_ID: Real): Boolean;
var
  LFrmBOLWeight : TFrmBOLWeight;
begin
  LFrmBOLWeight := TFrmBOLWeight.Create(UniGUIApplication.UniApplication);
  LFrmBOLWeight.Shipment_Bol_ID := AShipment_Bol_ID;
  LFrmBOLWeight.ShowModal;
  Result := LFrmBOLWeight.FWasChanged;
end;

procedure TFrmBOLWeight.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, wwDBGridBolItem]);
end;

procedure TFrmBOLWeight.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, wwDBGridBolItem]);
end;

procedure TFrmBOLWeight.TblShipment_Bol_ItemAfterOpen(DataSet: TDataSet);
begin
  TFDTable(DataSet).SetRange([FShipment_Bol_ID], [FShipment_Bol_ID]);
end;

procedure TFrmBOLWeight.wwDBComboDlgItemNoCustomDlg(Sender: TObject);
begin
  with PkArinvt do
    if Execute then
      try
        SrcShipment_Bol_Item.OnDataChange := nil;
        TblShipment_Bol_Item.Edit;
        TblShipment_Bol_ItemARINVT_ID.asFloat := GetValue('ID');
        TblShipment_Bol_ItemTARE_WEIGHT.Readonly := false;
        TblShipment_Bol_ItemTARE_WEIGHT.asFloat := GetValue('PK_WEIGHT');
      finally;
        SrcShipment_Bol_Item.OnDataChange := SrcShipment_Bol_ItemDataChange;
        SrcShipment_Bol_ItemDataChange(nil, nil);
      end
end;

procedure TFrmBOLWeight.TblShipment_Bol_ItemAfterPost(DataSet: TDataSet);
begin
  FWasChanged := TRUE;
end;

procedure TFrmBOLWeight.wwExpandButtonDescripAfterExpand(Sender: TObject);
begin
  Reopen(QryArinvt);
end;

procedure TFrmBOLWeight.TblShipment_Bol_ItemBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet)
end;

procedure TFrmBOLWeight.TblShipment_Bol_ItemNewRecord(DataSet: TDataSet);
begin
  TblShipment_Bol_ItemSHIPMENT_BOL_ID.asFloat := FShipment_Bol_ID;
end;

procedure TFrmBOLWeight.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmBOLWeight.SetShipment_Bol_ID(const Value: Real);
begin
  FShipment_Bol_ID := Value;
end;

procedure TFrmBOLWeight.SrcShipment_Bol_ItemDataChange(Sender: TObject;
  Field: TField);
var
  AClass: string;
begin
  AClass := TblShipment_Bol_ItemClass.asString;

  if AClass = '' then
  begin
    TblShipment_Bol_ItemNET_WEIGHT.Readonly := TRUE;
    TblShipment_Bol_ItemTARE_WEIGHT.Readonly := TRUE;
  end
  else if AClass = 'PK' then
  begin
    TblShipment_Bol_ItemNET_WEIGHT.Readonly := TRUE;
    TblShipment_Bol_ItemTARE_WEIGHT.Readonly := false;
  end
  else
  begin
    TblShipment_Bol_ItemNET_WEIGHT.Readonly := false;
    TblShipment_Bol_ItemTARE_WEIGHT.Readonly := TRUE;
  end;
end;

procedure TFrmBOLWeight.wwDBGridBolItemCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then
    EXIT;

  if (Field = TblShipment_Bol_ItemNET_WEIGHT) then
  begin
    if TblShipment_Bol_ItemClass.asString = '' then
      ABrush.Color := clBtnFace
    else if TblShipment_Bol_ItemClass.asString <> 'PK' then
      ABrush.Color := clWindow
    else
      ABrush.Color := clBtnFace;
  end;

  if (Field = TblShipment_Bol_ItemTARE_WEIGHT) then
  begin
    if TblShipment_Bol_ItemClass.asString = '' then
      ABrush.Color := clBtnFace
    else if TblShipment_Bol_ItemClass.asString = 'PK' then
      ABrush.Color := clWindow
    else
      ABrush.Color := clBtnFace;
  end;
end;

procedure TFrmBOLWeight.TblShipment_Bol_ItemCalcFields(DataSet: TDataSet);
begin
  if TblShipment_Bol_ItemARINVT_ID.asFloat > 0 then
  begin
    with TFDQuery.Create(nil) do
      try
        Connection := UniMainModule.FDConnection1;
        SQL.Add('SELECT itemno,     ');
        SQL.Add('       descrip,    ');
        SQL.Add('       class       ');
        SQL.Add('  FROM arinvt      ');
        SQL.Add(Format(' WHERE id = %d     ',
          [TblShipment_Bol_ItemARINVT_ID.AsLargeInt]));
        Open;
        if not (Bof and Eof) then
        begin
          TblShipment_Bol_ItemItemNo.asString := Fields[0].asString;
          TblShipment_Bol_ItemDescrip.asString := Fields[1].asString;
          TblShipment_Bol_ItemClass.asString := Fields[2].asString;
        end;
      finally
        Free;
      end;
  end;
end;

end.
