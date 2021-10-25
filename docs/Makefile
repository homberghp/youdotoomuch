

all: index.html


%.html: %.adoc
	asciidoctorj \
             -b revealjs -a linkcss -a stylesheet=css/asciidoctor.css \
             -a revealjsdir=reveal.js \
             $<

index.html: index.adoc css/*.css *.adoc # hardproblems.adoc rules.adoc teaching.adoc badpractices.adoc

clean:
	rm -f index.html
