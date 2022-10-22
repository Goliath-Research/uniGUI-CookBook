unit IQMS.WebVcl.SecAddItem;

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
  ComCtrls,
  StdCtrls,
  ExtCtrls,
  System.Generics.Collections,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu, uniStringGrid,Vcl.Menus, uniBasicGrid, uniDBGrid, Data.DB,
  Datasnap.DBClient;

type

  TFrmIQWEBSecAddItem = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    ListView1: TUniDBGrid;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    PopupMenu1: TUniPopupMenu;
    Blink1: TUniMenuItem;
    IQWebAbout1: TIQWebAbout;
    cds: TClientDataSet;
    cdsItemName: TStringField;
    cdsClassName: TStringField;
    ds: TDataSource;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Blink1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SortColumn(const FieldName: string; Dir: Boolean);
    procedure ListView1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
    procedure openCds;
  private
    { Private declarations }

    FForm: TUniForm;
    FSecurityRegister: TIQWebSecurityRegister;
    procedure SaveSelectedItemsTo(var AList: TStringList);
    procedure LoadComponents;
    function GetSelectedComponentOnFormInFocus: TComponent;
  public
    { Public declarations }
    class function DoShowModal( AForm: TUniForm; ASecReg: TIQWebSecurityRegister; var AList: TStringList ): Boolean;
  end;

var

  FrmIQSecAddItem: TFrmIQWebSecAddItem;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.ResourceStrings,
  IQMS.Common.StringUtils;
//  PanelMsg,
//  IQSecIns;

{ TFrmIQSecAddItem }

class function TFrmIQWebSecAddItem.DoShowModal( AForm: TUniForm;
          ASecReg: TIQWebSecurityRegister;
          var AList: TStringList ): Boolean;
var frm :  TFrmIQWebSecAddItem;
begin

   frm :=  TFrmIQWebSecAddItem.Create(uniGUIApplication.UniApplication);
   with frm do
   begin
     frm.openCds;
     FForm:= AForm;
     FSecurityRegister:= ASecReg;
     Caption:= Format( IQMS.WebVcl.ResourceStrings.cTXT0000356 {'Add Security Items [ %s ]'}, [ FForm.Name ]);
     LoadComponents;
   end;

   Result:= frm.ShowModal = mrOK;
   if Result then
       frm.SaveSelectedItemsTo( AList );
end;

procedure TFrmIQWebSecAddItem.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmIQWebSecAddItem.btnOKClick(Sender: TObject);
begin
  IQAssert( ListView1.SelectedRows.Count > 0, IQMS.WebVcl.ResourceStrings.cTXT0000357 {'No item selected - operation aborted.});
  ModalResult:= mrOK;
end;

procedure TFrmIQWebSecAddItem.SaveSelectedItemsTo( var AList: TStringList );
var
  I: Integer;
  bookmark:TBookmark;
begin
  cds.DisableControls;
  try
    for I := 0 to ListView1.SelectedRows.Count - 1 do
    begin
       cds.Bookmark := ListView1.SelectedRows[I];
       AList.Add( cds.Fields[0].AsString);
    end;
  finally
    cds.EnableControls;
  end;
end;


procedure TFrmIQWEBSecAddItem.ListView1ColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  SortColumn(Column.FieldName, Direction);
end;

procedure TFrmIQWebSecAddItem.LoadComponents;
var
  I, J    : Integer;
  isFound : Boolean;


  procedure AddToListView( AComponent: TComponent );
  var
    className: string;
  begin
    // filter out certain types before adding to listview
    if Trim(AComponent.Name) = '' then
       EXIT;

     // check class type
     if not (StrInList( AComponent.ClassType.ClassName,
                       ['TUniButton', 'TUniMenuItem',   'TUniBitBtn', 'TUniSpeedButton', 'TUniDBNavigator',
                        'TUniDBEdit', 'TUniDBCheckBox', 'TUniDBText', 'TUniDBMemo', 'TUniDBHtmlMemo', 'TWWDBEdit',
                        'TwwDBComboDlg', 'TUniDBGrid', 'TIQEMailCorrespondence','TUniEdit' ])) then
       EXIT;

    // menu breaks
    if (AComponent is TUniMenuItem) and (TUniMenuItem(AComponent).Caption = '-') then
       EXIT;

    // check if already exists in the security register
    if FSecurityRegister.SecurityItems.IndexOf( AComponent.Name ) > -1 then
       EXIT;

//    for item in ItensGrid do
//       if Item.Caption=AComponent.Name then
//          exit;

    // add to the Grid
    cds.Append;
    cdsItemName.Value :=AComponent.Name;
    cdsClassName.Value:=AComponent.ClassType.ClassName;
    cds.Post;
  end;

begin
  // load form components
  for I:= 0 to FForm.ComponentCount - 1 do
    AddToListView( FForm.Components[ I ]);

  // check looad components belonging to another form that has switched it's Parent
  for I:= 0 to Screen.FormCount - 1 do
    if (Screen.Forms[ I ].Owner = FForm) and (Screen.Forms[ I ].ControlCount = 0) then
    begin
       for J:= 0 to Screen.Forms[ I ].ComponentCount - 1 do
          AddToListView( Screen.Forms[ I ].Components[ J ]);
    end;
    cds.First;
end;

procedure TFrmIQWEBSecAddItem.openCds;
var
  I:Integer;
  IndexnameAsc : string;
  IndexnameDes : string;
begin
  cds.CreateDataSet;
  cds.Open;
  with cds do
  begin
    for I := 0 to cds.FieldCount-1 do
    begin
      IndexnameAsc := cds.Fields[I].FieldName+'_index_asc';
      IndexnameDes := cds.Fields[I].FieldName+'_index_des';
      IndexDefs.Add(IndexnameAsc, cds.Fields[I].FieldName, []);
      IndexDefs.Add(IndexnameDes, cds.Fields[I].FieldName, [ixDescending]);
    end;
  end;
end;

procedure TFrmIQWebSecAddItem.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmIQWebSecAddItem.About1Click(Sender: TObject);
begin
  IQWebABout1.Execute;
end;

procedure TFrmIQWebSecAddItem.SortColumn(const FieldName: string; Dir: Boolean);
begin
  if Dir then
    cds.IndexName := FieldName+'_index_asc'
  else
    cds.IndexName := FieldName+'_index_des';
end;

procedure TFrmIQWebSecAddItem.Blink1Click(Sender: TObject);
begin
 // TSecurityInspector.Blink( GetSelectedComponentOnFormInFocus as TControl, 3 );  // IQSecIns.pas
end;

procedure TFrmIQWebSecAddItem.PopupMenu1Popup(Sender: TObject);
var
  AComponent: TComponent;
begin
  Blink1.Enabled:= FALSE;

  AComponent:= GetSelectedComponentOnFormInFocus;

  Blink1.Enabled:= Assigned(AComponent) and (AComponent is TControl);
end;

function TFrmIQWebSecAddItem.GetSelectedComponentOnFormInFocus: TComponent;


begin
  Result:= nil;
//  AItem:= ListView1.Selected;
//  if AItem = nil then
//     EXIT;

//  Result:= FSecurityRegister.LocateComponent( FForm, AItem.Caption );
end;

end.
