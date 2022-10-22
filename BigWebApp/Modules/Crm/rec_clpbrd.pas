unit rec_clpbrd;

{ Allows copying a list of ID values from a TwwGrid.
  You can assign Copy and Paste Vcl.Menus.  In the Paste routine,
  lookup the required values from the ID stored in the list,
  and insert it into the dataset.

}
interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.UI.Intf,
  MainModule,
  IQUniGrid;

type
  TCopyMode = (cmAppend, cmReplace);

type
  TItemClipbrdCargo = class
    Value: Real;
    constructor Create(AValue: Real);
  end;

type
  TRecClpbrd = class(TComponent)
  private
    FList: TList;
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddValue(Value: Real);
    procedure Clear;
    function Value(AIndex: Integer): Real;
    function Count: Integer;
    procedure CopyValuesFromGrid(AGrid: TIQUniGridControl; AFieldName: String;
      ACopyMode: TCopyMode);

  published
    property List: TList read FList;
  end;

implementation

uses
  IQMS.Common.Dialogs;

{ TItemClipbrdCargo }

constructor TItemClipbrdCargo.Create(AValue: Real);
begin
  Value := AValue;
end;

{ TRecClpbrd }

constructor TRecClpbrd.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FList := TList.Create;
end;

destructor TRecClpbrd.Destroy;
begin
  if Assigned(FList) then
    FList.Free;
  inherited Destroy;
end;

procedure TRecClpbrd.AddValue(Value: Real);
begin
  FList.Add(TItemClipbrdCargo.Create(Value));
end;

procedure TRecClpbrd.Clear;
begin
  FList.Clear;
end;

function TRecClpbrd.Value(AIndex: Integer): Real;
begin
  if (AIndex < 0) or (AIndex > FList.Count - 1) then
    Result := 0
  else
    Result := TItemClipbrdCargo(FList[AIndex]).Value;
end;

procedure TRecClpbrd.CopyValuesFromGrid(AGrid: TIQUniGridControl;
  AFieldName: String; ACopyMode: TCopyMode);
var
  i: Integer;
  AValue: Real;
begin
  if ACopyMode = cmReplace then
    Self.Clear;

  try
    AGrid.DataSource.DataSet.DisableControls;
    if AGrid.DBGrid.SelectedRows.Count > 1 then
      begin
        with AGrid, AGrid.DataSource.DataSet do
          try
            // Cycle selected rows and update the dataset according to the corresponding ID
            for i := 0 to DBGrid.SelectedRows.Count - 1 do
              begin
                GotoBookmark(DBGrid.SelectedRows.Items[i]);
                Freebookmark(DBGrid.SelectedRows.Items[i]);
                // Add it
                AValue := AGrid.DataSource.DataSet.FieldByName
                  (AFieldName).AsFloat;
                AddValue(AValue);
              end;
          finally
            //SelectedList.Clear;
          end;
      end
    else
      begin
        // Add it
        AValue := AGrid.DataSource.DataSet.FieldByName(AFieldName).AsFloat;
        AddValue(AValue);
      end;

    Application.ProcessMessages; // let the screen update

  finally
    AGrid.DataSource.DataSet.EnableControls;
  end;
end;

function TRecClpbrd.Count: Integer;
begin
  Result := FList.Count;
end;

end.
