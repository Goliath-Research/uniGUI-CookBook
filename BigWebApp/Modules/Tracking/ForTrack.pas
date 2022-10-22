unit ForTrack;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniStringGrid,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame,
  Vcl.Controls;

type
  TFrmForTrack = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    SearchSerial1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryForeignLbl: TFDQuery;
    QryForeignLblID: TBCDField;
    QryForeignLblMASTER_LABEL_ID: TBCDField;
    QryForeignLblSERIAL: TStringField;
    QryForeignLblSCAN_DATE: TDateTimeField;
    QryMasterLbl: TFDQuery;
    QryMasterLblEQNO: TStringField;
    QryMasterLblCLASS: TStringField;
    QryMasterLblITEMNO: TStringField;
    QryMasterLblREV: TStringField;
    QryMasterLblDESCRIP: TStringField;
    QryMasterLblDESCRIP2: TStringField;
    QryMasterLblMFGNO: TStringField;
    QryMasterLblPONO: TStringField;
    QryMasterLblFG_LOTNO: TStringField;
    QryMasterLblBOXNO: TBCDField;
    QryMasterLblPRINT_DATE: TDateTimeField;
    QryMasterLblSCANNED: TStringField;
    QryMasterLblSERIAL: TStringField;
    QryMasterLblQTY: TFMTBCDField;
    QryMasterLblDISPO_SCAN: TStringField;
    QryMasterLblVOLUME: TFMTBCDField;
    QryMasterLblWEIGHT: TFMTBCDField;
    QryMasterLblLOC_DESC: TStringField;
    QryMasterLblUSER_NAME: TStringField;
    QryMasterLblID: TBCDField;
    QryMasterLblARCUSTO_ID: TBCDField;
    QryMasterLblPARENT_ID: TBCDField;
    QryMasterLblIS_SKID: TStringField;
    QryMasterLblBOX_ID: TBCDField;
    QryMasterLblARINVT_ID: TBCDField;
    QryMasterLblSYS_DATE: TDateTimeField;
    QryMasterLblPARENT_ID_DISP: TStringField;
    QryMasterLblORDERNO: TStringField;
    SrcMasterLbl: TDataSource;
    SrcForeignLbl: TDataSource;
    QryParentLbl: TFDQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField1: TBCDField;
    DateTimeField1: TDateTimeField;
    StringField10: TStringField;
    StringField11: TStringField;
    FloatField2: TFMTBCDField;
    StringField12: TStringField;
    FloatField3: TFMTBCDField;
    FloatField4: TFMTBCDField;
    StringField13: TStringField;
    StringField14: TStringField;
    FloatField5: TBCDField;
    FloatField6: TBCDField;
    FloatField7: TBCDField;
    StringField15: TStringField;
    FloatField8: TBCDField;
    FloatField9: TBCDField;
    DateTimeField2: TDateTimeField;
    StringField16: TStringField;
    StringField17: TStringField;
    PanelMain: TUniPanel;
    Panel2: TUniPanel;
    SgParent: TUniStringGrid;
    Splitter2: TUniSplitter;
    Panel1: TUniPanel;
    SGMaster: TUniStringGrid;
    Panel5: TUniPanel;
    GridFor: TIQUniGridControl;
    Splitter1: TUniSplitter;
    PnlBelongstoLabelCaption: TUniPanel;
    lblBelongstoLabelCaption: TUniLabel;
    PnlBelongstoPalletCaption: TUniPanel;
    lblBelongstoPalletCaption: TUniLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure SearchSerial1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure QryForeignLblAfterScroll(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    FSer:String;
    { Private declarations }
    procedure PopulateStringGrid(ASg:TUniStringGrid; AQry:TFDQuery);
    procedure SetSer(const Value: string);
  public
    { Public declarations }
    procedure RefreshData( ASer:String );
    property Ser:string read FSer write SetSer;
  end;


implementation

{$R *.DFM}

uses
  GetSer,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

procedure TFrmForTrack.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, GridFor]);
end;

procedure TFrmForTrack.RefreshData( ASer:String );
begin
  with QryForeignLbl do
  begin
    IQRegFormWrite( self, [GridFor]);
    Close;
    ParamByName('ASer').asString := ASer;
    Open;
    IQRegFormRead( self, [GridFor]);
  end;

  QryForeignLblAfterScroll(nil);

end;

procedure TFrmForTrack.PopulateStringGrid(ASg:TUniStringGrid; AQry:TFDQuery);
var
  I: Integer;
begin
  with ASg do
  begin
    RowCount := 2;
    Cells[ 0, 0 ]:= '#';
    Cells[ 1, 0 ]:= 'Field Name';
    Cells[ 2, 0 ]:= 'Value';
  end;

  with AQry do
    for I:= 0 to FieldCount - 1 do with ASg do
      if (Fields[ I ].Tag = 0) then
      begin
        if (I >= RowCount - 1) then
          RowCount:= RowCount + 1;
        Cells[ 0, RowCount - 1 ]:= IntToStr( RowCount - 1 );
        Cells[ 1, RowCount - 1 ]:= Fields[ I ].DisplayLabel;
        Cells[ 2, RowCount - 1 ]:= Fields[ I ].asString;
      end;

end;

procedure TFrmForTrack.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmForTrack.SearchSerial1Click(Sender: TObject);
begin
  GetSerialTrackingNumber;  {in GetSer.pas}
end;

procedure TFrmForTrack.SetSer(const Value: string);
begin
   FSer := Value;
   RefreshData( Value );
end;

procedure TFrmForTrack.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, GridFor]);
end;

procedure TFrmForTrack.FormResize(Sender: TObject);
begin
  with SGMaster do
    ColWidths[ 2 ]:= ClientWidth - ColWidths[ 0 ] - ColWidths[ 1 ] - 3;

  with SGParent do
    ColWidths[ 2 ]:= ClientWidth - ColWidths[ 0 ] - ColWidths[ 1 ] - 3;
end;

procedure TFrmForTrack.QryForeignLblAfterScroll(DataSet: TDataSet);
begin
  QryMasterLbl.Close;
  QryMasterLbl.Open;

  QryParentLbl.Close;
  QryParentLbl.Open;


  PopulateStringGrid(SGMaster, QryMasterLbl);
  PopulateStringGrid(SGParent, QryParentLbl);
end;

end.
