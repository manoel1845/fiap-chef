Documentação Trabalho de Orquestração e Automação
=================================================

Escopo do trabalho
-------------------
Você trabalha em uma grande empresa e tem a necessidade de realizar a instalação de um servidor apache em sua infra estrutura. O processo de instalação deverá levar em consideração os seguintes requerimentos:

* O apache deverá possuir 3 virtual hosts, sendo um para o ambiente de Desenvolvimento, um para o ambiente de QA e um para o ambiente de produção.
* Cada um dos ambientes deverá apontar para uma página HTML que apresente o nome do ambiente, bem como o nome de cada integrante de sua equipe (grupo) junto com o ID que identifica cada um (RM).
* O acesso via SSH deverá estar habilitado, porém a porta utilizada não poderá ser a 22, devendo esta ser substituída para uma porta alta de sua escolha.
* Este servidor deverá possuir também um usuário com permissões totais, que será utilizado pelo CTO de sua companhia (professor).

Informações relevantes
---------
* Qual foi a porta utilizada para o acesso via SSH;
    O daemon do **SSH Server** está LISTENING na **porta 4098**
* Dados de usuário e senha para que seu CTO possa validar o funcionamento do ambiente.
    Usuário: **ctouser**
    Senha: **labfiap123**
    
 **Obs: A senha no cookbok ssh está criptografada usando openssl.
 
* Quais os virtual hosts configurado no servidor para que o CTO possa efetuar as alterações no arquivo hosts local e validar o funcionamento.

    **ServerName:** production.com        **ServerAlias:** www.production.com

    **ServerName:** homologation.com      **ServerAlias:** www.homologation.com

    **SernerName:** development.com       **ServerAlias:** www.development.com

**Obs: Para efeito de teste deve ser editado o arquivo hosts do S.O. oriundo dos testes para a correta resolução de nome (DNS manual)**

Caso o S.O. seja `Windows` alterar o arquivo `C:\Windows\System32\drivers\etc\hosts` com o conteúdo abaixo fazendo as devidas alterações.

Caso o S.O. seja `Linux` alterar o arquivo `/etc/hosts` com o conteúdo abaixo fazendo as devidas alterações.

`**ip_publico**  www.development.com www.homologation.com www.production.com`

**Exemplo**

`192.168.8.145	www.development.com www.homologation.com www.production.com`


Ambiente de teste
---------
Favor considerar as seguintes premissas para o teste dos cookbooks:
* Servidor Ubuntu 18.04 
* Apache versão 2.4
* OpenSSH versão 1.7
* Sudo versão 1.8

Cookbooks
---------
Os itens do trabalho foram atendidos em 3 cookbooks diferentes, são eles:

* [apache](cookbooks/apache/)
* [ssh](cookbooks/ssh/)
* [adminuser](cookbooks/adminuser/)
