object ADLogin: TADLogin
  OldCreateOrder = False
  Height = 93
  Width = 92
  object ldap1: TipwLDAP
    FirewallAutoDetect = True
    OnSearchResult = ldap1SearchResult
    Left = 31
    Top = 22
  end
end
