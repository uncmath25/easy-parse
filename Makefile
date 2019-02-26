.PHONY: clean flake test build publish

clean:
	@echo "*** Cleaning out previous builds and cached modules ***"
	@find . -name "__pycache__" -type d -exec rm -rf {} \;
	@find . -name "*.pyc" -type f -exec rm {} \;
	rm -rf .pytest_cache
	rm -rf build
	rm -rf dist
	rm -rf easy_parse.egg-info

flake:
	@echo "*** Linting python code ***"
	flake8 . --ignore="E501"

test:
	@echo "*** Running unit testing via pytest ***"
	pytest .

build: clean test
	@echo "*** Building source archive and wheel for the package ***"
	python3 setup.py sdist bdist_wheel
	# Markdown renderer is breaking this
	# twine check dist/*
	@echo "REMEMBER: update xmleasyparse.__init__.__version__ ..."

publish:
	@echo "*** Uploading the package to PyPI ***"
	twine upload dist/*
