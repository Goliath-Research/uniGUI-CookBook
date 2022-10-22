unit Address_Book;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame,
  Address_BookDataModule, uniGUIBaseClasses, uniPanel, IQUniGrid;

type
  TUniAddress_Book = class(TUniFrame)
    IQUniGridControl1: TIQUniGridControl;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TUniAddress_Book.UniFrameCreate(Sender: TObject);
begin
  Address_Book_DM.DoOnFrameCreate(Self);
end;

procedure TUniAddress_Book.UniFrameDestroy(Sender: TObject);
begin
  Address_Book_DM.DoOnFrameDestroy(Self);
end;

end.
