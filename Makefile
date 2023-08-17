CV_FILES := cv.en.pdf cv.id.pdf

all: $(CV_FILES)

clean:
	rm $(CV_FILES)

cv.%.pdf: cv.html translations/%.toml
	python tools/localize.py $< $(word 2,$^) | weasyprint - $@
