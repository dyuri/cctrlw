python setup.py sdist bdist_wheel
git add . && git commit -m "$@"
rm -rf dist
twine check dist/* && cat ../pypi_creds.txt | twine upload dist/*
git push -u origin main
