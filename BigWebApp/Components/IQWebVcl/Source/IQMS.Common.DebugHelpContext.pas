unit IQMS.Common.DebugHelpContext;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmDebugHelpContext = class(TUniForm)
    Label1: TUniLabel;
    Edit1: TUniEdit;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Button2: TUniButton;
    Bevel1: TUniPanel;
    Label2: TUniLabel;
    Edit2: TUniEdit;
    sbtnCopyContextID: TUniSpeedButton;
    sbtnCopyWiki: TUniSpeedButton;
    btnOK: TUniButton;
    procedure UniFormCreate(Sender: TObject);
  strict private
    { Private declarations }
    FWiki: string;
    FContextID: string;
  public
    { Public declarations }
    class function DoShowModal( AContext_ID, AWiki: string ): Boolean;
    property ContextID: string read FContextID;
    property Wiki: string read FWiki;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.Controls;

{ TFrmDebugHelpContext }

class function TFrmDebugHelpContext.DoShowModal( AContext_ID,
  AWiki: string ): Boolean;
var
  AForm: TUniForm;
begin
  // Get existing form
//  AForm := IQMS.Common.Controls.FindFormByClassType(Self);

  // If form exists and has same values, then exit
  if Assigned(AForm) and
   (TFrmDebugHelpContext(AForm).FContextID = AContext_ID) and
   (TFrmDebugHelpContext(AForm).Wiki = AWiki) then
   Exit(False);

  with self.Create(uniGUIApplication.UniApplication) do
  begin
    FContextID := AContext_ID;
    FWiki := AWiki;
    Edit1.Text:= AContext_ID;
    Edit2.Text:= AWiki;
    Result:= ShowModal = mrOK;
  end;
end;

procedure TFrmDebugHelpContext.UniFormCreate(Sender: TObject);
begin
  sbtnCopyContextID.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+Edit1.JSName+'_id-inputEl"); '+
      ' textarea.select(); '+
      ' try { '+
      ' var successful = document.execCommand(''copy''); '+
      ' if(successful) console.log(''Copied!''); '+
      ' else console.log(''Unable to copy!''); '+
      ' } catch (err) { '+
      ' console.log(''Unsupported Browser!''); '+
      ' } '+
      ' }';
  sbtnCopyWiki.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+Edit2.JSName+'_id-inputEl"); '+
      ' textarea.select(); '+
      ' try { '+
      ' var successful = document.execCommand(''copy''); '+
      ' if(successful) console.log(''Copied!''); '+
      ' else console.log(''Unable to copy!''); '+
      ' } catch (err) { '+
      ' console.log(''Unsupported Browser!''); '+
      ' } '+
      ' }';
end;

end.
