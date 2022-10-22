unit qc_apqp_template;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame,
  qc_apqp_templateDataModule, uniGUIBaseClasses, uniPanel, uniPageControl,
  IQUniGrid;

type
  TUniQCApqpTemplate = class(TUniFrame)
    pnlTop: TUniPanel;
    pnlMiddle: TUniPanel;
    pnlBottom: TUniPanel;
    pcElementDetails: TUniPageControl;
    tsLookupList: TUniTabSheet;
    tsCheckList: TUniTabSheet;
    tsTeamMembers: TUniTabSheet;
    IQUniGridControl1: TIQUniGridControl;
    IQUniGridControl2: TIQUniGridControl;
    IQUniGridControl3: TIQUniGridControl;
    IQUniGridControl4: TIQUniGridControl;
    IQUniGridControl5: TIQUniGridControl;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TUniQCApqpTemplate.UniFrameCreate(Sender: TObject);
begin
  QCApqpTemplate_DM.DoOnFrameCreate(Self);
end;

procedure TUniQCApqpTemplate.UniFrameDestroy(Sender: TObject);
begin
  QCApqpTemplate_DM.DoOnFrameDestroy(Self);
end;

end.
