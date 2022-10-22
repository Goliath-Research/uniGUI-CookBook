unit IQMS.Common.SortFields;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Vcl.Menus,
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniMultiItem,
  uniListBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel;

type
  TFrmSortFields = class(TUniForm)
    Panel1: TUniPanel;
    pnlSelected: TUniPanel;
    lstbSortFields: TUniListBox;
    Splitter1: TUniSplitter;
    Panel5: TUniPanel;
    PMFields: TUniPopupMenu;
    PMSortFields: TUniPopupMenu;
    Add1: TUniMenuItem;
    Remove1: TUniMenuItem;
    pnlLeftRightBtns: TUniPanel;
    Panel6: TUniPanel;
    lstbFields: TUniListBox;
    Panel2: TUniPanel;
    SBRight: TUniSpeedButton;
    SBLeft: TUniSpeedButton;
    SpeedButton1: TUniSpeedButton;
    Panel3: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    PnlAvailable: TUniPanel;
    lblAvailable: TUniLabel;
    Panel7: TUniPanel;
    lblSelected: TUniLabel;
    procedure lstbSortFieldsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lstbSortFieldsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lstbFieldsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lstbFieldsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lstbSortFieldsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Remove1Click(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Add1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure lstbFieldsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lstbFieldsDblClick(Sender: TObject);
    procedure lstbSortFieldsDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadAvailableFields(ADataSet: TDataSet);
    procedure LoadSortFields(AList: TList);
    procedure ChecksForSameItem(cItem: String);
    procedure DeleteRow(LB: TUniListBox);
  public
    { Public declarations }
     procedure AssignSortList(AList: TList);
    class function DoShowModal(ADataSet: TDataSet; AList: TList): Boolean;
  end;

function GetSortFields(ADataSet: TDataSet; AList: TList): Boolean;

var
  FrmSortFields: TFrmSortFields;

implementation

{$R *.DFM}


uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.ResourceStrings;

function GetSortFields(ADataSet: TDataSet; AList: TList): Boolean;
var
  frm : TFrmSortFields;
begin
  frm := TFrmSortFields.Create(uniGUIApplication.UniApplication);

  frm.LoadAvailableFields(ADataSet);
  frm.LoadSortFields(AList);

  Result := frm.ShowModal = mrOK;

  if Result then
     frm.AssignSortList(AList);
end;

{$REGION 'TFrmSortFields'}


class function TFrmSortFields.DoShowModal(ADataSet: TDataSet;
  AList: TList): Boolean;
var
  frm : TFrmSortFields;
begin
  frm := TFrmSortFields.Create(uniGUIApplication.UniApplication);

  frm.LoadAvailableFields(ADataSet);
  frm.LoadSortFields(AList);

  Result := frm.ShowModal = mrOK;
  if Result then
     frm.AssignSortList(AList);
end;

procedure TFrmSortFields.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmSortFields.LoadAvailableFields(ADataSet: TDataSet);
var
  I: Integer;
begin
  for I := 0 to ADataSet.FieldCount - 1 do
    with ADataSet.Fields[I] do
      if Visible then
        lstbFields.Items.AddObject(DisplayLabel, ADataSet.Fields[I]);
end;

procedure TFrmSortFields.LoadSortFields(AList: TList);
var
  I: Integer;
begin
  for I := 0 to AList.Count - 1 do
    { If this is a valid item (found in the left box) add it to the right box }
    if lstbFields.Items.IndexOfObject(AList[I]) > - 1 then
      lstbSortFields.Items.AddObject(TField(AList[I]).DisplayLabel, AList[I]);
end;

procedure TFrmSortFields.lstbSortFieldsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source = lstbFields) or (Source = lstbSortFields)
end;

procedure TFrmSortFields.lstbFieldsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source = lstbSortFields);
end;

procedure TFrmSortFields.lstbSortFieldsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (lstbSortFields.ItemIndex > - 1) then
    lstbSortFields.BeginDrag(False);
end;

procedure TFrmSortFields.lstbFieldsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    lstbFields.BeginDrag(False);
end;

procedure TFrmSortFields.lstbSortFieldsDblClick(Sender: TObject);
begin
  DeleteRow(lstbSortFields);
end;

procedure TFrmSortFields.lstbSortFieldsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  APoint: TPoint;
  I, j: Integer;
begin
  APoint.X := X;
  APoint.Y := Y;
  //I := lstbSortFields.ItemAtPos(APoint, False);

  if Source = lstbFields then
    with lstbFields do
      begin
        ChecksForSameItem(Items[ItemIndex]);
        if I > - 1 then
          begin
            lstbSortFields.Items.Insert(I, Items[ItemIndex]);
            lstbSortFields.Items.Objects[I] := Items.Objects[ItemIndex];
          end
        else
          lstbSortFields.Items.AddObject(Items[ItemIndex],
            Items.Objects[ItemIndex]);
      end
  else
    with lstbSortFields do
      begin
        j := ItemIndex;
        if (I > - 1) and (I <= Items.Count - 1) and (j > - 1) then
          Items.Move(j, I)
      end;
end;

procedure TFrmSortFields.ChecksForSameItem(cItem: String);
var
  I: Integer;
begin
  for I := 0 to lstbSortFields.Items.Count - 1 do
    if lstbSortFields.Items[I] = cItem then
      raise Exception.CreateFmt
        (IQMS.WebVcl.ResourceStrings.cTXT0000257 { 'Item, %s, already selected' } , [cItem]);
end;

procedure TFrmSortFields.DeleteRow(LB: TUniListBox);
var
  I: Integer;
begin
  with LB do
    if ItemIndex >= 0 then
      Items.Delete(ItemIndex);
end;

procedure TFrmSortFields.Remove1Click(Sender: TObject);
begin
  DeleteRow(lstbSortFields);
end;

procedure TFrmSortFields.BtnClearClick(Sender: TObject);
var
  I: Integer;
begin
  with lstbSortFields do
    while Items.Count > 0 do
      Items.Delete(0);
end;

procedure TFrmSortFields.BtnOkClick(Sender: TObject);
begin
  IQAssert(lstbSortFields.Items.Count > 0,
    IQMS.WebVcl.ResourceStrings.cTXT0000258 { 'Nothing is selected' } );
  ModalResult := mrOK;
end;

procedure TFrmSortFields.Add1Click(Sender: TObject);
begin
  if lstbFields.ItemIndex < 0 then
    Exit;

  ChecksForSameItem(lstbFields.Items[lstbFields.ItemIndex]);

  lstbSortFields.Items.AddObject(lstbFields.Items[lstbFields.ItemIndex],
    lstbFields.Items.Objects[lstbFields.ItemIndex]);
end;

procedure TFrmSortFields.AssignSortList(AList: TList);
var
  I: Integer;
begin
  AList.Clear;
  with lstbSortFields.Items do
    for I := 0 to Count - 1 do
      AList.Add(Objects[I])
end;

procedure TFrmSortFields.FormResize(Sender: TObject);
begin
  pnlSelected.Width := (self.ClientWidth - pnlLeftRightBtns.Width -
    Splitter1.Width) div 2;
end;

procedure TFrmSortFields.lstbFieldsDblClick(Sender: TObject);
begin
  if lstbFields.ItemIndex < 0 then
    Exit;

  ChecksForSameItem(lstbFields.Items[lstbFields.ItemIndex]);

  lstbSortFields.Items.AddObject(lstbFields.Items[lstbFields.ItemIndex],
    lstbFields.Items.Objects[lstbFields.ItemIndex]);
end;

procedure TFrmSortFields.lstbFieldsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  DeleteRow(Source as TUniListBox);
end;

{$ENDREGION 'TFrmSortFields'}

end.
