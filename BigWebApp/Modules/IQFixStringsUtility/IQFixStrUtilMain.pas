unit IQFixStrUtilMain;

interface

uses
  Vcl.Forms,
  System.Classes,
  Vcl.Controls,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniGUIBaseClasses;

type
  TFrmIQFixStrUtilMain = class(TUniForm)
    btnFixDelphiDebugStr: TUniButton;
    Button1: TUniButton;
    btnFixDelphiUsesList: TUniButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFixDelphiDebugStrClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnFixDelphiUsesListClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

uses
  fix_debug_string,
  fix_file_lines,
  MainModule,
//  fix_uses_list,
  IQMS.Common.RegFrm;

procedure TFrmIQFixStrUtilMain.FormCreate(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]);
end;

procedure TFrmIQFixStrUtilMain.btnFixDelphiDebugStrClick(Sender: TObject);
begin
  fix_debug_string.DoShow;
end;

procedure TFrmIQFixStrUtilMain.btnFixDelphiUsesListClick(Sender: TObject);
begin
//  fix_uses_list.TFrmFixUsesList.DoShow(Self);
end;

procedure TFrmIQFixStrUtilMain.Button1Click(Sender: TObject);
begin
  fix_file_lines.DoShow;
end;

procedure TFrmIQFixStrUtilMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
end;

end.
