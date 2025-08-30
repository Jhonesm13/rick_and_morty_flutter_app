# Rick and Morty

Esse é um aplicativo feito em Flutter que usa a Rick and Morty API para mostrar uma lista de personagens do desenho.
Cada personagem aparece num card com a imagem e o nome.
O Aplicativo possui uma barra de busca que filtra os personagens enquanto você digita e, se clicar em um deles, ira para outra página para ver mais detalhes.


## Arquitetura do Projeto
O projeto segue uma arquitetura modularizada por camadas, visando separação de responsabilidades e facilidade de manutenção.
Models: Modelos de dados (mapeamento JSON para Dart)
Pages: Telas (UI e controle do estado local)
Repositories: Acesso a dados (API REST)
Widgets: Componentes reutilizáveis (APP Bar e cards)

## Tecnologias e Bibliotecas
Flutter (UI)
Dio (requisições HTTP)
Rick and Morty API (fonte de dados)
