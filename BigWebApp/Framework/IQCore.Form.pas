unit IQCore.Form;

interface

uses
  Classes,
  DB,
  Vcl.Menus,
  Spring.Collections,
  IQCore.Interfaces,
  IQCore.Obj;

type

  TIQForms = class(TIQObjs<IIQForm>, IIQForms)
  end;

  TIQForm = class(TIQNamedObj, IIQForm)
  private
    FModule         : IIQModule;
    FSingleton      : boolean;
    FDataModule     : IIQDataModule;
    FDesigns        : IList<IIQFormDesign>;
    FDefaultDesign  : IIQFormDesign;
    FParent         : IIQForm;

    function  GetModule         : IIQModule;
    procedure SetModule         (val : IIQModule);
    function  GetSingleton      : boolean;
    procedure SetSingleton      (val : boolean);
    function  GetDataModule     : IIQDataModule;
    procedure SetDataModule     (val : IIQDataModule);
    function  GetDesigns        : IList<IIQFormDesign>;
    function  GetDefaultDesign  : IIQFormDesign;
    procedure SetDefaultDesign  (val : IIQFormDesign);
    function  GetParent         : IIQForm;
    procedure SetParent         (val : IIQForm);
  public
    procedure Load(aDataSet : TDataSet = nil); override;
    procedure Save(aDataSet : TDataSet = nil; aProc : TAssignFieldValuesProc = nil); override;
  end;

implementation

uses
  SysUtils,
  Math,
  MainModule,
  IQCore.Module,
//  IQCore.FormDesign,
  System.Generics.Defaults;

{ TIQForm }

function TIQForm.GetDataModule: IIQDataModule;
begin
  Result := FDataModule;
end;

function TIQForm.GetDefaultDesign: IIQFormDesign;
begin
  Result := FDefaultDesign;
end;

function TIQForm.GetDesigns: IList<IIQFormDesign>;
begin
//  if FDesigns = nil then
//    FDesigns := TIQFormDesigns.Create.GetObjs;
  Result := nil;
end;

function TIQForm.GetModule: IIQModule;
begin
  Result := FModule;
end;

function TIQForm.GetParent: IIQForm;
begin
  Result := FParent;
end;

function TIQForm.GetSingleton: boolean;
begin
  Result := FSingleton;
end;

procedure TIQForm.SetDataModule(val: IIQDataModule);
begin
  FDataModule := val;
end;

procedure TIQForm.SetDefaultDesign(val: IIQFormDesign);
begin
  FDefaultDesign := val;
end;

procedure TIQForm.SetModule(val: IIQModule);
begin
  FModule := val;
end;

procedure TIQForm.SetParent(val: IIQForm);
begin
  FParent := val;
end;

procedure TIQForm.SetSingleton(val: boolean);
begin
  FSingleton := val;
end;

procedure TIQForm.Load(aDataSet: TDataSet = nil);
var
  Module_ID : integer;
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.GetDataSet(Self, GetID);

  inherited Load(aDataSet);

  FModule := TIQModule.Create;
  FModule.ID := aDataSet.FieldByName('Module_ID').AsInteger;
  FModule.Load;

//  FRootNodeID := aDataSet.FieldByName('PickTreeNode_ID').AsInteger;
end;

procedure TIQForm.Save(aDataSet: TDataSet = nil; aProc : TAssignFieldValuesProc = nil);
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.ModuleDS;

  inherited Save(aDataSet);
end;

end.
