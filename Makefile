.PHONY: install fmt lint typecheck test clean

# Default installation wrapping your HTTP timeout for heavy CUDA binaries
install:
	@echo "Initializing Python Environment for RTX 3080..."
	UV_HTTP_TIMEOUT=300 uv sync --all-extras
	uv pip install -e .
	@echo "Environment locked and loaded."

# Formatting and Code Quality
fmt:
	uv run ruff format .

lint:
	uv run ruff check . --fix

typecheck:
	uv run mypy src/

# Testing
test:
	uv run pytest

# Run the complete validation suite (Formatting, Linting, Typing, Testing)
check: fmt lint typecheck test
	@echo "Codebase validation complete. Ready for execution."

# Nuke the environment and caches if things get weird
clean:
	rm -rf .venv
	uv cache clean
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".ruff_cache" -exec rm -rf {} +
	find . -type d -name ".mypy_cache" -exec rm -rf {} +
