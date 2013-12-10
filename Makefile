all: fastqc.jar

fastqc.jar:
	javac -cp sam-1.32.jar:jbzip2-0.9.jar `find uk -name "*.java"`
	jar cf fastqc.jar `find uk -name "*.class" -o -name "*.png"`

dist: fastqc.jar
	mkdir -p dist/FastQC
	cp -a fastqc dist/FastQC
	chmod +x dist/FastQC/fastqc
	cp -a fastqc.jar dist/FastQC
	cp -ra Contaminants Help Templates dist/FastQC
	cd dist; zip FastQC.zip FastQC; cd -

