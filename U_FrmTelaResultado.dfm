object frmTelaResultado: TfrmTelaResultado
  Left = 0
  Top = 0
  Caption = 'QuimicQuiz'
  ClientHeight = 452
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 452
    Align = alClient
    TabOrder = 0
    object lbResultado: TLabel
      Left = 184
      Top = 104
      Width = 56
      Height = 13
      Caption = 'lbResultado'
    end
    object Label1: TLabel
      Left = 152
      Top = 24
      Width = 135
      Height = 24
      Caption = 'FIM DE JOGO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object btJogarNovamente: TButton
      Left = 72
      Top = 208
      Width = 107
      Height = 25
      Caption = 'Jogar Novamente'
      TabOrder = 0
    end
    object btVerPlacar: TButton
      Left = 264
      Top = 208
      Width = 91
      Height = 25
      Caption = 'Ver Placar'
      TabOrder = 1
      OnClick = btVerPlacarClick
    end
    object btSair: TButton
      Left = 176
      Top = 264
      Width = 75
      Height = 25
      Caption = 'Sair do Jogo'
      TabOrder = 2
      OnClick = btSairClick
    end
  end
end
