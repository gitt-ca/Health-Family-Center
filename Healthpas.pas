unit Healthpas;

  interface
    uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
    Vcl.Imaging.pngimage, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
    FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
    FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
    FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
    FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
    FireDAC.VCLUI.Wait;
  type
  TForm2 = class(TForm)
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label15: TLabel;
    pnlLogin: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ediUser: TEdit;
    edtPass: TEdit;
    btnCadastro: TButton;
    BtnEntrar: TBitBtn;
    LoginSQL: TFDQuery;
    FDConnection2: TFDConnection;
    FDPhysMySQLDriverLink2: TFDPhysMySQLDriverLink;
    procedure btnCadastroClick(Sender: TObject);
    procedure BtnEntrarClick(Sender: TObject);

  private

  public

  end;
  var
  Form2 : TForm2;

  implementation

  {$R *.dfm}

    uses
      Cadastro,Principal;

  procedure TForm2.btnCadastroClick(Sender: TObject);
    begin
    Form3:= TForm3.Create(nil);
    Form3.Show;
    Form3.Position := poScreenCenter;

    end;

procedure TForm2.BtnEntrarClick(Sender: TObject);
var
  strSQLResult: String;
begin
  LoginSQL.SQL.Text := 'SELECT senha FROM usuario WHERE usuario = :valor1';
  LoginSQL.Params.ParamByName('valor1').Value := ediUser.Text;
  LoginSQL.Open; // Para executar a query

  if not LoginSQL.IsEmpty then
  begin
    strSQLResult := LoginSQL.FieldByName('senha').AsString;

    if strSQLResult = edtPass.Text then
    begin
      Form4 := TForm4.Create(nil);
      try
        Form4.ShowModal;
      finally
        FreeAndNil(Form4); // Liberar ram
      end;

    end
    else
      ShowMessage('Senha incorreta!');
  end
  else
    ShowMessage('Usu�rio n�o encontrado!');
  LoginSQL.Close; // Fecha sql
end;


end.
