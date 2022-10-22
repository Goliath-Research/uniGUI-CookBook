unit BomOpmat_Uom;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  BOM_UOM,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  IQMS.WebVcl.SecurityRegister;

type
  TFrmBomOpmat_UomSelect = class(TFrmBom_UomSelect)
  private
    { Private declarations }
  protected
    procedure LoadListBox; override;
    procedure ApplyConvertTo( ID:Real; AFromUOM, AToUOM: string ); override;
  public
    { Public declarations }
  end;

function GetBomOpmat_UOM( AOwner:TComponent ):Boolean;

var
  FrmBomOpmat_UomSelect: TFrmBomOpmat_UomSelect;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.UOM,
  { TODO -omugdha -cWEBIQ : Dependancy on UOM Lst unit
  UOM_Lst,  }
  DB;


function GetBomOpmat_UOM( AOwner:TComponent ):Boolean;
begin
  with TFrmBomOpmat_UomSelect.Create( AOwner ) do
  try
    Result:= ShowModal = mrOK;
  finally
    Free;
  end;
end;


{ TFrmBomOpmat_UomSelect }

procedure TFrmBomOpmat_UomSelect.ApplyConvertTo(ID: Real; AFromUOM, AToUOM: string);
var
  AFactor: Real;
  ADB: TFDConnection;
  AWasInTrans: Boolean;
begin
  // with TFDTable(FDataSet) do
  //ADB:= MainModule.FDConnection;
  AWasInTrans:= ADB.InTransaction;

  with FDataSet do
  try
    if not AWasInTrans then
       ADB.StartTransaction;

    Edit; {Opmat}
    (*
    FieldByName('ptsper_disp').asFloat:= IQConvertUom( FieldByName('ptsper_disp').asFloat, // AQty
                                                       AFromUOM,                           // AFromUOM
                                                       AToUOM,                             // AToUOM
                                                       FieldByName('arinvt_id').asFloat,   // AArinvt_ID
                                                       FALSE );                            // AIgnoreError
    *)
    AFactor:= IQConvertUom( 1,                                  // AQty
                            AFromUOM,                           // AFromUOM
                            AToUOM,                             // AToUOM
                            FieldByName('arinvt_id').asFloat,   // AArinvt_ID
                            FALSE );                            // AIgnoreError

    if SelectValueByID( 'op_class', 'sndop', FieldByName('sndop_id').asFloat ) = 'PK' then
       FieldByName('ptsper_disp').asFloat:= FieldByName('ptsper_disp').asFloat * (1 / AFactor)
    else
       FieldByName('ptsper_disp').asFloat:= FieldByName('ptsper_disp').asFloat * AFactor;

    FieldByName( FDataField ).asString:= ListBox1.Items[ ListBox1.ItemIndex ];

    Post;

    if not AWasInTrans then
       ADB.Commit;
    // DataBase.Commit;
  finally
    // if DataBase.InTransaction then
    if ADB.InTransaction and not AWasInTrans then
       ADB.RollBack;
  end;
end;

procedure TFrmBomOpmat_UomSelect.LoadListBox;
begin
  // inherited;
  { TODO -omugdha -cWEBIQ : Dependancy on UOM_Lst
  PopulateUOMs( ListBox1.Items ); } {UOM_Lst}
end;

end.
