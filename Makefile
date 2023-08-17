GEN_FILES := resume.en.pdf resume.id.pdf

all: $(GEN_FILES)

clean:
	rm $(GEN_FILES)

resume.%.pdf: resume.html translations/%.toml
	python tools/localize.py $< $(word 2,$^) | weasyprint - $@
