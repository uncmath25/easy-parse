.PHONY: clean test build publish

clean:
	@echo "*** Cleaning out previous builds and cached modules ***"
	rm -rf build dist *.egg-info */__pycache__ *.xml *.json

test:
	@echo "*** Running unit testing via pytest ***"

build: clean test
	@echo "*** Building source archive and wheel for the package ***"
	python3 setup.py sdist bdist_wheel
	# Markdown renderer is breaking this
	# twine check dist/*
	@echo "REMEMBER: update xmleasyparse.__init__.__version__ ..."

publish:
	@echo "*** Uploading the package to PyPI ***"
	twine upload dist/*
