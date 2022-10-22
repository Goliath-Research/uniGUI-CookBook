unit dbtlist;

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
  StdCtrls,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmDbtList = class(TUniForm)
    lstObjects: TUniListBox;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    function GetItemIndex: Integer;
    procedure SetItemIndex(const Value: Integer);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AList: TStringList);
    procedure ApplyList(const AList: TStringList; const AItemIndex: Integer = 0);
  published
    { Published declarations }
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
  end;

  function DbTransShowList(const AOwner: TComponent; const AList: TStringList;
    var AItemIndex: Integer): Boolean; // returns true if item is selected

var
  FrmDbtList: TFrmDbtList;

implementation

{$R *.dfm}

uses
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.Controls,
  IQMS.Common.RegFrm;

function DbTransShowList(const AOwner: TComponent; const AList: TStringList;
  var AItemIndex: Integer): Boolean; // returns item index
begin
  with TFrmDbtList.Create(AOwner, AList) do
  try
     if Trunc(AItemIndex) > -1 then
        ItemIndex := AItemIndex;
     Result := ShowModal = mrOk;
     if Result then
        AItemIndex := ItemIndex;
  finally
     Free;
  end;
end;


{ TFrmIQDBXList }

constructor TFrmDbtList.Create(AOwner: TComponent; AList: TStringList);
begin
  inherited Create(AOwner);
  ApplyList(AList);
  IQMS.Common.Controls.CenterForm(Self);
  IQMS.Common.RegFrm.IQRegFormRead(Self,[Self]);
end;

procedure TFrmDbtList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self,[Self]);
end;

procedure TFrmDbtList.ApplyList(const AList: TStringList;
 const AItemIndex: Integer = 0);
begin
  if Assigned(AList) then
     try
        lstObjects.Items.BeginUpdate;
        lstObjects.Items.Clear;
        lstObjects.Items.AddStrings(AList);
        lstObjects.ItemIndex := AItemIndex;
     finally
        lstObjects.Items.EndUpdate;
     end;
end;

function TFrmDbtList.GetItemIndex: Integer;
begin
  Result := lstObjects.ItemIndex;
end;

procedure TFrmDbtList.SetItemIndex(const Value: Integer);
begin
  lstObjects.ItemIndex := Value;
end;

procedure TFrmDbtList.btnOkClick(Sender: TObject);
begin
  // allow click event to finish
  Application.ProcessMessages;

  // validate selection
  if (lstObjects.Count > 0) and (ItemIndex = -1) then
     // 'Please select an item from the list.';
     raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000091);

  // set modal result   
  ModalResult := mrOk;      
end;

end.
