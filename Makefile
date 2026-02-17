
TEX=datasets
MD=Datasets

all: $(MD).md

$(MD).md: $(TEX).tex
	pandoc $(TEX).tex -f latex -t gfm -s -o $(MD).md

clean:
	rm -f $(MD).md

distclean: clean
