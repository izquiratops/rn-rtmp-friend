pack:
	pnpm pack
unpack:
	pnpm unpack
deletePackage:
	pnpm deletePackage
incrementVersion:
	pnpm version patch --git-tag-version
release:
	git push --follow-tags
updateDockerImage:
	docker build --platform linux/amd64 -t klimandrew/node-pnpm:latest . && docker push klimandrew/node-pnpm

.PHONY: pack unpack deletePackage incrementVersion release updateDockerImage