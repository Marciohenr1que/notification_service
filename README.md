Funcionalidades do Projeto
Armazenamento de Notificações:

Modelo Notification: Representa uma notificação no sistema, armazenando informações como task_id, task_title, task_description, user_id, user_email e action.
Repositório NotificationRepository: Gerencia a criação, recuperação e manipulação das notificações no banco de dados.
Integração com gRPC:

Serviço gRPC NotificationService: Permite que outros serviços se comuniquem com o microserviço de notificações usando gRPC. O serviço expõe um método SendNotification que aceita um pedido de notificação e armazena os dados no banco de dados.
Geração de Código gRPC: O arquivo notification.proto define o serviço e as mensagens usadas no protocolo gRPC, e o código Ruby para esse serviço é gerado a partir desse arquivo.
Endpoint HTTP:

Controller NotificationsController: Fornece um endpoint HTTP (POST /notifications) para que o sistema principal (ou qualquer cliente HTTP) possa enviar notificações. O controller processa o pedido e armazena as notificações no banco de dados.
Serviço HTTP e gRPC:

HTTP: Permite a comunicação através de requisições HTTP, onde o sistema principal pode enviar notificações para o endpoint /notifications.
gRPC: Permite a comunicação eficiente entre microserviços, enviando notificações para o microserviço através de chamadas gRPC.
Como Funciona
Recepção de Notificações:

Via HTTP: Um cliente ou serviço externo faz uma requisição POST para o endpoint /notifications com os detalhes da notificação no corpo da requisição. O NotificationsController processa essa requisição e armazena a notificação no banco de dados.
Via gRPC: Outro microserviço pode fazer uma chamada gRPC para o método SendNotification do NotificationService, passando os detalhes da notificação. O serviço gRPC recebe essa chamada, armazena a notificação e retorna uma resposta.
Armazenamento e Resposta:

Armazenamento: As notificações recebidas são armazenadas na tabela notifications do banco de dados PostgreSQL.
Resposta: Após armazenar a notificação, o sistema retorna uma resposta confirmando o sucesso ou a falha da operação.
Objetivos do Microserviço
Centralizar o Gerenciamento de Notificações: Oferecer uma maneira consistente e centralizada para outros serviços ou sistemas enviarem e gerenciarem notificações.
Oferecer Duas Formas de Comunicação: Suporte tanto para chamadas HTTP quanto para chamadas gRPC, proporcionando flexibilidade na integração com diferentes tipos de sistemas.
Esse projeto é ideal para sistemas que precisam de um serviço separado para gerenciar e armazenar notificações, especialmente em arquiteturas de microserviços onde a comunicação entre diferentes partes do sistema é necessária.
