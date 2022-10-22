unit IQMS.WebVcl.HPickFilterPickList;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  DB,
  DBClient,
  Grids,
//  Wwdbigrd,
//  Wwdbgrid,
  DBCtrls,
  ExtCtrls,
  StdCtrls,
//  wwDialog,
//  Wwfltdlg,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  { TFrmHPickFilterPickList }
  TFrmHPickFilterPickList = class(TUniForm)
    pnlMain: TUniPanel;
    Panel2: TUniPanel;
    NavMain: TUniDBNavigator;
    cdsFilters: TClientDataSet;
    srcFilters: TDataSource;
    cdsFiltersFILTER_NAME: TStringField;
    pnlBottom: TUniPanel;
    Panel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    pnlGrid: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    procedure DispatchAction(Sender: TObject; Button: TNavigateBtn);
    procedure btnOKClick(Sender: TObject);
    procedure wwDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FParentKeyName: string;
//    FFilterDialog: TwwFilterDialog;
    FPickListOwner: TComponent;
    procedure PopulateFilterNamesList;
    procedure DeleteFilterByName(AName: string);
    function GetSelectedFilterName: string;
    procedure AddCurrentAdvancedFilter;
  public
    { Public declarations }
    constructor Create( APickListOwner: TComponent;
      AFilterDialog: pointer; AParentKeyName: string );
    property SelectedFilterName: string read GetSelectedFilterName;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Dialogs,
  IQMS.Common.InputQuery,
  IQMS.WebVcl.ResourceStrings;

{ TFrmHPickFilterPickList }

constructor TFrmHPickFilterPickList.Create( APickListOwner: TComponent;
  AFilterDialog: pointer; AParentKeyName: string );
begin
  FParentKeyName:= AParentKeyName;
//  FFilterDialog := AFilterDialog;
  FPickListOwner:= APickListOwner;
  
  inherited Create(uniGUIApplication.UniApplication);   // AOwner is the picklist

  PopulateFilterNamesList();
end;

function TFrmHPickFilterPickList.GetSelectedFilterName: string;
begin
  if cdsFilters.Eof and cdsFilters.Bof then
     Result:= ''
  else   
     Result:= cdsFiltersFILTER_NAME.asString;
end;

procedure TFrmHPickFilterPickList.PopulateFilterNamesList;
var
  AList: TStringList;
  I: Integer;
begin
  AList:= TStringList.Create;
  try
    // with TIQRegForm.Create( self.Owner.Owner ) do
    with TIQRegForm.Create( FPickListOwner ) do
    try
      GetKeyNamesOf( self.FParentKeyName, AList );
    finally
      Free;
    end;

    cdsFilters.Close;
    cdsFilters.CreateDataSet;
    cdsFilters.Open;
  
    for I:= 0 to AList.Count - 1 do
    begin
      cdsFilters.Append;
      cdsFiltersFILTER_NAME.asString:= AList[ I ];
      cdsFilters.Post;
    end;
    cdsFilters.First;
  
  finally
    AList.Free;
  end;
end;

procedure TFrmHPickFilterPickList.wwDBGrid1DblClick(Sender: TObject);
begin
  btnOKClick(Sender);
end;

procedure TFrmHPickFilterPickList.DispatchAction(Sender: TObject; Button: TNavigateBtn);
begin
  case Button of
    nbInsert: 
      begin
        AddCurrentAdvancedFilter;
        ABORT;
      end;
    nbDelete:
      // IQMS.WebVcl.ResourceStrings.cTXT0000485 = 'Delete record?';
      if IQConfirmYN(IQMS.WebVcl.ResourceStrings.cTXT0000485) then
         DeleteFilterByName( cdsFiltersFILTER_NAME.asString );
  end;
end;

procedure TFrmHPickFilterPickList.DeleteFilterByName( AName: string );
var
  AKey: string;
begin
  with TIQRegForm.Create( FPickListOwner ) do
  try
    // \Software\IQMS\IQWin32\Iqwin32.exe\TBOM_DM\PkMfg\AdvancedFilter\Filter Name 1
    AKey:= Format( '%s\%s\%s', [ FormPath, FParentKeyName, AName ]);
    // IQMS.WebVcl.ResourceStrings.cTXT0000540 =
    // 'Unable to remove filter record.  Operation aborted.';
    IQAssert( DeleteKey( AKey ), IQMS.WebVcl.ResourceStrings.cTXT0000540);
  finally
    Free;
  end;
end;

procedure TFrmHPickFilterPickList.AddCurrentAdvancedFilter;
var
  AKey: string;
  AFilterName: string;
begin
  // IQMS.WebVcl.ResourceStrings.cTXT0000541 = 'Please assign an Advanced Filter.';
//  IQAssert( FFilterDialog.FieldInfo.Count > 0, IQMS.WebVcl.ResourceStrings.cTXT0000541);

  // IQMS.WebVcl.ResourceStrings.cTXT0000542 = 'Add Filter';
  // IQMS.WebVcl.ResourceStrings.cTXT0000543 = 'Enter the filter name';
  if not (IQInputQuery(IQMS.WebVcl.ResourceStrings.cTXT0000542, IQMS.WebVcl.ResourceStrings.cTXT0000543,
    AFilterName) and (Trim(AFilterName) <> '')) then
    SysUtils.Abort;
  // IQMS.WebVcl.ResourceStrings.cTXT0000544 = 'Filter name, %s, already exists.  Please enter a unique name.';
  IQAssert(not cdsFilters.Locate('FILTER_NAME', AFilterName,
    [loCaseInsensitive]),
    Format(IQMS.WebVcl.ResourceStrings.cTXT0000544, [ AFilterName ]));

  with TIQRegForm.Create( FPickListOwner ) do 
  try
    // \Software\IQMS\IQWin32\Iqwin32.exe\TBOM_DM\PkMfg\AdvancedFilter\Filter Name 1
    AKey:= Format( '%s\%s\%s', [ FormPath, FParentKeyName, AFilterName ]);
//    WriteWWFilterDialog( AKey, FFilterDialog );
  finally
    Free;
  end;

  cdsFilters.Append;
  cdsFiltersFILTER_NAME.asString:= AFilterName;
  cdsFilters.Post;
end;


procedure TFrmHPickFilterPickList.btnOKClick(Sender: TObject);
var
  AKey: string;
begin
  if GetSelectedFilterName = '' then
  begin
    ModalResult:= mrCancel;
    EXIT;
  end;

  // update current wwFilterDialog and exit
  with TIQRegForm.Create( FPickListOwner ) do 
  try
    // Ex Key: FrmRealTime\AdvancedFilterList\Some Filter Name
    AKey:= Format( '%s\%s\%s', [ FormPath, FParentKeyName, GetSelectedFilterName ]);
//    ReadWWFilterDialog( AKey, FFilterDialog );
  finally
    Free;
  end;
  ModalResult:= mrOK;
end;

end.

