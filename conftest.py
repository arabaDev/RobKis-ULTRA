# Os testes em scripts/ e gui-engine/tools/ são scripts autônomos (rodam com `python arquivo.py` e encerram com sys.exit).
# O pytest não deve importá-los diretamente; tests/test_suites.py executa cada um em subprocesso.
collect_ignore_glob = ["scripts/test_*.py", "gui-engine/tools/test_*.py", "dist/*", "extras/*"]
