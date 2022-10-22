unit IQWebUserDefinedForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniTreeView, uniPanel, uniPageControl,
  uniGUIBaseClasses, uniImageList, uniButton, uniBitBtn, uniSpeedButton,
  DB, DBCtrls;

type
  TUniUserDefinedForm = class(TUniFrame)
    UniContainerPanel1: TUniContainerPanel;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    upnlSpeedButtonBar: TUniPanel;
    UniSpeedButton1: TUniSpeedButton;
    procedure UniSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    FDataLink: TFieldDataLink;
    FActive  : Boolean;
    FSource  : string;
//    CS       : TCriticalSection;
    FCreateChildInProgress: Boolean;

//    FSecurityRegister: TSecurityRegister;

    FLastSourceAttribute: string;

    FSourceAttributeDataLink: TFieldDataLink;
    FTableName: string;

//    FAfterStructureChange: TAfterStructureChange;          // Usr_Flds.pas
//    FOnCheckArchived: TOnCheckArchivedEvent;

    function GetSourceAttributeField: string;
    procedure SetSourceAttributeField(const Value: string);

    function GetSourceAttribute: string;
    property SourceAttribute: string read GetSourceAttribute;

    function  GetDataField:string;
    procedure SetDataField( AValue:string );

    function  GetDataSource : TDataSource;
    procedure SetDataSource( AValue:TDataSource );

    procedure DataChange( Sender: TObject );

    function GetActive: Boolean;
    procedure SetActive(const Value: Boolean);
    procedure SetSource(const Value: string);
    procedure CheckFreeChild;
    procedure CreateChild;
//    procedure SetSecurityRegister(const Value: TSecurityRegister);
    procedure AssignCaption;
//    procedure IQNotifyMessage( var Msg: TMessage ); message iq_Notify;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

  protected
    { Protected declarations }
    procedure Loaded; override;

  public
    { Public declarations }
//    property Child: TFrmUserFieldsBuiltIn read FChild;

    constructor Create( AOwner:TComponent ); override;
    destructor Destroy; override;

  published
    property Active: Boolean read GetActive write SetActive;
    property DataField: string read GetDataField  write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property Source: string read FSource write SetSource;      // table name we create the user form for such as PLM or STANDARD
    property SourceAttributeField: string read GetSourceAttributeField write SetSourceAttributeField;  // extra key data such as INJECTION or GENERIC in case of BOM
    property TableName: string read FTableName write FTableName;
//    property SecurityRegister: TSecurityRegister read FSecurityRegister write SetSecurityRegister;
//    property AfterStructureChange: TAfterStructureChange read FAfterStructureChange write FAfterStructureChange;
//    property OnCheckArchived: TOnCheckArchivedEvent read FOnCheckArchived write FOnCheckArchived;

    property Align;
    property BevelOuter;
    property BevelInner;
//    property BorderStyle;
    property Ctl3D;
    property Font;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnEnter;
    property OnExit;
    property OnResize;
  end;

implementation

{$R *.dfm}



procedure TUniUserDefinedForm.AssignCaption;
begin

end;

procedure TUniUserDefinedForm.CheckFreeChild;
begin

end;

constructor TUniUserDefinedForm.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TUniUserDefinedForm.CreateChild;
begin

end;

procedure TUniUserDefinedForm.DataChange(Sender: TObject);
begin

end;

destructor TUniUserDefinedForm.Destroy;
begin

  inherited;
end;

function TUniUserDefinedForm.GetActive: Boolean;
begin

end;

function TUniUserDefinedForm.GetDataField: string;
begin

end;

function TUniUserDefinedForm.GetDataSource: TDataSource;
begin

end;

function TUniUserDefinedForm.GetSourceAttribute: string;
begin

end;

function TUniUserDefinedForm.GetSourceAttributeField: string;
begin

end;

procedure TUniUserDefinedForm.Loaded;
begin
  inherited;

end;

procedure TUniUserDefinedForm.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;

end;

procedure TUniUserDefinedForm.SetActive(const Value: Boolean);
begin

end;

procedure TUniUserDefinedForm.SetDataField(AValue: string);
begin

end;

procedure TUniUserDefinedForm.SetDataSource(AValue: TDataSource);
begin

end;

procedure TUniUserDefinedForm.SetSource(const Value: string);
begin

end;

procedure TUniUserDefinedForm.SetSourceAttributeField(const Value: string);
begin

end;

procedure TUniUserDefinedForm.UniSpeedButton1Click(Sender: TObject);
begin
  // Spawn User Defined Form Designer
end;

end.
