unit WC_Where;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Menus,
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.Jump,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, Vcl.Controls, uniGUIFrame;

type
  TFrmWorkCenterWhereUsed = class(TUniForm)
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    PopupMenu1: TUniPopupMenu;
    wwQuery1MFGNO: TStringField;
    wwQuery1STANDARD_ID: TBCDField;
    wwQuery1CLASS: TStringField;
    wwQuery1ITEMNO: TStringField;
    wwQuery1REV: TStringField;
    wwQuery1DESCRIP: TStringField;
    wwQuery1DESCRIP2: TStringField;
    wwQuery1ARINVT_ID: TBCDField;
    wwQuery1EPLANT_ID: TBCDField;
    JumptoBOM1: TUniMenuItem;
    JumptoInventory1: TUniMenuItem;
    IQJumpInv: TIQWebJump;
    IQJumpBom: TIQWebJump;
    IQSearch1: TIQUniGridControl;
    wwQuery1EPLANT_NAME: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    procedure JumptoBOM1Click(Sender: TObject);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FWork_Center_ID: Real;
    FCenter_Type   : string;
    FLookup_Mfgtype: string;
    procedure SetWork_Center_ID(const Value: Real);
  public
    { Public declarations }
    property Work_Center_ID: Real write SetWork_Center_ID;
  end;

procedure DoShowWorkCenterTypeWhereUsed( AWork_Center_ID: Real );

implementation

{$R *.DFM}

uses
  IQMS.Common.Cursor,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  workcntr_rscstr;


procedure DoShowWorkCenterTypeWhereUsed( AWork_Center_ID: Real );
var
  frm: TFrmWorkCenterWhereUsed;
begin
  frm := TFrmWorkCenterWhereUsed.Create(uniGUIApplication.UniApplication);
  frm.Work_Center_ID := AWork_Center_ID;
  frm.Show;
end;

procedure TFrmWorkCenterWhereUsed.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

procedure TFrmWorkCenterWhereUsed.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);

  FCenter_Type   := SelectValueFmtAsString('select cntr_type from work_center where id = %f', [ FWork_Center_ID ]);
  FLookup_Mfgtype:= SelectValueFmtAsString('select mfg.lookup_mfgtype( mfg_type) from work_center where id = %f', [ FWork_Center_ID ]);
  Caption:= Format( workcntr_rscstr.cTXT0000021 {'Where center type, %s, is used'}, [ FCenter_Type ]);
  IQSearch1.Cursor:= crJump;
end;

procedure TFrmWorkCenterWhereUsed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmWorkCenterWhereUsed.wwQuery1BeforeOpen(DataSet: TDataSet);
begin

{ TODO -oLema : AV in security manager, IQAssignEPlantFilter }
//  IQAssignEPlantFilter( DataSet );  {pas}

  AssignQueryParamValue(DataSet, 'work_center_id', FWork_Center_ID);
  AssignQueryParamValue(DataSet, 'lookup_mfgtype', FLookup_Mfgtype);
end;

procedure TFrmWorkCenterWhereUsed.JumptoBOM1Click(Sender: TObject);
begin
  IQJumpBom.Execute;
end;

procedure TFrmWorkCenterWhereUsed.JumptoInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TFrmWorkCenterWhereUsed.SetWork_Center_ID(const Value: Real);
begin
  FWork_Center_ID := Value;
end;

end.
