unit IQMS.Common.GridBase;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.Jump,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmIQGridBase = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    wwDBGrid1: TIQUniGridControl;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    PopupMenu1: TUniPopupMenu;
    IQJump1: TIQWebJump;
    JumpTo1: TUniMenuItem;
    Bevel1: TUniPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JumpTo1Click(Sender: TObject);
    procedure wwDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Cursor;

procedure TFrmIQGridBase.FormCreate(Sender: TObject);
var
  ATag: Integer;
begin
  {sometimes we assign SQL after form created}
  ATag:= Query1.Tag;
  if Trim(Query1.SQL.Text) = '' then
     Query1.Tag:= 1;
  IQSetTablesActive( TRUE, self );
  Query1.Tag:= ATag;

  IQRegFormRead( self, [ self, wwDBGrid1 ]);
  if Assigned(IQJump1.DataSource) and (IQJump1.DataField > '') then
     wwDBGrid1.Cursor:= crJump;
end;

procedure TFrmIQGridBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmIQGridBase.JumpTo1Click(Sender: TObject);
begin
  IQJump1.Execute;
end;

procedure TFrmIQGridBase.wwDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Key:= 0;
    Close;
  end;
end;

procedure TFrmIQGridBase.wwDBGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PopupMenu1.Popup(x,y,sender);
end;

end.
