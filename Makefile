language = language
folder = implementations/$(language)

add:
# add a folder in implementations/LANGUAGE
	mkdir -p $(folder)
# copy the contents of the template in the new folder
	cp -r template/* $(folder)
# replace the contents of the README file
	sed -i 's/LANGUAGE/$(language)/g' $(folder)/README.md
# add the language in the list of available implementations
	sed -i 's/\[\/\/\]: \# \"\"/\[\/\/\]: \# \"\"\n- \[$(language)\]\(implementations\/$(language)\)/' README.md

.PHONY: add