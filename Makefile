RESUME_FILES := resume.en.pdf resume.id.pdf
CV_FILES := cv.en.pdf cv.id.pdf

all: cv resume

cv: $(CV_FILES)

resume: $(RESUME_FILES)

clean:
	rm -f $(CV_FILES) $(RESUME_FILES)

.PHONY: cv resume all clean

resume.%.pdf: resume.html translations/%.toml
	python tools/localize.py $< $(word 2,$^) | weasyprint - $@

cv.%.pdf: cv.html translations/%.toml
	python tools/localize.py $< $(word 2,$^) | weasyprint - $@
