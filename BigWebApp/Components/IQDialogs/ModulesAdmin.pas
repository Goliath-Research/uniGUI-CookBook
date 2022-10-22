unit ModulesAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniDBNavigator,
  uniToolBar, uniGUIBaseClasses, uniPanel, uniSplitter,
  ModulesAdmin.DM, uniImageList, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox;

type
  TModulesAdminForm = class(TUniForm)
    pnlModules: TUniPanel;
    tbModules: TUniToolBar;
    dbnavModules: TUniDBNavigator;
    grdModules: TUniDBGrid;
    UniSplitter1: TUniSplitter;
    pnlForms: TUniPanel;
    tbForms: TUniToolBar;
    dbnavForms: TUniDBNavigator;
    grdForms: TUniDBGrid;
    tbExecTests: TUniToolButton;
    ilTests: TUniNativeImageList;
    UniHiddenPanel1: TUniHiddenPanel;
    dblookupParent: TUniDBLookupComboBox;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure tbExecTestsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ModulesAdm: TModulesAdminForm;

implementation

uses
  StrUtils,
  uniGUIApplication,
  uniGUIDialogs,
  MainModule,
  Spring.Collections,
  IQCore.Interfaces,
  IQCore.Module;

{$R *.dfm}

function ModulesAdm: TModulesAdminForm;
begin
  Result := TModulesAdminForm(UniMainModule.GetFormInstance(TModulesAdminForm));
end;

procedure TModulesAdminForm.UniFormCreate(Sender: TObject);
begin
  dmDataSetAdmin := TdmModulesAdmin.Create(nil);
end;

procedure TModulesAdminForm.UniFormDestroy(Sender: TObject);
begin
  FreeAndNil(dmDataSetAdmin);
end;

procedure TModulesAdminForm.tbExecTestsClick(Sender: TObject);
var
  modules : IList<IIQModule>;
  module  : IIQModule;
  log : TStringList;
  sl : TStringList;
  forms : IList<IIQForm>;
begin
  log := TStringList.Create;
  try
    log.Add('1 - Get All Modules using UserIQModel.Modules');
    modules := MainModule.UniMainModule.UserIQModel.Modules.GetObjs;
    Assert(modules <> nil, 'Failed to get IIQModules.GetObjs IList!');

    log.Add('2 - Show Modules.Count');
    log.Add(Format('Module Qty: %d', [modules.Count]));

    log.Add('3 - Show all module names traveling Modules IList');
    sl := TStringList.Create;
    try
      modules.ForEach
      (
        procedure(const m : IIQModule)
        begin
          sl.Add(m.Name);
        end
      );

      log.Add(sl.Text);
    finally
      sl.Free;
    end;

    log.Add('4 - Select one module by name (Manufacturing)');
    log.Add
    (
      IfThen
      (
        modules.TryGetFirst
        (
          module,
          function(const m : IIQModule) : boolean
          begin
            Result := m.Name = 'Manufacturing';
          end
        ),
        'Sucess!',
        'Failure'
      )
    );
    log.Add('5 - Get and show all the forms in the selected module');
    forms := module.Forms;
    sl := TStringList.Create;
    try
      forms.ForEach
      (
        procedure(const f : IIQForm)
        begin
          sl.Add(f.Name);
        end
      );

      log.Add(sl.Text);
    finally
      sl.Free;
    end;
  finally
    ShowMessage(log.Text);
    log.Free;
  end;
end;

end.
