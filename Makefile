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

.PHONY: pack unpack deletePackage incrementVersion release