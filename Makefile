.PHONY: archives/sha256sum.txt api/v1.json

archives/sha256sum.txt:
	cd archives && sha256sum *.tar.bz2 | tee sha256sum.txt && cd -

api/v1.json:
	echo '{"version":"1", "otp_releases_built": [' >$@~
	echo 1* 2* R1* maint | sort | sed 's/^/"/;s/$$/"/;s/ /","/g' >>$@~
	echo ']}' >>$@~
	cat $@~ | python -mjson.tool >$@
	rm $@~
