unit crm_massmail_types;

interface

uses
  System.Classes,
  System.SysUtils,
  crm_rscstr,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniComboBox;

type
  TCRMMassMailMergeTagCargo = class
    MergeTag: string;
    constructor Create(AMergeTag: string);
  end;

const
  // Example:
  // |*FULL_NAME*|
  MergeTags: array[0..18, 0..1] of string =
  (('*|CAMPAIGN:DESCRIPTION|*',     crm_rscstr.cTXT0001943 ), // 'Campaign Description'
   ('*|CAMPAIGN:NUMBER|*',          crm_rscstr.cTXT0001944 ), // 'Campaign Number'
   ('*|CAMPAIGN:CODE|*',            crm_rscstr.cTXT0001945 ), // 'Campaign Code'
   ('*|RECIP:FIRST_NAME|*',         crm_rscstr.cTXT0001926 ), // 'First Name'
   ('*|RECIP:LAST_NAME|*',          crm_rscstr.cTXT0001927 ), // 'Last Name'
   ('*|RECIP:FULL_NAME|*',          crm_rscstr.cTXT0001928 ), // 'Full Name'
   ('*|RECIP:EMAIL|*',              crm_rscstr.cTXT0001929 ), // 'Email'
   ('*|RECIP:COMPANY|*',            crm_rscstr.cTXT0001930 ), // 'Company'
   ('*|RECIP:TELEPHONE|*',          crm_rscstr.cTXT0001931 ), // 'Telephone'
   ('*|RECIP:FULL_ADDRESS|*',       crm_rscstr.cTXT0001932 ), // 'Full Address'
   ('*|RECIP:ADDRESS1|*',           crm_rscstr.cTXT0001934 ), // 'Address Line 1'
   ('*|RECIP:CITY|*',               crm_rscstr.cTXT0001935 ), // 'City'
   ('*|RECIP:STATE|*',              crm_rscstr.cTXT0001936 ), // 'State or Region'
   ('*|RECIP:POSTAL_CODE|*',        crm_rscstr.cTXT0001937 ), // 'Postal Code'
   ('*|RECIP:COUNTRY|*',            crm_rscstr.cTXT0001938 ), // 'Country'
   ('*|DATE:SHORT|*',               crm_rscstr.cTXT0001939 ), // 'Date (Short Date Format)'
   ('*|DATE:LONG|*',                crm_rscstr.cTXT0001940 ), // 'Date (Long Date Format)'
   ('*|DATE:YEAR|*',                crm_rscstr.cTXT0001941 ), // 'Date (Year)'
   ('*|DATE:MONTH|*',               crm_rscstr.cTXT0001942 )  // 'Date (Month)'
   );

  procedure LoadTypeComboBox(AComboBox: TUniComboBox);
  function SelectedMergeTag(AComboBox: TUniComboBox): string;

implementation

procedure LoadTypeComboBox(AComboBox: TUniComboBox);
var
  i: Integer;
begin
  AComboBox.Items.BeginUpdate;
  try
    AComboBox.Items.Clear;
    for i := 0 to Length(MergeTags) - 1 do
      AComboBox.Items.AddObject(MergeTags[i][1],
        TCRMMassMailMergeTagCargo.Create(MergeTags[i][0]));
  finally
    AComboBox.Items.EndUpdate;
  end;
end;

function SelectedMergeTag(AComboBox: TUniComboBox): string;
begin
  if Assigned(AComboBox) and (AComboBox.ItemIndex > -1) then
    Result := TCRMMassMailMergeTagCargo(AComboBox.Items.
      Objects[AComboBox.ItemIndex]).MergeTag;
end;

{ TCRMMassMailMergeTagCargo }

constructor TCRMMassMailMergeTagCargo.Create(AMergeTag: string);
begin
  MergeTag := AMergeTag;
end;

end.
