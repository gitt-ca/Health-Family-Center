unit TelaCadPaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TForm6 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    pnl1: TPanel;
    lbl7: TLabel;
    dbnvgr1: TDBNavigator;
    dbgrd1: TDBGrid;
    edtBusca: TEdit;
    edtNomePaciente: TEdit;
    edtTelefonePaciente: TEdit;
    edtEmailPaciente: TEdit;
    edtCpfPaciente: TEdit;
    edtIdadePaciente: TEdit;
    lblEndereco: TLabel;
    edtEnderecoPaciente: TEdit;
    btnSalvar: TBitBtn;
    conConCadPaci: TFDConnection;
    fdphysmysqldrvrlnkPaci: TFDPhysMySQLDriverLink;
    fdqryQueryPaci: TFDQuery;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.btnSalvarClick(Sender: TObject);
var
  DataModule: TDataModule; // Substitua TDataModule pelo nome do seu m�dulo de dados, se necess�rio
begin
  // Obtendo a inst�ncia do DataModule onde est�o os componentes de conex�o com o banco de dados
  DataModule := TDataModule(Application.MainForm.FindComponent('NomeDoSeuDataModule')) as TDataModule;

  // Verificar se os campos obrigat�rios est�o preenchidos antes de inserir
  if (edtNomePaciente.Text <> '') and (edtTelefonePaciente.Text <> '') and
     (edtEmailPaciente.Text <> '') and (edtCpfPaciente.Text <> '') and
     (edtIdadePaciente.Text <> '') and (edtEnderecoPaciente.Text <> '') then
  begin
    // Inserir dados no banco de dados usando um componente de query, como TFDQuery
    DataModule.FDQuery1.SQL.Text := 'INSERT INTO Paciente (NomeUsuario, Idade, CPF, endereco, email, telefone) ' +
      'VALUES (:NomeUsuario, :Idade, :CPF, :endereco, :email, :telefone)';
    DataModule.FDQuery1.ParamByName('NomeUsuario').AsString := edtNomePaciente.Text;
    DataModule.FDQuery1.ParamByName('Idade').AsInteger := StrToIntDef(edtIdadePaciente.Text, 0);
    DataModule.FDQuery1.ParamByName('CPF').AsString := edtCpfPaciente.Text;
    DataModule.FDQuery1.ParamByName('endereco').AsString := edtEnderecoPaciente.Text;
    DataModule.FDQuery1.ParamByName('email').AsString := edtEmailPaciente.Text;
    DataModule.FDQuery1.ParamByName('telefone').AsString := edtTelefonePaciente.Text;

    try
      DataModule.FDQuery1.ExecSQL; // Executa a inser��o no banco de dados

      ShowMessage('Dados inseridos com sucesso!');
      // Limpar os campos ap�s a inser��o, se necess�rio
      edtNomePaciente.Clear;
      edtTelefonePaciente.Clear;
      edtEmailPaciente.Clear;
      edtCpfPaciente.Clear;
      edtIdadePaciente.Clear;
      edtEnderecoPaciente.Clear;

      // Atualizar o DBGrid com os dados inseridos, se necess�rio
      // DataModule.FDQueryGrid.Refresh; // Use o m�todo correto para atualizar o DBGrid
    except
      on E: Exception do
        ShowMessage('Erro ao inserir dados: ' + E.Message);
    end;
  end
  else
    ShowMessage('Preencha todos os campos obrigat�rios!');
end;
