unit md_login;

interface

uses
  Classes, SysUtils, Data.DB, FireDAC.Stan.Param,
  IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompButton, IWCompEdit, IWHTMLTag {, UserSessionUnit};

type
  TF_login = class(TIWAppForm)
    template_login: TIWTemplateProcessorHTML;
    bt_login: TIWButton;
    ed_usuario: TIWEdit;
    ed_senha: TIWEdit;

    procedure bt_loginAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure IWAppFormShow(Sender: TObject);
    procedure ed_usuarioHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure ed_senhaHTMLTag(ASender: TObject; ATag: TIWHTMLTag);

  public

  end;

implementation

{$R *.dfm}

uses md_principal, ServerController, UserSessionUnit;

procedure TF_login.bt_loginAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if Trim(ed_usuario.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo USUÁRIO!');
    ed_usuario.SetFocus;
    exit;
  end;
  if Trim(ed_senha.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo SENHA!');
    ed_senha.SetFocus;
    exit;
  end;

  with UserSession do
  begin
    if ed_senha.Text = '' then ed_senha.Text := 'NULL';
    T_login.Active := True;
    T_login.Close;
//  T_login.SQL.Clear
//  T_login.SQL.Add('SELECT * FROM T_USUARIOS WHERE USUARIO = :USUARIO AND SENHA = PASSWORD(md5(:SENHA)) ');
    T_login.ParamByName('USUARIO').AsString := ed_usuario.Text;
    T_login.ParamByName('SENHA').AsString := ed_senha.Text;
    T_login.Open;

		if T_login.IsEmpty then
    begin
      WebApplication.ShowMessage('Acesso negado! Usuário e/ou Senha não conferem.');
		end else
		begin
      USR_ID := T_login.FieldByName('ID').AsString;
      USRNAME  := T_login.FieldByName('NOME').AsString;
      USRFUNCTION  := T_login.FieldByName('FUNCAO').AsString;
      USRLEVEL  := T_login.FieldByName('NIVEL').AsString;
      TF_principal.Create(WebApplication).Show;
    end;
  end;

end;

procedure TF_login.ed_usuarioHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('placeholder','Nome do Usuário');
end;

procedure TF_login.ed_senhaHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('placeholder','Senha');
end;

procedure TF_login.IWAppFormShow(Sender: TObject);
begin
  ed_usuario.SetFocus;
end;

initialization
  TF_login.SetAsMainForm;

end.
