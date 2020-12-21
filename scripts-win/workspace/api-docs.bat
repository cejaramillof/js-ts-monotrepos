echo "┏━━━ 📚 API DOCS: Extracting API surface ━━━━━━━━━━━━━━"
call yarn clean
call yarn tsc -b packages
call yarn lerna run api-report
echo "┏━━━ 📝 API DOCS: Generating Markdown Docs ━━━━━━━━━━━━"
SET GH_PAGES_CFG_EXISTS=$(test -f docs/_config.yml)
if EXIST $GH_PAGES_CFG_EXISTS (
  echo "GitHub pages config file DETECTED"
  cp docs/_config.yml .
)

call yarn api-documenter markdown -i temp -o docs

if EXIST $GH_PAGES_CFG_EXISTS (
  cp _config.yml docs/_config.yml
)