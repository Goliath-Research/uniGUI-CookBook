unit Qk_Plast_ExA;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Qk_Plast_Ex,
  Vcl.Wwdatsrc,
  Data.DB,
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
  FireDAC.Comp.Client,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniCheckBox,
  uniLabel, uniDBLookupComboBox, IQUniGrid, Vcl.Forms, uniGUIFrame,
  uniMultiItem, uniComboBox, uniDBComboBox, uniSplitter, uniDBCheckBox,
  uniPageControl, uniButton, uniPanel;

type
  TQuickAddPlasticExA = class(TQuickAddPlasticEx)
    Table1LENGTH: TFMTBCDField;
    Table1WIDTH: TFMTBCDField;
    lblLength: TUniLabel;
    lblWidth: TUniLabel;
    dbeLength: TUniDBEdit;
    dbeWidth: TUniDBEdit;
    chkConvFactor: TUniCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure CheckBlendAndClass; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  inv_rscstr;
  { TODO -oathite -cWebConvert : Depends on uom_lst
  uom_lst; }

procedure TQuickAddPlasticExA.FormCreate(Sender: TObject);
begin
  inherited;

  {override the UOM selection}
  (* TODO -oathite -cWebConvert : Depends on uom_lst
  PopulateUOMs( dbcUnit.Items, 'EACH;EA' );  {uom_lst.pas}   *)
end;

procedure TQuickAddPlasticExA.FormShow(Sender: TObject);
begin
  inherited;
  try
    dbcCLASS.SetFocus;
  except
    {supress any surprises}
  end;
end;

procedure TQuickAddPlasticExA.CheckBlendAndClass;
begin
  // inherited;
  with Table1 do
  begin
    if chkBlend.Checked then
      if FieldByName('CLASS').asString <> 'PL' then
         raise Exception.Create(inv_rscstr.cTXT0000116                          {'Blend item class must be PL'});
    if (Pos( FieldByName('UNIT').asString , '__EACH_EA__' ) = 0) then
         raise Exception.Create(inv_rscstr.cTXT0000136                          {'Sheet UOM must be in EACH'});
  end;
end;


procedure TQuickAddPlasticExA.btnOKClick(Sender: TObject);
var
  AConvFactor: Real;
  AUOM: string;
begin
  inherited;

  if chkConvFactor.Checked then
  begin
    AConvFactor:= Table1.FieldByName('length').asFloat * Table1.FieldByName('width').asFloat * Table1.FieldByName('gauge').asFloat * Table1.FieldByName('spg').asFloat * 0.0361;

    AUOM:= '';
    if Assigned( FQuickAddBaseCargo ) then
       AUOM:= FQuickAddBaseCargo.CParam1;
    if AUOM = '' then
       AUOM:= 'LBS';

    ExecuteCommandFmt('insert into arinvt_uom_conv '+
              '      ( arinvt_id, uom, conv_value, default_po, operator_kind ) ' +
              'values ' +
              '      ( %f, ''%s'', %.6f, ''Y'', ''D'')',
              [ Table1.FieldByName('ID').asFloat,
                AUOM,
                AConvFactor ]);
  end;
end;

end.
