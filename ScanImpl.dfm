object ScanX: TScanX
  Left = 355
  Top = 231
  Width = 581
  Height = 183
  Caption = 'ScanX'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    573
    151)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 556
    Height = 137
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' Debug Console '
    TabOrder = 0
    DesignSize = (
      556
      137)
    object Memo1: TMemo
      Left = 8
      Top = 16
      Width = 540
      Height = 113
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -12
      Font.Name = 'Lucida Console'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object Twain: TDelphiTwain
    OnAcquireCancel = TwainAcquireCancel
    OnTwainAcquire = TwainTwainAcquire
    OnAcquireError = TwainAcquireError
    TransferMode = ttmMemory
    SourceCount = 0
    Info.MajorVersion = 1
    Info.MinorVersion = 0
    Info.Language = tlUserLocale
    Info.CountryCode = 1
    Info.Groups = [tgControl, tgImage]
    Info.VersionInfo = 'Application name'
    Info.Manufacturer = 'Application manufacturer'
    Info.ProductFamily = 'App product family'
    Info.ProductName = 'App product name'
    LibraryLoaded = False
    SourceManagerLoaded = False
    Left = 48
  end
  object httpClient: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 88
  end
end
