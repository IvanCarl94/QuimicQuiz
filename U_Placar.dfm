object U_FrmPlacar: TU_FrmPlacar
  Left = 0
  Top = 0
  Caption = 'Placar'
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
    ParentBackground = False
    TabOrder = 0
    object PLACAR: TLabel
      Left = 184
      Top = 24
      Width = 82
      Height = 24
      Caption = 'PLACAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 112
      Top = 64
      Width = 241
      Height = 201
      Color = clBtnShadow
      DataSource = DataSource1
      FixedColor = clBtnShadow
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_JOGADOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_PONTUACAO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PONTOS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_JOGADOR_1'
          Width = 64
          Visible = True
        end>
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Ivanderson\Desktop\ADS 3'#186' semestre\Delphi\TRAB' +
        'ALHOFINAL.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 384
    Top = 40
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 384
    Top = 104
  end
  object FDQueryPlacar: TFDQuery
    Connection = FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'select *  from jogador as j'
      'inner join pontuacao as p'
      'on j.id_jogador = p.id_jogador'
      ''
      '')
    Left = 392
    Top = 200
    object FDQueryPlacarID_JOGADOR: TIntegerField
      FieldName = 'ID_JOGADOR'
      Origin = 'ID_JOGADOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPlacarNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 30
    end
    object FDQueryPlacarDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
    end
    object FDQueryPlacarID_PONTUACAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_PONTUACAO'
      Origin = 'ID_PONTUACAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryPlacarPONTOS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PONTOS'
      Origin = 'PONTOS'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryPlacarDATA: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryPlacarID_JOGADOR_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_JOGADOR_1'
      Origin = 'ID_JOGADOR'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQueryPlacar
    Left = 392
    Top = 264
  end
end
