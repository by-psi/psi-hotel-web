program psi_hotel;

uses
  IWRtlFix,
  IWJclStackTrace,
  IWJclDebug,
  Forms,
  IWStart,
  md_login in 'md_login.pas' {F_login: TIWAppForm},
  md_principal in 'md_principal.pas' {F_principal: TIWAppForm},
  md_aptos in 'md_aptos.pas' {F_aptos: TIWAppForm},
  md_tabeladeprecos in 'md_tabeladeprecos.pas' {F_tabeladeprecos: TIWAppForm},
  md_feriados in 'md_feriados.pas' {F_feriados: TIWAppForm},
  md_vendas in 'md_vendas.pas' {F_vendas: TIWAppForm},
  md_produtos in 'md_produtos.pas' {F_produtos: TIWAppForm},
  md_fornecedores in 'md_fornecedores.pas' {F_fornecedores: TIWAppForm},
  md_compras in 'md_compras.pas' {F_compras: TIWAppForm},
  md_planodecontas in 'md_planodecontas.pas' {F_planodecontas: TIWAppForm},
  md_lancamentos in 'md_lancamentos.pas' {F_lancamentos: TIWAppForm},
  md_usuarios in 'md_usuarios.pas' {F_usuarios: TIWAppForm},
  ServerController in 'ServerController.pas' {F_server: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {F_session: TIWUserSessionBase};

{$R *.res}

begin
  TIWStart.Execute(True);
end.
