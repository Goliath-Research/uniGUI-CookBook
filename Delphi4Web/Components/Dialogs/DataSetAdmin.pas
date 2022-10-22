unit DataSetAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm,
  uniSyntaxEditor, uniPageControl, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniToolBar, uniGUIBaseClasses, uniPanel,
  DataSetAdmin.DM, uniSplitter, uniSyntaxEditorBase;

type
  TDataSetAdminForm = class(TUniForm)
    pnlDataSets: TUniPanel;
    tbDataSets: TUniToolBar;
    dbnavDataSets: TUniDBNavigator;
    grdDataSets: TUniDBGrid;
    pcDataSet: TUniPageControl;
    tsSQL: TUniTabSheet;
    tsFields: TUniTabSheet;
    tsParams: TUniTabSheet;
    seSQL: TUniSyntaxEdit;
    UniSplitter1: TUniSplitter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DataSetAdm: TDataSetAdminForm;

implementation

uses
  uniGUIApplication,
  MainModule,
  uniGUIDialogs,
  IQCore.DataSet;

{$R *.dfm}

function DataSetAdm: TDataSetAdminForm;
begin
  Result := TDataSetAdminForm(UniMainModule.GetFormInstance(TDataSetAdminForm));
end;

end.
