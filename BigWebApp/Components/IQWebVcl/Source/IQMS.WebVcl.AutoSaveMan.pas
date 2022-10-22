{Steps to auto post before exiting a form - in FormClose event call
   TAutoSaveManager.Create(self).Execute;  // auto_save_man.pas
}
unit IQMS.WebVcl.AutoSaveMan;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Dialogs,
  ComCtrls,
  DB,
  DBCtrls,
  Menus,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIRegClasses,
  uniGUIForm,
  uniGUIBaseClasses,
  UniGUIApplication,
  Generics.Collections;

type
  TAutoSaveAction = (asaNone, asaSave, asaIgnore);

  TAutoSaveManager = class( TComponent )
  private
    FList: TList<TDataSet>;
    procedure InternalLoadDataSets(AOwner: TComponent);
    function GetStateOf(ADataSet: TDataSet): TDataSetState;
    procedure LoadDataSets;
  public
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;
    function Execute: TAutoSaveAction;
  end;

implementation

uses
  IQMS.Common.Dialogs,
  IQMS.WebVcl.UDEmbeddedForm,
  IQMS.Common.UserFields,
  IQMS.Common.Usr_Flds;

{ TAutoSaveManager }

constructor TAutoSaveManager.Create(AOwner: TComponent);
begin
  inherited;
  FList:= TList<TDataSet>.Create;
end;

destructor TAutoSaveManager.Destroy;
begin
  FList.Free;
  inherited;
end;

procedure TAutoSaveManager.LoadDataSets;
begin
  FList.Clear;
  InternalLoadDataSets( self.Owner );
end;

procedure TAutoSaveManager.InternalLoadDataSets( AOwner: TComponent );
var
  I:Integer;
  ADataSet: TDataSet;
begin
  {components on a form or user defined component that needs to be drilled in}
  for I:= 0 to AOwner.ComponentCount - 1 do
  begin
    if AOwner.Components[ I ] is TDataSet then
        begin
          ADataSet:= AOwner.Components[ I ] as TDataSet;
          if (GetStateOf( ADataSet ) in [dsEdit, dsInsert]) and not FList.Contains( ADataSet ) then
             FList.Add( ADataSet );
        end

    else if AOwner.Components[ I ] is TIQWebUDEmbeddedForm then
       InternalLoadDataSets( AOwner.Components[ I ] )

    else if AOwner.Components[ I ] is TFrmUserFieldsBuiltIn then
       InternalLoadDataSets( AOwner.Components[ I ] )
  end;

  {component that belongs to another form that has switched it's parents}
  for I:= 0 to  unisession.FormsList.Count - 1 do
    if (unisession.FormsList[ I ] = AOwner) then
       InternalLoadDataSets( unisession.FormsList[ I ]);
       
  {datamodule}
  for I:= 0 to unisession.DataModules.Count - 1 do
    if unisession.DataModules[ I ] = AOwner then
       InternalLoadDataSets( unisession.DataModules[ I ]);
end;


function TAutoSaveManager.GetStateOf( ADataSet: TDataSet ): TDataSetState;
begin
  Result:= dsInactive;
  if Assigned( ADataSet ) then
  try
    Result:= ADataSet.State;
  except 
    Result:= dsInactive;
  end;
end;

function TAutoSaveManager.Execute: TAutoSaveAction;
var
  ADataSet: TDataSet;
begin
  Result:= asaNone;

  LoadDataSets;
    
  for ADataSet in FList do
  begin
     if Result = asaNone then
        if IQWarningYN('Save changes?') then 
           Result:= asaSave 
        else 
           Result:= asaIgnore;

     // see EIQ-11228 BOM - Access Violation if Closing Without Saving and Saying No to Save Changes 2016 Only - TC10
     //if Result = asaIgnore then
     //   BREAK;

     if Result = asaSave then
        ADataSet.Post
     else 
        try
          ADataSet.Cancel;
        except on E: Exception do
          // EIQ-11228 BOM - Access Violation if Closing Without Saving and Saying No to Save Changes 2016 Only - TC10
          if not (E is EAbort) then
             raise;
        end;
  end;   
end;


end.
