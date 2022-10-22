unit AssyTrack_PickToDispatch;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
//  Mask,
  IQMS.WebVcl.Search,
  Data.DB,
//  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.Jump,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel, IQUniGrid, uniGUIFrame, uniSpinEdit;

type
  TFrmAssyTrackPickToDispatch = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
    IQSearch1: TIQUniGridControl;
    rbAddBottom: TUniRadioButton;
    rbInsert: TUniRadioButton;
    Label1: TUniLabel;
    Panel5: TUniPanel;
    Label2: TUniLabel;
    Bevel2: TUniPanel;
    SrcSndopDispatch: TDataSource;
    QrySndopDispatch: TFDQuery;
    QrySndopDispatchID: TBCDField;
    QrySndopDispatchOPNO: TStringField;
    QrySndopDispatchOPDESC: TStringField;
    QrySndopDispatchSNDOP_ID: TBCDField;
    QrySndopDispatchWORKORDER_ID: TBCDField;
    QrySndopDispatchSTANDARD_ID: TBCDField;
    QrySndopDispatchMFGNO: TStringField;
    QrySndopDispatchDESCRIP: TStringField;
    QrySndopDispatchARINVT_ID: TBCDField;
    QrySndopDispatchITEMNO: TStringField;
    QrySndopDispatchSTANDARD_DESCRIP: TStringField;
    QrySndopDispatchREV: TStringField;
    QrySndopDispatchCLASS: TStringField;
    PopupMenu1: TUniPopupMenu;
    IQJumpInv: TIQWebJump;
    JumpToWorkOrder1: TUniMenuItem;
    JumpToBOM1: TUniMenuItem;
    JumpToInventory1: TUniMenuItem;
    IQJumpBOM: TIQWebJump;
    IQJumpWO: TIQWebJump;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QrySndopDispatchHRS_TO_GO: TFMTBCDField;
    QrySndopDispatchPARTS_TO_GO: TFMTBCDField;
    QrySndopDispatchDESCRIP2: TStringField;
    QrySndopDispatchREL_DATE: TDateTimeField;
    QrySndopDispatchPROD_START_TIME: TDateTimeField;
    QrySndopDispatchSTART_TIME: TDateTimeField;
    QrySndopDispatchJOB_SEQ: TFMTBCDField;
    ePos: TUniSpinEdit;
    procedure btnOKClick(Sender: TObject);
    procedure QrySndopDispatchBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JumpToInventory1Click(Sender: TObject);
    procedure JumpToBOM1Click(Sender: TObject);
    procedure JumpToWorkOrder1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FWork_Center_ID: Real;
    procedure SetWork_Center_ID(const Value: Real);
  public
    { Public declarations }
    FSndop_Dispatch_List: TStringList;
    property Work_Center_ID: Real write SetWork_Center_ID;
    class function DoShowModal( AWork_Center_ID: Real; var ASndop_Dispatch_List: TStringList; var ASeq: Real ): Boolean;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous;

{ TFrmAssyTrackAddToSched }

class function TFrmAssyTrackPickToDispatch.DoShowModal( AWork_Center_ID: Real; var ASndop_Dispatch_List: TStringList; var ASeq: Real ): Boolean;
var
  frm: TFrmAssyTrackPickToDispatch;
begin
  frm := TFrmAssyTrackPickToDispatch.Create(uniGUIApplication.UniApplication);
  frm.FWork_Center_ID := AWork_Center_ID;

  Result:= (frm.ShowModal = mrOK);
  if Result then
  begin
    ASndop_Dispatch_List.Assign(frm.FSndop_Dispatch_List);
    if frm.rbAddBottom.Checked then
      ASeq:= 999
    else
      ASeq:= frm.ePos.Value;
  end;

end;

procedure TFrmAssyTrackPickToDispatch.UniFormCreate(Sender: TObject);
begin
  FSndop_Dispatch_List:= TStringList.Create;
  IQRegFormRead(self, [ self ]);
end;

procedure TFrmAssyTrackPickToDispatch.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmAssyTrackPickToDispatch.FormDestroy(Sender: TObject);
begin
  FSndop_Dispatch_List.Free;
end;

procedure TFrmAssyTrackPickToDispatch.btnOKClick(Sender: TObject);
var
  I: Integer;
begin
  with IQSearch1 do
  try
     DBGrid.DataSource.DataSet.DisableControls;
     FSndop_Dispatch_List.Clear;

     { Append to List (ship_to_id, tran_date) }
     if DBGrid.SelectedRows.Count > 0 then
        for I:= 0 to DBGrid.SelectedRows.Count - 1 do
        begin
          DBGrid.DataSource.DataSet.GotoBookmark( DBGrid.SelectedRows.Items[ I ]);
          FSndop_Dispatch_List.Add( DBGrid.DataSource.DataSet.FieldByName('id').asString );
        end

     else if not (DBGrid.DataSource.DataSet.Bof and DBGrid.DataSource.DataSet.Eof) then
        FSndop_Dispatch_List.Add( DBGrid.DataSource.DataSet.FieldByName('id').asString );
  finally
     DBGrid.DataSource.DataSet.EnableControls;
  end;

  IQAssert( FSndop_Dispatch_List.Count > 0, 'No process is selected - operation aborted');
  ModalResult:= mrOK;
end;

procedure TFrmAssyTrackPickToDispatch.QrySndopDispatchBeforeOpen(DataSet: TDataSet);
begin
  // with TFDQuery( DataSet ) do
  //   ParamByName('work_center_id').Value := FWork_Center_ID;
  AssignQueryParamValue(DataSet, 'work_center_id', FWork_Center_ID);
end;

procedure TFrmAssyTrackPickToDispatch.SetWork_Center_ID(const Value: Real);
begin
  FWork_Center_ID := Value;
end;

procedure TFrmAssyTrackPickToDispatch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmAssyTrackPickToDispatch.JumpToInventory1Click(
  Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TFrmAssyTrackPickToDispatch.JumpToBOM1Click(Sender: TObject);
begin
  IQJumpBOM.Execute;
end;

procedure TFrmAssyTrackPickToDispatch.JumpToWorkOrder1Click(
  Sender: TObject);
begin
  IQJumpWO.Execute;
end;

procedure TFrmAssyTrackPickToDispatch.Exit1Click(Sender: TObject);
begin
  btnCancel.Click;
end;

procedure TFrmAssyTrackPickToDispatch.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;


end.
