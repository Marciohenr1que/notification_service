# Serviço de Notificação

O Serviço de Notificação é responsável por receber e gerenciar notificações em um sistema distribuído. Ele utiliza arquitetura hexagonal, comunicando-se com microserviços de usuários e web scraping. O serviço armazena notificações em um banco de dados PostgreSQL e opera como um servidor dentro do projeto.

## Arquitetura

O serviço adota a **Arquitetura Hexagonal** (Portas e Adaptadores), separando claramente a lógica de negócios dos serviços externos. Opera como um **servidor** e interage com outros microserviços via APIs e gRPC.

## Arquitetura e Implementação


Configuração
Pré-requisitos
Ruby
PostgreSQL
Docker
Docker Compose
Comandos
Executar o Serviço com Ruby
Para rodar o serviço de notificação localmente com Ruby:

Navegue até o diretório do projeto.

Execute o servidor:
- Modo dev
- bundle install
- executar comando abaixo 
- ruby lib/notification_service_server.rb
- rodando na porta 50052
Construir Imagem Docker
-Para construir a imagem Docker do serviço de notificação:

bash
Copiar código
docker build -t my_notification_service .
Iniciar PostgreSQL e Serviço de Notificação
Inicie o PostgreSQL e o serviço de notificação com Docker Compose:

bash
Copiar código
docker-compose up
Parar e Remover Contêineres, Redes e Volumes
Para parar e remover todos os contêineres, redes e volumes criados:

bash
Copiar código
docker-compose down
Executar o Serviço de Notificação
Para rodar o serviço de notificação localmente com Docker:

bash
Copiar código
docker run -d --name notification_service -p 50052:50052 my_notification_service
O serviço de notificação estará acessível na porta 50052.

Comunicação com Outros Microserviços
O Serviço de Notificação comunica-se com:

Microserviço de Usuários: Para obter detalhes sobre os usuários.
Microserviço de Web Scraping: Para interagir e processar dados de scraping.
Desenvolvimento
Executar Testes
Para executar os testes do serviço de notificação, certifique-se de ter as dependências instaladas e execute:

bash
Copiar código
rspec
