unit JC_elem_log;

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
  Wwquery,
  Wwdatsrc,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  StdCtrls,
  wwcheckbox,
  wwDataInspector,
  FireDAC.Comp.Client,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  IQUniGrid, uniGUIFrame;

type
  TFrmJC_Elem_Log = class(TUniForm)
    wwDBGrid1: TIQUniGridControl;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    wwQuery1ID: TBCDField;
    wwQuery1C_PROCESS_COST_ELEM_ID: TBCDField;
    wwQuery1TRANSLOG_ID: TBCDField;
    wwQuery1ARINVT_ID: TBCDField;
    wwQuery1SOURCE: TStringField;
    wwQuery1ACT_PRICE: TFMTBCDField;
    wwQuery1ACT_QTY: TFMTBCDField;
    wwQuery1STD_PRICE: TFMTBCDField;
    wwQuery1STD_QTY: TFMTBCDField;
    wwQuery1PRICE_VARIANCE: TFMTBCDField;
    wwQuery1QTY_VARIANCE: TFMTBCDField;
    wwQuery1ITEMNO: TStringField;
    wwQuery1REV: TStringField;
    wwQuery1CLASS: TStringField;
    wwQuery1DESCRIP: TStringField;
    SrcTranslog: TDataSource;
    QryTranslog: TFDQuery;
    QryTranslogID: TBCDField;
    QryTranslogBATCH: TBCDField;
    QryTranslogTRANS_IN_OUT: TStringField;
    QryTranslogTRANS_DATE: TDateTimeField;
    QryTranslogTRANS_QUAN: TFMTBCDField;
    QryTranslogACT_QTY: TFMTBCDField;
    QryTranslogACT_COST: TFMTBCDField;
    QryTranslogTRANS_TYPE: TStringField;
    QryTranslogLOC_DESC: TStringField;
    QryTranslogMFGNO: TStringField;
    QryTranslogORDERNO: TStringField;
    QryTranslogUSERID: TStringField;
    QryTranslogLOTNO: TStringField;
    QryTranslogFG_LOTNO: TStringField;
    QryTranslogTRANS_REASON: TStringField;
    QryTranslogCOST_ELEMENT: TStringField;
    QryTranslogARINVT_ID: TBCDField;
    QryTranslogPARENT_ARINVT_ID: TBCDField;
    QryTranslogRECEIPTNO: TStringField;
    QryTranslogDIVISION_NAME: TStringField;
    QryTranslogTRANS_CODE: TStringField;
    QryTranslogTRANS_DESCRIP: TStringField;
    QryTranslogPROD_DATE: TDateTimeField;
    QryTranslogFGMULTI_ID: TBCDField;
    wwExpandButtonTranslog: TwwExpandButton;
    wwDataInspectorTransLog: TwwDataInspector;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    procedure wwExpandButtonTranslogAfterExpand(Sender: TObject);
    procedure QryTranslogBeforeOpen(DataSet: TDataSet);
    procedure AssignBlankIfZero(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FC_Process_Cost_Elem_ID: Real;
    procedure Set_AC_Process_Cost_Elem_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal(AC_Process_Cost_Elem_ID: Real);
    property AC_Process_Cost_Elem_ID: Real write Set_AC_Process_Cost_Elem_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmJC_Elem_Log }

class procedure TFrmJC_Elem_Log.DoShowModal(AC_Process_Cost_Elem_ID: Real);
var
  LFrm: TFrmJC_Elem_Log;
begin
  LFrm:= Self.Create(UniGUIApplication.UniApplication);
  LFrm.AC_Process_Cost_Elem_ID:= AC_Process_Cost_Elem_ID;
  LFrm.ShowModal;
end;

procedure TFrmJC_Elem_Log.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBGrid1 ]);
end;

procedure TFrmJC_Elem_Log.wwQuery1BeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue( DataSet, 'c_process_cost_elem_id', FC_Process_Cost_Elem_ID );
//  with DataSet as TFDQuery do
//    ParamByName('c_process_cost_elem_id').asFloat:= FC_Process_Cost_Elem_ID;
end;

procedure TFrmJC_Elem_Log.wwExpandButtonTranslogAfterExpand(Sender: TObject);
begin
  Reopen(QryTranslog)
end;

procedure TFrmJC_Elem_Log.QryTranslogBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue( DataSet, 'translog_id', wwQuery1TRANSLOG_ID.asFloat );
//  with DataSet as TFDQuery do
//    ParamByName('translog_id').asFloat:=  wwQuery1TRANSLOG_ID.asFloat;
end;

procedure TFrmJC_Elem_Log.Set_AC_Process_Cost_Elem_ID(const Value: Real);
begin
  FC_Process_Cost_Elem_ID:= Value;
end;

procedure TFrmJC_Elem_Log.UniFormShow(Sender: TObject);
begin
  IQRegFormRead(self, [ self, wwDBGrid1 ]);
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmJC_Elem_Log.AssignBlankIfZero(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Abs( Sender.asFloat ) <= 0.0000001 then
     Text:= ''
  else
     Text:= FormatFloat( TFloatField(Sender).DisplayFormat, Sender.asFloat );
  DisplayText:= TRUE;
end;

end.
