build:
	@docker build -t mattinsler/drone-cache .

push:
	@docker push mattinsler/drone-cache
