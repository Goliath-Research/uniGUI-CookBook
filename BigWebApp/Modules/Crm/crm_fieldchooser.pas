unit crm_fieldchooser;

{ Displays a list of fields in a dataset and allows the user to choose
  which fields to display.  The first wrapper, DoFieldChooser, simply
  returns a list of chosen field names.  Use it this way:

  if DoFieldChooser( Self, SrcData.DataSet, AList ) then
  try
  ASelected := TStringList.Create;
  SrcData.DataSet.DisableControls;
  AList.Sort;
  for i := 0 to SrcData.DataSet.Fields.Count - 1 do
  begin
  if AList.Find( SrcData.DataSet.Fields[i].FieldName, x ) then
  ASelected.Add( Format( '%s'#9'%d'#9'%s',
  [SrcData.DataSet.Fields[i].FieldName,
  SrcData.DataSet.Fields[i].DisplayWidth,
  SrcData.DataSet.Fields[i].DisplayName] ));
  end;
  with Grid.wwDBGrid do
  begin
  Selected.Clear;
  for i := 0 to ASelected.Count - 1 do
  Selected.Add( ASelected.Strings[i] );
  ApplySelected;
  end;

  finally
  SrcData.DataSet.EnableControls;
  end; }

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.CheckLst,
  Vcl.Menus,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu, Vcl.StdCtrls, IQUniGrid;

type
  TListCargo = class
    FieldName: String;
    DisplayName: String;
    Size: Integer;
    constructor Create(AFieldName: String; ADisplayName: String;
      ASize: Integer);
  end;

type
  TFrmCRMFieldChooser = class(TUniForm)
    PnlList: TUniPanel;
    PnlControls: TUniPanel;
    lstFields: TCheckListBox;
    PMain: TUniPopupMenu;
    SelectAll1: TUniMenuItem;
    Panel1: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    procedure SelectAll1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FDataSet: TDataSet;
    FwwGrid: TIQUniGridControl;
    FSelected: TStringList;
    function GetSelectedList: TStringList;
    procedure wwApplySelected;
    procedure SetDataSet(const Value: TDataSet);
    procedure SetGrid(const Value: TIQUniGridControl);
    procedure SetSelected(const Value: TStringList);
    property Selected: TStringList read FSelected write SetSelected;
  public
    //constructor Create(AOwner: TComponent; ADataSet: TDataSet; AGrid: TIQUniGridControl);
    { Public declarations }

    property DataSet : TDataSet write SetDataSet;
    property Grid : TIQUniGridControl write SetGrid;

  end;

  // Returns simple list of field names
function DoFieldChooser(ADataSet: TDataSet;var ASelected: TStringList): Boolean;
// Apply user selection immediately to an InfoPower dataset and grid
function wwDoFieldChooser(ADataSet: TDataSet;AGrid: TIQUniGridControl): Boolean;

implementation

{$R *.DFM}


uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm;

function DoFieldChooser(ADataSet: TDataSet;var ASelected: TStringList): Boolean;
var
  LFrmCRMFieldChooser : TFrmCRMFieldChooser;
begin
  LFrmCRMFieldChooser := TFrmCRMFieldChooser.Create(uniGUIApplication.UniApplication);
  LFrmCRMFieldChooser.DataSet :=  ADataSet;
  LFrmCRMFieldChooser.Selected:=ASelected;
      if LFrmCRMFieldChooser.ShowModal = mrOk then
        begin
          ASelected := LFrmCRMFieldChooser.Selected;
          Result := TRUE;
        end
      else
        Result := FALSE;
end;

function wwDoFieldChooser(ADataSet: TDataSet;AGrid: TIQUniGridControl): Boolean;
var
  LFrmCRMFieldChooser : TFrmCRMFieldChooser;
begin
 LFrmCRMFieldChooser := TFrmCRMFieldChooser.Create(uniGUIApplication.UniApplication);

          LFrmCRMFieldChooser.DataSet:= ADataSet;
          LFrmCRMFieldChooser.Grid:=     AGrid;

      if LFrmCRMFieldChooser.ShowModal = mrOk then
        begin
          LFrmCRMFieldChooser.wwApplySelected;
          Result := TRUE;
        end
      else
        Result := FALSE;
end;

{$REGION 'TListCargo' }


constructor TListCargo.Create(AFieldName, ADisplayName: String;
  ASize: Integer);
begin
  FieldName := AFieldName;
  DisplayName := ADisplayName;
  Size := ASize;
end;

{$ENDREGION 'TListCargo' }

{$REGION 'TFrmCRMFieldChooser' }

{
constructor TFrmCRMFieldChooser.Create(AOwner: TComponent;
  ADataSet: TDataSet; AGrid: TIQUniGridControl);
var
  i, i2: Integer;
begin
  FDataSet := ADataSet;
  FwwGrid := AGrid;

  inherited Create(AOwner);
  CenterForm(Self); // iqctrl; must be called before IQRegFormRead()
  for i := 0 to ADataSet.Fields.Count - 1 do
    begin
      if (ADataSet.Fields[i].Tag = 0) then
        begin
          i2 := lstFields.Items.AddObject(ADataSet.Fields[i].DisplayName,
            TListCargo.Create(ADataSet.Fields[i].FieldName,
            ADataSet.Fields[i].DisplayName,
            ADataSet.Fields[i].Size));
          lstFields.Checked[i2] := ADataSet.Fields[i].Visible;
        end;
    end;
end;
}
procedure TFrmCRMFieldChooser.FormShow(Sender: TObject);
var
  i,i2 : integer;
begin
   for i := 0 to FDataSet.Fields.Count - 1 do
    begin
      if (FDataSet.Fields[i].Tag = 0) then
        begin
          i2 := lstFields.Items.AddObject(FDataSet.Fields[i].DisplayName,
            TListCargo.Create(FDataSet.Fields[i].FieldName,
            FDataSet.Fields[i].DisplayName,
            FDataSet.Fields[i].Size));
          lstFields.Checked[i2] := FDataSet.Fields[i].Visible;
        end;
    end;
  IQRegFormRead(Self, [Self]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmCRMFieldChooser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]); // IQMS.Common.RegFrm.pas
end;

function TFrmCRMFieldChooser.GetSelectedList: TStringList;
var
  i: Integer;
  AList: TStringList;
begin
  AList := TStringList.Create;
  for i := 0 to lstFields.Items.Count - 1 do
    if lstFields.Checked[i] then
      AList.Add(TListCargo(lstFields.Items.Objects[i]).FieldName);
  AList.Sort;
  Result := AList;
end;

procedure TFrmCRMFieldChooser.wwApplySelected;
var
  AList, ASelected: TStringList;
  i, x: Integer;
begin
  try
    FDataSet.DisableControls;
    ASelected := TStringList.Create;
    AList := TStringList.Create;
    AList.Assign(Selected);
    AList.Sort;
    for i := 0 to FDataSet.Fields.Count - 1 do
      begin
        if AList.Find(FDataSet.Fields[i].FieldName, x) then
          ASelected.Add(Format('%s'#9'%d'#9'%s',
            [FDataSet.Fields[i].FieldName,
            10, // FDataSet.Fields[i].DisplayWidth,
            FDataSet.Fields[i].DisplayName]));
      end;
    with FwwGrid do
      begin
        Selected.Clear;
        for i := 0 to ASelected.Count - 1 do
          Selected.Add(ASelected.Strings[i]);
        //ApplySelected;
      end;

  finally
    FDataSet.EnableControls;
  end;
end;

procedure TFrmCRMFieldChooser.SelectAll1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to lstFields.Items.Count - 1 do
    lstFields.Checked[i] := TRUE;
end;

procedure TFrmCRMFieldChooser.SetDataSet(const Value: TDataSet);
begin
    FDataSet:=Value;
end;

procedure TFrmCRMFieldChooser.SetGrid(const Value: TIQUniGridControl);
begin
     FwwGrid:=Value;
end;

procedure TFrmCRMFieldChooser.SetSelected(const Value: TStringList);
begin
  FSelected := Value;
end;

{$ENDREGION 'TFrmCRMFieldChooser' }

end.
