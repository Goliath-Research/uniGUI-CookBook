unit fedex_dd;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
  Vcl.Buttons,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniMainMenu,
  uniPanel,
  uniPageControl,
  uniMultiItem,
  uniListBox,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniBasicGrid,
  uniDBGrid,
  uniComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.VCLUI.Wait, FireDAC.Comp.DataSet, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Controls, uniMemo;

type
  TFrmFedExDD = class(TUniForm)
    SrcData: TDataSource;
    TblData: TFDTable;
    QrySQL: TFDQuery;
    Splitter1: TUniSplitter;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    Panel1: TUniPanel;
    lstObject: TUniListBox;
    Panel5: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    cmbDatabase: TUniComboBox;
    Panel8: TUniPanel;
    pcMain: TUniPageControl;
    TabData: TUniTabSheet;
    TabSQL: TUniTabSheet;
    Panel2: TUniPanel;
    Bevel1: TUniPanel;
    Panel3: TUniPanel;
    NavMain: TUniDBNavigator;
    Panel4: TUniPanel;
    Grid: TUniDBGrid;
    Panel9: TUniPanel;
    Panel10: TUniPanel;
    Splitter2: TUniSplitter;
    GridSQL: TUniDBGrid;
    Panel11: TUniPanel;
    Bevel2: TUniPanel;
    sbtnRunSQL: TUniSpeedButton;
    SrcSQL: TDataSource;
    PopupMenu1: TUniPopupMenu;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Bevel3: TUniPanel;
    RunSQL1: TUniMenuItem;
    DB: TFDConnection;
    memSQL: TUniMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lstObjectClick(Sender: TObject);
    procedure cmbDatabaseChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure RunSQL1Click(Sender: TObject);
  private
    { Private declarations }
    function FedExConnect( S: String = 'Shipnet2000' ): Boolean;
    procedure GetObjectList;
  public
    { Public declarations }
    FFormActive: Boolean;
  end;

  procedure DoFedExDD;


implementation

{$R *.DFM}

procedure DoFedExDD;
var
  FrmFedExDD : TFrmFedExDD;
begin
  FrmFedExDD := TFrmFedExDD.Create(UniApplication);
  with FrmFedExDD do
   begin
     FFormActive := FALSE;
     cmbDatabase.ItemIndex := 0;
     pcMain.ActivePageIndex := 0;
     Show;
   end;
end;

procedure TFrmFedExDD.FormShow(Sender: TObject);
begin
     FFormActive := TRUE;
     if FedExConnect then GetObjectList;
end;

procedure TFrmFedExDD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FFormActive := FALSE;
     Action := caFree;
end;

function TFrmFedExDD.FedExConnect( S: String = 'Shipnet2000' ): Boolean;
begin
     // Connect to FedEx Ship Manager
     try
        if DB.Connected then DB.Connected := FALSE;
        DB.ConnectionName := S;
        DB.Connected := TRUE;
        Result := DB.Connected;
     except Result := FALSE;
     end;
end;

procedure TFrmFedExDD.GetObjectList;
var
   AList: TStringList;
   i: Integer;
   S: String;
begin
     if DB.Connected then
     try
        lstObject.Items.BeginUpdate;
        AList := TStringList.Create;
        DB.GetTableNames( 'DB', '', '', AList );
        lstObject.Items.Clear;
        lstObject.Items.AddStrings( AList );
     finally
        if Assigned( AList ) then FreeAndNil( AList );
        lstObject.Items.EndUpdate;
     end;
end;

procedure TFrmFedExDD.lstObjectClick(Sender: TObject);
var S: String;
begin
     if ( lstObject.ItemIndex > -1 ) then
        begin
             S := lstObject.Items.Strings[lstObject.ItemIndex];
             if ( S > '' ) then
                begin
                     TblData.Close;
                     TblData.TableName := S;
                     TblData.Open;
                end;
        end;
end;

procedure TFrmFedExDD.cmbDatabaseChange(Sender: TObject);
var S: String;
begin
     if ( FFormActive = FALSE ) then Exit;
     if TblData.Active then TblData.Close;
     S := cmbDatabase.Items.Strings[ cmbDatabase.ItemIndex ];
     if FedExConnect(S) then GetObjectList;
end;

procedure TFrmFedExDD.Exit1Click(Sender: TObject);
begin
     Close;
end;

procedure TFrmFedExDD.RunSQL1Click(Sender: TObject);
begin
     if QrySQL.Active then QrySQL.Close;
     QrySQL.SQL.Clear;
     QrySQL.SQL.Text := memSQL.Text;
     QrySQL.Open;
end;

end.
