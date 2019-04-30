unit U_Placar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TU_FrmPlacar = class(TForm)
    FDConnection1: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDQueryPlacar: TFDQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    PLACAR: TLabel;
    FDQueryPlacarID_JOGADOR: TIntegerField;
    FDQueryPlacarNOME: TStringField;
    FDQueryPlacarDATA_NASCIMENTO: TDateField;
    FDQueryPlacarID_PONTUACAO: TIntegerField;
    FDQueryPlacarPONTOS: TIntegerField;
    FDQueryPlacarDATA: TDateField;
    FDQueryPlacarID_JOGADOR_1: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  U_FrmPlacar: TU_FrmPlacar;

implementation

{$R *.dfm}


end.
