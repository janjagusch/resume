clean:
	@echo "Cleaning up ..."
	@find . -type f -name "*.py[co]" -delete
	@find . -type d -name "__pycache__" -delete
	@find . -type d -name ".ipynb_checkpoints" -exec rm -rf {} +
	@find . -type d -name ".pytest_cache" -exec rm -rf {} +

format_prettier:
	@echo "Prettier formatting ..."
	@npx prettier --write $$(find \( -name "*.yml" -o -name "*.yaml" -o -name "*.json" \) -not \( -path "./.venv/*" -o -path "./.tox/*" \))

format: format_prettier clean

lint_prettier:
	@echo "Prettier linting ..."
	@npx prettier --check $$(find \( -name "*.yml" -o -name "*.yaml" -o -name "*.json" \) -not \( -path "./.venv/*" -o -path "./.tox/*" \))

lint: lint_prettier clean

app:
	@docker run -p 8080:80 amruthpillai/reactive-resume:v1
