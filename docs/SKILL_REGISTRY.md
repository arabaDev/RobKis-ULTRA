# Registro de skills

Total registrado: **681** skills em **46** departamentos.
Estados: ESTRUTURALMENTE VALIDADA: skill com SKILL.md legível e frontmatter completo.

Skills registradas não são skills carregadas: cada tarefa carrega só as necessárias (`python scripts/skill_plan.py` ou `skill_search.py`).
Estado acima de ESTRUTURALMENTE VALIDADA exige evidência em `docs/skills_evidence.json`.
Gerado por `python scripts/build_index.py`; não edite à mão.

## Animação 3D (13)
- `SK-26-01` **anim3d-keyframe-basics** — Keyframes por código e interpolação.
- `SK-26-02` **anim3d-walk-cycles** — Ciclos de caminhada em loop.
- `SK-26-03` **anim3d-attack-animations** — Animações de ataque com antecipação, golpe e recuperação.
- `SK-26-04` **anim3d-timing-spacing** — Tempo e espaçamento de animação.
- `SK-26-05` **anim3d-fps-export** — Taxa de quadros na exportação de animações.
- `SK-26-06` **anim3d-looping** — Loops de animação sem salto: primeira e última pose iguais, sem quadro duplicado.
- `SK-26-07` **anim3d-root-motion** — Movimento da raiz versus deslocamento pelo jogo.
- `SK-26-08` **anim3d-nla-actions** — Actions e faixas NLA.
- `SK-26-09` **anim3d-bake-export** — Bake de animações antes da exportação.
- `SK-26-10` **anim3d-markers** — Marcadores de evento nas animações.
- `SK-26-11` **anim3d-retargeting** — Reaproveitar animações em rigs diferentes.
- `SK-26-12` **anim3d-validation-in-studio** — Validar animações dentro do Studio.
- `SK-26-13` **anim3d-action-editor** — Action Editor e gerenciamento de ações.

## Animações Roblox (12)
- `SK-10-01` **anim-animator-basics** — Animator, AnimationTrack e como carregar e tocar animações.
- `SK-10-02` **anim-priorities** — Prioridades de animação (Core, Idle, Movement, Action).
- `SK-10-03` **anim-markers-events** — Eventos de animação com GetMarkerReachedSignal.
- `SK-10-04` **anim-blending-weights** — Mistura de animações com peso e tempo de fade.
- `SK-10-05` **anim-looping-speed** — Loop, velocidade e duração de animações.
- `SK-10-06` **anim-ownership-permissions** — Propriedade e permissões de animações publicadas.
- `SK-10-07` **anim-preloading** — Pré-carregamento de animações com ContentProvider.
- `SK-10-08` **anim-r15-vs-r6** — Diferenças de rig R6 e R15 para animações.
- `SK-10-09` **anim-custom-rigs** — Animar rigs personalizados com AnimationController e Motor6D.
- `SK-10-10` **anim-procedural** — Animação por código alterando Motor6D e CFrame.
- `SK-10-11` **anim-ik-control** — IKControl para pés e mãos.
- `SK-10-12` **anim-cleanup-tracks** — Limpeza de tracks e conexões de animação.

## Análise de dependências (12)
- `SK-34-01` **dep-require-graph** — Grafo de requires entre módulos.
- `SK-34-02` **dep-circular-detection** — Detectar dependências circulares entre módulos que travam o require.
- `SK-34-03` **dep-service-order** — Ordem de inicialização de serviços.
- `SK-34-04` **dep-package-managers** — Gerenciadores de pacotes só quando o projeto já os usa, com versões fixas.
- `SK-34-05` **dep-version-pinning** — Fixar versões exatas de ferramentas e bibliotecas para builds reproduzíveis.
- `SK-34-06` **dep-asset-ids-tracking** — Rastreio de IDs de assets.
- `SK-34-07` **dep-plugin-dependencies** — Dependências de plugins do Studio.
- `SK-34-08` **dep-blender-addon-deps** — Dependências de addons do Blender.
- `SK-34-09` **dep-impact-analysis** — Análise de impacto de mudanças.
- `SK-34-10` **dep-removal-safety** — Remoção segura de código e assets.
- `SK-34-11` **dep-third-party-licenses** — Licenças de código e assets de terceiros.
- `SK-34-12` **dep-tool-versions** — Versões das ferramentas do projeto.

## Análise de segurança (12)
- `SK-39-01` **secan-threat-modeling** — Modelagem de ameaças de um jogo.
- `SK-39-02` **secan-remote-audit** — Auditoria de todos os Remotes.
- `SK-39-03` **secan-economy-exploit-audit** — Auditoria de exploits de economia.
- `SK-39-04` **secan-datastore-abuse** — Auditoria de abuso e falhas em DataStore.
- `SK-39-05` **secan-injection-risks** — Riscos de injeção e execução de código.
- `SK-39-06` **secan-free-model-audit** — Auditoria de modelos gratuitos e plugins.
- `SK-39-07` **secan-permissions-audit** — Auditar quem pode editar, publicar e acessar dados do jogo.
- `SK-39-08` **secan-privacy-pii** — Privacidade e dados pessoais.
- `SK-39-09` **secan-rate-abuse** — Auditar abuso por frequência: Remotes e recursos que podem ser disparados em rajada.
- `SK-39-10` **secan-dos-vectors** — Vetores de negação de serviço do jogo.
- `SK-39-11` **secan-incident-response** — Resposta a incidentes de segurança.
- `SK-39-12` **secan-audit-report-format** — Formato de relatório de auditoria.

## Arquitetura de software (15)
- `SK-01-01` **arq-service-layering** — Separa serviços de servidor, controllers de cliente e módulos compartilhados.
- `SK-01-02` **arq-client-server-boundary** — Define o que roda no cliente e o que é autoridade do servidor.
- `SK-01-03` **arq-module-dependencies** — Mantém dependências entre módulos explícitas e sem ciclos.
- `SK-01-04` **arq-config-driven-design** — Move números e dados de balanceamento para módulos de configuração.
- `SK-01-05` **arq-event-driven-design** — Prefere eventos e sinais a polling em loops.
- `SK-01-06` **arq-state-management** — Mantém uma única fonte de verdade para o estado do jogo.
- `SK-01-07` **arq-folder-structure** — Estrutura de pastas e nomes consistentes para o projeto Roblox.
- `SK-01-08` **arq-extensibility-patterns** — Padrões para adicionar armas, habilidades e itens sem reescrever sistemas.
- `SK-01-09` **arq-api-contracts** — Contratos claros e tipados para Remotes e APIs de módulos.
- `SK-01-10` **arq-error-boundaries** — Isola falhas para um sistema não derrubar os outros.
- `SK-01-11` **arq-feature-flags** — Liga e desliga funcionalidades por configuração.
- `SK-01-12` **arq-refactor-safely** — Refatora em passos pequenos sem quebrar o que funciona.
- `SK-01-13` **arq-game-loop-design** — Modela o ciclo de partida como máquina de estados (lobby, rodada, fim).
- `SK-01-14` **arq-component-based-design** — Arquitetura por componentes com tags do CollectionService.
- `SK-01-15` **arq-design-patterns-luau** — Padrões de projeto úteis em Luau: observer, state, factory e command.

## Benchmark e qualidade (12)
- `SK-40-01` **bench-task-suite** — Conjunto fixo de tarefas de benchmark.
- `SK-40-02` **bench-timing-method** — Método de medição de tempo.
- `SK-40-03` **bench-token-accounting** — Contagem de tokens e custo.
- `SK-40-04` **bench-success-criteria** — Critérios objetivos de sucesso.
- `SK-40-05` **bench-regression-compare** — Comparação entre versões do agente.
- `SK-40-06` **bench-fair-comparison** — Comparação justa com outras ferramentas.
- `SK-40-07` **bench-quality-rubric** — Rubrica de qualidade de resultados.
- `SK-40-08` **bench-reporting** — Relatório de benchmark com tabela por versão, limitações e próximos passos.
- `SK-40-09` **bench-baselines** — Registrar a linha de base de desempenho e qualidade antes de otimizar.
- `SK-40-10` **bench-statistics-small-n** — Interpretar benchmarks com poucas execuções usando mediana e intervalo, sem conclusões fortes.
- `SK-40-11` **bench-gameplay-metrics** — Métricas de qualidade de gameplay: loop jogável, erros no Output e desempenho.
- `SK-40-12` **bench-continuous-improvement** — Melhoria contínua guiada por dados.

## Blender Python (17)
- `SK-20-01` **bpy-scene-setup** — Preparar a cena do Blender: unidades, coleções e limpeza segura.
- `SK-20-02` **bpy-bmesh-modeling** — Modelagem por código com bmesh.
- `SK-20-03` **bpy-collections-naming** — Organização por coleções e nomes consistentes.
- `SK-20-04` **bpy-modifiers-api** — Modificadores via objects.modifiers.new e aplicação.
- `SK-20-05` **bpy-context-overrides** — Operadores bpy.ops com contexto explícito.
- `SK-20-06` **bpy-headless-run** — Executar Blender em modo background.
- `SK-20-07` **bpy-data-vs-ops** — Quando usar bpy.data e quando usar bpy.ops.
- `SK-20-08` **bpy-batch-generation** — Gerar muitos assets em lote.
- `SK-20-09` **bpy-version-compat** — Compatibilidade de API entre versões do Blender.
- `SK-20-10` **bpy-error-handling-verify** — Tratamento de erros e verificação em scripts bpy.
- `SK-20-11` **bpy-custom-operators** — Operadores e painéis simples em um addon.
- `SK-20-12` **bpy-mesh-stats** — Estatísticas de malha: vértices, faces e triângulos.
- `SK-20-13` **bpy-instances** — Instâncias e duplicatas ligadas para reduzir custo.
- `SK-20-14` **bpy-geometry-nodes-scripting** — Geometry Nodes por script: grupo, entradas e modificador.
- `SK-20-15` **bpy-safe-execution** — Execução segura de scripts no Blender.
- `SK-20-16` **bpy-material-editing** — Edição de materiais existentes por script.
- `SK-20-17` **bpy-script-failure-diagnosis** — Diagnóstico de falhas em scripts bpy.

## Compatibilidade de versões (12)
- `SK-37-01` **compat-roblox-api-changes** — Mudanças e depreciações da API do Roblox.
- `SK-37-02` **compat-luau-versions** — Recursos de Luau e versões.
- `SK-37-03` **compat-blender-versions** — Compatibilidade entre versões do Blender.
- `SK-37-04` **compat-exporter-changes** — Detectar mudanças de comportamento dos exportadores do Blender após atualização.
- `SK-37-05` **compat-platform-differences** — Diferenças entre PC, celular e console.
- `SK-37-06` **compat-input-devices** — Suporte a teclado, mouse, toque e gamepad, com troca de dispositivo em jogo.
- `SK-37-07` **compat-studio-vs-live** — Diferenças entre Studio e jogo publicado.
- `SK-37-08` **compat-deprecated-apis** — Trocar APIs depreciadas do Roblox por substitutos oficiais em passos pequenos.
- `SK-37-09` **compat-os-paths** — Caminhos e sistemas operacionais.
- `SK-37-10` **compat-python-versions** — Versão do Python do Blender.
- `SK-37-11` **compat-mcp-versions** — Versões de servidores MCP.
- `SK-37-12` **compat-r6-r15** — R6 e R15 em ferramentas, animações e UI.

## Controle de versão e recuperação (12)
- `SK-31-01` **vcs-git-basics** — Fundamentos de Git para projetos Roblox e Blender.
- `SK-31-02` **vcs-commit-hygiene** — Commits pequenos, com mensagem clara e sem segredos nem arquivos temporários.
- `SK-31-03` **vcs-branching-for-features** — Ramos Git por funcionalidade, integrados em passos pequenos.
- `SK-31-04` **vcs-backup-before-risk** — Backup antes de mudanças arriscadas.
- `SK-31-05` **vcs-roblox-file-formats** — Formatos .rbxl, .rbxlx e sincronização por arquivos.
- `SK-31-06` **vcs-rojo-workflow** — Fluxo com Rojo, se o projeto o usar.
- `SK-31-07` **vcs-merge-conflicts** — Resolução de conflitos de merge.
- `SK-31-08` **vcs-roblox-version-history** — Histórico de versões do Roblox.
- `SK-31-09` **vcs-rollback-recovery** — Reverter e recuperar com segurança.
- `SK-31-10` **vcs-gitignore-assets** — .gitignore e arquivos grandes.
- `SK-31-11` **vcs-release-tags** — Tags e versões de entrega.
- `SK-31-12` **vcs-team-create-vs-git** — Team Create e Git juntos.

## DataStore e persistência (12)
- `SK-15-01` **data-schema-versioning** — Versão do esquema de dados e valores padrão.
- `SK-15-02` **data-session-locking** — Bloqueio de sessão para evitar dois servidores sobrescrevendo.
- `SK-15-03` **data-updateasync-pattern** — UpdateAsync para leitura e escrita atômicas.
- `SK-15-04` **data-retry-backoff** — Tentativas com espera crescente para DataStore.
- `SK-15-05` **data-autosave-bindtoclose** — Salvamento periódico, em PlayerRemoving e em BindToClose.
- `SK-15-06` **data-budget-limits** — Limites de requisições e de tamanho do DataStore.
- `SK-15-07` **data-migration** — Migração de dados entre versões do esquema.
- `SK-15-08` **data-ordered-leaderboards** — OrderedDataStore: valores inteiros ordenados.
- `SK-15-09` **data-memorystore-usage** — MemoryStoreService para dados temporários e filas.
- `SK-15-10` **data-studio-api-access** — Acesso do Studio às APIs para testar DataStore.
- `SK-15-11` **data-corruption-recovery** — Recuperação de dados corrompidos com versões.
- `SK-15-12` **data-gdpr-userids** — Registro de UserIds e remoção de dados de usuário.

## Diagnóstico de bugs (12)
- `SK-17-01` **bug-reproduce-minimal** — Reproduzir o bug com a menor entrada possível.
- `SK-17-02` **bug-read-stack** — Ler mensagens de erro e stacks completos.
- `SK-17-03` **bug-nil-index** — Erros de indexar nil.
- `SK-17-04` **bug-race-conditions** — Condições de corrida entre scripts e eventos.
- `SK-17-05` **bug-replication-desync** — Diferenças entre servidor e cliente.
- `SK-17-06` **bug-event-leaks** — Eventos duplicados e conexões acumuladas.
- `SK-17-07` **bug-yield-issues** — Yield infinito e esperas que nunca terminam.
- `SK-17-08` **bug-datastore-failures** — Diagnóstico de falhas de DataStore.
- `SK-17-09` **bug-physics-glitches** — Glitches de física: tremedeira, voo e travamento.
- `SK-17-10` **bug-ui-not-showing** — UI que não aparece.
- `SK-17-11` **bug-bisect-regressions** — Bisseção para achar a mudança que quebrou algo.
- `SK-17-12` **bug-log-instrumentation** — Instrumentação de logs para depuração.

## Documentação técnica (12)
- `SK-33-01` **doc-script-headers** — Cabeçalho padrão no topo de cada script: local, tipo, função e dependências.
- `SK-33-02` **doc-readme-structure** — README de projeto com o que é, como rodar, estrutura e problemas conhecidos.
- `SK-33-03` **doc-api-reference** — Referência de APIs internas com assinatura, parâmetros, retorno, erros e exemplo.
- `SK-33-04` **doc-changelogs** — Changelog por versão: o que mudou, por quê e o que ficou quebrado.
- `SK-33-05` **doc-decision-records** — Registro curto de decisões técnicas: contexto, escolha, alternativas e consequências.
- `SK-33-06` **doc-diagrams-text** — Diagramas em texto, como Mermaid.
- `SK-33-07` **doc-known-issues** — Lista de problemas conhecidos com sintoma, causa, contorno e gravidade.
- `SK-33-08` **doc-onboarding-guide** — Guia de início rápido para um colaborador novo rodar e testar o projeto.
- `SK-33-09` **doc-inline-comments** — Comentários úteis no código.
- `SK-33-10` **doc-asset-manifest** — Manifesto de assets com nome, arquivo, ID, versão e orçamento de triângulos.
- `SK-33-11` **doc-test-reports** — Relatório de testes separando o que passou, falhou e não foi testado.
- `SK-33-12` **doc-agents-md-maintenance** — Manutenção do AGENTS.md como memória do projeto.

## Economia e lojas (12)
- `SK-14-01` **eco-currency-design** — Projeto de moedas e fontes de renda do jogo.
- `SK-14-02` **eco-shop-purchase-flow** — Fluxo de compra dentro do jogo no servidor.
- `SK-14-03` **eco-sinks-and-sources** — Equilíbrio entre fontes e sumidouros de moeda.
- `SK-14-04` **eco-pricing-balance** — Preços e progressão econômica balanceados.
- `SK-14-05` **eco-developer-products** — Developer Products: compras repetíveis com Robux.
- `SK-14-06` **eco-gamepasses** — Game Passes: compras únicas com benefício permanente.
- `SK-14-07` **eco-subscriptions** — Assinaturas da experiência, se o jogo as usar.
- `SK-14-08` **eco-daily-rewards** — Recompensas diárias com data validada no servidor.
- `SK-14-09` **eco-leaderboards** — Placares globais com OrderedDataStore.
- `SK-14-10` **eco-anti-exploit-economy** — Defesa contra exploits de economia.
- `SK-14-11` **eco-ethical-monetization** — Monetização honesta, sem padrões enganosos.
- `SK-14-12` **eco-premium-benefits** — Benefícios para membros Premium.

## Exportação de assets (12)
- `SK-27-01` **exp-fbx-settings** — Configuração de exportação FBX para jogos.
- `SK-27-02` **exp-gltf-settings** — Configuração de exportação glTF e GLB.
- `SK-27-03` **exp-obj-settings** — Exportação OBJ para malhas simples.
- `SK-27-04` **exp-apply-transforms** — Aplicar transformações antes de exportar.
- `SK-27-05` **exp-axis-orientation** — Eixos e orientação na exportação.
- `SK-27-06` **exp-scale-units** — Unidades e escala entre Blender e Roblox.
- `SK-27-07` **exp-selection-export** — Exportar só a seleção ou a coleção certa.
- `SK-27-08` **exp-naming-batch** — Nomes de arquivos e exportação em lote.
- `SK-27-09` **exp-validate-file** — Validar o arquivo exportado: existência, tamanho, contagens e reimportação.
- `SK-27-10` **exp-embedded-textures** — Texturas embutidas e externas.
- `SK-27-11` **exp-versioned-output-folders** — Pastas de saída versionadas.
- `SK-27-12` **exp-failed-export-triage** — Diagnóstico de exportações que falham.

## Ferramentas e armas (13)
- `SK-05-01` **tool-structure** — Estrutura de uma Tool: Handle, RequiresHandle, Grip e partes.
- `SK-05-02` **tool-equip-lifecycle** — Eventos Equipped, Unequipped, Activated e Deactivated.
- `SK-05-03` **tool-grip-positioning** — Ajuste de posição e rotação da ferramenta na mão.
- `SK-05-04` **tool-server-validation** — Validação no servidor de ações disparadas por uma Tool.
- `SK-05-05` **tool-backpack-handling** — Backpack, StarterPack e StarterGear.
- `SK-05-06` **tool-animation-binding** — Animações de uso e idle ligadas à Tool.
- `SK-05-07` **tool-sounds-effects** — Sons e efeitos da Tool, tocados com origem no Handle.
- `SK-05-08` **tool-ammo-reload** — Munição, pente e recarga no servidor.
- `SK-05-09` **tool-rarity-stats** — Raridade e atributos de armas por tabela de config.
- `SK-05-10` **tool-custom-models** — Usar modelos do Blender como Handle de ferramentas.
- `SK-05-11` **tool-dropping-pickup** — Largar e pegar ferramentas com ProximityPrompt.
- `SK-05-12` **tool-respawn-cleanup** — Limpeza de ferramentas e efeitos na morte e no respawn.
- `SK-05-13` **tool-ui-hotbar** — Hotbar personalizada no lugar do Backpack padrão.

## Fluxos compostos (12)
- `SK-44-01` **flow-complete-weapon** — Fluxo completo de arma: requisitos, modelo, importação, scripts, testes e relatório.
- `SK-44-02` **flow-map-creation** — Fluxo de criação de mapa: layout, assets, iluminação, navegação e desempenho.
- `SK-44-03` **flow-game-system** — Fluxo genérico para implementar um sistema de jogo com segurança e testes.
- `SK-44-04` **flow-inventory-system** — Fluxo de inventário: dados, ações no servidor, UI, persistência e anti-duplicação.
- `SK-44-05` **flow-combat-system** — Fluxo de combate completo: dano, hitbox, estados, latência e balanceamento.
- `SK-44-06` **flow-npc-system** — Fluxo de NPC: spawn, IA, navegação, rede, vida e custo de CPU.
- `SK-44-07` **flow-ability-system** — Fluxo de habilidades: dados, validação, efeitos, UI e balanceamento.
- `SK-44-08` **flow-ui-feature** — Fluxo de uma tela ou HUD: layout, estados, entrada, desempenho e testes.
- `SK-44-09` **flow-datastore-feature** — Fluxo de persistência: esquema, escrita segura, falhas, migração e recuperação.
- `SK-44-10` **flow-animation-pipeline** — Fluxo de animação: rig, animação, exportação, importação e validação no Studio.
- `SK-44-11` **flow-3d-environment** — Fluxo de ambiente 3D: modelagem, UV, texturas, exportação, importação e custo.
- `SK-44-12` **flow-release-update** — Fluxo de lançamento de atualização: backup, regressão, medição, publicação e reversão.

## Física e colisões (13)
- `SK-06-01` **phys-collision-groups** — Grupos de colisão com PhysicsService e a propriedade CollisionGroup.
- `SK-06-02` **phys-network-ownership** — Propriedade de rede de física e SetNetworkOwner.
- `SK-06-03` **phys-constraints-basics** — Constraints básicas: Attachment, Hinge, Prismatic, Spring, Rope.
- `SK-06-04` **phys-modern-movers** — LinearVelocity, AlignPosition e VectorForce no lugar de BodyMovers.
- `SK-06-05` **phys-assemblies-mass** — Assemblies, massa, Massless e velocidade da assembly.
- `SK-06-06` **phys-custom-properties** — PhysicalProperties: densidade, fricção e elasticidade.
- `SK-06-07` **phys-raycast-filtering** — Filtros de raycast e consultas espaciais.
- `SK-06-08` **phys-collision-fidelity** — CollisionFidelity de MeshParts e custo de física.
- `SK-06-09` **phys-anchoring-strategy** — Quando ancorar e quando deixar a física agir.
- `SK-06-10` **phys-touched-pitfalls** — Armadilhas do evento Touched e alternativas.
- `SK-06-11` **phys-joints-welds** — WeldConstraint, Weld, Motor6D e quando usar cada um.
- `SK-06-12` **phys-vehicles** — Veículos com VehicleSeat, constraints e propriedade de rede.
- `SK-06-13` **phys-ragdoll** — Ragdoll com BallSocketConstraint e estado de Humanoid.

## Gameplay e sistemas de movimento (14)
- `SK-41-01` **move-humanoid-speed-jump** — Velocidade e salto do Humanoid: WalkSpeed e JumpHeight.
- `SK-41-02` **move-sprint-stamina** — Corrida com estamina decidida no servidor, com consumo e regeneração por tempo.
- `SK-41-03` **move-dash-roll** — Dash e esquiva com impulso curto e invulnerabilidade opcional.
- `SK-41-04` **move-double-jump** — Pulo duplo com detecção de estado.
- `SK-41-05` **move-custom-camera** — Câmera personalizada em primeira, terceira pessoa e fixa.
- `SK-41-06` **move-wall-climb** — Escalada de paredes por detecção e movimento controlado.
- `SK-41-07` **move-swimming** — Natação e movimento na água do terreno.
- `SK-41-08` **move-slopes-floor** — Inclinação e superfícies: MaxSlopeAngle e FloorMaterial.
- `SK-41-09` **move-custom-controller** — Controle de personagem personalizado sobre o PlayerModule.
- `SK-41-10` **move-grapple-hook** — Gancho de arremesso com constraint.
- `SK-41-11` **move-ledge-mantle** — Subir bordas (mantle) por raycasts de altura e tween curto, para parkour.
- `SK-41-12` **move-slide** — Deslizar com velocidade e redução de hitbox.
- `SK-41-13` **move-speed-modifiers** — Empilhamento de modificadores de velocidade.
- `SK-41-14` **move-lock-on-camera** — Câmera com mira em alvo (lock-on).

## Iluminação e renderização (21)
- `SK-30-01` **light-technology-modes** — Modos de iluminação do Lighting: Voxel, Compatibility, ShadowMap e Future.
- `SK-30-02` **light-atmosphere-sky** — Atmosphere, Sky e neblina.
- `SK-30-03` **light-day-night-cycle** — Ciclo de dia e noite com ClockTime.
- `SK-30-04` **light-post-processing** — Efeitos de pós-processamento: Bloom, ColorCorrection, DepthOfField, SunRays.
- `SK-30-05` **light-local-lights** — PointLight, SpotLight e SurfaceLight.
- `SK-30-06` **light-horror-mood** — Iluminação de terror com pouca luz ambiente, luzes locais guiando e contraste controlado.
- `SK-30-07` **light-shadows-cost** — Custo de sombras e GlobalShadows em cenas pesadas, com medição de FPS.
- `SK-30-08` **light-blender-preview-render** — Renders de inspeção no Blender.
- `SK-30-09` **light-eevee-cycles-settings** — Configuração de EEVEE e Cycles por script.
- `SK-30-10` **light-baked-lighting-textures** — Iluminação assada em texturas.
- `SK-30-11` **light-mobile-lighting** — Iluminação para dispositivos móveis.
- `SK-30-12` **light-color-grading** — Correção de cor e coerência visual.
- `SK-30-13` **light-hdri-setup** — Iluminação por HDRI no Blender.
- `SK-30-14` **light-camera-setup** — Câmeras para renders de inspeção e previews.
- `SK-30-15` **light-compositing** — Composição de renders no compositor do Blender.
- `SK-30-16` **light-batch-rendering** — Renderização em lote por script.
- `SK-30-17` **light-sample-optimization** — Otimização de amostras de render.
- `SK-30-18` **light-denoising** — Denoising de renders Cycles com poucas amostras, sem perder detalhe.
- `SK-30-19` **light-render-memory** — Gerenciamento de memória de render.
- `SK-30-20` **light-render-diagnosis** — Diagnóstico de problemas de render.
- `SK-30-21` **light-visual-qc** — Controle de qualidade visual de assets renderizados.

## Integração Blender–Roblox (15)
- `SK-28-01` **pipe-import-3d-importer** — Importação pelo Importador 3D do Studio.
- `SK-28-02` **pipe-scale-verification** — Verificação de escala no Studio.
- `SK-28-03` **pipe-meshpart-setup** — Configuração de MeshPart: material, colisão e ancoragem.
- `SK-28-04` **pipe-collision-setup** — Colisão do asset importado.
- `SK-28-05` **pipe-pivot-fix** — Corrigir pivô de modelos importados.
- `SK-28-06` **pipe-surfaceappearance-assign** — Atribuir SurfaceAppearance com mapas PBR.
- `SK-28-07` **pipe-bulk-import** — Importação em lote de muitos assets com pastas organizadas e IDs registrados.
- `SK-28-08` **pipe-upload-moderation** — Uploads e moderação de assets.
- `SK-28-09` **pipe-rig-import-animation** — Importar rigs e animações do Blender.
- `SK-28-10` **pipe-roundtrip-iteration** — Ciclo rápido Blender, exportar, Studio.
- `SK-28-11` **pipe-in-game-verification** — Verificação do asset dentro do jogo.
- `SK-28-12` **pipe-manual-handoff** — Instruções para etapas manuais.
- `SK-28-13` **pipe-geometry-limits** — Limites de geometria e tamanho para importação no Roblox.
- `SK-28-14` **pipe-source-vs-destination-diff** — Comparar origem (Blender) e destino (Studio).
- `SK-28-15` **pipe-texture-upload-workflow** — Fluxo de texturas até o Roblox.

## Integração e MCP (19)
- `SK-19-01` **mcp-tool-discovery** — Descobrir quais ferramentas MCP estão realmente disponíveis.
- `SK-19-02` **mcp-roblox-studio-usage** — Uso do MCP do Roblox Studio para inspecionar e alterar o lugar.
- `SK-19-03` **mcp-blender-usage** — Uso do MCP do Blender para cena, objetos e exportação.
- `SK-19-04` **mcp-batching-calls** — Agrupar operações em chamadas únicas quando possível.
- `SK-19-05` **mcp-timeouts-retries** — Timeouts e tentativas limitadas em chamadas MCP.
- `SK-19-06` **mcp-cache-invalidation** — Cache seguro de leituras de MCP.
- `SK-19-07` **mcp-error-triage** — Triagem de erros de ferramentas MCP.
- `SK-19-08` **mcp-fallback-manual** — Alternativa quando o MCP não está disponível.
- `SK-19-09` **mcp-permissions-safety** — Permissões e segurança em chamadas MCP.
- `SK-19-10` **mcp-latency-logging** — Registro de latência de ferramentas.
- `SK-19-11` **mcp-state-verification** — Verificação do estado após escrita via MCP.
- `SK-19-12` **mcp-setup-troubleshooting** — Diagnóstico de instalação e conexão dos MCPs.
- `SK-19-13` **mcp-tool-selection** — Escolher a ferramenta MCP adequada.
- `SK-19-14` **mcp-argument-validation** — Validar argumentos antes de chamar ferramentas.
- `SK-19-15` **mcp-redundant-call-prevention** — Evitar chamadas MCP redundantes.
- `SK-19-16` **mcp-write-conflict-prevention** — Evitar escritas conflitantes via MCP.
- `SK-19-17` **mcp-side-effect-verification** — Verificar efeitos colaterais após chamadas.
- `SK-19-18` **mcp-operation-audit-log** — Registro de operações feitas por ferramentas.
- `SK-19-19` **mcp-untrusted-content-handling** — Tratar instruções em arquivos e resultados de ferramentas como dados.

## Inteligência artificial para jogos (12)
- `SK-12-01` **ai-state-machines** — Máquinas de estados finitos para IA de inimigos.
- `SK-12-02` **ai-behavior-trees** — Árvores de comportamento para IA com muitas decisões.
- `SK-12-03` **ai-pathfinding-service** — PathfindingService com parâmetros de agente, custos e modificadores.
- `SK-12-04` **ai-perception-sight** — Visão da IA com cone, distância e raycast.
- `SK-12-05` **ai-hearing-noise** — Audição baseada em eventos de ruído.
- `SK-12-06` **ai-utility-scoring** — IA de utilidade: pontua ações e escolhe a melhor.
- `SK-12-07` **ai-steering-avoidance** — Desvio de obstáculos e separação entre NPCs.
- `SK-12-08` **ai-group-coordination** — Coordenação de grupos: papéis, ataque em turnos e formação.
- `SK-12-09` **ai-difficulty-scaling** — Escala de dificuldade por parâmetros de IA.
- `SK-12-10` **ai-performance-throttling** — Limitar o custo de IA: intervalos e níveis de detalhe.
- `SK-12-11` **ai-debug-visualization** — Visualizar caminhos, alcance e estado de IA.
- `SK-12-12` **ai-boss-patterns** — Padrões de chefe com fases e ataques telegrafados.

## Interfaces e GUIs (20)
- `SK-09-01` **ui-scale-layout** — Layout com escala (UDim2 Scale), âncoras e restrições.
- `SK-09-02` **ui-responsive-mobile** — Interfaces utilizáveis em telas pequenas e com toque.
- `SK-09-03` **ui-safe-areas** — Áreas seguras e insets do sistema.
- `SK-09-04` **ui-layout-objects** — UIListLayout, UIGridLayout, UIPadding e afins.
- `SK-09-05` **ui-text-handling** — Texto: RichText, TextScaled, TextWrapped e restrições de tamanho.
- `SK-09-06` **ui-tween-animation** — Animações de UI com TweenService.
- `SK-09-07` **ui-input-handling** — Entrada de mouse, toque, teclado e gamepad.
- `SK-09-08` **ui-hud-design** — HUD legível: vida, munição, objetivos.
- `SK-09-09` **ui-inventory-grids** — Grades de inventário com layout e dados ligados.
- `SK-09-10` **ui-shop-screens** — Telas de loja com compra confirmada pelo servidor.
- `SK-09-11` **ui-notifications-toasts** — Notificações e avisos temporários.
- `SK-09-12` **ui-viewport-frames** — ViewportFrame para pré-visualizar itens e modelos 3D.
- `SK-09-13` **ui-accessibility-controls** — Acessibilidade: contraste, tamanho e navegação por gamepad.
- `SK-09-14` **ui-menu-navigation** — Navegação entre menus com pilha de telas.
- `SK-09-15` **ui-health-bar** — Barra de vida com animação e cor por faixa.
- `SK-09-16` **ui-ability-indicators** — Indicadores de habilidade e de cooldown.
- `SK-09-17` **ui-gamepad-navigation** — Navegação de UI por gamepad.
- `SK-09-18` **ui-update-optimization** — Reduzir o custo de atualizar a UI.
- `SK-09-19` **ui-state-management** — Estado de UI separado da apresentação.
- `SK-09-20` **ui-usability-testing** — Testes de usabilidade de interfaces.

## Materiais e texturas (16)
- `SK-23-01` **mat-principled-bsdf** — Materiais Principled BSDF por código.
- `SK-23-02` **mat-pbr-texture-set** — Conjuntos PBR e mapas para SurfaceAppearance.
- `SK-23-03` **mat-texture-resolution** — Resolução de texturas e custo de memória.
- `SK-23-04` **mat-atlases** — Atlas de texturas para reduzir materiais.
- `SK-23-05` **mat-vertex-colors** — Cores de vértice como alternativa leve.
- `SK-23-06` **mat-roblox-materials-mapping** — Mapeamento para Enum.Material e MaterialVariant.
- `SK-23-07` **mat-baking** — Bake de texturas e luz.
- `SK-23-08` **mat-stylized-palettes** — Paletas estilizadas e consistência visual.
- `SK-23-09` **mat-transparency** — Transparência e custo de renderização.
- `SK-23-10` **mat-emission-glow** — Emissão e brilho (Neon e luzes).
- `SK-23-11` **mat-naming-reuse** — Nomes e reutilização de materiais.
- `SK-23-12` **mat-export-checks** — Verificar materiais antes da exportação.
- `SK-23-13` **mat-normal-maps** — Normal maps: espaço tangente, convenção e uso.
- `SK-23-14` **mat-roughness-metallic** — Mapas de rugosidade e de metal.
- `SK-23-15` **mat-ambient-occlusion** — Oclusão ambiente (AO) em texturas.
- `SK-23-16` **mat-shader-nodes-scripting** — Criar e ligar nós de shader por script.

## Modelagem 3D (5)
- `SK-43-01` **model-hard-surface** — Modelagem hard surface para armas e veículos.
- `SK-43-02` **model-organic** — Modelagem orgânica de criaturas e plantas.
- `SK-43-03` **model-low-poly** — Modelagem low-poly estilizada com silhueta clara, poucas faces e cor por material.
- `SK-43-04` **model-high-poly** — Modelagem high-poly para bake.
- `SK-VR-05` **viral-blender-pro-models** — Cria modelos 3D, partes e assets estilo Blender para jogos do Roblox: low-poly estilizado, cores vibrantes, silhueta clara, otimizados para mobile e PC.

## Modelagem procedural (13)
- `SK-21-01` **proc-parametric-props** — Props paramétricos com dimensões e variações.
- `SK-21-02` **proc-seeded-randomness** — Aleatoriedade com semente para geração reproduzível.
- `SK-21-03` **proc-modular-building-kits** — Kits modulares: paredes, pisos e peças encaixáveis.
- `SK-21-04` **proc-terrain-heightmaps** — Terreno por mapa de altura e ruído.
- `SK-21-05` **proc-vegetation-scatter** — Distribuição de árvores e pedras.
- `SK-21-06` **proc-geometry-nodes-intro** — Introdução aos Geometry Nodes por script.
- `SK-21-07` **proc-weapon-generator** — Gerador de armas com partes combináveis.
- `SK-21-08` **proc-architecture-generator** — Gerar construções simples (casas, torres) a partir de largura, altura e andares.
- `SK-21-09` **proc-variations-lod** — Variações e níveis de detalhe gerados juntos.
- `SK-21-10` **proc-symmetry-mirroring** — Simetria e espelhamento na geração.
- `SK-21-11` **proc-curves-sweeps** — Curvas e varreduras para cordas, tubos e trilhos.
- `SK-21-12` **proc-validation-bounds** — Validação de dimensões e limites dos assets gerados.
- `SK-21-90` **roblox-studio-editable-mesh** — Construir e editar geometria de malha diretamente no Roblox Studio via EditableMesh/EditableImage (sem round-trip pelo Blender). Use quando o usuário pedir um modelo 3D gerado por script, uma variação procedural de uma malha, ou quando o pipeline Blender->export->import for desnecessário para a forma pedida.

## Multiplayer e replicação (18)
- `SK-07-01` **net-remote-event-design** — Projeto de RemoteEvents: nomes, direção e payload mínimo.
- `SK-07-02` **net-remote-function-risks** — Riscos de RemoteFunction e quando evitar.
- `SK-07-03` **net-unreliable-remotes** — UnreliableRemoteEvent para dados descartáveis.
- `SK-07-04` **net-payload-limits** — O que pode atravessar Remotes: tipos, tabelas e instâncias.
- `SK-07-05` **net-replication-model** — O que replica entre servidor e cliente.
- `SK-07-06` **net-attributes-replication** — Atributos como canal simples de estado replicado.
- `SK-07-07` **net-latency-prediction** — Previsão no cliente com reconciliação pelo servidor.
- `SK-07-08` **net-bandwidth-batching** — Agrupa e reduz mensagens de rede.
- `SK-07-09` **net-player-lifecycle** — Ciclo de vida de jogadores: PlayerAdded, PlayerRemoving e jogadores já presentes.
- `SK-07-10` **net-server-movement-sanity** — Checagens de sanidade no servidor para movimento.
- `SK-07-11` **net-streaming-replication** — Interação entre StreamingEnabled e código replicado.
- `SK-07-12` **net-teleport-service** — TeleportService: TeleportAsync, dados de teleporte e servidores reservados.
- `SK-07-13` **net-messaging-memorystore** — MessagingService e MemoryStoreService entre servidores.
- `SK-07-14` **net-reconciliation** — Reconciliação de estado após previsão do cliente.
- `SK-07-15` **net-latency-jitter** — Lidar com latência variável (jitter) e perda de pacotes.
- `SK-07-16` **net-gameplay-sync-timing** — Sincronizar tempo entre servidor e clientes com GetServerTimeNow.
- `SK-07-17` **net-session-management** — Gerenciamento de sessões de jogador e de servidor.
- `SK-07-18` **net-disconnect-handling** — Tratamento de desconexão no meio de ações.

## Núcleo Roblox (61)
- `SK-46-01` **3d-game-assets** — Convenções de assets 3D para jogos — nomenclatura, orçamento, LOD, colisão e checklist de entrega. Use ao definir requisitos ou conferir um asset antes de levar ao Roblox.
- `SK-46-01` **blender-modeling** — Princípios de modelagem 3D para jogos — topologia, orçamento de polígonos, normais, UV e materiais. Use ao criar ou revisar modelos para Roblox.
- `SK-46-01` **blender-python** — Automação do Blender com Python/bpy — scripts idempotentes, execução headless e exportação verificada. Use ao gerar, modificar ou exportar objetos via script.
- `SK-46-01` **debugging-testing** — Fluxo de depuração e testes para Luau, bpy e integração. Use quando houver erro, comportamento inesperado ou antes de declarar algo concluído.
- `SK-46-01` **performance-optimization** — Diagnóstico e otimização de desempenho em Roblox (CPU, memória, renderização, física, rede) para PC e mobile. Use quando houver lag, FPS baixo ou custo alto.
- `SK-46-01` **roblox-admin-tools-observability** — Design Roblox admin tools and observability systems. Use for safe grant/revoke tools, moderation commands, audit logs, live diagnostics, economy inspection, player support, operational dashboards, and abuse-resistant admin workflows.
- `SK-46-01` **roblox-analytics-instrumentation** — Plan Roblox analytics instrumentation and event logging. Use for retention funnels, first-action timing, tutorial drop-off, economy events, monetization conversion, session milestones, progression analytics, A/B test planning, and live game KPI review.
- `SK-46-01` **roblox-animation-audio-feedback** — Improve Roblox feel through animation, audio, VFX, haptics-like feedback, reward juice, movement feel, combat feedback, UI transitions, emotes, and satisfying loop feedback without hurting mobile performance.
- `SK-46-01` **roblox-animations** — Use when working with Roblox animation systems including playing, stopping, or blending animations on Humanoid characters or non-Humanoid models, handling AnimationTrack events, replacing default character animations, or debugging animation priority and blending issues.
- `SK-46-01` **roblox-asset-pipeline** — Plan and execute Roblox asset workflows. Use for Creator Store search, inventory/group/universe assets, inserting assets, generated meshes, generated materials, procedural models, uploaded images, thumbnails, icons, decals, style consistency, import security audits, and asset performance budgets.
- `SK-46-01` **roblox-blender-pipeline** — Fluxo completo Blender → Roblox Studio — escala, eixos, formato, importação, colisão e validação no jogo. Use quando um asset vai do Blender ao Roblox.
- `SK-46-01` **roblox-code-maintenance-refactor** — Maintain and refactor Roblox Luau code safely. Use for technical debt, dead code removal, module boundaries, naming cleanup, duplicate logic, dependency review, regression prevention, and long-term codebase health.
- `SK-46-01` **roblox-combat** — Combate em Roblox — Tools, hit detection, cooldown, dano server-authoritative e prevenção de dano duplicado. Use ao criar armas, habilidades ou NPCs que causam dano.
- `SK-46-01` **roblox-combat-systems** — Design, implement, and review Roblox combat systems. Use for melee, ranged, abilities, cooldowns, hit detection, damage validation, status effects, enemy AI hooks, combat UI, balance knobs, VFX/SFX, and exploit-resistant remotes.
- `SK-46-01` **roblox-community-ops** — Manage Roblox community operations. Use for player feedback triage, bug reports, feature requests, moderation concerns, sentiment review, update communication, community-to-roadmap conversion, and long-term player trust.
- `SK-46-01` **roblox-creator-store-security-audit** — Audit Roblox Creator Store, Toolbox, inventory, group, universe, package, model, UI, gameplay, plugin-like, and other third-party imported assets for malicious or risky scripts. Use whenever Claude imports, inserts, reviews, or trusts Creator Store assets, especially assets with Scripts, LocalScripts, ModuleScripts, hidden descendants, require calls, HTTP, DataStore, remote creation, obfuscated code, or suspicious names.
- `SK-46-01` **roblox-datastore-persistence** — Design, implement, and review Roblox DataStore persistence. Use for save/load schemas, migrations, autosave, retries, player leave saves, server shutdown saves, rollback-safe state, profile locking, and data-loss debugging.
- `SK-46-01` **roblox-datastores** — Use when implementing player data persistence in Roblox, saving/loading player stats or inventory, building leaderboards with ordered datastores, handling data migration between versions, diagnosing data loss issues, or adding auto-save and shutdown-safe data handling with DataStoreService.
- `SK-46-01` **roblox-debugging-bugfix** — Debug and fix Roblox bugs through Studio MCP. Use for repro steps, console errors, script search/read/edit flow, broken UI, failed gameplay systems, data issues, remotes, regressions, root-cause reports, and post-fix verification.
- `SK-46-01` **roblox-development** — Estrutura de projeto, serviços e ordem de trabalho para criar experiências Roblox completas. Use ao iniciar jogo/sistema novo ou decidir onde cada script vive.
- `SK-46-01` **roblox-economy-balancing** — Balance Roblox economies and progression math. Use for currency sources and sinks, pricing, reward curves, upgrade costs, inflation control, event economies, progression pacing, premium offers, and profitability without pay-to-win pressure.
- `SK-46-01` **roblox-game** — Skill principal de desenvolvimento de jogos Roblox: roteia por intenção (criar jogo, corrigir bug, combate, monetização, performance, segurança, UI, multiplayer...) para o workflow/template/referência certo, com detecção de modo MCP Studio (live, degradado ou offline).
- `SK-46-01` **roblox-game-development-lifecycle** — Orchestrate the full Roblox game development lifecycle. Use as the umbrella entrypoint for broad requests like create a Roblox game, build a new game, continue development, what should we do next, take this from idea to launch, make this game profitable, plan the roadmap, manage production, or maintain a live Roblox game. Routes to the right Roblox specialist skills by GDLC phase.
- `SK-46-01` **roblox-game-ideas** — Generate or evaluate Roblox game ideas using retention, social, monetization, mobile-first, and first-session best practices. Use when pitching concepts, choosing a game direction, or improving a core loop.
- `SK-46-01` **roblox-game-ux** — Design and critique Roblox game UX, HUDs, menus, onboarding, mobile controls, and progression surfaces. Use when making a Roblox experience feel clear, fast, touch-friendly, and retention-aware.
- `SK-46-01` **roblox-genre-patterns** — Apply Roblox genre-specific design patterns. Use for simulator, tycoon, obby, RPG, adventure, pet collector, tower defense, survival, horror, battlegrounds, roleplay, racing, and hybrid genre planning from idea to live ops.
- `SK-46-01` **roblox-growth-marketing** — Plan Roblox growth marketing and user acquisition. Use for launch campaigns, Roblox sponsored ads, trailers, TikTok/YouTube/influencer outreach, social promotion, creative testing, update promotion, acquisition funnels, retention-aware growth loops, and launch-day push planning.
- `SK-46-01` **roblox-gui** — Use when building, animating, or debugging Roblox GUI elements including HUDs, menus, world-space UI, and player labels. Triggers on: ScreenGui setup, SurfaceGui or BillboardGui placement, UDim2 sizing questions, TweenService UI animations, responsive scaling, LocalScript GUI logic, ResetOnSpawn issues, or any Frame/TextLabel/ImageButton layout work.
- `SK-46-01` **roblox-liveops-roadmap** — Plan Roblox live ops, update cadence, event systems, retention milestones, roadmap checkboxes, approval gates, content pacing, Day-1/Day-3/Day-7 hooks, quests, rewards, and release-ready task sequencing.
- `SK-46-01` **roblox-localization-accessibility** — Improve Roblox localization and accessibility readiness. Use for UI text scaling, language-ready copy, icon clarity, color contrast, younger-player comprehension, readable HUDs, input accessibility, and reducing text-heavy onboarding.
- `SK-46-01` **roblox-luau-architecture** — Design, inspect, and refactor Roblox Luau game architecture. Use for ModuleScript/service boundaries, client-server flow, RemoteEvents/RemoteFunctions, ReplicatedStorage organization, reusable systems, script placement, and safe Studio MCP code-edit workflows.
- `SK-46-01` **roblox-mobile-playtest** — Playtest and QA Roblox experiences for mobile and tablet. Use for device simulator checks, touch controls, safe areas, thumb zones, text readability, orientation, HUD overlap, first-action friction, and mobile performance verification through Studio MCP.
- `SK-46-01` **roblox-monetization** — Use when developing Roblox games or experiences and need to earn Robux through Game Passes, Developer Products, UGC avatar items, or Premium Payouts — covers both Studio scripting and Creator Hub dashboard setup.
- `SK-46-01` **roblox-monetization-optimization** — Optimize Roblox monetization strategy. Use for game passes, developer products, bundles, store UX, pricing ladders, premium anchors, cosmetics, conversion experiments, offer placement, revenue analysis, and fair non-pay-to-win monetization.
- `SK-46-01` **roblox-performance** — Use when optimizing a Roblox game for better frame rates, reducing lag, improving server or client performance, diagnosing FPS drops, handling large worlds, or when asked about streaming, draw calls, object pooling, LOD, MicroProfiler, or expensive loop operations.
- `SK-46-01` **roblox-performance-optimization** — Analyze and optimize Roblox scene and script performance. Use for mobile frame rate, memory, instance count, rendering cost, physics, particles, lighting, asset budgets, streaming, leaks, and using the rbx-scene-analysis workflow.
- `SK-46-01` **roblox-playtest-qa** — Playtest Roblox experiences through Studio MCP with attention to first-session fun, mobile UX, console errors, progression, social hooks, performance, and exploit-sensitive flows.
- `SK-46-01` **roblox-policy-compliance** — Review Roblox platform policy and compliance risk. Use for Community Standards, advertising rules, Roblox Economy rules, paid random rewards or gacha odds disclosure, maturity and age labels, IP, privacy, off-platform links, scams, moderation risk, and pre-publish compliance checks.
- `SK-46-01` **roblox-publishing-discovery** — Prepare Roblox games for publishing and discovery. Use for icon, thumbnail, name, description, store copy, launch positioning, genre fit, CTR improvement, first impression review, and pre-launch page readiness.
- `SK-46-01` **roblox-quest-progression-systems** — Design and implement Roblox quests, achievements, collections, unlocks, prestige, daily/weekly goals, progression pacing, reward claims, and objective tracking. Use for short-term and long-term goals tied to retention.
- `SK-46-01` **roblox-release-operations** — Run Roblox release operations. Use for pre-publish checklists, smoke tests, release notes, staged rollout thinking, rollback plans, live issue response, release gates, version readiness, and post-release monitoring.
- `SK-46-01` **roblox-remote-events** — Use when implementing client-server communication in Roblox, firing events between LocalScripts and Scripts, passing data across the network boundary, syncing game state, or defending against exploits that abuse RemoteEvents or RemoteFunctions.
- `SK-46-01` **roblox-retention-monetization** — Plan Roblox retention, progression, live ops, and fair monetization systems. Use when designing daily rewards, content pacing, economy, game passes, developer products, cosmetics, events, or anti-pay-to-win strategy.
- `SK-46-01` **roblox-security** — Segurança de jogos Roblox multiplayer — validação de RemoteEvents, anti-spam, compras e dados. Use ao criar/revisar qualquer Remote, recompensa, compra ou salvamento.
- `SK-46-01` **roblox-security-economy** — Build and review Roblox security-sensitive economy systems. Use for currency, inventory, DataStores, trading, purchases, rewards, anti-dupe logic, RemoteEvent validation, server authority, receipt handling, and exploit-resistant progression.
- `SK-46-01` **roblox-social-systems** — Design and implement Roblox social systems. Use for parties, clans, groups, friend boosts, gifting, trading, co-op objectives, leaderboards, public celebrations, invites, social retention, and safe player-to-player value exchange.
- `SK-46-01` **roblox-studio-workflow** — Use Roblox Studio MCP safely and productively from Claude. Use when connecting to Studio, inspecting a Roblox place, editing scripts or instances, inserting assets, generating models/materials, or playtesting through MCP tools.
- `SK-46-01` **roblox-to-issues** — Break a Roblox game PRD, roadmap, or plan into small independently-playtestable vertical slices instead of building the whole game at once. Use when the user wants to turn a concept or PRD into buildable tickets, split work into slices, plan what to build next, or stop Claude from trying to build an entire game in one pass. Each slice cuts through client, server, remotes, data, and UI for one small player-facing capability, verified with a Studio playtest.
- `SK-46-01` **roblox-to-prd** — Turn a Roblox game concept or the current conversation into a short, buildable PRD (game design brief) and publish it to the project tracker. Use when the user wants to lock a chosen concept into a spec before building, write a design brief, or create a PRD for a Roblox game or feature. Pairs with roblox-to-issues, which slices the PRD into vertical slices so the game is built one playable piece at a time instead of all at once.
- `SK-46-01` **roblox-triage** — Triage Roblox game slices and bug reports through a small state machine so only fully-specified, playtestable work gets built. Use when the user wants to review incoming slices or bugs, decide what to build next, prepare a slice for building, mark work ready, or manage the roadmap/issue workflow. Keeps Claude from picking up vague, half-specified work and building the wrong thing.
- `SK-46-01` **roblox-ui** — Interfaces Roblox responsivas para PC e mobile — escala, layouts, áreas seguras e toque. Use ao criar HUDs, menus, lojas e inventários.
- `SK-46-01` **roblox-ui-implementation** — Implement Roblox UI in Studio. Use for ScreenGui, HUDs, menus, mobile-safe layouts, UI state controllers, touch controls, buttons, progress bars, shop panels, reward surfaces, and verifying UI through Roblox Studio MCP.
- `SK-46-01` **roblox-world-level-design** — Design Roblox worlds, levels, hubs, zones, biomes, obbies, arenas, and exploration spaces. Use for spatial layout, landmarks, player flow, spawn design, objective placement, onboarding paths, traversal, sightlines, social spaces, performance-aware world layout, and guiding players without text.
- `SK-46-01` **setup-roblox-skills** — Bootstrap the Roblox skill pack in a game project by injecting a `## Roblox Skills` block into CLAUDE.md — the full game-development lifecycle map, every skill's purpose, use case, and trigger words, and the next-skill routing so each skill ends by telling the user what to run next. Also records the project's tracker (GitHub issues or local roadmap), triage labels, and UI design artifact layout. Run once when setting up a Roblox project, or if the skills seem to be missing lifecycle, tracker, label, or routing context.
- `SK-46-01` **write-a-skill** — Create new agent skills with proper structure, progressive disclosure, and bundled resources. Use when user wants to create, write, or build a new skill.
- `SK-46-01` **zoom-out** — Tell the agent to zoom out and give broader context or a higher-level perspective. Use when you're unfamiliar with a section of code or need to understand how it fits into the bigger picture.
- `SK-46-60` **handoff** — Compact the current conversation into a durable handoff document for another agent or future session to pick up. Use when the user says 'handoff', 'handoff to /prototype', 'summarize for next session', 'another agent should continue', or when switching skills/sessions after substantial context has accumulated.
- `SK-VR-02` **viral-game-inspector** — Estuda jogos virais do Roblox (um jogo, um gênero ou uma tendência) com teardown em 11 camadas e mapa de saturação, extraindo padrões reutilizáveis para criar um jogo ORIGINAL. Nunca copia conteúdo de um jogo específico.
- `SK-VR-03` **viral-game-generator** — Gera um jogo completo do Roblox do zero a partir de uma spec do ROViral: primeiros 60 s jogáveis, loop, retenção D1/D7/D28, modelos, scripts Luau server-authoritative, UI, economia e monetização saudável, com verificação real.
- `SK-VR-04` **viral-viral-ideas** — ROViral Idea Engine: inventa ideias de jogos Roblox com potencial viral real (retenção de 28 dias, co-play, clipes), diferentes entre si, avaliadas por rubrica de 9 critérios e portões anti-reskin.
- `SK-VR-06` **viral-prototype-validation** — Valida ideias virais com protótipo mínimo e métricas reais do Roblox (play-through, bounce de 60 e 180 s, play days D1/D2-7/D8-28, co-play, return rate) e decide escalar, iterar, pivotar ou matar.

## Orquestração e roteamento (18)
- `SK-35-01` **orch-task-classification** — Classificação de tarefas em níveis 1 a 5.
- `SK-35-02` **orch-subtask-splitting** — Dividir uma tarefa em subtarefas com entrada, saída e teste próprios.
- `SK-35-03` **orch-specialist-selection** — Escolha de agente e skills por necessidade.
- `SK-35-04` **orch-dependency-ordering** — Ordenar tarefas por dependências e priorizar o caminho crítico.
- `SK-35-05` **orch-parallel-safety** — Paralelismo seguro: só tarefas sem arquivos em comum, nunca duas escritas no mesmo arquivo.
- `SK-35-06` **orch-concurrency-limits** — Limites de concorrência de subagentes e chamadas, com fila para o excedente.
- `SK-35-07` **orch-result-consolidation** — Consolidar resultados de subtarefas, verificar a integração e reportar estados reais.
- `SK-35-08` **orch-contradiction-detection** — Detectar contradições entre subagentes ou fontes e resolvê-las com evidência.
- `SK-35-09` **orch-escalation-rules** — Escalonar bloqueios e falhas repetidas após tentativas limitadas, dizendo o que foi tentado.
- `SK-35-10` **orch-context-minimization** — Contexto mínimo por tarefa.
- `SK-35-11` **orch-handoff-format** — Formato de passagem entre agentes.
- `SK-35-12` **orch-skill-search-protocol** — Protocolo de busca de skills sem carregar todas.
- `SK-35-13` **orch-intent-routing** — Roteamento de pedidos por intenção.
- `SK-35-14` **orch-cache-reuse** — Reaproveitamento seguro de resultados já verificados.
- `SK-35-15` **orch-incremental-verification** — Verificação incremental por etapa.
- `SK-35-16` **orch-latency-measurement** — Medição de latência por etapa e por ferramenta.
- `SK-35-17` **orch-obsolete-task-cancellation** — Cancelar tarefas que ficaram obsoletas.
- `SK-35-18` **orch-report-compaction** — Relatórios compactos com o essencial.

## Otimização de desempenho (21)
- `SK-16-01` **perf-microprofiler** — Medir quedas de FPS e picos de frame com o MicroProfiler, antes e depois.
- `SK-16-02` **perf-instance-count** — Contagem de instâncias e partes.
- `SK-16-03` **perf-script-profiling** — Perfil de scripts com os.clock e debug.profilebegin.
- `SK-16-04` **perf-render-cost** — Custo de renderização: triângulos, luzes, sombras e partículas.
- `SK-16-05` **perf-physics-cost** — Custo de física: partes móveis, colisões e constraints.
- `SK-16-06` **perf-memory-leaks** — Vazamentos de memória em conexões, tabelas e instâncias.
- `SK-16-07` **perf-network-cost** — Custo de rede: Remotes, replicação e propriedades.
- `SK-16-08` **perf-object-pooling** — Pool de objetos para projéteis e efeitos.
- `SK-16-09` **perf-streaming-tuning** — Ajuste de streaming para equilibrar memória e visibilidade.
- `SK-16-10` **perf-mobile-budgets** — Orçamentos de desempenho para dispositivos móveis.
- `SK-16-11` **perf-loading-time** — Tempo de carregamento e tela de loading.
- `SK-16-12` **perf-benchmark-method** — Método para comparar desempenho de forma justa.
- `SK-16-13` **perf-memory-profiling** — Perfil de memória por categoria no console do desenvolvedor.
- `SK-16-14` **perf-reduce-allocations** — Reduzir alocações de tabelas e strings em loops.
- `SK-16-15` **perf-debris-cleanup** — Limpeza de instâncias temporárias com Debris ou task.delay.
- `SK-16-16` **perf-loop-optimization** — Otimização de laços executados por frame.
- `SK-16-17` **perf-particle-optimization** — Otimização de partículas e efeitos.
- `SK-16-18` **perf-lod-roblox** — Níveis de detalhe no Roblox com RenderFidelity e distância.
- `SK-16-19` **perf-low-end-testing** — Testes em dispositivos de baixo desempenho.
- `SK-16-20` **perf-diagnose-freezes** — Diagnóstico de travamentos (picos de frame).
- `SK-16-21` **perf-fps-regression-tracking** — Acompanhamento de regressões de FPS entre versões.

## Personagens e NPCs (12)
- `SK-11-01` **npc-character-spawning** — Criar NPCs com Humanoid e aparência definida.
- `SK-11-02` **npc-humanoid-states** — Estados do Humanoid e como controlá-los em NPCs.
- `SK-11-03` **npc-path-following** — Seguir caminhos com PathfindingService e Humanoid:MoveTo.
- `SK-11-04` **npc-dialogue-system** — Diálogos de NPC com dados e UI.
- `SK-11-05` **npc-spawn-despawn** — Gerenciamento de nascimento e remoção de NPCs.
- `SK-11-06` **npc-health-bars** — Barras de vida com BillboardGui.
- `SK-11-07` **npc-network-ownership** — Propriedade de rede em NPCs para evitar jitter.
- `SK-11-08` **npc-patrol-routes** — Rotas de patrulha com pontos de passagem.
- `SK-11-09` **npc-aggro-targeting** — Escolha e perda de alvo com distância e linha de visão.
- `SK-11-10` **npc-animations** — Animações de NPC: andar, ataque e morte.
- `SK-11-11` **npc-loot-drops** — Itens que os NPCs soltam ao morrer.
- `SK-11-12` **npc-streaming-considerations** — NPCs e streaming de Workspace.

## Programação Luau (18)
- `SK-02-01` **luau-strict-types** — Tipagem Luau com --!strict, aliases, opcionais e refinamento.
- `SK-02-02` **luau-task-library** — Usa task.spawn, task.defer, task.delay, task.wait e task.cancel.
- `SK-02-03` **luau-error-handling** — Tratamento de erros com pcall, xpcall, assert e erro estruturado.
- `SK-02-04` **luau-modulescript-patterns** — Padrões de ModuleScript: retorno único, cache do require e estado.
- `SK-02-05` **luau-metatables-oop** — Classes simples com setmetatable e __index, tipadas.
- `SK-02-06` **luau-table-performance** — Uso eficiente de tabelas e da biblioteca table.
- `SK-02-07` **luau-string-handling** — Manipulação de strings: format, split, padrões e utf8.
- `SK-02-08` **luau-generalized-iteration** — Iteração com for k, v in tabela, pairs e ipairs sem armadilhas.
- `SK-02-09` **luau-coroutines-threads** — Coroutines, threads do scheduler e propagação de erros.
- `SK-02-10` **luau-signals-bindables** — BindableEvent e módulos Signal para comunicação interna.
- `SK-02-11` **luau-attributes-tags** — Atributos e CollectionService para dados e comportamento por objeto.
- `SK-02-12` **luau-math-vectors-cframe** — Vector3, CFrame, Random e matemática de jogo.
- `SK-02-13` **luau-linting-formatting** — Análise estática e formatação (luau-analyze, selene, stylua).
- `SK-02-14` **luau-gradual-typing** — Adoção gradual de tipos com nocheck, nonstrict e strict.
- `SK-02-15` **luau-cleanup-patterns** — Padrão de limpeza de conexões e instâncias (Maid ou Janitor próprio).
- `SK-02-16` **luau-semantics-pitfalls** — Armadilhas de semântica do Luau: índices, nil e valores falsos.
- `SK-02-17` **luau-legacy-migration** — Migrar código legado para APIs e práticas atuais.
- `SK-02-18` **luau-best-practices** — Boas práticas de Luau — tipagem, tasks, conexões de evento, tratamento de nil e erros. Use ao escrever ou revisar qualquer script Luau.

## Protocolo do agente RobKis (9)
- `SK-45-01` **rk-toolbox-first** — Busca na Toolbox antes de criar qualquer asset. Economiza tempo e mantém consistência visual.
- `SK-45-02` **rk-asset-security-scan** — Scan obrigatório de segurança em todo asset inserido. Detecta backdoors antes de entrar no projeto.
- `SK-45-03` **rk-genre-templates** — Templates de arquitetura por gênero: simulator, tycoon, obby, rpg, horror, battle royale.
- `SK-45-04` **rk-visual-loop** — Loop de iteração visual de 3 passes com portões de aprovação. Garante qualidade progressiva.
- `SK-45-05` **rk-visual-direction** — Direção visual anti-genérico. Paleta, materiais, iluminação com intenção antes de construir.
- `SK-45-06` **rk-map-budget** — Budgets concretos de cena mobile-first. Medir antes de entregar, nunca estimar.
- `SK-45-07` **rk-math-rng** — RNG seeded, weighted loot, spawn orgânico com math.noise e progressão com curvas.
- `SK-45-08` **rk-game-scaffold** — Estrutura mínima funcional para jogo novo. Sempre antes da primeira feature.
- `SK-45-09` **rk-famous-game-mode** — Reconhece jogo Roblox famoso citado pelo nome e usa o padrão de design dele como referência de estudo, nunca como molde de cópia.

## Recuperação de falhas (12)
- `SK-38-01` **rec-retry-policy** — Política de novas tentativas com limite, espera crescente e operações seguras.
- `SK-38-02` **rec-circuit-breaker** — Interromper chamadas a um recurso que falha.
- `SK-38-03` **rec-fallback-strategies** — Alternativas quando o plano principal falha.
- `SK-38-04` **rec-state-rollback** — Reverter para um estado anterior bom.
- `SK-38-05` **rec-checkpointing** — Pontos de controle em tarefas longas.
- `SK-38-06` **rec-partial-failure** — Falhas parciais em lotes.
- `SK-38-07` **rec-timeout-handling** — Tratamento de tempo esgotado.
- `SK-38-08` **rec-corrupted-file-recovery** — Recuperar arquivos corrompidos por backups e versões, sem sobrescrever o original.
- `SK-38-09` **rec-tool-outage** — Queda de ferramenta ou MCP.
- `SK-38-10` **rec-strategy-switching** — Mudar de abordagem após falhas.
- `SK-38-11` **rec-failure-logging** — Registro de falhas e causas.
- `SK-38-12` **rec-safe-abort** — Abortar com segurança quando continuar é arriscado, deixando o projeto utilizável.

## Revisão independente (12)
- `SK-32-01` **review-syntax** — Revisão de sintaxe e erros estáticos.
- `SK-32-02` **review-architecture** — Revisão de arquitetura: responsabilidades, dependências e fronteira cliente-servidor.
- `SK-32-03` **review-security** — Revisão de segurança de mudanças.
- `SK-32-04` **review-performance** — Revisão de desempenho: loops por frame, criação de instâncias e tráfego de rede.
- `SK-32-05` **review-integration** — Revisão de integração entre sistemas.
- `SK-32-06` **review-tests** — Revisão da qualidade dos testes.
- `SK-32-07` **review-regressions** — Revisão de regressões nas funcionalidades vizinhas a uma mudança.
- `SK-32-08` **review-compatibility** — Revisão de compatibilidade de APIs depreciadas, versões do Blender e plataformas.
- `SK-32-09` **review-3d-assets** — Revisão de assets 3D.
- `SK-32-10` **review-export** — Revisão de exportação: arquivo existe, reimporta e tem configurações registradas.
- `SK-32-11` **review-final-result** — Revisão final antes de entregar: requisitos, estados reais e limitações.
- `SK-32-12` **review-evidence-standards** — Padrão de evidência para aprovar ou reprovar.

## Rigging e esqueletos (15)
- `SK-25-01` **rig-bone-hierarchy** — Hierarquia de ossos coerente.
- `SK-25-02` **rig-naming-roblox** — Nomes de ossos e partes compatíveis com Roblox.
- `SK-25-03` **rig-weight-painting** — Pintura de pesos e grupos de vértices.
- `SK-25-04` **rig-auto-weights** — Pesos automáticos e ajustes finais.
- `SK-25-05` **rig-motor6d-mapping** — Relação entre ossos e Motor6D no Roblox.
- `SK-25-06` **rig-ik-fk** — IK e FK em rigs.
- `SK-25-07` **rig-bone-limits** — Limite de influências por vértice e de ossos.
- `SK-25-08` **rig-facial** — Rigs simples de rosto para jogos.
- `SK-25-09` **rig-props-attachments** — Pontos de encaixe para itens e efeitos.
- `SK-25-10` **rig-pose-testing** — Testar poses extremas e de repouso do rig antes de animar.
- `SK-25-11` **rig-apply-scale** — Aplicar escala e rotação no armature e na malha antes de exportar.
- `SK-25-12` **rig-export-armature** — Exportar armature com malha.
- `SK-25-13` **rig-fixing-common-problems** — Correções de problemas comuns de rig.
- `SK-25-14` **rig-skeleton-compatibility** — Compatibilidade de esqueletos entre rigs.
- `SK-25-15` **rig-skinning-vs-parenting** — Skinning ou parentesco rígido de peças.

## Roblox Studio (13)
- `SK-03-01` **studio-explorer-properties** — Navegar Explorer e Properties e escolher entre propriedade e atributo.
- `SK-03-02` **studio-play-modes** — Diferenças entre Play, Run e Test com servidor e clientes locais.
- `SK-03-03` **studio-output-console** — Output do Studio e console do desenvolvedor em jogo.
- `SK-03-04` **studio-script-workflow** — Fluxo de edição de scripts e sincronização com arquivos.
- `SK-03-05` **studio-plugin-development** — Criação de plugins do Studio (toolbar, Selection, waypoints).
- `SK-03-06` **studio-terrain-workflow** — Terreno por editor e por script (FillBlock, FillBall, Clear).
- `SK-03-07` **studio-asset-manager** — Asset Manager, importação em lote e organização de assets.
- `SK-03-08` **studio-streaming-enabled** — Configuração de StreamingEnabled e modos de streaming de modelos.
- `SK-03-09` **studio-team-create** — Colaboração no Team Create e histórico de versões.
- `SK-03-10` **studio-publishing** — Publicar o jogo e separar experiência de lugar.
- `SK-03-11` **studio-device-emulator** — Emulador de dispositivos para telas e entrada de toque.
- `SK-03-12` **studio-undo-waypoints** — Desfazer e refazer em scripts de edição e plugins.
- `SK-03-13` **studio-workspace-settings** — Configurações globais de Workspace: gravidade, altura de queda e filtragem.

## Segurança cliente-servidor (13)
- `SK-08-01` **sec-remote-input-validation** — Validação de tipo, faixa e formato de argumentos de Remotes.
- `SK-08-02` **sec-rate-limit-implementation** — Limite de frequência por jogador e por Remote.
- `SK-08-03` **sec-ownership-checks** — Confirma posse de itens, tools e objetos antes de agir.
- `SK-08-04` **sec-distance-sanity-checks** — Valida distância e linha de visão no servidor.
- `SK-08-05` **sec-receipt-processing** — ProcessReceipt idempotente para Developer Products.
- `SK-08-06` **sec-gamepass-verification** — Verificação de Game Pass no servidor.
- `SK-08-07` **sec-dupe-prevention** — Prevenção de duplicação de itens em troca, salvamento e teleporte.
- `SK-08-08` **sec-sanitize-text** — Filtragem e limite de texto digitado por jogadores.
- `SK-08-09` **sec-secrets-handling** — Segredos, chaves e tokens fora do código.
- `SK-08-10` **sec-exploit-resistant-ui** — UI como exibição apenas, sem autoridade.
- `SK-08-11` **sec-anti-speed-fly** — Detecção de velocidade e voo anômalos com tolerância.
- `SK-08-12` **sec-admin-auth** — Autorização de comandos de administrador.
- `SK-08-13` **sec-script-visibility** — O que o cliente consegue ver e o que fica oculto.

## Sistemas completos de jogo (10)
- `SK-42-01` **game-quest-system** — Sistema de quests com objetivos e progresso.
- `SK-42-02` **game-progression-xp-levels** — Progressão com XP e níveis.
- `SK-42-03` **game-matchmaking-queue** — Fila de partidas e formação de grupos.
- `SK-42-04` **game-round-manager** — Gerenciador de rodadas com estados e pontuação.
- `SK-42-05` **game-lobby-system** — Lobby com preparação e início automático.
- `SK-42-06` **game-respawn-handling** — Respawn controlado: tempo, local e estado.
- `SK-42-07` **game-checkpoints** — Checkpoints com persistência opcional.
- `SK-42-08` **game-portals-teleporters** — Portais dentro do mesmo lugar e entre lugares.
- `SK-42-09` **game-class-system** — Sistema de classes com atributos e habilidades.
- `SK-42-10` **game-ability-system** — Sistema de habilidades reutilizável.

## Sistemas de combate (20)
- `SK-04-01` **combat-hitbox-raycast** — Detecção de acerto por raycast no servidor com RaycastParams.
- `SK-04-02` **combat-hitbox-overlap** — Hitbox por volume com GetPartBoundsInBox e OverlapParams.
- `SK-04-03` **combat-shapecast** — Blockcast e Spherecast para hitboxes grossas em movimento.
- `SK-04-04` **combat-cooldowns** — Cooldown por jogador validado no servidor com os.clock.
- `SK-04-05` **combat-damage-pipeline** — Pipeline único de dano com defesa, crítico e eventos.
- `SK-04-06` **combat-hit-dedup** — Evita dano duplicado por golpe, projétil ou colisão repetida.
- `SK-04-07` **combat-melee-combos** — Combos corpo a corpo com janela de input e estado.
- `SK-04-08` **combat-ranged-projectiles** — Projéteis físicos ou simulados com tempo de vida e colisão.
- `SK-04-09` **combat-hitscan-weapons** — Armas de acerto instantâneo com dispersão e alcance.
- `SK-04-10` **combat-lag-compensation** — Tolerância a latência sem abrir brechas de exploit.
- `SK-04-11` **combat-status-effects** — Efeitos de status (queimadura, lentidão, atordoamento) com duração.
- `SK-04-12` **combat-knockback** — Empurrão com impulso físico respeitando propriedade de rede.
- `SK-04-13` **combat-kill-credit** — Atribuição de abate e assistência ao último agressor.
- `SK-04-14` **combat-fire-rate** — Cadência de tiro e controle de disparo automático.
- `SK-04-15` **combat-projectile-trajectories** — Trajetórias balísticas com gravidade e velocidade inicial.
- `SK-04-16` **combat-parry-block** — Bloqueio e parry com janelas de tempo no servidor.
- `SK-04-17` **combat-stun-system** — Atordoamento com duração, imunidade e interrupção de ações.
- `SK-04-18` **combat-animation-sync** — Sincronizar animação, hitbox e efeito pelo mesmo tempo.
- `SK-04-19` **combat-balancing-method** — Método de balanceamento de armas e habilidades por dados.
- `SK-04-20` **combat-latency-testing** — Testes de combate com latência simulada.

## Sistemas de inventário (12)
- `SK-13-01` **inv-data-model** — Modelo de dados de inventário: itens, quantidades e slots.
- `SK-13-02` **inv-stacking-rules** — Regras de empilhamento e limites.
- `SK-13-03` **inv-equip-system** — Equipar itens com slots e regras de conflito.
- `SK-13-04` **inv-server-actions** — Ações de inventário decididas no servidor.
- `SK-13-05` **inv-capacity-limits** — Limites de capacidade e peso.
- `SK-13-06` **inv-item-registry** — Registro central de definições de itens.
- `SK-13-07` **inv-trading-safe** — Troca entre jogadores em duas fases.
- `SK-13-08` **inv-persistence** — Persistência do inventário com versão do esquema.
- `SK-13-09` **inv-ui-sync** — Sincronia entre inventário do servidor e UI.
- `SK-13-10` **inv-drag-drop** — Arrastar e soltar itens na UI.
- `SK-13-11` **inv-crafting** — Sistema de criação com receitas.
- `SK-13-12` **inv-rarity-sorting** — Ordenação e filtro de itens por raridade e tipo.

## Testes automatizados (12)
- `SK-18-01` **test-unit-luau** — Testes unitários de lógica Luau pura.
- `SK-18-02` **test-integration-studio** — Testes de integração dentro do Studio.
- `SK-18-03` **test-multiplayer-local-server** — Testar com servidor local e vários clientes.
- `SK-18-04` **test-edge-cases** — Casos de borda: nil, vazio, limites e concorrência.
- `SK-18-05` **test-fuzzing-remotes** — Enviar entradas inválidas a Remotes para testar a defesa.
- `SK-18-06` **test-mock-services** — Simulações de DataStore e Marketplace para testes.
- `SK-18-07` **test-determinism** — Testes reproduzíveis com Random com semente.
- `SK-18-08` **test-ui-responsive** — Testes de UI em vários tamanhos de tela.
- `SK-18-09` **test-performance-smoke** — Teste rápido de desempenho com carga realista.
- `SK-18-10` **test-datastore-offline** — Testar comportamento quando o DataStore falha.
- `SK-18-11` **test-bpy-headless** — Testar scripts bpy em modo background.
- `SK-18-12` **test-acceptance-checklists** — Checklists de aceitação por tipo de entrega.

## Testes de regressão (12)
- `SK-36-01` **regr-baseline-capture** — Registrar o comportamento atual antes de mudar.
- `SK-36-02` **regr-smoke-suite** — Suíte rápida de poucos testes que cobrem o essencial do jogo após cada mudança.
- `SK-36-03` **regr-diff-impact** — Impacto da diferença de código.
- `SK-36-04` **regr-golden-outputs** — Saídas de referência para funções determinísticas, comparadas a cada mudança.
- `SK-36-05` **regr-gameplay-checklist** — Checklist de gameplay: morte, respawn, compra e salvamento antes de entregar versão.
- `SK-36-06` **regr-ui-snapshots** — Comparar capturas de UI antes e depois de uma mudança, em vários tamanhos de tela.
- `SK-36-07` **regr-data-compat** — Garantir que dados salvos em versões antigas ainda carregam após mudar o esquema.
- `SK-36-08` **regr-network-contracts** — Compatibilidade de contratos de Remotes.
- `SK-36-09` **regr-asset-rechecks** — Recheque de assets após mudanças.
- `SK-36-10` **regr-flaky-tests** — Tratar testes instáveis que mudam de resultado sem alteração de código.
- `SK-36-11` **regr-bisect** — Bisseção para achar qual mudança causou uma regressão entre duas versões.
- `SK-36-12` **regr-release-gate** — Portão de entrega: smoke, regressão e segurança aprovados antes de publicar.

## Topologia e geometria (15)
- `SK-22-01` **topo-quads-vs-tris** — Quads na modelagem e triângulos na exportação.
- `SK-22-02` **topo-edge-flow** — Fluxo de arestas para deformação e forma.
- `SK-22-03` **topo-poly-budgets** — Orçamentos de polígonos por categoria de asset.
- `SK-22-04` **topo-normals-fixing** — Corrigir normais invertidas e inconsistentes.
- `SK-22-05` **topo-non-manifold** — Detectar e corrigir geometria não manifold.
- `SK-22-06` **topo-merge-doubles** — Mesclar vértices duplicados com bmesh.ops.remove_doubles sem alterar a forma.
- `SK-22-07` **topo-hard-surface-bevels** — Chanfros em hard surface com poucos segmentos e normais ponderadas.
- `SK-22-08` **topo-lod-generation** — Gerar níveis de detalhe com redução.
- `SK-22-09` **topo-collision-hulls** — Malhas de colisão simplificadas.
- `SK-22-10` **topo-decimation-safely** — Redução de polígonos sem destruir a forma.
- `SK-22-11` **topo-scale-origin** — Escala, rotação e origem corretas.
- `SK-22-12` **topo-mesh-validation** — Validação geral da malha antes da entrega.
- `SK-22-13` **topo-boolean-operations** — Operações booleanas e limpeza posterior.
- `SK-22-14` **topo-retopology** — Retopologia de malhas de alta resolução.
- `SK-22-15` **topo-triangulation** — Triangulação controlada antes da exportação.

## UV mapping (12)
- `SK-24-01` **uv-unwrap-basics** — Desdobramento UV básico: costuras, ilhas e escala.
- `SK-24-02` **uv-seams** — Escolha e marcação de costuras.
- `SK-24-03` **uv-texel-density** — Densidade de texel consistente entre peças.
- `SK-24-04` **uv-padding-islands** — Margem entre ilhas UV.
- `SK-24-05` **uv-mirror-overlap** — UVs espelhadas e sobrepostas.
- `SK-24-06` **uv-smart-project-script** — UV automática por script com smart_project.
- `SK-24-07` **uv-atlas-packing** — Empacotar ilhas em um atlas.
- `SK-24-08` **uv-stretch-checking** — Detectar e corrigir esticamento de UV com textura de teste xadrez.
- `SK-24-09` **uv-multiple-uv-sets** — Múltiplos conjuntos de UV.
- `SK-24-10` **uv-tiling-textures** — Texturas repetidas com UV em tile.
- `SK-24-11` **uv-decal-areas** — Áreas de decalques e detalhes únicos.
- `SK-24-12` **uv-export-validation** — Validar UV antes da exportação.

## Áudio e efeitos (16)
- `SK-29-01` **fx-particle-emitters** — ParticleEmitter com taxa, vida e emissão controladas.
- `SK-29-02` **fx-beams-trails** — Beam e Trail para raios, rastros e linhas, com Attachments e destruição ao fim.
- `SK-29-03` **fx-sound-design** — Sons espaciais 3D com RollOffMode, distâncias e volume balanceado.
- `SK-29-04` **fx-sound-groups-mixing** — SoundGroup para controlar volumes de música, efeitos e interface por categoria.
- `SK-29-05` **fx-audio-api-wires** — Nova API de áudio com AudioPlayer, AudioEmitter e Wire.
- `SK-29-06` **fx-screen-shake-camera** — Tremor de câmera e efeitos de câmera.
- `SK-29-07` **fx-hit-feedback** — Feedback de acerto: som, flash e números.
- `SK-29-08` **fx-tween-vfx** — Efeitos visuais com tweens.
- `SK-29-09` **fx-ui-juice** — Pequenos efeitos de UI para sensação de resposta.
- `SK-29-10` **fx-ambient-loops** — Loops de som ambiente sem emenda audível, com volume baixo e distância definida.
- `SK-29-11` **fx-performance-limits** — Limites de custo de efeitos.
- `SK-29-12` **fx-client-side-effects** — Efeitos só no cliente, decisões no servidor.
- `SK-29-13` **fx-music-system** — Sistema de música com transições e volume.
- `SK-29-14` **fx-footstep-sounds** — Sons de passos por material do chão.
- `SK-29-15` **fx-cinematic-cutscenes** — Cutscenes com câmera Scriptable e tweens.
- `SK-29-16` **fx-presentation-polish** — Acabamento de apresentação: transições, tela de título e créditos.
