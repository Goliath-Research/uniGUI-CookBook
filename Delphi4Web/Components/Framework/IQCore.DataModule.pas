unit IQCore.DataModule;

interface

uses
  DB,
  Spring.Collections,
  IQCore.Interfaces,
  IQCore.Obj;

type

  TIQDataModules = class(TIQObjs<IIQDataModule>, IIQDataModules)
  end;

  TIQDataModule = class(TIQNamedObj, IIQDataModule)
  private
    FModule               : IIQModule;
    FMainMenu             : string;
    FDataSets             : IList<IIQDataSet>;
    FMainDataSet          : IIQDataSet;
    FControllerLinkTrios  : IList<IIQControllerLinkTrio>;

    function  GetModule       : IIQModule;
    procedure SetModule       (val : IIQModule);
    function  GetMainMenu     : string;
    procedure SetMainMenu     (val : string);
    function  GetDataSets     : IList<IIQDataSet>;
    function  GetMainDataSet  : IIQDataSet;
    procedure SetMainDataSet  (val : IIQDataSet);

    function  GetControllerLinkTrios : IList<IIQControllerLinkTrio>;

    function  GetNewDataSet   : IIQDataSet;
    function  GetDataSetByID  (aID   : integer) : IIQDataSet;
    function  GetDataSetByName(aName : string ) : IIQDataSet;

    procedure Load           (aDataSet : TDataSet = nil); override;
    procedure Save           (aDataSet : TDataSet = nil; aProc : TAssignFieldValuesProc = nil); override;
  public
//    procedure AddField;
//    procedure DelField;
  end;


implementation

uses
  SysUtils,
  Variants,
  IQCore.DataSet,
  IQCore.Field,
  MainModule;

{ TIQDataModule }

function TIQDataModule.GetMainDataSet: IIQDataSet;
begin
  Result := FMainDataSet;
end;

function TIQDataModule.GetMainMenu: string;
begin
  Result := FMainMenu;
end;

function TIQDataModule.GetModule: IIQModule;
begin
  Result := FModule;
end;

procedure TIQDataModule.SetMainDataSet(val: IIQDataSet);
begin
  FMainDataSet := val;
end;

procedure TIQDataModule.SetMainMenu(val: string);
begin
  FMainMenu := val;
end;

procedure TIQDataModule.SetModule(val: IIQModule);
begin
  FModule := val;
end;

function TIQDataModule.GetNewDataSet: IIQDataSet;
begin
  Result := TIQDataSet.Create;
end;

function TIQDataModule.GetDataSets: IList<IIQDataSet>;
begin
  Result := TIQDataSet.GetDataSets(GetID);
end;

function TIQDataModule.GetDataSetByID(aID: integer): IIQDataSet;
begin
  Result := nil;
  if aID <= 0 then
    Exit;

  GetDataSets.TryGetFirst(Result,
    function(const ds : IIQDataSet) : boolean
    begin
      Result := ds.ID = aID;
    end
  );
end;

function TIQDataModule.GetDataSetByName(aName: string): IIQDataSet;
begin
  Result := nil;
  if aName = '' then
    Exit;

  GetDataSets.TryGetFirst(Result,
    function(const ds : IIQDataSet) : boolean
    begin
      Result := AnsiUpperCase(ds.Name) = AnsiUpperCase(aName);
    end
  );
end;

function TIQDataModule.GetControllerLinkTrios: IList<IIQControllerLinkTrio>;
begin
  //
end;

procedure TIQDataModule.Load(aDataSet: TDataSet);
begin

end;

procedure TIQDataModule.Save(aDataSet: TDataSet = nil; aProc : TAssignFieldValuesProc = nil);
begin

end;

end.
