unit Mat_Thermo2_Edit;

interface

uses
  Winapi.Windows,
  Add_edit,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, uniButton,
  uniBitBtn, uniDBCheckBox, uniCheckBox, uniDBComboBox, uniMultiItem,
  uniComboBox, uniDBLookupComboBox, uniSplitter, System.Classes, Vcl.Controls,
  Vcl.Forms, uniPanel;

type
  TMatThermo2Edit = class(TAddEdit)
    lblSheet_Length: TUniLabel;
    lblSheet_Width: TUniLabel;
    dbeWidth: TUniDBEdit;
    dbeLength: TUniDBEdit;
  private
    { Private declarations }
  protected
    procedure PopulateUOMs; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TMatThermo2Edit }

procedure TMatThermo2Edit.PopulateUOMs;
begin
  // inherited;
  dbcUNIT.Clear;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    // SQL.Add('select distinct uom from arinvt_uom order by uom');
    SQL.Add('SELECT uom FROM arinvt_uom ORDER BY seq, uom');
    Open;
    while not Eof do
    begin
      if (Fields[ 0 ].asString = 'EACH') or (Fields[ 0 ].asString = 'EA') then
         dbcUNIT.Items.Add( Fields[ 0 ].asString );
      Next;
    end;
  finally
    Free;
  end;
end;

end.
