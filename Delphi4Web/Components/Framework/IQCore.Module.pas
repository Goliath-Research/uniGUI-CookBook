unit IQCore.Module;

interface

uses
  Classes,
  DB,
  Spring.Collections,
  IQCore.Interfaces,
  IQCore.Obj;

type

  TIQModules = class(TIQObjs<IIQModule>, IIQModules)
  end;

  TIQModule = class(TIQNamedObj, IIQModule)
  private
    function  GetForms        : IList<IIQForm>;
  public
    procedure Load(aDataSet : TDataSet = nil); override;
    procedure Save(aDataSet : TDataSet = nil; aProc : TAssignFieldValuesProc = nil); override;
  end;

implementation

uses
  SysUtils,
  Math,
  MainModule,
  System.Generics.Defaults,
  IQCore.Form;

{ TIQModule }

procedure TIQModule.Load(aDataSet: TDataSet = nil);
begin
//  if aDataSet = nil then
//    aDataSet := UniMainModule.UserIQModel.ModuleDS;

  inherited Load(aDataSet);
end;

procedure TIQModule.Save(aDataSet: TDataSet = nil; aProc : TAssignFieldValuesProc = nil);
begin
  if aDataSet = nil then
    aDataSet := UniMainModule.UserIQModel.ModuleDS;

  inherited Save(aDataSet);
end;

function TIQModule.GetForms : IList<IIQForm>;
begin
  Result := TIQForms.Create.GetObjs;
end;

end.
