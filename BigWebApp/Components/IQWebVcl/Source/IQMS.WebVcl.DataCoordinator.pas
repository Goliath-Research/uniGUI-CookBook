unit IQMS.WebVcl.DataCoordinator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB, Generics.Collections;

type
  TIQWebDataCoordinator = class(TComponent)
  private
    FList: TList<TDataSet>;
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateAndRegister( AOwner: TComponent; const AObjects : array of TDataSet );
    destructor Destroy; override;
    procedure RegisterDataSets( const AObjects : array of TDataSet );
    procedure CheckOpenDataSets;
  end;
                              
implementation

{ TIQWebDataCoordinator }

constructor TIQWebDataCoordinator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FList:= TList<TDataSet>.Create;
end;

constructor TIQWebDataCoordinator.CreateAndRegister(AOwner: TComponent; const AObjects: array of TDataSet);
begin
  Create( AOwner );
  RegisterDataSets( AObjects );
end;

destructor TIQWebDataCoordinator.Destroy;
begin
  FList.Free;
  inherited;
end;

procedure TIQWebDataCoordinator.CheckOpenDataSets;
var
  ADataSet: TDataSet;
begin
  for ADataSet in FList do
  begin
    if not ADataSet.Active then
       ADataSet.Open;
  end;
end;

procedure TIQWebDataCoordinator.RegisterDataSets( const AObjects: array of TDataSet);
var
  I: Integer;
begin
  for I:= 0 to High( AObjects ) do
  begin
    AObjects[ I ].Tag:= 1;       // prevent from openning during form creation
    FList.Add( AObjects[ I ]);
  end;
end;

end.
