clean:
	rm -rf build dist *.egg-info

dist:
	python3 setup.py bdist_wheel --universal

upload:
	curl -F package=@`find dist -name "django_elasticsearch_dsl_drf-*.whl"` $(PRIVATE_PYPI_UPLOAD_URL)
	curl -F package=@`find dist -name "django_elasticsearch_dsl_drf-*.whl"` $(FURY_LABCODES_PRIVATE_PYPI_UPLOAD_URL)


package: clean dist upload
