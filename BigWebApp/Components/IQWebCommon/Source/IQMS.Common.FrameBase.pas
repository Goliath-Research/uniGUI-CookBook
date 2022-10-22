unit IQMS.Common.FrameBase;

{  How to Use:

   1.  Include this unit, FrameBase, in your project.
   2.  Create a new frame which inherites from IQFrameBase (this unit).
   3.  The owner form of your new frame must implement a method for
       OnCheckSecurity.  In that method, the component is evaluated,
       the security register checked, and the var parameters returned.
   4.  Your new frame must call GetComponentSecurity() to obtain
       security attributes, and then set visible or enabled accordingly.

}

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniGuiFrame;

type
  { Callback procedure }
  TOnCheckSecurity = procedure(const AComponent: TComponent;
    var AEnabled: Boolean; var AVisible: Boolean) of object;

  { TIQFrameBase }
  TIQFrameBase = class(TUniFrame)
    private
      FOnCheckSecurity: TOnCheckSecurity;
      { Private declarations }
    protected
      { Protected declarations }
      procedure GetComponentSecurity(const AComponent: TComponent;
        var AEnabled, AVisible: Boolean);
    public
      { Public declarations }
      property OnCheckSecurity: TOnCheckSecurity
        read FOnCheckSecurity
        write FOnCheckSecurity;
  end;

implementation

{$R *.dfm}

{ TIQFrameBase }

procedure TIQFrameBase.GetComponentSecurity(const AComponent: TComponent;
  var AEnabled, AVisible: Boolean);
begin
  AEnabled := True;
  AVisible := True;
  if Assigned(FOnCheckSecurity) then
    FOnCheckSecurity(AComponent, AEnabled, AVisible);
end;

end.
