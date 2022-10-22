unit cc_const;

interface

const
  CC_CARD_TYPES           = $000064; // cc_cardtypes.pas
  //CC_NEW                = $000065; // cc_custcards_new.pas
  CC_ATTACH_CARD          = $000066; // cc_attach.pas
  CC_CUSTOMER_CARDS       = $000067; // cc_custcards.pas
  CC_CHARGE_CARD          = $000068; // cc_charge.pas
  CC_SETTLE_TRANS         = $000069; // cc_settle.pas
  // CC_CHARGE_CARD_SILENT   = $00006A;
  CC_TRANSLOG             = $00006B;
  CC_RESERVED1            = $00006C;

  { 06/19/2012 Hash secret key required so that the methods in
    package, CC_ENCRYPT, can be used.  The value here must match
    exactly the value declared at the top of the package body
    of CC_ENCRYPT. }
  CC_ENCRYPT_HASH_KEY =
   'FC4155E67F33AEF5382DF07D3F3F6C5BD2B31BD760920545CEBFD3409A1DE3A2';
  { OLD VALUE:  CCENCRYPT_PASSWORD = '5B9F85AE92F4484A86D1FA6AA666CDD8';
    06/19/2012 Changed method of encryption. }
  CCENCRYPT_PASSWORD =
    '814C6B259ECEF388C9278C3A496D6EA2925260A8E094C0CB3B434A3EF5A6FD09';

implementation

end.
