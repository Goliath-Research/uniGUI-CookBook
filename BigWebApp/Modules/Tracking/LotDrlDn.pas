unit LotDrlDn;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmLotDrlDn = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQSearch1: TIQUniGridControl;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    IQSearch2: TIQUniGridControl;
    QryTransLog: TFDQuery;
    SrcTransLog: TDataSource;
    PopupMenu1: TUniPopupMenu;
    ShowDetails1: TUniMenuItem;
    QryTransLogTRANS_QUAN: TFMTBCDField;
    IQAbout1: TIQWebAbout;
    QryTransLogMFGNO: TStringField;
    QryTransLogWORKORDER_ID: TBCDField;
    QryTransLogORDERNO: TStringField;
    QryTransLogPROD_DATE: TDateTimeField;
    QryTransLogSHIFT: TBCDField;
    SrcDetail: TDataSource;
    QryDtl: TFDQuery;
    QryDtlCLASS: TStringField;
    QryDtlITEMNO: TStringField;
    QryDtlDESCRIP: TStringField;
    QryDtlREV: TStringField;
    QryDtlUNIT: TStringField;
    QryDtlRG_QUAN: TFMTBCDField;
    QryDtlTRANS_QUAN: TFMTBCDField;
    QryDtlLOTNO: TStringField;
    QryDtlARINVT_ID: TBCDField;
    QryTransLogARINVT_ID: TBCDField;
    QryTransLogBATCH: TBCDField;
    QryTransLogID: TBCDField;
    QryTransLogTRANS_DATE: TDateTimeField;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQRepDef1: TIQWebRepDef;
    SR: TIQWebSecurityRegister;
    Splitter1: TUniSplitter;
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure QryTransLogAfterScroll(DataSet: TDataSet);
    procedure ShowDetails1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure PopulateCompositTables;
  public
    { Public declarations }
    procedure xCreate(AArinvtId:Real; ALotNo:String);
  end;

procedure DoLotNumberDrillDown(AArinvtId:Real; ALotNo:String);


implementation
uses
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.DataLib;
//  IQSecIns;
{$R *.DFM}

procedure DoLotNumberDrillDown(AArinvtId:Real; ALotNo:String);
var
  FrmLotDrlDn: TFrmLotDrlDn;
begin
   FrmLotDrlDn:= TFrmLotDrlDn.create(uniguiapplication.uniapplication);
   with FrmLotDrlDn do
    begin
       xCreate(AArinvtId, ALotNo);
       ShowModal;
    end;
end;

procedure TFrmLotDrlDn.xCreate(AArinvtId:Real; ALotNo:String);
begin

  with QryTransLog do
  begin
    Close;
    ParamByName('AID').Value := AArinvtId;
    ParamByName('ALOTNO').asString := ALotno;
    Open;
  end;
end;

procedure TFrmLotDrlDn.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmLotDrlDn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Panel1]);
end;

procedure TFrmLotDrlDn.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmLotDrlDn.QryTransLogAfterScroll(DataSet: TDataSet);
begin
  QryDtl.Close;
end;

procedure TFrmLotDrlDn.ShowDetails1Click(Sender: TObject);
begin
  with QryDtl do
  begin
    Close;
    ParamByName('aid').Value := QryTransLogARINVT_ID.asFloat;
    ParamByName('abatch').Value := QryTransLogBATCH.asFloat;
    Open;
  end;
end;

procedure TFrmLotDrlDn.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, Panel1]);
end;

procedure TFrmLotDrlDn.Print1Click(Sender: TObject);
begin
  PopulateCompositTables;
  IQRepDef1.Execute;
end;

procedure TFrmLotDrlDn.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmLotDrlDn.PopulateCompositTables;
var
  AId:Real;
begin
  if not IqConfirmYN(Format('Do you wish to populate the composite tables with the current data?'#13 +
                 'Previous entries in the composite table for the %s user will be deleted.', [SecurityManager.UserName])) then Exit;

  ExecuteCommandFmt('delete from C_LOTTRACK_DRL_HDR where userid = ''%s''', [SecurityManager.UserName]);
  QryTransLog.First;
  while not QryTransLog.eof do
  begin
    AId := GetNextID('C_LOTTRACK_DRL_HDR');
    ExecuteCommandFmt('insert into C_LOTTRACK_DRL_HDR (id,           ' +
                                              'userid,       ' +
                                              'mfgno,        ' +
                                              'orderno,      ' +
                                              'prod_date,    ' +
                                              'trans_date,   ' +
                                              'shift,        ' +
                                              'trans_quan,   ' +
                                              'workorder_id, ' +
                                              'batch)        ' +
                                     'values (%f, ''%s'', ''%s'', ''%s'', ' +
                                     'To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR''), ' +
                                     '%f, %f, %f, %f)',
                                     [AId,
                                      SecurityManager.UserName,
                                      QryTransLogMFGNO.asString,
                                      QryTransLogORDERNO.asString,
                                      FormatDateTime('mm/dd/yyyy', QryTransLogPROD_DATE.AsDateTime),
                                      FormatDateTime('mm/dd/yyyy', QryTransLogTRANS_DATE.asDateTime),
                                      QryTransLogSHIFT.asFloat,
                                      QryTransLogTRANS_QUAN.asFloat,
                                      QryTransLogWORKORDER_ID.asFloat,
                                      QryTransLogBATCH.asFloat]);
    ShowDetails1Click(nil);
    QryDtl.First;
    while not QryDtl.Eof do
    begin
      ExecuteCommandFmt('insert into C_LOTTRACK_DRL_DTL (C_LOTTRACK_DRL_HDR_ID, ' +
                                               'arinvt_id,            ' +
                                               'class,                ' +
                                               'itemno,               ' +
                                               'rev,                  ' +
                                               'descrip,              ' +
                                               'unit,                 ' +
                                               'trans_quan,           ' +
                                               'rg_quan,              ' +
                                               'lotno)                ' +
                                     'values (%f, %f, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', %f, %f, ''%s'')',
                                     [AId,
                                      QryDtlARINVT_ID.asFloat,
                                      QryDtlCLASS.asString,
                                      QryDtlITEMNO.asString,
                                      QryDtlREV.asString,
                                      QryDtlDESCRIP.asString,
                                      QryDtlUNIT.asString,
                                      QryDtlTRANS_QUAN.asFloat,
                                      QryDtlRG_QUAN.asFloat,
                                      QryDtlLOTNO.asString]);
      QryDtl.Next;
    end;
    QryTransLog.Next;
  end;
end;

procedure TFrmLotDrlDn.FormShow(Sender: TObject);
begin
//  EnsureSecurityInspectorOnTopOf( self );
end;

end.
