unit prn_filename_format;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniMultiItem,
  uniListBox,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmPrnFileNameFormat = class(TUniForm)
    Panel1: TUniPanel;
    pnlSelected: TUniPanel;
    lstbSelElem: TUniListBox;
    Splitter1: TUniSplitter;
    Panel5: TUniPanel;
    pnlLeftRightBtns: TUniPanel;
    Panel6: TUniPanel;
    lstbAvailElem: TUniListBox;
    Panel2: TUniPanel;
    SBRight: TUniSpeedButton;
    SBLeft: TUniSpeedButton;
    SpeedButton1: TUniSpeedButton;
    Panel3: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    Panel7: TUniPanel;
    Panel4: TUniPanel;
    Panel8: TUniPanel;
    Panel10: TUniPanel;
    GroupBox1: TUniGroupBox;
    GroupBox2: TUniGroupBox;
    Bevel4: TUniPanel;
    Label1: TUniLabel;
    DBEdit1: TUniDBEdit;
    bvlLeft1: TUniPanel;
    Bevel6: TUniPanel;
    Bevel1: TUniPanel;
    pnlMain: TUniPanel;
    Bevel2: TUniPanel;
    QryFileNameFormat: TFDQuery;
    SrcFileNameFormat: TDataSource;
    QryFileNameFormatID: TBCDField;
    QryFileNameFormatSOURCE: TStringField;
    QryFileNameFormatSEPARATOR: TStringField;
    UpdateSQL1: TFDUpdateSQL;
    procedure lstbSelElemDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lstbSelElemMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lstbAvailElemMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lstbAvailElemDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lstbSelElemDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Remove1Click(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Add1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure lstbAvailElemDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure QryFileNameFormatBeforeOpen(DataSet: TDataSet);
    procedure QryFileNameFormatNewRecord(DataSet: TDataSet);
    procedure QryFileNameFormatBeforePost(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FList: TStringList;
    FSource: string;
    function GetFormat_ID: Real;
    procedure LoadAvailableElements( AList: TStringList );

    procedure EnsureParentFileNameFormatAssigned;
    procedure CheckForSameItem(cItem:String);
    procedure DeleteRow(LB:TUniListBox);
    procedure DeleteSavedSelectedElements;
    procedure SaveSelectedElements;
    procedure SetSource(const Value: string);
    procedure SetList(const Value: TStringList);

    property Format_ID: Real read GetFormat_ID;
  public
    { Public declarations }
    class procedure DoShowModal( ASource: string; AList: TStringList ); overload;
    class procedure DoShowModal( ASource: string; AFieldNames: string ); overload;
    class procedure LoadSelectedElements( AList: TStringList; AFormat_ID: Real );
    property Source: string write SetSource;
    property List: TStringList write SetList;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.WebVcl.ResourceStrings;

class procedure TFrmPrnFileNameFormat.DoShowModal( ASource: string; AFieldNames: string );
var
  AList: TStringList;
begin
  AList:= TStringList.Create;
  try
    IQMS.Common.StringUtils.StrToStringList( AFieldNames, AList );
    TFrmPrnFileNameFormat.DoShowModal( ASource, AList );
  finally
    AList.Free;
  end;
end;

class procedure TFrmPrnFileNameFormat.DoShowModal(ASource: string; AList: TStringList );
var
  LFrm: TFrmPrnFileNameFormat;
begin
  LFrm:= self.Create( UniGuiApplication.UniApplication );
  LFrm.Source:= ASource;
  LFrm.List:= AList;
  LFrm.ShowModal;
end;

procedure TFrmPrnFileNameFormat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmPrnFileNameFormat.LoadAvailableElements( AList: TStringList );
begin
  lstbAvailElem.Items.Assign( AList );
end;

class procedure TFrmPrnFileNameFormat.LoadSelectedElements( AList: TStringList; AFormat_ID: Real );
begin
  AList.Clear;
  LoadColumnValueIntoStringList( AList,
                                       IQFormat('select name from filename_format_element where filename_format_id = %f order by id', [ AFormat_ID ]));
end;

procedure TFrmPrnFileNameFormat.lstbSelElemDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source = lstbAvailElem) or (Source = lstbSelElem)
end;

procedure TFrmPrnFileNameFormat.lstbAvailElemDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source = lstbSelElem);
end;

procedure TFrmPrnFileNameFormat.lstbSelElemMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (lstbSelElem.ItemIndex > -1) then
     lstbSelElem.BeginDrag(False);
end;

procedure TFrmPrnFileNameFormat.QryFileNameFormatBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'source', FSource);
end;

procedure TFrmPrnFileNameFormat.QryFileNameFormatBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'FILENAME_FORMAT');
end;

procedure TFrmPrnFileNameFormat.QryFileNameFormatNewRecord(DataSet: TDataSet);
begin
  QryFileNameFormatSOURCE.asString:= FSource;
end;

procedure TFrmPrnFileNameFormat.lstbAvailElemMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then lstbAvailElem.BeginDrag(False);
end;

procedure TFrmPrnFileNameFormat.lstbSelElemDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  APoint: TPoint;
  i, j:Integer;
begin
  APoint.X := X;
  APoint.Y := Y;
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'ItemAtPos'
  I:= lstbSelElem.ItemAtPos(APoint, False);}

  if Source = lstbAvailElem then with lstbAvailElem do
    begin
      CheckForSameItem( Items[ ItemIndex ]);
      if I > -1 then
         lstbSelElem.Items.Insert( I, Items[ ItemIndex ])
      else
         lstbSelElem.Items.Add( Items[ ItemIndex ]);
    end
  else
    with lstbSelElem do
    begin
       J:= ItemIndex;
       if (I > -1) and  (I <= Items.Count - 1) and (J > -1) then
          Items.Move( J, I )
    end;
end;

procedure TFrmPrnFileNameFormat.CheckForSameItem(cItem:String);
var
  i:integer;
begin
  for i := 0 to lstbSelElem.Items.Count - 1 do
    if lstbSelElem.Items[i] = cItem then
      raise Exception.CreateFmt( IQMS.WebVcl.ResourceStrings.cTXT0000257 {'Item, %s, already selected'}, [ cItem ]);
end;

procedure TFrmPrnFileNameFormat.DeleteRow(LB:TUniListBox);
var
  i:Integer;
begin
  with LB do
  if ItemIndex >= 0 then
     Items.Delete(ItemIndex);
end;

procedure TFrmPrnFileNameFormat.Remove1Click(Sender: TObject);
begin
  DeleteRow(lstbSelElem);
end;

procedure TFrmPrnFileNameFormat.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmPrnFileNameFormat.BtnClearClick(Sender: TObject);
var
  i:Integer;
begin
  with lstbSelElem do
    while Items.Count > 0 do
      Items.Delete(0);
end;

procedure TFrmPrnFileNameFormat.BtnOkClick(Sender: TObject);
begin
  SaveSelectedElements;
  ModalResult:= mrOK;
end;

procedure TFrmPrnFileNameFormat.Add1Click(Sender: TObject);
begin
  if lstbAvailElem.ItemIndex < 0 then Exit;

  CheckForSameItem(lstbAvailElem.Items[lstbAvailElem.ItemIndex]);

  lstbSelElem.Items.Add(lstbAvailElem.Items[ lstbAvailElem.ItemIndex ]);
end;

procedure TFrmPrnFileNameFormat.FormResize(Sender: TObject);
begin
  pnlSelected.Width:= (self.ClientWidth - pnlLeftRightBtns.Width - Splitter1.Width - bvlLeft1.Width ) div 2;
end;

function TFrmPrnFileNameFormat.GetFormat_ID: Real;
begin
  Result:= QryFileNameFormatID.asFloat;
end;

procedure TFrmPrnFileNameFormat.lstbAvailElemDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  DeleteRow( Source as TUniListBox );
end;

procedure TFrmPrnFileNameFormat.DeleteSavedSelectedElements;
begin
  ExecuteCommandFmt('delete from filename_format_element where filename_format_id = %f', [ Format_ID ]);
end;

procedure TFrmPrnFileNameFormat.SaveSelectedElements;
var
  I: Integer;
begin
  DeleteSavedSelectedElements;

  if lstbSelElem.Items.Count > 0 then
     EnsureParentFileNameFormatAssigned;

  for I:= 0 to lstbSelElem.Items.Count - 1 do
    ExecuteCommandFmt('insert into filename_format_element( filename_format_id, name ) values (%f, ''%s'')',
              [ Format_ID,
                lstbSelElem.Items[ I ]]);
end;

procedure TFrmPrnFileNameFormat.SetList(const Value: TStringList);
begin
  FList := Value;
end;

procedure TFrmPrnFileNameFormat.SetSource(const Value: string);
begin
  FSource := Value;
end;

procedure TFrmPrnFileNameFormat.EnsureParentFileNameFormatAssigned;
begin
  Reopen(QryFileNameFormat);

  if QryFileNameFormat.Eof and  QryFileNameFormat.Bof then
  begin
    QryFileNameFormat.Append;
    QryFileNameFormatSEPARATOR.asString:= '-';
    QryFileNameFormat.Post;
  end;
end;

procedure TFrmPrnFileNameFormat.UniFormShow(Sender: TObject);
begin
  inherited;

  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);

  // load available
  LoadAvailableElements( FList );

  // load selected saved in the past
  LoadSelectedElements( FList, Format_ID );
  lstbSelElem.Items.Assign( FList );
end;

end.

