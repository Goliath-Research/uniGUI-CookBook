unit MatXcpWO;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.Jump,
  Vcl.Menus,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmMatExceptionWO = class(TUniForm)
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    wwDBGrid1: TIQUniGridControl;
    wwQuery1CLASS: TStringField;
    wwQuery1ITEMNO: TStringField;
    wwQuery1REV: TStringField;
    wwQuery1EPLANT_ID: TBCDField;
    wwQuery1PROD_DATE: TDateTimeField;
    wwQuery1ARINVT_ID: TBCDField;
    wwQuery1DIVISION_ID: TBCDField;
    wwQuery1QTY: TFMTBCDField;
    PopupMenu1: TUniPopupMenu;
    JumptoInventory1: TUniMenuItem;
    IQJumpInv: TIQWebJump;
    Bevel1: TUniPanel;
    wwQuery1Qty_On_Req: TFloatField;
    wwQuery1Qty_On_Po: TFloatField;
    wwQuery1ONHAND: TFMTBCDField;
    JumpToMaterialExceptions1: TUniMenuItem;
    wwQuery1DESCRIP: TStringField;
    wwQuery1DESCRIP2: TStringField;
    wwQuery1STANDARD_EPLANT_ID: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure wwQuery1CalcFields(DataSet: TDataSet);
    procedure JumpToMaterialExceptions1Click(Sender: TObject);
    procedure wwQuery1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FWorkOrder_ID: Real;
    procedure OpenQuery;
  public
    { Public declarations }
  end;

procedure DoShowWorkorderMaterialExceptions( AWorkOrder_ID: Real );

implementation

{$R *.DFM}

uses
  IQMS.Common.Cursor,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  Mat_Xcpt,
  System.Variants;

procedure DoShowWorkorderMaterialExceptions( AWorkOrder_ID: Real );
var
  frm: TFrmMatExceptionWO;
begin
  frm := TFrmMatExceptionWO.Create(uniGUIApplication.UniApplication);
  frm.FWorkOrder_ID:=AWorkOrder_ID;
  frm.Show;
end;

procedure TFrmMatExceptionWO.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, wwDBGrid1]);
end;

procedure TFrmMatExceptionWO.UniFormShow(Sender: TObject);
begin
  Caption:= Format('Material Exceptions for WO # %.0f', [ FWorkOrder_ID ]);
  OpenQuery;
  wwDBGrid1.Cursor:= crJump;
end;

procedure TFrmMatExceptionWO.OpenQuery;
begin
  with wwQuery1 do
  begin
    Close;
    ParamByName('workorder_id').Value:= FWorkOrder_ID;
    Open;
  end;
end;

procedure TFrmMatExceptionWO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self,wwDBGrid1]);
end;

procedure TFrmMatExceptionWO.JumptoInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TFrmMatExceptionWO.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSCHED{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmMatExceptionWO.wwQuery1CalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select sum( (case nvl(po.approved_by, ''Not Approved'')     '+
                            '              when ''Not Approved'' then 0                  '+
                            '              when ''Denied'' then 0                        '+
                            '       else r.qty_left_onorder                              '+
                            '       end )) as qty_on_po,                                 '+
                            '                                                            '+
                            '       sum( (case nvl(po.approved_by, ''Not Approved'')     '+
                            '              when ''Not Approved'' then r.qty_left_onorder '+
                            '              when ''Denied'' then r.qty_left_onorder       '+
                            '       else 0                                               '+
                            '       end )) as qty_on_req                                 '+
                            '  from v_po_releases_cum r, po                              '+
                            ' where                                                      '+
                            '       r.arinvt_id = %f                                     '+
                            '   and r.po_id = po.id                                      '+
                            '   and NVL(r.closed, ''N'') = ''N''                         '+
                            '   and NVL(r.division_id, 0) = NVL(%f, 0)                   ',
                            [ wwQuery1ARINVT_ID.asFloat,
                              wwQuery1DIVISION_ID.asFloat ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  wwQuery1Qty_On_Po.asFloat := A[ 0 ];
  wwQuery1Qty_On_Req.asFloat:= A[ 1 ];
end;

procedure TFrmMatExceptionWO.JumpToMaterialExceptions1Click(Sender: TObject);
begin
  Mat_Xcpt.DoIQJumpToMatException( wwQuery1ARINVT_ID.asFloat);
end;

procedure TFrmMatExceptionWO.wwQuery1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:= not SecurityManager.IsInvisibleAnotherEPlant( wwQuery1EPLANT_ID.asFloat );
end;

end.
