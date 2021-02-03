unit md_usuarios;

interface

uses
  Classes, SysUtils, FireDAC.Stan.Param,
  IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, IWCompEdit, IWCompButton,
  Data.DB, IWCompListbox, IWCompGrids, IWDBGrids, IWCompExtCtrls, IWCompLabel;

type
  TF_usuarios = class(TIWAppForm)
    template_usuarios: TIWTemplateProcessorHTML;
    bt_incluir: TIWButton;
    bt_editar: TIWButton;
    bt_excluir: TIWButton;
    bt_ok: TIWButton;
    bt_cancelar: TIWButton;
    ed_nome: TIWEdit;
    ed_id: TIWEdit;
    ed_senha: TIWEdit;
    ed_buscar: TIWEdit;
    bt_buscar: TIWButton;
    ed_funcao: TIWEdit;
    ed_usuario: TIWEdit;
    ed_nivel: TIWComboBox;
    bt_imprimir: TIWButton;
    link_home: TIWLink;
    m_painel: TIWLink;
    m_aptos: TIWLink;
    m_feriados: TIWLink;
    m_tabeladeprecos: TIWLink;
    m_vendas: TIWLink;
    m_estoque: TIWLink;
    m_produtos: TIWLink;
    m_fornecedores: TIWLink;
    m_compras: TIWLink;
    m_financeiro: TIWLink;
    m_planodecontas: TIWLink;
    m_contasapagarreceber: TIWLink;
    m_lancamentos: TIWLink;
    m_relatorios: TIWLink;
    m_relatoriodeestoque: TIWLink;
    m_relatoriodevendas: TIWLink;
    m_relatoriofinanceiro: TIWLink;
    m_lavanderia: TIWLink;
    m_usuarios: TIWLink;
    m_suportetecnico: TIWLink;
    m_configuracoes: TIWLink;
    m_sair: TIWLink;
    link_usuario: TIWLink;
    link_sair: TIWLink;
    Label_1: TIWLabel;

    procedure IWAppFormShow(Sender: TObject);
    procedure template_usuariosUnknownTag(const AName: string; var VValue: string);
    procedure link_homeClick(Sender: TObject);
    procedure link_sairClick(Sender: TObject);
    procedure m_usuariosClick(Sender: TObject);
    procedure m_fornecedoresClick(Sender: TObject);
    procedure m_produtosClick(Sender: TObject);
    procedure m_vendasClick(Sender: TObject);
    procedure m_financeiroClick(Sender: TObject);
    procedure m_sairClick(Sender: TObject);

    procedure ClearFields();
    procedure SyncFields();
    procedure UpdateAll();
    procedure Search();

    procedure bt_incluirAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_editarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_buscarClick(Sender: TObject);
    procedure bt_okAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_cancelarClick(Sender: TObject);

  private

  public

  end;

implementation

{$R *.dfm}

uses
  ServerController, UserSessionUnit,
  md_login, md_principal, md_fornecedores, md_produtos, md_vendas, md_lancamentos;

procedure TF_usuarios.IWAppFormShow(Sender: TObject);
begin
  Label_1.Caption := USRNAME;
  UpdateAll;
end;

procedure TF_usuarios.template_usuariosUnknownTag(const AName: string;
  var VValue: string);
begin
  if AName = 'GRID_USUARIOS' then
  begin
    with UserSession do
    begin
      T_usuarios.First;
      while not T_usuarios.eof do
      begin
        VValue := VValue + '<tr>'+
        '<td>'+T_usuarios.FieldByName('NOME').AsString+'</td>'+sLineBreak+
        '<td>'+T_usuarios.FieldByName('FUNCAO').AsString+'</td>'+sLineBreak+
        '<td>'+T_usuarios.FieldByName('USUARIO').AsString+'</td>'+sLineBreak+
        '<td>'+T_usuarios.FieldByName('NIVEL').AsString+'</td>'+sLineBreak+
        '<td>'+
        '<a href="#" class="buttom" onclick="return getItemId('+T_usuarios.FieldByName('ID').AsString+', ''editar'')"><img src="icons/931.bmp" width="32" alt="EDITAR" title="EDITAR"></a> '+
        '<a href="#" class="buttom" onclick="return getItemId('+T_usuarios.FieldByName('ID').AsString+', ''excluir'')"><img src="icons/938.bmp" width="32" alt="EXCLUIR" title="EXCLUIR"></a>'+
        '</td>'+sLineBreak+'</tr>';
        T_usuarios.Next;
      end;
    end;
  end;
end;

procedure TF_usuarios.link_homeClick(Sender: TObject);
begin
  TF_principal.Create(WebApplication).Show;
end;

procedure TF_usuarios.link_sairClick(Sender: TObject);
begin
  TF_login.Create(WebApplication).Show;
end;

procedure TF_usuarios.m_usuariosClick(Sender: TObject);
begin
  { usuarios }
end;

procedure TF_usuarios.m_fornecedoresClick(Sender: TObject);
begin
  TF_fornecedores.Create(WebApplication).Show;
end;

procedure TF_usuarios.m_produtosClick(Sender: TObject);
begin
  TF_produtos.Create(WebApplication).Show;
end;

procedure TF_usuarios.m_vendasClick(Sender: TObject);
begin
  TF_vendas.Create(WebApplication).Show;
end;

procedure TF_usuarios.m_financeiroClick(Sender: TObject);
begin
  TF_lancamentos.Create(WebApplication).Show;
end;

procedure TF_usuarios.m_sairClick(Sender: TObject);
begin
  TF_login.Create(WebApplication).Show;
end;

{ ... }

procedure TF_usuarios.ClearFields;
begin
  ed_nome.Text := '';
  ed_funcao.Text := '';
  ed_usuario.Text := '';
  ed_senha.Text := '';
  ed_nivel.ItemIndex := 0;
end;

procedure TF_usuarios.SyncFields;
begin
  with UserSession do
  begin
    T_usuarios.FieldByName('NOME').Value := ed_nome.Text;
    T_usuarios.FieldByName('FUNCAO').Value := ed_funcao.Text;
    T_usuarios.FieldByName('USUARIO').Value := ed_usuario.Text;
    T_usuarios.FieldByName('SENHA').Value  := ed_senha.Text;
    case ed_nivel.ItemIndex of
    0: T_usuarios.FieldByName('NIVEL').Value  := 0;
    1: T_usuarios.FieldByName('NIVEL').Value  := 1;
    2: T_usuarios.FieldByName('NIVEL').Value  := 7;
    3: T_usuarios.FieldByName('NIVEL').Value  := 9;
    end;
  end;
end;

procedure TF_usuarios.UpdateAll;
begin
  with UserSession do
  begin
    T_usuarios.Active := False;
    T_usuarios.Active := True;
    T_usuarios.SQL.Clear;
    T_usuarios.SQL.Add('SELECT * FROM t_usuarios ORDER BY NOME ASC ');
    T_usuarios.Open();
  end;
end;

procedure TF_usuarios.Search;
begin
  with UserSession do
  begin
    T_usuarios.Close;
    T_usuarios.Active := True;
    T_usuarios.SQL.Clear;
    T_usuarios.SQL.Add('SELECT * FROM t_usuarios WHERE NOME LIKE :CHV ORDER BY NOME ASC ');
    T_usuarios.ParamByName('CHV').Value := '%'+ed_buscar.Text+'%';
    T_usuarios.Open();
		if T_usuarios.IsEmpty then WebApplication.ShowMessage('Usuário não encontrado!');
  end;
end;

{ ... }

procedure TF_usuarios.bt_incluirAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  ClearFields;
  ed_nivel.ItemIndex := 0;
  UserSession.T_usuarios.Insert;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
end;

procedure TF_usuarios.bt_editarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  with UserSession do
  begin
    T_usuarios.Locate('ID', ed_id.Text, []);
    T_usuarios.Edit;
    if T_usuarios.FieldByName('ID').IsNull <> true then ed_id.Text := T_usuarios.FieldByName('ID').Value;
    if T_usuarios.FieldByName('NOME').IsNull <> true then ed_nome.Text := T_usuarios.FieldByName('NOME').Value;
    if T_usuarios.FieldByName('FUNCAO').IsNull <> true then ed_funcao.Text := T_usuarios.FieldByName('FUNCAO').Value;
    if T_usuarios.FieldByName('USUARIO').IsNull <> true then ed_usuario.Text := T_usuarios.FieldByName('USUARIO').Value;
    if T_usuarios.FieldByName('SENHA').IsNull <> true then ed_senha.Text := T_usuarios.FieldByName('SENHA').Value;
    if T_usuarios.FieldByName('NIVEL').IsNull <> true then
    case
       T_usuarios.FieldByName('NIVEL').Value of
      0: ed_nivel.ItemIndex := 0;
      1: ed_nivel.ItemIndex := 1;
      7: ed_nivel.ItemIndex := 2;
      9: ed_nivel.ItemIndex := 3;
    end;
  end;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
end;

procedure TF_usuarios.bt_excluirClick(Sender: TObject);
begin
  with UserSession do
  begin
    T_usuarios.Locate('ID', ed_id.Text, []);
    T_usuarios.Delete;
  end;
  UpdateAll;
end;

procedure TF_usuarios.bt_buscarClick(Sender: TObject);
begin
  Search;
end;

procedure TF_usuarios.bt_okAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if Trim(ed_nome.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo NOME!');
    ed_nome.SetFocus;
    exit;
  end;
  if Trim(ed_funcao.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo FUNÇÃO!');
    ed_funcao.SetFocus;
    exit;
  end;
  if Trim(ed_usuario.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo USUÁRIO!');
    ed_usuario.SetFocus;
    exit;
  end;
  if Trim(ed_senha.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo SENHA');
    ed_senha.SetFocus;
    exit;
  end;
  SyncFields;
  UserSession.T_usuarios.Post;
  with UserSession do
  begin
    if ed_senha.Text = '' then ed_senha.Text := 'NULL';
    T_usuarios.DisableControls;
    T_usuarios.SQL.Clear;
    T_usuarios.SQL.Add('UPDATE t_usuarios SET SENHA = PASSWORD(MD5(:PASSWORD)) WHERE ID = :CHV ');
    T_usuarios.ParamByName('PASSWORD').Value := ed_senha.Text;
    T_usuarios.ParamByName('CHV').Value := ed_id.Text;
    T_usuarios.ExecSQL;
    T_usuarios.EnableControls;
  end;
  ClearFields;
  UpdateAll;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
  WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');
end;

procedure TF_usuarios.bt_cancelarClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
end;

end.
