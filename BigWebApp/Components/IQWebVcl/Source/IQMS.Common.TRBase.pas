unit IQMS.Common.TRBase;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
//  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniPageControl, IQMS.WebVcl.RecordViewPanel, IQUniGrid, uniGUIFrame;

type
  TFrmTraceBase = class(TUniForm)
    wwSrcTR_Batch: TDataSource;
    wwQryTR_Batch: TFDQuery;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Splitter1: TUniSplitter;
    wwSrcTR_Value: TDataSource;
    wwQryTR_Value: TFDQuery;
    wwQryTR_BatchBATCH_ID: TBCDField;
    wwQryTR_BatchACTION: TStringField;
    wwQryTR_BatchTIME_STAMP: TDateTimeField;
    wwQryTR_BatchUSER_NAME: TStringField;
    wwQryTR_ValueCOL_NAME: TStringField;
    Report1: TUniMenuItem;
    Print1: TUniMenuItem;
    Printersetup1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel3: TUniPanel;
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    Bevel1: TUniPanel;
    Panel4: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    Panel6: TUniPanel;
    Panel2: TUniPanel;
    NavDetail: TUniDBNavigator;
    Panel5: TUniPanel;
    Bevel2: TUniPanel;
    wwQryTR_BatchTABLE_NAME: TStringField;
    wwQryTR_ValueOld_Value_Disp: TStringField;
    wwQryTR_ValueNew_Value_Disp: TStringField;
    wwQryTR_ValueDATA_TYPE: TStringField;
    wwQryTR_ValueOLD_VALUE_DATE: TDateTimeField;
    wwQryTR_ValueNEW_VALUE_DATE: TDateTimeField;
    pgctrlData: TUniPageControl;
    TabGrid: TUniTabSheet;
    TabForm: TUniTabSheet;
    wwDBGrid2: TIQUniGridControl;
    sbtnGridFormToggle: TUniSpeedButton;
    wwQryTR_ValueOLD_VALUE: TStringField;
    wwQryTR_ValueNEW_VALUE: TStringField;
    PMain: TUniPopupMenu;
    CopyIDtoClipboard1: TUniMenuItem;
    CopyTableNametoClipboard1: TUniMenuItem;
    wwQryTR_BatchPROGRAM_NAME: TStringField;
    CopySelectSQLtoClipboard1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure wwQryTR_BatchUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure Print1Click(Sender: TObject);
    procedure Printersetup1Click(Sender: TObject);
    procedure wwQryTR_ValueCalcFields(DataSet: TDataSet);
    procedure sbtnGridFormToggleClick(Sender: TObject);
    procedure CopyIDtoClipboard1Click(Sender: TObject);
    procedure CopyTableNametoClipboard1Click(Sender: TObject);
    procedure CopySelectSQLtoClipboard1Click(Sender: TObject);
    procedure UniFormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure wwQryTR_BatchBeforeRefresh(DataSet: TDataSet);
  private
    { Private declarations }
    FTableName: string;
    FTableID: Int64;
  public
    { Public declarations }
    constructor Create(  ATable_Name: string; AID: Real );
    property TableName: string read FTableName;
    property ID: Int64 read FTableID;
  end;

procedure DoShowTrace( ATable_Name: string; AID: Real );


implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.ResStrings,
  IQMS.Common.Controls,
  IQMS.Common.Numbers,
  Vcl.Clipbrd;

procedure DoShowTrace(  ATable_Name: string; AID: Real );
begin
  TFrmTraceBase.Create(ATable_Name, AID ).Show;
end;

constructor TFrmTraceBase.Create( ATable_Name: string; AID: Real );
begin
  inherited Create( uniGUIApplication.UniApplication );

  FTableName := UpperCase(ATable_Name);
  FTableID := Trunc(AID);

  with wwQryTR_Batch do
  begin
    ParamByName('table_name').asString:= FTableName;
    ParamByName('parent_id').Value := AID;
  end;

  IQSetTablesActive( TRUE, self );
  IQRegFormRead(self, [ self, wwDBgrid1 ]);

  Caption:= Format( IQMS.Common.ResStrings.cTXT0000244 {'Trace on %s, ID = %.0f'}, [ FTableName, AID ]);

  IQMS.Common.Controls.AdjustPageControlToParent( pgctrlData );
end;

procedure TFrmTraceBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBgrid1 ]);
end;

procedure TFrmTraceBase.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTraceBase.About1Click(Sender: TObject);
begin
//  IQAbout1.Execute;
end;

procedure TFrmTraceBase.wwQryTR_BatchBeforeRefresh(DataSet: TDataSet);
begin
    ReOpen(DataSet);
    ABORT;
end;

procedure TFrmTraceBase.wwQryTR_BatchUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
 // Just a stub to keep REFRESH button available
end;

procedure TFrmTraceBase.Print1Click(Sender: TObject);
begin
//  IQRepDef1.Execute;
end;

procedure TFrmTraceBase.Printersetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmTraceBase.wwQryTR_ValueCalcFields(DataSet: TDataSet);
begin
  if CompareText( wwQryTR_ValueDATA_TYPE.asString, 'DATE' ) = 0 then
     begin
       {take the actual date as date type and let Delphi convert to string according to Locale}
       wwQryTR_ValueOld_Value_Disp.asString:= wwQryTR_ValueOLD_VALUE_DATE.asString;
       wwQryTR_ValueNew_Value_Disp.asString:= wwQryTR_ValueNEW_VALUE_DATE.asString;
     end
  else
     begin
       {straight copy of old_value and new_value into calc field}
       wwQryTR_ValueOld_Value_Disp.asString:= wwQryTR_ValueOLD_VALUE.asString;
       wwQryTR_ValueNew_Value_Disp.asString:= wwQryTR_ValueNEW_VALUE.asString;
     end;
end;

procedure TFrmTraceBase.sbtnGridFormToggleClick(Sender: TObject);
begin
  pgctrlData.ActivePageIndex:= IIf( pgctrlData.ActivePageIndex = 0, 1, 0);
end;

procedure TFrmTraceBase.UniFormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
   begin
     PMain.Popup(x,y);
   end;

end;

procedure TFrmTraceBase.CopyTableNametoClipboard1Click(Sender: TObject);
begin
  Clipboard.AsText := FTableName;
end;

procedure TFrmTraceBase.CopyIDtoClipboard1Click(Sender: TObject);
begin
 Clipboard.AsText := IntToStr(FTableID);
end;

procedure TFrmTraceBase.CopySelectSQLtoClipboard1Click(Sender: TObject);
begin
  Clipboard.AsText := Format(
    'SELECT * FROM %s WHERE id = %d',
    [FTableName, FTableID]);
end;

end.
