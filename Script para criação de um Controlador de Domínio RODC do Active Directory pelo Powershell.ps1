# Script para criação de um Controlador de Domínio RODC do Active Directory pelo Powershell - Créditos Gabriel Luiz - www.gabrielluiz.com #


# Executa os pré-requisitos somente para instalar um controlador de domínio no Active Directory.


Test-ADDSDomainControllerInstallation -InstallDns -DomainName "gabrielluiz.lan"


<#

Explicação do comando: Test-ADDSDomainControllerInstallation -InstallDns -DomainName "gabrielluiz.lan"

Este comando executa os pré-requisitos para determinar se a instalação de um controlador de domínio juntamente com o servidor DNS no domínio gabrielluiz.lan. 

O comando também solicita ao usuário que entre e confirme a senha do DSRM.

#>


# Instalação da função ADDS ( Active Directory Domain Services).

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools


<#

Explicação do comando: Install-WindowsFeature -Name AD-Domain-Services - IncludeManagementTools

Install-WindowsFeature - Este comando permitirá instalar a função do Windows, os serviços de função ou o recurso do Windows no servidor local ou remoto. É semelhante ao uso do gerenciador de servidores do Windows para instalá-los.

-Name AD-Domain-Services - Nome da função a ser instalada, neste exemplo será o Active Directory Domain Services.

-IncludeManagementTools - Isso instalará as ferramentas de gerenciamento para o serviço de função selecionado.

#>



# Executa os pré-requisitos para adicionar uma conta RODC.


Test-ADDSReadOnlyDomainControllerAccountCreation -DomainControllerAccountName ADDSRODC1 -DomainName gabrielluiz.lan -SiteName BH -DelegatedAdministratorAccountName "GABRIELlUIZ\G-DL-RODC" -DenyPasswordReplicationAccountName "GABRIELlUIZ\Denied RODC Password Replication Group", "BUILTIN\Administrators", "BUILTIN\Server Operators", "BUILTIN\Backup Operators", "BUILTIN\Account Operators" -allowpasswordreplicationaccountname "GABRIELlUIZ\Allowed RODC Password Replication Group" -ReplicationSourceDC ADDS1.gabrielluiz.lan


<#


Explicação do comando: Test-ADDSReadOnlyDomainControllerAccountCreation -DomainControllerAccountName ADDSRODC1 -DomainName gabrielluiz.lan -SiteName BH -DelegatedAdministratorAccountName "GABRIELlUIZ\G-DL-RODC" -DenyPasswordReplicationAccountName "GABRIELlUIZ\Denied RODC Password Replication Group", "BUILTIN\Administrators", "BUILTIN\Server Operators", "BUILTIN\Backup Operators", "BUILTIN\Account Operators" -allowpasswordreplicationaccountname "GABRIELlUIZ\Allowed RODC Password Replication Group" -ReplicationSourceDC ADDS1.gabrielluiz.lan

Test-ADDSReadOnlyDomainControllerAccountCreatio - Este comando executa os pré-requisitos para determinar se é possivel criar uma conta RODC.

-DomainControllerAccountName - Especifica o nome da conta RODC que este comando cria.

-DomainName - Especifica o nome de domínio para o nome de usuário da operação. Este parâmetro é obrigatório. Você deve especificar a floresta onde planeja instalar o controlador de domínio ou criar uma conta RODC.

SiteName - Especifica o nome de um site existente onde você pode colocar o novo controlador de domínio. O valor padrão depende do tipo de instalação. Para uma nova floresta, o padrão é Default-First-Site-Name. Para todas as outras instalações, o padrão é o site associado à sub-rede que inclui o endereço IP deste servidor. Se esse site não existir, o padrão será o site do controlador de domínio de origem de replicação.

-DelegatedAdministratorAccountName - Especifica o nome do usuário ou grupo que instala e administra o RODC.

-DenyPasswordReplicationAccountName - Especifica os nomes de contas de usuário, contas de grupo e contas de computador cujas senhas não devem ser replicadas para este RODC. Use Nenhum se não quiser negar a replicação de credenciais de nenhum usuário ou computador. Por padrão, Administradores, Operadores de Servidor, Operadores de Backup, Operadores de Conta e o Grupo de Replicação de Senha RODC Negado são negados. Por padrão, o grupo de replicação de senha RODC negado inclui editores de certificados, administradores de domínio, administradores corporativos, controladores de domínio corporativos, controladores de domínio somente leitura corporativos, proprietários criadores de políticas de grupo, a conta krbtgt e administradores de esquemas.

-allowpasswordreplicationaccountname - Especifica os nomes de contas de usuário, contas de grupo e contas de computador cujas senhas podem ser replicadas para este RODC. Use None se quiser manter o valor vazio. Por padrão, somente o Grupo de Replicação de Senha RODC Permitido é permitido e é originalmente criado vazio.

-ReplicationSourceDC - Especifica o nome do controlador de domínio totalmente gravável a ser usado na criação da conta RODC no Active Directory.


#>



# Cria uma conta RODC que pode ser usada para instalar um Controlador de Domínio RODC no Active Directory.



Add-addsreadonlydomaincontrolleraccount -DomainControllerAccountName ADDSRODC1 -DomainName gabrielluiz.lan -SiteName BH -DelegatedAdministratorAccountName "GABRIELlUIZ\G-DL-RODC" -DenyPasswordReplicationAccountName "GABRIELlUIZ\Denied RODC Password Replication Group", "BUILTIN\Administrators", "BUILTIN\Server Operators", "BUILTIN\Backup Operators", "BUILTIN\Account Operators" -allowpasswordreplicationaccountname "GABRIELlUIZ\Allowed RODC Password Replication Group" -ReplicationSourceDC ADDS1.gabrielluiz.lan


<#


Explicação do comando: Add-addsreadonlydomaincontrolleraccount -DomainControllerAccountName ADDSRODC1 -DomainName gabrielluiz.lan -SiteName BH -DelegatedAdministratorAccountName "GABRIELlUIZ\G-DL-RODC" -DenyPasswordReplicationAccountName "GABRIELlUIZ\Denied RODC Password Replication Group", "BUILTIN\Administrators", "BUILTIN\Server Operators", "BUILTIN\Backup Operators", "BUILTIN\Account Operators" -allowpasswordreplicationaccountname "GABRIELlUIZ\Allowed RODC Password Replication Group" -ReplicationSourceDC ADDS1.gabrielluiz.lan

Add-addsreadonlydomaincontrolleraccoun - Cria uma conta de controlador de domínio somente leitura (RODC) que pode ser usada para instalar um RODC no Active Directory.

-DomainControllerAccountName - Especifica o nome da conta RODC que este comando cria.

-DomainName - Especifica o nome de domínio para o nome de usuário da operação. Este parâmetro é obrigatório. Você deve especificar a floresta onde planeja instalar o controlador de domínio ou criar uma conta RODC.

SiteName - Especifica o nome de um site existente onde você pode colocar o novo controlador de domínio. O valor padrão depende do tipo de instalação. Para uma nova floresta, o padrão é Default-First-Site-Name. Para todas as outras instalações, o padrão é o site associado à sub-rede que inclui o endereço IP deste servidor. Se esse site não existir, o padrão será o site do controlador de domínio de origem de replicação.

-DelegatedAdministratorAccountName - Especifica o nome do usuário ou grupo que instala e administra o RODC.

-DenyPasswordReplicationAccountName - Especifica os nomes de contas de usuário, contas de grupo e contas de computador cujas senhas não devem ser replicadas para este RODC. Use Nenhum se não quiser negar a replicação de credenciais de nenhum usuário ou computador. Por padrão, Administradores, Operadores de Servidor, Operadores de Backup, Operadores de Conta e o Grupo de Replicação de Senha RODC Negado são negados. Por padrão, o grupo de replicação de senha RODC negado inclui editores de certificados, administradores de domínio, administradores corporativos, controladores de domínio corporativos, controladores de domínio somente leitura corporativos, proprietários criadores de políticas de grupo, a conta krbtgt e administradores de esquemas.

-allowpasswordreplicationaccountname - Especifica os nomes de contas de usuário, contas de grupo e contas de computador cujas senhas podem ser replicadas para este RODC. Use None se quiser manter o valor vazio. Por padrão, somente o Grupo de Replicação de Senha RODC Permitido é permitido e é originalmente criado vazio.

-ReplicationSourceDC - Especifica o nome do controlador de domínio totalmente gravável a ser usado na criação da conta RODC no Active Directory.


#>




Add-addsreadonlydomaincontrolleraccount -DomainControllerAccountName ADDSRODC1 -DomainName gabrielluiz.lan -SiteName BH -DelegatedAdministratorAccountName "GABRIELlUIZ\G-DL-RODC" -DenyPasswordReplicationAccountName "GABRIELlUIZ\Denied RODC Password Replication Group", "BUILTIN\Administrators", "BUILTIN\Server Operators", "BUILTIN\Backup Operators", "BUILTIN\Account Operators" -allowpasswordreplicationaccountname "GABRIELlUIZ\Allowed RODC Password Replication Group" -NoGlobalCatalog -InstallDNS -ReplicationSourceDC ADDS1.gabrielluiz.lan


<#


Explicação do comando: Mesma opções do comando apresentado acima Add-addsreadonlydomaincontrolleraccount, mas com uma diferença a adição de dois parâmetro.


-NoGlobalCatalog - Indica que o comando não define o RODC como um servidor de catálogo global.


-InstallDns - Indica que o comando instala o serviço Servidor DNS. Se nenhum valor for fornecido, o comportamento padrão é calcular automaticamente o comportamento de configuração do DNS com base no ambiente existente.


#>




# Importa o módulo ADDSDeployment.


Import-Module ADDSDeployment



# Instala um novo Controlador de Domínio RODC do Active Directory.


Install-ADDSDomainController -Credential (Get-Credential) -CriticalReplicationOnly:$false -DatabasePath "C:\Windows\NTDS" -DomainName "gabrielluiz.lan" -LogPath "C:\Windows\NTDS" -ReplicationSourceDC "ADDS1.gabrielluiz.lan" -SYSVOLPath "C:\Windows\SYSVOL" -UseExistingAccount:$true  -Norebootoncompletion:$false -Force:$true



<# 

Explicação do comando: Install-ADDSDomainController -Credential (Get-Credential) -CriticalReplicationOnly:$false -DatabasePath "C:\Windows\NTDS" -DomainName "gabrielluiz.lan" -LogPath "C:\Windows\NTDS" -ReplicationSourceDC "ADDS1.gabrielluiz.lan" -SYSVOLPath "C:\Windows\SYSVOL" -UseExistingAccount:$true  -Norebootoncompletion:$false -Force:$true


Install-ADDSDomainController - Este comando permitirá instalar um novo controlador de domínio do Active Directory.


-Credential (Get-Credential) - Especifica o nome de usuário e a senha que correspondem à conta usada para instalar o controlador de domínio. Use Get-Credential para solicitar que o usuário forneça uma senha.


-CriticalReplicationOnly:$false - Indica que o comando executa apenas a replicação crítica antes da reinicialização e continua durante a operação de instalação do AD DS. Esse parâmetro ignora a parte não crítica e potencialmente longa da replicação. A replicação não crítica ocorre após a conclusão da instalação e a reinicialização do computador. Por padrão, o comando executa partes críticas e não críticas da replicação.


-DatabasePath "C:\Windows\NTDS" - Este parâmetro será usado para definir o caminho da pasta para armazenar o arquivo de banco de dados do Active Directory (Ntds.dit).


-DomainName "gabrielluiz.lan" - Este parâmetro define o FQDN para o domínio do Active Directory.


-LogPath "C:\Windows\NTDS" - O caminho do log pode ser usado para especificar o local para salvar os arquivos de log do domínio.


-ReplicationSourceDC "ADDS1.gabrielluiz.lan" - Especifica o nome do controlador de domínio a ser usado como fonte de replicação para este controlador de domínio RODC.


-SysvolPath "C:\Windows\SYSVOL" - Isso é para definir o caminho da pasta SYSVOL. O local padrão para ele será C:\Windows.


-UseExistingAccount:$true - Indica que o comando anexa um servidor a uma conta RODC existente. Se especificado, um membro do grupo Admins. do Domínio ou um usuário delegado pode executar este comando.


-Norebootoncompletion:$false - Indica que o comando não reinicia o computador após a conclusão da operação para instalar o controlador de domínio. Por padrão, se esse parâmetro for omitido, o computador será reiniciado após a conclusão da operação de instalação. Como regra geral, o suporte da Microsoft recomenda que você não use esse parâmetro, exceto para fins de teste ou solução de problemas, porque depois que a configuração for concluída, o servidor não funcionará corretamente como servidor membro ou controlador de domínio até que seja reinicializado.



-Force:$true - Por padrão, o sistema reiniciará o servidor após a configuração do controlador de domínio. usar este comando pode impedir a reinicialização automática do sistema.



#>




# Validação do novo controlador de domínio RODC do Active Directory.



# Este comando verfica dos serviços devem estar em execução.

Get-Service adws,kdc,netlogon,dns


# Este comando listará todos os detalhes de configuração do controlador de domínio.


Get-ADDomainController


# Este comando listará os detalhes sobre o domínio do Active Directory.


Get-ADDomain gabrielluiz.lan


# Este comando listará os detalhes da floresta do Active Directory.


Get-ADForest gabrielluiz.lan


# Este comando mostrará se o controlador de domínio está compartilhando a pasta SYSVOL.


Get-smbshare SYSVOL


# Este comando mostrará se o controlador de domínio está localizado no site AD correto, seu endereço de IP, seu hostname.

Get-ADDomainController -Discover



# Adiciona usuários, computadores, grupos ou outras conta à lista permitida de uma diretiva de replicação de senha de controlador de domínio somente leitura (RODC).



Add-ADDomainControllerPasswordReplicationPolicy -Identity ADDSRODC1 -AllowedList "carlos.luiz","DESKTOP-WIN10$"



<# 


Explicação do comando: Add-ADDomainControllerPasswordReplicationPolicy -Identity ADDSRODC1 -AllowedList "carlos.luiz","DESKTOP-WIN10$"


Add-ADDomainControllerPasswordReplicationPolicy - Adiciona usuários, computadores, grupos ou outras conta à lista permitida ou negada de uma diretiva de replicação de senha de controlador de domínio somente leitura.


-Identity ADDSRODC1 - Especifica um objeto de controlador de domínio do Active Directory fornecendo um dos seguintes valores.

O identificador entre parênteses é o nome de exibição do Lightweight Directory Access Protocol (LDAP) para o atributo.

Os valores aceitáveis para este parâmetro são:

Um GUID (objectGUID)
Um Endereço IPV4
Um Endereço IPV6 Global
Um nome de host DNS (dNSHostName)
Um nome do objeto do servidor
Um nome distinto do objeto de configurações NTDS
Um nome distinto do objeto do servidor que representa o controlador de domínio
Um GUID do objeto de configurações NTDS na partição de configuração
Um GUID do objeto do servidor na partição de configuração
Um nome distinto do objeto de computador que representa o controlador de domínio


O comando pesquisa o contexto de nomenclatura padrão ou a partição para localizar o objeto.
Se dois ou mais objetos forem encontrados, o cmdlet retornará um erro sem finalização.
Esse parâmetro também pode obter esse objeto por meio do pipeline ou você pode definir esse parâmetro para uma instância de objeto.


-AllowedList "carlos.luiz","DESKTOP-WIN10$"

Especifica os usuários, computadores, grupos ou outras contas a serem adicionadas à lista de contas com permissão para replicar suas senhas para este RODC.

Você pode especificar mais de um valor usando uma lista separada por vírgulas.

Os valores aceitáveis para este parâmetro são:

Um nome distinto
Um GUID (objectGUID)
Um identificador de segurança (objectSid)
Um nome de conta do Security Accounts Manager (SAM)(sAMAccountName)


#>



# Adiciona usuários, computadores, grupos ou outras conta à lista negada de uma diretiva de replicação de senha de controlador de domínio somente leitura (RODC).



Add-ADDomainControllerPasswordReplicationPolicy -Identity ADDSRODC1 -DeniedList "luiza.luiz","DESKTOP-WIN11$"



<# 


Explicação do comando: Add-ADDomainControllerPasswordReplicationPolicy -Identity ADDSRODC1 -DeniedList "luiza.luiz","DESKTOP-WIN11$"


Add-ADDomainControllerPasswordReplicationPolicy - Adiciona usuários, computadores, grupos ou outras conta à lista permitida ou negada de uma diretiva de replicação de senha de controlador de domínio somente leitura.


-Identity ADDSRODC1 - Especifica um objeto de controlador de domínio do Active Directory fornecendo um dos seguintes valores.

O identificador entre parênteses é o nome de exibição do Lightweight Directory Access Protocol (LDAP) para o atributo.

Os valores aceitáveis para este parâmetro são:

Um GUID (objectGUID)
Um Endereço IPV4
Um Endereço IPV6 Global
Um nome de host DNS (dNSHostName)
Um nome do objeto do servidor
Um nome distinto do objeto de configurações NTDS
Um nome distinto do objeto do servidor que representa o controlador de domínio
Um GUID do objeto de configurações NTDS na partição de configuração
Um GUID do objeto do servidor na partição de configuração
Um nome distinto do objeto de computador que representa o controlador de domínio


O comando pesquisa o contexto de nomenclatura padrão ou a partição para localizar o objeto.
Se dois ou mais objetos forem encontrados, o cmdlet retornará um erro sem finalização.
Esse parâmetro também pode obter esse objeto por meio do pipeline ou você pode definir esse parâmetro para uma instância de objeto.


-DeniedList "luiza.luiz","DESKTOP-WIN11$"

Especifica os usuários, computadores, grupos ou outras contas a serem adicionadas à lista de contas às quais é negado o direito de replicar suas senhas para este RODC.

Você pode especificar mais de um valor usando uma lista separada por vírgulas.

Os valores aceitáveis para este parâmetro são:

Um nome distinto
Um GUID (objectGUID)
Um identificador de segurança (objectSid)
Um nome de conta do Security Accounts Manager (SAM)(sAMAccountName)


#>




# Remover usuários, computadores, grupos ou outras conta à lista permitida ou negada de uma diretiva de replicação de senha de controlador de domínio somente leitura (RODC).



Remove-ADDomainControllerPasswordReplicationPolicy -Identity "ADDSRODC1" -AllowedList "carlos.luiz","DESKTOP-WIN10$"



<# 


Explicação do comando: Remove-ADDomainControllerPasswordReplicationPolicy -Identity "ADDSRODC1" -AllowedList "carlos.luiz","DESKTOP-WIN10$"


Remove-ADDomainControllerPasswordReplicationPolicy - Remove usuários, computadores, grupos ou outras conta à lista permitida ou negada de uma diretiva de replicação de senha de controlador de domínio somente leitura.


-Identity ADDSRODC1 - Especifica um objeto de controlador de domínio do Active Directory fornecendo um dos seguintes valores.

O identificador entre parênteses é o nome de exibição do Lightweight Directory Access Protocol (LDAP) para o atributo.

Os valores aceitáveis para este parâmetro são:

Um GUID (objectGUID)
Um Endereço IPV4
Um Endereço IPV6 Global
Um nome de host DNS (dNSHostName)
Um nome do objeto do servidor
Um nome distinto do objeto de configurações NTDS
Um nome distinto do objeto do servidor que representa o controlador de domínio
Um GUID do objeto de configurações NTDS na partição de configuração
Um GUID do objeto do servidor na partição de configuração
Um nome distinto do objeto de computador que representa o controlador de domínio


O comando pesquisa o contexto de nomenclatura padrão ou a partição para localizar o objeto.
Se dois ou mais objetos forem encontrados, o cmdlet retornará um erro sem finalização.
Esse parâmetro também pode obter esse objeto por meio do pipeline ou você pode definir esse parâmetro para uma instância de objeto.


-AllowedList "carlos.luiz","DESKTOP-WIN10$"

Especifica os usuários, computadores, grupos ou outras contas a serem adicionadas à lista de contas com permissão para replicar suas senhas para este RODC.

Você pode especificar mais de um valor usando uma lista separada por vírgulas.

Os valores aceitáveis para este parâmetro são:

Um nome distinto
Um GUID (objectGUID)
Um identificador de segurança (objectSid)
Um nome de conta do Security Accounts Manager (SAM)(sAMAccountName)


#>




Remove-ADDomainControllerPasswordReplicationPolicy -Identity "ADDSRODC1" -DeniedList "luiza.luiz","DESKTOP-WIN11$"


<# 


Explicação do comando: Remove-ADDomainControllerPasswordReplicationPolicy -Identity "ADDSRODC1" -DeniedList "luiza.luiz","DESKTOP-WIN11$"


Remove-ADDomainControllerPasswordReplicationPolicy - Remove usuários, computadores, grupos ou outras conta à lista permitida ou negada de uma diretiva de replicação de senha de controlador de domínio somente leitura.


-Identity ADDSRODC1 - Especifica um objeto de controlador de domínio do Active Directory fornecendo um dos seguintes valores.

O identificador entre parênteses é o nome de exibição do Lightweight Directory Access Protocol (LDAP) para o atributo.

Os valores aceitáveis para este parâmetro são:

Um GUID (objectGUID)
Um Endereço IPV4
Um Endereço IPV6 Global
Um nome de host DNS (dNSHostName)
Um nome do objeto do servidor
Um nome distinto do objeto de configurações NTDS
Um nome distinto do objeto do servidor que representa o controlador de domínio
Um GUID do objeto de configurações NTDS na partição de configuração
Um GUID do objeto do servidor na partição de configuração
Um nome distinto do objeto de computador que representa o controlador de domínio


O comando pesquisa o contexto de nomenclatura padrão ou a partição para localizar o objeto.
Se dois ou mais objetos forem encontrados, o cmdlet retornará um erro sem finalização.
Esse parâmetro também pode obter esse objeto por meio do pipeline ou você pode definir esse parâmetro para uma instância de objeto.


-DeniedList "luiza.luiz","DESKTOP-WIN11$"

Especifica os usuários, computadores, grupos ou outras contas a serem adicionadas à lista de contas às quais é negado o direito de replicar suas senhas para este RODC.

Você pode especificar mais de um valor usando uma lista separada por vírgulas.

Os valores aceitáveis para este parâmetro são:

Um nome distinto
Um GUID (objectGUID)
Um identificador de segurança (objectSid)
Um nome de conta do Security Accounts Manager (SAM)(sAMAccountName)


#>

# Obtém os membros da lista permitida ou negada da política de replicação de senha de um controlador de domínio RODC do Active Directory.




# Obtém os membros da lista permitida da política de replicação de senha de um controlador de domínio somente leitura (RODC).


Get-ADDomainControllerPasswordReplicationPolicy -Identity ADDSRODC1 -Allowed


<# 


Explicação do comando: Get-ADDomainControllerPasswordReplicationPolicy -Identity ADDSRODC1 -Allowed


Get-ADDomainControllerPasswordReplicationPolicy - Obtém os membros da lista permitida ou negada da política de replicação de senha de um controlador de domínio somente leitura.

-Identity ADDSRODC1 - Especifica um objeto de controlador de domínio do Active Directory fornecendo um dos seguintes valores.

O identificador entre parênteses é o nome de exibição do Lightweight Directory Access Protocol (LDAP) para o atributo.

Os valores aceitáveis para este parâmetro são:

Um GUID (objectGUID)
Um Endereço IPV4
Um Endereço IPV6 Global
Um nome de host DNS (dNSHostName)
Um nome do objeto do servidor
Um nome distinto do objeto de configurações NTDS
Um nome distinto do objeto do servidor que representa o controlador de domínio
Um GUID do objeto de configurações NTDS na partição de configuração
Um GUID do objeto do servidor na partição de configuração
Um nome distinto do objeto de computador que representa o controlador de domínio


O comando pesquisa o contexto de nomenclatura padrão ou a partição para localizar o objeto.
Se dois ou mais objetos forem encontrados, o cmdlet retornará um erro sem finalização.
Esse parâmetro também pode obter esse objeto por meio do pipeline ou você pode definir esse parâmetro para uma instância de objeto.


-Allowed - Especifica na pesquisa os usuários, computadores, grupos ou outras contas às quais é permitido o direito de replicar suas senhas para este controlador de domínio somente leitura (RODC).


#>


# Obtém os membros da lista permitida da política de replicação de senha de um controlador de domínio somente leitura (RODC).


Get-ADDomainControllerPasswordReplicationPolicy -Identity ADDSRODC1 -Denied


<# 


Explicação do comando: Get-ADDomainControllerPasswordReplicationPolicy -Identity ADDSRODC1 -Denied


-Denied - Especifica na pesquisa os usuários, computadores, grupos ou outras contas às quais é negado o direito de replicar suas senhas para este controlador de domínio somente leitura (RODC).


#>



<#

Referências:


https://learn.microsoft.com/en-us/powershell/module/servermanager/install-windowsfeature?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/pt-br/powershell/module/addsdeployment/test-addsreadonlydomaincontrolleraccountcreation?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/pt-br/powershell/module/addsdeployment/add-addsreadonlydomaincontrolleraccount?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/pt-br/powershell/module/microsoft.powershell.core/import-module?view=powershell-7.3&WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/addsdeployment/test-addsdomaincontrollerinstallation?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/addsdeployment/install-addsdomaincontroller?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-service?view=powershell-7.2&WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/activedirectory/get-addomaincontroller?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/activedirectory/get-addomain?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/activedirectory/get-adforest?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/smbshare/get-smbshare?WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/activedirectory/get-addomaincontrollerpasswordreplicationpolicy?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/activedirectory/add-addomaincontrollerpasswordreplicationpolicy?view=windowsserver2022-ps&WT.mc_id=5003815

https://learn.microsoft.com/en-us/powershell/module/activedirectory/remove-addomaincontrollerpasswordreplicationpolicy?view=windowsserver2022-ps&WT.mc_id=5003815

#>
