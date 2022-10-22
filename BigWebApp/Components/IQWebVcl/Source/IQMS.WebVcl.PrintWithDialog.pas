unit IQMS.WebVcl.PrintWithDialog;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  Mask,
  wwdbedit,
  Wwdotdot,
  Wwdbcomb,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox;

type
  TFrmPrintWithDlg = class(TUniForm)
    Label3: TUniLabel;
    comboPrintWith: TUniDBComboBox;
    btnCancel: TUniBitBtn;
    btnOk: TUniBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create( AParentTableName: String; APrintWith: String );
  end;

  function DoPrintWith(  AParentTableName: String; var APrintWith: String ): Boolean;


implementation

{$R *.DFM}

uses
  IQMS.WebVcl.DocumentsDescript,
  IQMS.Common.RegFrm;

function DoPrintWith(  AParentTableName: String; var APrintWith: String ): Boolean;
begin
     with TFrmPrintWithDlg.Create( AParentTableName, APrintWith ) do
     try
        Result := ShowModal = mrOk;
        if Result then APrintWith := comboPrintWith.Text;
     finally Free;
     end;
end;

constructor TFrmPrintWithDlg.Create( AParentTableName: String;  APrintWith: String);
var 
  i: Integer;
begin
     inherited Create( uniGUIApplication.UniApplication );

     IQRegFormRead( self, [ self ]);

     // Fill combo box with "Print With" list
     AssignPrintWithToList( comboPrintWith.Items, AParentTableName );
     comboPrintWith.ItemIndex := comboPrintWith.items.IndexOf(APrintWith);
end;

procedure TFrmPrintWithDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

end.
