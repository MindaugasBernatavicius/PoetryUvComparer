# setup-and-run:
# 	docker build -t ubuntu-with-poetry -f dockerfile-poetry . 
# 	docker run --name ubuntu-with-poetry -it ubuntu-with-poetry

# setup:
# 	docker build -t ubuntu-with-poetry -f dockerfile-poetry . 

# run:
# 	docker run --name ubuntu-with-poetry -it ubuntu-with-poetry

# teardown:
# 	docker stop ubuntu-with-poetry
# 	docker rm ubuntu-with-poetry
# 	docker rmi ubuntu-with-poetry



setup-and-run:
	docker build -t ubuntu-with-uv -f dockerfile-uv . 
	docker run --name ubuntu-with-uv -it ubuntu-with-uv

setup:
	docker build -t ubuntu-with-uv -f dockerfile-uv .

run:
	docker run --name ubuntu-with-uv -it ubuntu-with-uv

teardown:
	docker stop ubuntu-with-uv
	docker rm ubuntu-with-uv
	docker rmi ubuntu-with-uv