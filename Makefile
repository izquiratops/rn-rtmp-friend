pack:
	pnpm pack
unpack:
	pnpm unpack
deletePackage:
	pnpm deletePackage
incrementVersionPatch:
	pnpm version patch --git-tag-version
incrementVersionMinor:
	pnpm version minor --git-tag-version
incrementVersionMajor:
	pnpm version major --git-tag-version
patchAndRelease:
	make incrementVersionPatch && make release
release:
	git push --follow-tags
updateDockerImage:
	docker build --platform linux/amd64 -t klimandrew/node-pnpm:latest . && docker push klimandrew/node-pnpm

.PHONY: pack unpack deletePackage incrementVersionPatch incrementVersionMinor incrementVersionMajor release updateDockerImage patchAndRelease