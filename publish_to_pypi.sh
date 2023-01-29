#!/bin/bash
python setup.py sdist bdist_wheel
twine upload -r testpypi dist/* -u ${PYPI_USERNAME} -p ${PYPI_TEST_PASSWORD} --verbose 
twine check dist/*
twine upload dist/* -u ${PYPI_USERNAME} -p ${PYPI_PASSWORD} --verbose 