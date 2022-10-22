unit oe_estimate_bol_weight;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
  Mask,
//  Vcl.wwDataInspector,  //not yet
//  wwcheckbox,
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
  TFrmEstimateBOLWeight = class(TUniForm)
    Panel1: TUniPanel;
    SrcEstimate_Bol_Item: TDataSource;
    TblEstimate_Bol_Item: TFDTable;
    TblEstimate_Bol_ItemID: TBCDField;
    TblEstimate_Bol_ItemARINVT_ID: TBCDField;
    TblEstimate_Bol_ItemQTY: TFMTBCDField;
    TblEstimate_Bol_ItemNET_WEIGHT: TFMTBCDField;
    TblEstimate_Bol_ItemTARE_WEIGHT: TFMTBCDField;
    wwDBGridBolItem: TIQUniGridControl;
    TblEstimate_Bol_ItemItemNo: TStringField;
    TblEstimate_Bol_ItemDescrip: TStringField;
    wwDBComboDlgItemNo: TUniEdit;
    PkArinvt: TIQWebHPick;
    PkArinvtID: TFloatField;
    PkArinvtITEMNO: TStringField;
    PkArinvtDESCRIP: TStringField;
    PkArinvtDESCRIP2: TStringField;
    PkArinvtCLASS: TStringField;
    PkArinvtREV: TStringField;
    PkArinvtPK_WEIGHT: TFloatField;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtDESCRIP2: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtIS_PALLET: TStringField;
    TblEstimate_Bol_ItemClass: TStringField;
    TblEstimate_Bol_ItemESTIMATE_BOL_ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBComboDlgItemNoCustomDlg(Sender: TObject);
    procedure TblEstimate_Bol_ItemAfterPost(DataSet: TDataSet);
    procedure wwExpandButtonDescripAfterExpand(Sender: TObject);
    procedure TblEstimate_Bol_ItemBeforePost(DataSet: TDataSet);
    procedure TblEstimate_Bol_ItemNewRecord(DataSet: TDataSet);
    procedure TblEstimate_Bol_ItemAfterOpen(DataSet: TDataSet);
    procedure SrcEstimate_Bol_ItemDataChange(Sender: TObject;
      Field: TField);
    procedure wwDBGridBolItemCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure TblEstimate_Bol_ItemCalcFields(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FEstimate_Bol_ID: Real;
    FWasChanged: Boolean;
    procedure SetEstimate_Bol_ID(const Value: Real);
  public
    { Public declarations }
    property Estimate_Bol_ID: Real read FEstimate_Bol_ID write SetEstimate_Bol_ID;
    property WasChanged: Boolean read FWasChanged;
    class function DoShowModal( AEstimate_Bol_ID: Real ): Boolean;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmBOLWeight }

class function TFrmEstimateBOLWeight.DoShowModal(AEstimate_Bol_ID: Real): Boolean;
var
  frm: TFrmEstimateBOLWeight;
begin
  frm:= TFrmEstimateBOLWeight.Create(uniGUIApplication.UniApplication);
  frm.Estimate_Bol_ID:= AEstimate_Bol_ID;
  frm.ShowModal;
  Result:= frm.WasChanged;
end;


procedure TFrmEstimateBOLWeight.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGridBolItem ]);
end;

procedure TFrmEstimateBOLWeight.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGridBolItem ]);
end;

procedure TFrmEstimateBOLWeight.TblEstimate_Bol_ItemAfterOpen(DataSet: TDataSet);
begin
  TFDTable(DataSet).SetRange([ FEstimate_Bol_ID ], [ FEstimate_Bol_ID ]);
end;

procedure TFrmEstimateBOLWeight.wwDBComboDlgItemNoCustomDlg(Sender: TObject);
begin
  with PkArinvt do
    if Execute then
    begin
       TblEstimate_Bol_Item.Edit;
       TblEstimate_Bol_ItemARINVT_ID.asFloat:= GetValue('ID');
       TblEstimate_Bol_ItemTARE_WEIGHT.asFloat:= GetValue('PK_WEIGHT');
    end
end;

procedure TFrmEstimateBOLWeight.TblEstimate_Bol_ItemAfterPost(DataSet: TDataSet);
begin
  FWasChanged:= TRUE;
end;

procedure TFrmEstimateBOLWeight.wwExpandButtonDescripAfterExpand(Sender: TObject);
begin
  Reopen( QryArinvt );
end;

procedure TFrmEstimateBOLWeight.TblEstimate_Bol_ItemBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet )
end;

procedure TFrmEstimateBOLWeight.TblEstimate_Bol_ItemNewRecord(DataSet: TDataSet);
begin
  TblEstimate_Bol_ItemESTIMATE_BOL_ID.asFloat:= FEstimate_Bol_ID;
end;


procedure TFrmEstimateBOLWeight.SetEstimate_Bol_ID(const Value: Real);
begin
  FEstimate_Bol_ID:= Value;
end;

procedure TFrmEstimateBOLWeight.SrcEstimate_Bol_ItemDataChange(Sender: TObject;  Field: TField);
var
  AClass: string;
begin
  AClass:= TblEstimate_Bol_ItemClass.asString;

  if AClass = '' then
     begin
        TblEstimate_Bol_ItemNET_WEIGHT.ReadOnly := TRUE;
        TblEstimate_Bol_ItemTARE_WEIGHT.ReadOnly:= TRUE;
     end
  else if AClass = 'PK' then
     begin
        TblEstimate_Bol_ItemNET_WEIGHT.ReadOnly := TRUE;
        TblEstimate_Bol_ItemTARE_WEIGHT.ReadOnly:= FALSE;
     end
  else
     begin
        TblEstimate_Bol_ItemNET_WEIGHT.ReadOnly := FALSE;
        TblEstimate_Bol_ItemTARE_WEIGHT.ReadOnly:= TRUE;
     end;
end;

procedure TFrmEstimateBOLWeight.wwDBGridBolItemCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then EXIT;

  if (Field = TblEstimate_Bol_ItemNET_WEIGHT) then
  begin
    if TblEstimate_Bol_ItemClass.asString = '' then
       ABrush.Color:= clBtnFace
    else if TblEstimate_Bol_ItemClass.asString <> 'PK' then
       ABrush.Color:= clWindow
    else
       ABrush.Color:= clBtnFace;
  end;

  if (Field = TblEstimate_Bol_ItemTARE_WEIGHT) then
  begin
    if TblEstimate_Bol_ItemClass.asString = '' then
       ABrush.Color:= clBtnFace
    else if TblEstimate_Bol_ItemClass.asString = 'PK' then
       ABrush.Color:= clWindow
    else
       ABrush.Color:= clBtnFace;
  end;
end;

procedure TFrmEstimateBOLWeight.TblEstimate_Bol_ItemCalcFields(DataSet: TDataSet);
begin
  if TblEstimate_Bol_ItemARINVT_ID.asFloat > 0 then
    begin
      TblEstimate_Bol_ItemClass.asString:= SelectValueByID('class', 'arinvt', TblEstimate_Bol_ItemARINVT_ID.asFloat);
      TblEstimate_Bol_ItemItemNo.asString:= SelectValueByID('itemno', 'arinvt', TblEstimate_Bol_ItemARINVT_ID.asFloat);
      TblEstimate_Bol_ItemDescrip.asString:= SelectValueByID('descrip', 'arinvt', TblEstimate_Bol_ItemARINVT_ID.asFloat);
    end;
end;

end.
