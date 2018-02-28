.PHONY: run
run:
	python2 ./easy_feature_extraction.py ../song-annotation-db/audio_paths.txt ../song-annotation-db/features.npy 8

.PHONY: launch
launch:
	pipenv shell

.PHONY: install
install: kapre
	pip install -U pipenv
	pipenv --two
	pipenv install h5py
	pipenv install theano==0.9
	pipenv install keras==1.2.2
	pipenv install -e ./kapre

.PHONY: kapre
kapre:
	git clone https://github.com/evhub/kapre.git
	cd kapre; git checkout oldkeras; cd ..

.PHONY: clean
clean:
	rm -rf ./dist ./build ./kapre Pipfile Pipfile.lock
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -delete
