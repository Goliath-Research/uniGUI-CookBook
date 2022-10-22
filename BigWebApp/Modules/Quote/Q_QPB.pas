unit Q_QPB;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  System.Variants,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Controls;

type
  TFrmQ_QPB = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    DBGrid1: TUniDBGrid;
    SrcQinvt: TDataSource;
    TblQinvt_Qty_Breaks: TFDTable;
    TblQinvt_Qty_BreaksQUAN: TBCDField;
    TblQinvt_Qty_BreaksQPRICE: TFMTBCDField;
    TblQinvt_Qty_BreaksPRICE_DATE: TDateTimeField;
    TblQinvt_Qty_BreaksEFFECT_DATE: TDateTimeField;
    TblQinvt_Qty_BreaksDEACTIVE_DATE: TDateTimeField;
    SrcQinvt_Qty_Breaks: TDataSource;
    TblQinvt_Qty_BreaksQINVT_ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SrcQinvt_Qty_BreaksDataChange(Sender: TObject; Field: TField);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FPartno_ID: Real;
  public
    { Public declarations }
  end;

procedure DoQinvtQtyBreaks(ADataSet: TDataSet); { Q_QPB.pas }

implementation

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  quote_rscstr;

{$R *.DFM}

procedure DoQinvtQtyBreaks(ADataSet: TDataSet);
var
  frm: TFrmQ_QPB;
begin
  frm := TFrmQ_QPB.Create(uniGUIApplication.UniApplication);
  with frm do
  begin
    FPartno_ID := 0;
    SrcQinvt.DataSet := ADataSet;
    ShowModal;
  end;
end;

procedure TFrmQ_QPB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, DBGrid1]);
end;

procedure TFrmQ_QPB.SrcQinvt_Qty_BreaksDataChange(Sender: TObject; Field: TField);
var
  A: Variant;
begin
  with TblQinvt_Qty_Breaks do
    if Assigned(MasterSource) and Assigned(MasterSource.DataSet) then
      if (State = dsBrowse) and (MasterSource.DataSet.FieldByName('ID').asFloat <> FPartno_ID) then
      begin
        FPartno_ID := MasterSource.DataSet.FieldByName('ID').asFloat;

        A := SelectValueArrayFmt('select a.itemno, a.descrip from qinvt a where a.id = %f', [FPartno_ID]);
        if VarArrayDimCount(A) > 0 then // check to see if array is not empty
          Caption := Format(quote_rscstr.cTXT000000137 { '%s %s - Price Breaks' } , [A[0], A[1]])
        else
          Caption := quote_rscstr.cTXT000000136; // 'Price Breaks';
      end;

end;

procedure TFrmQ_QPB.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self, DBGrid1]);
end;

procedure TFrmQ_QPB.UniFormShow(Sender: TObject);
begin
  IQSetTablesActiveEx(TRUE, self, quote_rscstr.cTXT000000212 { 'Accessing database.  Please wait.' } );
end;

end.
