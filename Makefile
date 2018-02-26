.PHONY: launch
launch:
	pipenv shell

.PHONY: install
install: kapre
	pip install -U pipenv
	pipenv install theano==0.9
	pipenv install keras==1.2.2
	pipenv install -e ./kapre

.PHONY: kapre
kapre:
	git clone https://github.com/evhub/kapre.git
	cd kapre; git checkout oldkeras; cd ..

.PHONY: clean
clean:
	rm -rf ./dist ./build
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -delete
