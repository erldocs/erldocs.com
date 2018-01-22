.PHONY: archives/sha256sum.txt api/v1.js

archives/sha256sum.txt:
	cd archives && sha256sum *.tar.bz2 | tee sha256sum.txt && cd -

api/v1.js:
	printf 'var erldocs_api = {\n\t"version": "1",\n\t"otp_releases_built": [\n' >$@
	echo 1* 2* R1* maint | sort | sed 's/^/\t\t"/;s/$$/"/;s/ /",\n\t\t"/g' >>$@
	printf '\t]\n};\n' >>$@
