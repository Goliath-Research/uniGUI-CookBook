unit formula_editor_inv_class_dim;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  IQMS.Common.formula_editor_base,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  MainModule,
  System.ImageList,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Vcl.Buttons, uniGUIBaseClasses, uniGUIClasses, uniImageList, uniMainMenu,
  uniLabel, uniBitBtn, uniTreeView, uniMemo, uniHTMLMemo, uniButton,
  uniSpeedButton, uniPanel, Vcl.Forms, uniSplitter;

type
  TFrmFormulaEditorInvClassDim = class(TFrmFormulaEditorBase)
  private
    { Private declarations }
    FArinvtClassID: Int64;
  protected
    { Protected declarations }
    procedure LoadParameters; override;
  public
    { Public declarations }
    property ArinvtClassID: Int64 read FArinvtClassID write FArinvtClassID;
  end;

function DoEditFormula(const AArinvtClassID: Int64;
  const ASubCaption: String; var AFormula: String): Boolean;

implementation

{$R *.dfm}


function DoEditFormula(const AArinvtClassID: Int64;
  const ASubCaption: String; var AFormula: String): Boolean;
var
  LFrmFormulaEditorInvClassDim : TFrmFormulaEditorInvClassDim;
begin

  LFrmFormulaEditorInvClassDim := TFrmFormulaEditorInvClassDim.Create(AFormula);
  // Assign ARINVT_ID value, which is used below in LoadParameters.
  LFrmFormulaEditorInvClassDim.ArinvtClassID := AArinvtClassID;
  LFrmFormulaEditorInvClassDim.Caption := LFrmFormulaEditorInvClassDim.Caption + ' - ' + ASubCaption;
  Result := LFrmFormulaEditorInvClassDim.ShowModal = mrOk;
  if Result then
     AFormula := Trim(LFrmFormulaEditorInvClassDim.memSQL.Text);
end;

{ TFrmFormulaEditorInvClassDim }

procedure TFrmFormulaEditorInvClassDim.LoadParameters;
var
  ADescription: string;
  AValue: Int64;
begin
  inherited;
  with TFDQuery.Create(NIL) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add(       '  SELECT id,                                       ');
      SQL.Add(       '         name,                                     ');
      SQL.Add(       '         uom                                       ');
      SQL.Add(       '    FROM arinvt_class_dim                          ');
      SQL.Add(Format('   WHERE arinvt_class_id = %d AND                  ',
        [ArinvtClassID]));
      SQL.Add(       '         NVL(calculated, ''N'') <> ''Y''           ');
      SQL.Add(       'ORDER BY name                                      ');
      Open;

      // If no records are found, add a "No parameters found" node
      if BOF and EOF then
        AddNoParametersFoundNode;

      // Loop the records, add nodes.
      while not EOF do
        begin
          // ID value for the parameter
          AValue := FieldByName('id').AsLargeInt;
          // Description
          ADescription := FieldByName('name').AsString;
          AddParameterNode(
            ADescription,
            AValue);
          Next;
        end;
    finally
      Free;
    end;
end;

end.
