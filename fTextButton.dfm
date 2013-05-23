object FrameTextButton: TFrameTextButton
  Left = 0
  Top = 0
  Width = 451
  Height = 23
  Align = alTop
  TabOrder = 0
  object btnCopy: TButton
    Left = 376
    Top = 0
    Width = 75
    Height = 23
    Align = alRight
    Caption = #22797#21046
    TabOrder = 0
    OnClick = btnCopyClick
  end
  object edtText: TEdit
    Left = 121
    Top = 0
    Width = 255
    Height = 23
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 21
  end
  object edtTitle: TEdit
    Left = 0
    Top = 0
    Width = 121
    Height = 23
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    ExplicitHeight = 21
  end
end
