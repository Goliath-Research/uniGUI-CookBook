unit IQMS.CRM.SalesQuote.MarkupConst;

interface

uses
  System.Classes;

type
  TMarkupOptionType = (PercentageMarkup, FlatMarkup);

  TMarkupOptions = record
    MarkupOptionType: TMarkupOptionType;
    MarkupValue: Real;
    PercentageCompounded: Boolean;
    ApplyToAll: Boolean;
    ClearAllValues: Boolean;
  end;

  TSalesConfigurationItemMarkup = record
    MarkupOptionType: TMarkupOptionType;
    MarkupValue: Real;
    PercentageCompounded: Boolean;
    procedure Fill(
     AMarkupOptionType: TMarkupOptionType;
     AMarkupValue: Real;
     APercentageCompounded: Boolean);
  end;

implementation

{ TSalesConfigurationItemMarkup }

procedure TSalesConfigurationItemMarkup.Fill(AMarkupOptionType: TMarkupOptionType;
  AMarkupValue: Real; APercentageCompounded: Boolean);
begin
  MarkupOptionType := AMarkupOptionType;
  MarkupValue := AMarkupValue;
  PercentageCompounded := APercentageCompounded;
end;

end.
