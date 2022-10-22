unit sndop_pk_emp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, IQUniGrid, uniGUIFrame;

type
  TFrmSndOpPkEmp = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    wwQuery1EMPNO: TStringField;
    wwQuery1FIRST_NAME: TStringField;
    wwQuery1MIDDLE_NAME: TStringField;
    wwQuery1LAST_NAME: TStringField;
    wwQuery1ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FList: TStringList;
    procedure SaveToList;
    procedure SetList(const Value: TStringList);
  public
    { Public declarations }
    class function DoShowModal( var AList: TStringList ): Boolean;
    property List: TStringList write SetList;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  sndop_rscstr;


class function TFrmSndOpPkEmp.DoShowModal( var AList: TStringList ): Boolean;
var
  FrmSndOpPkEmp: TFrmSndOpPkEmp;
begin
  FrmSndOpPkEmp := TFrmSndOpPkEmp.Create(UniGuiApplication.UniApplication);
  FrmSndOpPkEmp.List := AList;
  Result:= FrmSndOpPkEmp.ShowModal = mrOK;
end;

procedure TFrmSndOpPkEmp.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmSndOpPkEmp.UniFormShow(Sender: TObject);
begin
  IQSetTablesActiveEx(TRUE, self, sndop_rscstr.cTXT0000050 {'Accessing database.  Please wait.'});
end;

procedure TFrmSndOpPkEmp.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmSndOpPkEmp.SaveToList;
var
  I: Integer;
begin
  FList.Clear;

{ TODO -oSanketG -cWebConvert : Need to revisit after finding alternative property for wwDbGrid, Dataset and UnselectAll of TIQUniGridControl }
  {with IQSearch1 do
  try
     DataSet.DisableControls;
     if (DataSet.Eof and DataSet.Bof) then
        EXIT;

     if wwDBGrid.SelectedList.Count = 0 then
        FList.Add( DataSet.FieldByName('id').asString )
     else
        for I:= wwDBGrid.SelectedList.Count - 1 downto 0 do
        begin
          DataSet.GotoBookmark( wwDBGrid.SelectedList.Items[ I ]);
          FList.Add( DataSet.FieldByName('id').asString );
        end;
     wwDBGrid.UnselectAll;
  finally
     DataSet.EnableControls;
  end;}
end;

procedure TFrmSndOpPkEmp.SetList(const Value: TStringList);
begin
  FList := Value;
end;

procedure TFrmSndOpPkEmp.btnOKClick(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit after finding alternative property for Dataset of TIQUniGridControl }
  {with IQSearch1 do
    IQAssert( not (DataSet.Eof and DataSet.Bof), 'No records found' );}

  SaveToList;

  ModalResult:= mrOK;
end;

end.

